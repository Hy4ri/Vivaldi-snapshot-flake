{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.4.4244.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-8eJgsrnDraZJzJ9Bd3/oNRUUU208ZEkknqb9Gxa3RVU=";
    aarch64-linux = "sha256-qRRXAof0UkgobQSejxiJ5zMTjXKlcb1jYjnB8AHORTI=";
  };
})
