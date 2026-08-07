# Vivaldi Flake

[![Vivaldi Snapshot](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2FHy4ri%2Fvivaldi-snapshot-flake%2Fmain%2Fversion.json&query=%24.version&label=vivaldi-snapshot&color=ef3939&logo=vivaldi&link=https%3A%2F%2Fraw.githubusercontent.com%2FHy4ri%2Fvivaldi-snapshot-flake%2Fmain%2Fversion.json)](https://vivaldi.com/blog/desktop/address-field-fixes-and-a-chromium-bump-vivaldi-browser-snapshot-4126-4/)
[![Snapshot Update Status](https://img.shields.io/github/actions/workflow/status/Hy4ri/vivaldi-snapshot-flake/update.yml?branch=main&label=snapshot-update)](https://github.com/Hy4ri/vivaldi-snapshot-flake/actions/workflows/update.yml)

[![Vivaldi Stable](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2FHy4ri%2Fvivaldi-snapshot-flake%2Fmain%2Fversion-stable.json&query=%24.version&label=vivaldi-stable&color=ef3939&logo=vivaldi&link=https%3A%2F%2Fraw.githubusercontent.com%2FHy4ri%2Fvivaldi-snapshot-flake%2Fmain%2Fversion-stable.json)](https://vivaldi.com/blog/desktop/minor-update-seven-8-1/)
[![Stable Update Status](https://img.shields.io/github/actions/workflow/status/Hy4ri/vivaldi-snapshot-flake/update.yml?branch=main&label=stable-update)](https://github.com/Hy4ri/vivaldi-snapshot-flake/actions/workflows/update.yml)

Nix flake for Vivaldi browser — provides both **Snapshot** (bleeding-edge) and **Stable** versions.

## Installation

### Try it out

```bash
# Snapshot (default)
nix run github:Hy4ri/vivaldi-snapshot-flake

# Stable
nix run github:Hy4ri/vivaldi-snapshot-flake#vivaldi-stable
```

### NixOS / Home Manager

1. Add the flake input:

```nix
{
  inputs.vivaldi.url = "github:Hy4ri/vivaldi-snapshot-flake";
}
```

2. Add the overlay(s):

- **Snapshot only** (`pkgs.vivaldi-snapshot`):
```nix
nixpkgs.overlays = [ inputs.vivaldi.overlays.default ];
```

- **Stable only** (`pkgs.vivaldi-stable`):
```nix
nixpkgs.overlays = [ inputs.vivaldi.overlays.stable ];
```

- **Both**:
```nix
nixpkgs.overlays = [
  inputs.vivaldi.overlays.default
  inputs.vivaldi.overlays.stable
];
```

3. Install the package(s):

```nix
# NixOS
environment.systemPackages = with pkgs; [
  vivaldi-snapshot   # or vivaldi-stable
];

# Home Manager
home.packages = with pkgs; [
  vivaldi-snapshot   # or vivaldi-stable
];
```

## Project Structure

| File | Purpose |
|---|---|
| `flake.nix` | Flake entry point — exposes packages and overlays |
| `package.nix` | Parameterized derivation builder — accepts variant-specific args |
| `vivaldi-snapshot.nix` | Wrapper calling `package.nix` with snapshot parameters (version, hashes, paths) |
| `vivaldi-stable.nix` | Wrapper calling `package.nix` with stable parameters |
| `update-version.sh` | CLI tool to check and update a variant: `--channel snapshot|stable <version>` |
| `version.json` | Snapshot version metadata (used by README badge) |
| `version-stable.json` | Stable version metadata |
| `flake.lock` | Pinned nixpkgs revision |

## Manual Updates

If a new Vivaldi release is out and the auto-update CI hasn't caught it yet, you can update manually:

```bash
# Update snapshot
./update-version.sh --channel snapshot 9.9.9999.99

# Update stable
./update-version.sh --channel stable 9.9.9999.99
```

The script will:
1. Download the `.deb` files for both architectures
2. Calculate their `sha256` hashes
3. Update the version and hashes in the wrapper file
4. Update the version JSON and README badge link

## Local Development

```bash
# Evaluate the flake
nix flake check

# Build a specific variant
nix build .#vivaldi-snapshot
nix build .#vivaldi-stable

# Run directly (no install)
nix run .#vivaldi-snapshot
nix run .#vivaldi-stable

# Build for aarch64-linux (cross-compilation)
nix build .#packages.aarch64-linux.vivaldi-snapshot
```

## Stable Branch Deprecation

The separate `stable` branch is **deprecated**. All updates now happen on `main`. If you were using `github:Hy4ri/vivaldi-snapshot-flake/stable`, switch to:

```nix
{
  inputs.vivaldi.url = "github:Hy4ri/vivaldi-snapshot-flake";
  # then use pkgs.callPackage ./vivaldi-stable.nix { … }
  # or add overlays.stable to get pkgs.vivaldi-stable
}
```
