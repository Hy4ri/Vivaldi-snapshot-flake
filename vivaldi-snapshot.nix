{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.3.4185.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-+nPdtT+QLd3/bvYNulVXZhUsHYNpG4/PkP+bwjVgiUg=";
    aarch64-linux = "sha256-P0a73RJ+axQ+wW98TIWo9dVG3W9Ln3VVzIypupg5T6o=";
  };
})
