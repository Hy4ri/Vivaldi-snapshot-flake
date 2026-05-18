#!/usr/bin/env bash

set -euo pipefail

# -------------------------------------------------------------------
# Helper functions
# -------------------------------------------------------------------

usage() {
  echo "Usage: $0 --channel <snapshot|stable> [--blog-url <url>] [version]"
  echo ""
  echo "  --channel   Required. Which Vivaldi variant to update (snapshot or stable)."
  echo "  --blog-url  Optional. Manually specify the blog post URL (for RC releases)."
  echo "  version     Optional. If omitted, you will be prompted."
  exit 1
}

get_hash() {
  local url="$1"
  local temp_file
  temp_file=$(mktemp)

  if curl -sL "$url" -o "$temp_file"; then
    local raw_hash
    raw_hash=$(sha256sum "$temp_file" | cut -d' ' -f1)
    nix hash convert --hash-algo sha256 --to sri "$raw_hash"
  fi
  rm -f "$temp_file"
}

get_blog_url_snapshot() {
  local version="$1"
  local build_patch major_minor
  build_patch=$(echo "$version" | sed -E 's/^[0-9]+\.[0-9]+\.([0-9]+)\.([0-9]+)$/\1-\2/')
  major_minor=$(echo "$version" | sed -E 's/^([0-9]+)\.([0-9]+)\.[0-9]+\.[0-9]+$/\1-\2/')

  # Try matching snapshot-BUILD-PATCH pattern first (regular snapshots)
  local blog_url
  blog_url=$(curl -sL "https://vivaldi.com/blog/snapshots/" | \
    grep -oP 'href="https://vivaldi\.com/blog/desktop/[^"]*snapshot-'"$build_patch"'/"' | \
    head -n 1 | \
    sed 's/href="//' | \
    sed 's/"$//')

  # Fallback: try matching MAJOR-MINOR-rc- pattern (RC releases)
  if [[ -z "$blog_url" ]]; then
    blog_url=$(curl -sL "https://vivaldi.com/blog/snapshots/" | \
      grep -oP 'href="https://vivaldi\.com/blog/desktop/[^"]*'"$major_minor"'-rc-[^"]*/"' | \
      head -n 1 | \
      sed 's/href="//' | \
      sed 's/"$//')
  fi

  echo "$blog_url"
}

get_blog_url_stable() {
  local version="$1"
  local major_minor
  major_minor=$(echo "$version" | sed -E 's/^([0-9]+)\.([0-9]+)\.[0-9]+\.[0-9]+$/\1-\2/')

  # Strategy 1: try matching the major.minor version in the URL
  local blog_url
  blog_url=$(curl -sL "https://vivaldi.com/blog/desktop/" | \
    grep -oP 'href="https://vivaldi\.com/blog/desktop/[^"]*'"$major_minor"'[^"]*/"' | \
    grep -v '/blog/desktop/$' | \
    head -n 1 | \
    sed 's/href="//' | \
    sed 's/"$//')

  # Strategy 2: fallback to the most recent desktop blog post
  if [[ -z "$blog_url" ]]; then
    blog_url=$(curl -sL "https://vivaldi.com/blog/desktop/" | \
      grep -oP 'href="https://vivaldi\.com/blog/desktop/[^"]+/"' | \
      grep -v '/blog/desktop/$' | \
      grep -v '/blog/desktop/page/' | \
      head -n 1 | \
      sed 's/href="//' | \
      sed 's/"$//')
  fi

  echo "$blog_url"
}

# -------------------------------------------------------------------
# Parse arguments
# -------------------------------------------------------------------
channel=""
blog_url_override=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --channel)
      if [[ -z "${2:-}" ]]; then
        echo "Error: --channel requires an argument (snapshot or stable)"
        usage
      fi
      channel="$2"
      shift 2
      ;;
    --blog-url)
      if [[ -z "${2:-}" ]]; then
        echo "Error: --blog-url requires an argument"
        usage
      fi
      blog_url_override="$2"
      shift 2
      ;;
    --help|-h)
      usage
      ;;
    *)
      # Assume it's the version
      if [[ -z "${version:-}" ]]; then
        version="$1"
      else
        echo "Error: Unexpected argument: $1"
        usage
      fi
      shift
      ;;
  esac
done

# Validate channel
if [[ "$channel" != "snapshot" && "$channel" != "stable" ]]; then
  echo "Error: --channel must be 'snapshot' or 'stable', got '$channel'"
  usage
fi

# -------------------------------------------------------------------
# Channel-specific configuration
# -------------------------------------------------------------------
if [[ "$channel" == "snapshot" ]]; then
  pname="vivaldi-snapshot"
  target_file="vivaldi-snapshot.nix"
  version_json="version.json"
  url_prefix="snapshot"
  blog_default="https://vivaldi.com/blog/snapshots/"
else
  pname="vivaldi-stable"
  target_file="vivaldi-stable.nix"
  version_json="version-stable.json"
  url_prefix="stable"
  blog_default="https://vivaldi.com/blog/desktop/"
fi

# -------------------------------------------------------------------
# Get version
# -------------------------------------------------------------------
if [[ -z "${version:-}" ]]; then
  echo "Current directory: $(pwd)"
  read -p "Enter Vivaldi ${channel} version to download (e.g., 7.9.4000.1): " version
fi

if [[ -z "$version" ]]; then
  echo "Error: Version cannot be empty."
  exit 1
fi

echo "------------------------------------------------"
echo "Variant: $channel"
echo "Target Version: $version"
echo "------------------------------------------------"

# -------------------------------------------------------------------
# Download and hash
# -------------------------------------------------------------------
url_amd64="https://downloads.vivaldi.com/${url_prefix}/${pname}_${version}-1_amd64.deb"
url_arm64="https://downloads.vivaldi.com/${url_prefix}/${pname}_${version}-1_arm64.deb"

echo "Downloading and calculating hash for x86_64-linux..."
hash_amd64_sri=$(get_hash "$url_amd64")

if [[ -z "$hash_amd64_sri" ]]; then
  echo "Error: Failed to download x86_64 version from:"
  echo "  $url_amd64"
  echo "Check if the version number is correct."
  exit 1
fi
echo "  Hash: $hash_amd64_sri"

echo "Downloading and calculating hash for aarch64-linux..."
hash_arm64_sri=$(get_hash "$url_arm64")

if [[ -z "$hash_arm64_sri" ]]; then
  echo "Warning: Failed to download aarch64 version. Setting hash to placeholder."
  hash_arm64_sri="sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="
else
  echo "  Hash: $hash_arm64_sri"
fi

# -------------------------------------------------------------------
# Fetch blog URL
# -------------------------------------------------------------------
if [[ -n "$blog_url_override" ]]; then
  blog_url="$blog_url_override"
  echo "  Blog URL (overridden): $blog_url"
else
  echo "Fetching blog post URL..."
  if [[ "$channel" == "snapshot" ]]; then
    blog_url=$(get_blog_url_snapshot "$version")
  else
    blog_url=$(get_blog_url_stable "$version")
  fi

  if [[ -z "$blog_url" ]]; then
    echo "Warning: Could not find blog post for this version. Using default."
    blog_url="$blog_default"
  else
    echo "  Blog URL: $blog_url"
  fi
fi

# -------------------------------------------------------------------
# Update target .nix file
# -------------------------------------------------------------------
if [[ ! -f "$target_file" ]]; then
  echo "Error: $target_file not found in current directory."
  exit 1
fi

echo "Updating $target_file..."

temp_file=$(mktemp)

sed "s/version = \".*\";/version = \"$version\";/" "$target_file" >"$temp_file"

# Update hashes
sed -i "s|x86_64-linux = \"sha256-.*\";|x86_64-linux = \"$hash_amd64_sri\";|" "$temp_file"
sed -i "s|aarch64-linux = \"sha256-.*\";|aarch64-linux = \"$hash_arm64_sri\";|" "$temp_file"

mv "$temp_file" "$target_file"

# -------------------------------------------------------------------
# Update version JSON
# -------------------------------------------------------------------
echo "Updating $version_json..."
cat > "$version_json" << EOF
{
  "version": "$version",
  "blogUrl": "$blog_url"
}
EOF

# -------------------------------------------------------------------
# Update README.md badge link
# -------------------------------------------------------------------
echo "Updating README.md..."

if [[ "$channel" == "snapshot" ]]; then
  # Update the snapshot badge link — scoped to the snapshot badge line only
  sed -i "/vivaldi-snapshot&/s|](https://vivaldi.com/blog/[^)]*)|]($blog_url)|" README.md
else
  # Update the stable badge link — scoped to the stable badge line only
  sed -i "/vivaldi-stable&/s|](https://vivaldi.com/blog/[^)]*)|]($blog_url)|" README.md
fi

echo "------------------------------------------------"
echo "Success! Updated ${target_file} to version ${version}"
echo "Blog URL: ${blog_url}"
echo "------------------------------------------------"
