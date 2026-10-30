{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.3.4191.10";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-H7zgqymFqHp6uNjZjvMSkhVjaKaVZ7Pr0My8D4VFmaQ=";
    aarch64-linux = "sha256-5MPnlK4X2jVSrbBOlHGM6KU4DU1RQTV7H05SPvpO0wk=";
  };
})
