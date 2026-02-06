# Vivaldi Snapshot Flake

[![Vivaldi Version](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2FHy4ri%2Fvivaldi-snapshot-flake%2Fmain%2Fversion.json&query=%24.version&label=vivaldi-snapshot&color=ef3939&logo=vivaldi&link=https%3A%2F%2Fraw.githubusercontent.com%2FHy4ri%2Fvivaldi-snapshot-flake%2Fmain%2Fversion.json)](https://vivaldi.com/blog/desktop/crash-fixing-friday-vivaldi-browser-snapshot-3943-3/)
[![Update Status](https://img.shields.io/github/actions/workflow/status/Hy4ri/vivaldi-snapshot-flake/update.yml?label=auto-update)](https://github.com/Hy4ri/vivaldi-snapshot-flake/actions/workflows/update.yml)

Nix flake for Vivaldi browser snapshot builds.

## Installation

### Try it out

```bash
nix run github:Hy4ri/vivaldi-snapshot-flake
```

### NixOS / Home Manager

1. Add the flake input:

```nix
{
  inputs.vivaldi-snapshot.url = "github:Hy4ri/vivaldi-snapshot-flake";
}
```

1. Add the overlay:

```nix
nixpkgs.overlays = [ inputs.vivaldi-snapshot.overlays.default ];
```

1. Install the package:

```nix
# NixOS
environment.systemPackages = [ pkgs.vivaldi-snapshot ];

# Home Manager
home.packages = [ pkgs.vivaldi-snapshot ];
```
