{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.1.4087.36";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-rj9lkP9CNIJj2YAaFUVxibyhoSzRSalrJqBrJIfkg1o=";
    aarch64-linux = "sha256-yA9PmLaWa1rA5yYHxWgU3FkZbkbjCczVP6FVTjhl94I=";
  };
})
