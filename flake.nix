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

    enableWidevine = true;

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
        inherit enableWidevine;
        widevine-cdm = pkgs.widevine-cdm;
      };
    in {
      vivaldi-snapshot = base;
      default = base;
    });

    # Overlay for easy integration into NixOS configurations
    overlays.default = final: _prev: {
      vivaldi-snapshot = final.callPackage ./package.nix {
        vivaldi-ffmpeg-codecs = final.vivaldi-ffmpeg-codecs;
        inherit enableWidevine;
        widevine-cdm = final.widevine-cdm;
      };
    };
  };
}
