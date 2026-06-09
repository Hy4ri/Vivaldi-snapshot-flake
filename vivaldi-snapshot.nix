{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.1.4068.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-TKrMPvUmEiJiKyZFPhuGNtYt64o0sfIPf98LvkKEezk=";
    aarch64-linux = "sha256-NEDrS4Pviwalo7agmITGib5ZHZiE6lXHgR8twYbO6XA=";
  };
})
