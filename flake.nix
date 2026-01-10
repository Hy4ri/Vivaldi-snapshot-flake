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
      base = pkgs.callPackage ./package.nix {};
    in {
      vivaldi-snapshot = base;
      # Version with proprietary codecs for video playback
      vivaldi-snapshot-with-codecs = base.override {
        proprietaryCodecs = true;
        vivaldi-ffmpeg-codecs = pkgs.vivaldi-ffmpeg-codecs;
      };
      default = self.packages.${system}.vivaldi-snapshot;
    });

    # Overlay for easy integration into NixOS configurations
    overlays.default = final: prev: {
      vivaldi-snapshot = final.callPackage ./package.nix {};
      vivaldi-snapshot-with-codecs = (final.callPackage ./package.nix {}).override {
        proprietaryCodecs = true;
        vivaldi-ffmpeg-codecs = final.vivaldi-ffmpeg-codecs;
      };
    };
  };
}
