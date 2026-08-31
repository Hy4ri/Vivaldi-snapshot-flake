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

    customFFmpegCodecs = pkgs: let
      system = pkgs.stdenv.hostPlatform.system;
      systemInfo = {
        "x86_64-linux" = {
          revision = "117";
          hash = "sha256-YEE7oF8NLGDCQ3gpY5z6B+7xDxcOumjOzwUztJUM+/s=";
          folder = "chromium-ffmpeg-git-2026-05-18";
        };
        "aarch64-linux" = {
          revision = "116";
          hash = "sha256-4RmVOQ9emlRyzAGxeiSLwvkGv+7R/mKLVYm5IWXqLpo=";
          folder = "chromium-ffmpeg-git-2026-03-16";
        };
      }.${system} or (throw "Unsupported system for custom codecs: ${system}");
    in
      pkgs.stdenv.mkDerivation {
        pname = "chromium-codecs-ffmpeg-extra";
        version = systemInfo.folder;

        src = pkgs.fetchurl {
          url = "https://api.snapcraft.io/api/v1/snaps/download/XXzVIXswXKHqlUATPqGCj2w2l7BxosS8_${systemInfo.revision}.snap";
          hash = systemInfo.hash;
        };

        nativeBuildInputs = [ pkgs.squashfsTools ];

        unpackPhase = ''
          unsquashfs -dest . $src
        '';

        installPhase = ''
          install -vD ${systemInfo.folder}/chromium-ffmpeg/libffmpeg.so $out/lib/libffmpeg.so
        '';
      };
  in {
    packages = forAllSystems (system: let
      pkgs = nixpkgsFor.${system};
      codecs = customFFmpegCodecs pkgs;
      commonArgs = {
        vivaldi-ffmpeg-codecs = codecs;
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
        vivaldi-ffmpeg-codecs = customFFmpegCodecs final;
        enableWidevine = true;
        widevine-cdm = final.widevine-cdm;
      };
      vivaldi-stable = final.callPackage ./vivaldi-stable.nix {
        vivaldi-ffmpeg-codecs = customFFmpegCodecs final;
        enableWidevine = true;
        widevine-cdm = final.widevine-cdm;
      };
    };

    overlays.stable = final: _prev: {
      vivaldi-stable = final.callPackage ./vivaldi-stable.nix {
        vivaldi-ffmpeg-codecs = customFFmpegCodecs final;
        enableWidevine = true;
        widevine-cdm = final.widevine-cdm;
      };
      vivaldi-snapshot = final.callPackage ./vivaldi-snapshot.nix {
        vivaldi-ffmpeg-codecs = customFFmpegCodecs final;
        enableWidevine = true;
        widevine-cdm = final.widevine-cdm;
      };
    };
  };
}
