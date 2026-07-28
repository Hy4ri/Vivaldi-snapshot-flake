{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.2.4116.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-qWbZ29xM3yRSkAYcq2PvjLWDWOtuixo0AkD9Fx3mC+g=";
    aarch64-linux = "sha256-KvqcBpLGEGgp2hXQOIWCbPgIfdzppqtsKSzZLY9CUAU=";
  };
})
