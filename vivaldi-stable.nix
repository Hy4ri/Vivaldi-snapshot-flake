{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.0.4033.34";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-0sQQsiJLStBTzjrd6JRKzrZ/HUZpT68O3tLdLECl7IQ=";
    aarch64-linux = "sha256-K5R/h+BZ0thqejG/3VM12efeZwS4Mw3tq1iHr96HIHQ=";
  };
})
