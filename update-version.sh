#!/usr/bin/env bash

set -e

get_hash() {
  local url="$1"
  local temp_file
  temp_file=$(mktemp)

  # Download to temp file
  if curl -sL "$url" -o "$temp_file"; then
    # Calculate sha256 sum
    local raw_hash
    raw_hash=$(sha256sum "$temp_file" | cut -d' ' -f1)
    nix hash convert --hash-algo sha256 --to sri "$raw_hash"
  fi
  # Clean up immediately
  rm -f "$temp_file"
}

get_blog_url() {
  local version="$1"
  # Extract build.patch (e.g., "7.8.3921.9" -> "3921-9")
  local build_patch
  build_patch=$(echo "$version" | sed -E 's/^[0-9]+\.[0-9]+\.([0-9]+)\.([0-9]+)$/\1-\2/')
  
  # Fetch snapshots page and find the matching blog post URL
  local blog_url
  blog_url=$(curl -sL "https://vivaldi.com/blog/snapshots/" | \
    grep -oP 'href="https://vivaldi\.com/blog/desktop/[^"]*snapshot-'"$build_patch"'/"' | \
    head -n 1 | \
    sed 's/href="//' | \
    sed 's/"$//')
  
  echo "$blog_url"
}

# 1. Ask for version
if [ -n "$1" ]; then
    version="$1"
    echo "Version provided from argument: $version"
else
    echo "Current directory: $(pwd)"
    read -p "Enter Vivaldi Snapshot version to download (e.g., 7.9.4000.1): " version
fi

if [[ -z "$version" ]]; then
  echo "Error: Version cannot be empty."
  exit 1
fi

echo "------------------------------------------------"
echo "Target Version: $version"
echo "------------------------------------------------"

# Define URLs
url_amd64="https://downloads.vivaldi.com/snapshot/vivaldi-snapshot_${version}-1_amd64.deb"
url_arm64="https://downloads.vivaldi.com/snapshot/vivaldi-snapshot_${version}-1_arm64.deb"

# Download and Hash
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

# Fetch blog URL
echo "Fetching blog post URL..."
blog_url=$(get_blog_url "$version")
if [[ -z "$blog_url" ]]; then
  echo "Warning: Could not find blog post for this version. Using default."
  blog_url="https://vivaldi.com/blog/snapshots/"
else
  echo "  Blog URL: $blog_url"
fi

# Update package.nix
package_file="package.nix"

if [[ ! -f "$package_file" ]]; then
  echo "Error: $package_file not found in current directory."
  exit 1
fi

echo "Updating $package_file..."

# Use a temporary file
temp_file=$(mktemp)

sed "s/version = \".*\";/version = \"$version\";/" "$package_file" >"$temp_file"

# Update hashes
sed -i "s|x86_64-linux = \"sha256-.*\";|x86_64-linux = \"$hash_amd64_sri\";|" "$temp_file"
sed -i "s|aarch64-linux = \"sha256-.*\";|aarch64-linux = \"$hash_arm64_sri\";|" "$temp_file"

# Move back
mv "$temp_file" "$package_file"

# Update version.json with version and blog URL
echo "Updating version.json..."
cat > version.json << EOF
{
  "version": "$version",
  "blogUrl": "$blog_url"
}
EOF

# Update README.md badge link
echo "Updating README.md..."
sed -i "s|](https://vivaldi.com/blog/[^)]*)|]($blog_url)|" README.md

echo "------------------------------------------------"
echo "Success! Updated package.nix to version $version"
echo "Blog URL: $blog_url"
echo "------------------------------------------------"
