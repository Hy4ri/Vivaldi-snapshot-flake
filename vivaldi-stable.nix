{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.3.4191.47";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-cozOsGb1GKuici3t9Yp1UoUBB/hduAx57MqBTmfRdQY=";
    aarch64-linux = "sha256-LBbZSdY9qckUORx82JiqR21/nO/xjBuhGQqgaoQvIag=";
  };
})
