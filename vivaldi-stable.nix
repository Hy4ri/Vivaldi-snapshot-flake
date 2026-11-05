{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.3.4191.28";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-d63vsm7x+zFHymASivhG5pfwGadwtregs2sAYZB0oqM=";
    aarch64-linux = "sha256-gDzFmYbx8aB+uje6VNfkCh6AKXUG1TgpRtAo1aiNznw=";
  };
})
