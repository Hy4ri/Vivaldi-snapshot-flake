{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.3.4171.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-KFLE1Md+xLow+PfoQfo0thlcHZPT+VP1uvCfhLNZG74=";
    aarch64-linux = "sha256-ybLq4l9ArttKaAUMbqDfm0taIKUWYAznZnwtN3+zvtM=";
  };
})
