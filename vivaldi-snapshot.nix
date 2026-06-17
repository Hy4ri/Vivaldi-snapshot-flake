{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.1.4076.4";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-VChVPg3Qu8Mv/hMhvXtunFQWW2l/o2gObmvVL/yXv0Y=";
    aarch64-linux = "sha256-iqXbWMZ4GrP2udNpndCVAHHOsJffI2pcNXU4cYdpi3U=";
  };
})
