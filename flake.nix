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

    nixpkgsFor = forAllSystems (system: import nixpkgs {inherit system;});
  in {
    packages = forAllSystems (system: {
      vivaldi-snapshot = nixpkgsFor.${system}.callPackage ./package.nix {};
      default = self.packages.${system}.vivaldi-snapshot;
    });

    # Overlay for easy integration into NixOS configurations
    overlays.default = final: prev: {
      vivaldi-snapshot = final.callPackage ./package.nix {};
    };
  };
}
