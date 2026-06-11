{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.1.4070.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-ZDHBPP1QMqpIpNgkwwjGU/6ciRGaIT3onpHz1pWSTro=";
    aarch64-linux = "sha256-X80KaoWqk2n2wvAi2iEUBvCcHScdhdjypOUTTfLJjUI=";
  };
})
