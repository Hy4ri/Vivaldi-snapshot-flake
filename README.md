# Vivaldi Flake

[![Vivaldi Snapshot](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2FHy4ri%2Fvivaldi-snapshot-flake%2Fmain%2Fversion.json&query=%24.version&label=vivaldi-snapshot&color=ef3939&logo=vivaldi&link=https%3A%2F%2Fraw.githubusercontent.com%2FHy4ri%2Fvivaldi-snapshot-flake%2Fmain%2Fversion.json)](https://vivaldi.com/blog/snapshots/)
[![Snapshot Update Status](https://img.shields.io/github/actions/workflow/status/Hy4ri/vivaldi-snapshot-flake/update.yml?branch=main&label=snapshot-update)](https://github.com/Hy4ri/vivaldi-snapshot-flake/actions/workflows/update.yml)

[![Vivaldi Stable](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2FHy4ri%2Fvivaldi-snapshot-flake%2Fmain%2Fversion-stable.json&query=%24.version&label=vivaldi-stable&color=ef3939&logo=vivaldi&link=https%3A%2F%2Fraw.githubusercontent.com%2FHy4ri%2Fvivaldi-snapshot-flake%2Fmain%2Fversion-stable.json)](https://vivaldi.com/blog/desktop/)
[![Stable Update Status](https://img.shields.io/github/actions/workflow/status/Hy4ri/vivaldi-snapshot-flake/update-stable.yml?branch=main&label=stable-update)](https://github.com/Hy4ri/vivaldi-snapshot-flake/actions/workflows/update-stable.yml)

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
