{
  description = "Vivaldi browser - Snapshot and Stable versions";

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
      commonArgs = {
        vivaldi-ffmpeg-codecs = pkgs.vivaldi-ffmpeg-codecs;
        enableWidevine = true;
        widevine-cdm = pkgs.widevine-cdm;
      };
    in {
      vivaldi-snapshot = pkgs.callPackage ./vivaldi-snapshot.nix commonArgs;
      vivaldi-stable = pkgs.callPackage ./vivaldi-stable.nix commonArgs;
      default = self.packages.${system}.vivaldi-snapshot;
    });

    overlays.default = final: _prev: {
      vivaldi-snapshot = final.callPackage ./vivaldi-snapshot.nix {
        vivaldi-ffmpeg-codecs = final.vivaldi-ffmpeg-codecs;
        enableWidevine = true;
        widevine-cdm = final.widevine-cdm;
      };
    };

    overlays.stable = final: _prev: {
      vivaldi-stable = final.callPackage ./vivaldi-stable.nix {
        vivaldi-ffmpeg-codecs = final.vivaldi-ffmpeg-codecs;
        enableWidevine = true;
        widevine-cdm = final.widevine-cdm;
      };
    };
  };
}
