{
  description = "Vivaldi Snapshot browser - bleeding edge version";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
    ];

    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

    nixpkgsFor = forAllSystems (system:
      import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      });
  in {
    packages = forAllSystems (system: let
      pkgs = nixpkgsFor.${system};
      base = pkgs.callPackage ./package.nix {
        vivaldi-ffmpeg-codecs = pkgs.vivaldi-ffmpeg-codecs;
      };
    in {
      vivaldi-snapshot = base;
      # Alias for backwards compatibility
      vivaldi-snapshot-with-codecs = base;
      default = base;
    });

    # Overlay for easy integration into NixOS configurations
    overlays.default = final: prev: {
      vivaldi-snapshot = final.callPackage ./package.nix {
        vivaldi-ffmpeg-codecs = final.vivaldi-ffmpeg-codecs;
      };
      # Alias for backwards compatibility
      vivaldi-snapshot-with-codecs = final.vivaldi-snapshot;
    };
  };
}
