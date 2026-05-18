{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.0.4033.15";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-IWx5TqvuEignIsnDdXJ7oYRf7NBllS9FIqdy2qJ3Tuw=";
    aarch64-linux = "sha256-t7tSHj68DOUcXxlQdQAl9qyVuz/sD8C7OGDV8L2UPVc=";
  };
})
