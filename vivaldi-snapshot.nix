{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.3.4157.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-jw4dMzvjQ2KuuUXe938dhkzEpTDSCuIgdQD6wq/WCbI=";
    aarch64-linux = "sha256-TMnK0hrUe2tBC3b7KV1VnVec0SBW5k4ZpCNsNBbn2F0=";
  };
})
