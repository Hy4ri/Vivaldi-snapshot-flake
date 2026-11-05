# Vivaldi Flake

[![Vivaldi Snapshot](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2FHy4ri%2Fvivaldi-snapshot-flake%2Fmain%2Fversion.json&query=%24.version&label=vivaldi-snapshot&color=ef3939&logo=vivaldi&link=https%3A%2F%2Fraw.githubusercontent.com%2FHy4ri%2Fvivaldi-snapshot-flake%2Fmain%2Fversion.json)](https://vivaldi.com/blog/desktop/8-3-rc-3/)
[![Snapshot Update Status](https://img.shields.io/github/actions/workflow/status/Hy4ri/vivaldi-snapshot-flake/update.yml?branch=main&label=snapshot-update)](https://github.com/Hy4ri/vivaldi-snapshot-flake/actions/workflows/update.yml)

[![Vivaldi Stable](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fraw.githubusercontent.com%2FHy4ri%2Fvivaldi-snapshot-flake%2Fmain%2Fversion-stable.json&query=%24.version&label=vivaldi-stable&color=ef3939&logo=vivaldi&link=https%3A%2F%2Fraw.githubusercontent.com%2FHy4ri%2Fvivaldi-snapshot-flake%2Fmain%2Fversion-stable.json)](https://vivaldi.com/blog/desktop/8-3-rc-3/)
[![Stable Update Status](https://img.shields.io/github/actions/workflow/status/Hy4ri/vivaldi-snapshot-flake/update.yml?branch=main&label=stable-update)](https://github.com/Hy4ri/vivaldi-snapshot-flake/actions/workflows/update.yml)

Run and install the [Vivaldi](https://vivaldi.com) browser on NixOS, Home Manager, or any Linux system with Nix.

This flake gives you both channels:

- **Snapshot:** the newest preview builds, released often.
- **Stable:** the normal release.

Proprietary media codecs and Widevine (DRM for Netflix, Spotify, and similar sites) are included. The flake is updated automatically every day.

## Packages

| Package | What it is | Command |
|---|---|---|
| `vivaldi-snapshot` (default) | Snapshot channel | `vivaldi-snapshot` |
| `vivaldi-stable` | Stable channel | `vivaldi-stable` |
| `vivaldi` | Same as `vivaldi-stable` | `vivaldi-stable` |

The two channels use different commands and install directories, so you can install both.

Platforms: Linux `x86_64` and `aarch64`.

## Try it without installing

You need Nix with [flakes enabled](https://wiki.nixos.org/wiki/Flakes).

```bash
nix run github:Hy4ri/vivaldi-snapshot-flake                  # snapshot
nix run github:Hy4ri/vivaldi-snapshot-flake#vivaldi-stable   # stable
```

## Install

There are **two ways** to install. **Pick one.** They give the same result.

| Option | Use it when |
|---|---|
| **A. Overlay** | You want to write `pkgs.vivaldi-snapshot`, like any other nixpkgs package. |
| **B. Direct package** | You do not want to use overlays. |

### Step 1: Add the flake input (needed for both options)

In your system `flake.nix`:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    vivaldi.url = "github:Hy4ri/vivaldi-snapshot-flake";
  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations.myhost = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; }; # lets your modules use `inputs`
      modules = [ ./configuration.nix ];
    };
  };
}
```

> Already have a flake? Add only the `vivaldi.url` line, and make sure `inputs` reaches your modules (`specialArgs` for NixOS, `extraSpecialArgs` for Home Manager).

### Step 2, Option A: Overlay

In `configuration.nix`:

```nix
{ inputs, pkgs, ... }:
{
  nixpkgs.overlays = [ inputs.vivaldi.overlays.default ];
  nixpkgs.config.allowUnfree = true; # required: Vivaldi and Widevine are unfree

  environment.systemPackages = [
    pkgs.vivaldi-snapshot
    # pkgs.vivaldi-stable
  ];
}
```

The overlay adds all three packages (`vivaldi-snapshot`, `vivaldi-stable`, `vivaldi`). Install the ones you want.

> Note: this overlay replaces the `vivaldi` package from nixpkgs with this flake's stable build.

For Home Manager, keep the two `nixpkgs` lines and use `home.packages = [ pkgs.vivaldi-snapshot ];` instead.

### Step 2, Option B: Direct package

In `configuration.nix`:

```nix
{ inputs, pkgs, ... }:
let
  vivaldi = inputs.vivaldi.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  environment.systemPackages = [
    vivaldi.vivaldi-snapshot
    # vivaldi.vivaldi-stable
  ];
}
```

You do not need `allowUnfree` for this option. For Home Manager, put the same packages in `home.packages`.

### Step 3: Rebuild

```bash
sudo nixos-rebuild switch --flake .#myhost
```

## Updates

A GitHub Action checks for new Vivaldi releases every day, tests the build, and commits the new version. To get it, update your lock file:

```bash
nix flake update vivaldi
```

### Manual update (maintainers)

If a new release is out and the daily job has not found it yet:

```bash
./update-version.sh --channel snapshot 9.9.9999.99
./update-version.sh --channel stable 9.9.9999.99
```

The script downloads the `.deb` files for both architectures, computes the hashes, and updates the channel file, the version JSON, and the badge link in this README.

### Repository layout

| File | Purpose |
|---|---|
| `flake.nix` | Flake entry point: packages, overlays, and the media codecs |
| `package.nix` | Shared build recipe for both channels |
| `vivaldi-snapshot.nix` | Snapshot version and hashes |
| `vivaldi-stable.nix` | Stable version and hashes |
| `update-version.sh` | Updates one channel: `--channel snapshot\|stable <version>` |
| `version.json` / `version-stable.json` | Current versions (also used by the badges) |

Local checks: `nix flake check`, `nix build .#vivaldi-snapshot`, and `nix build .#vivaldi-stable`.

## Old `stable` branch and `overlays.stable`

The separate `stable` branch is deprecated. All updates now happen on `main`. If your input uses `github:Hy4ri/vivaldi-snapshot-flake/stable`, change it to `github:Hy4ri/vivaldi-snapshot-flake`.

`overlays.stable` still works, but it is the same as `overlays.default`. Use `overlays.default` in new configs.

## License

Vivaldi is proprietary software by Vivaldi Technologies; Nix marks it as unfree. This flake only downloads and packages the official `.deb` releases.

## Support

If this flake helps you, you can support my work on [GitHub Sponsors](https://github.com/sponsors/hy4ri) or [Ko-fi](https://ko-fi.com/m_5_7). A star on the repo also helps.
