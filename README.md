# Vivaldi Snapshot Flake

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

## Proprietary Codecs (Video Playback)

For WebM, H.264, and other video format support, use the `-with-codecs` variant:

### Quick test

```bash
nix run github:Hy4ri/vivaldi-snapshot-flake#vivaldi-snapshot-with-codecs
```

### Installation

```nix
# NixOS
environment.systemPackages = [ pkgs.vivaldi-snapshot-with-codecs ];

# Home Manager
home.packages = [ pkgs.vivaldi-snapshot-with-codecs ];
```

> **Note:** The codecs version includes `vivaldi-ffmpeg-codecs` for proprietary media support.
