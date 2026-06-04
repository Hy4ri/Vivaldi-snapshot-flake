{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.1.4063.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-T3auYdTCX+4057PbE46tjzrJJuwaP3/8S5Dq4DCN2YI=";
    aarch64-linux = "sha256-RBDIPNswz7emsSY28PHjtFtKi0errC9W33wKWGnaTw8=";
  };
})
