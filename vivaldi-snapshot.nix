{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.2.4106.4";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-iDN1m70FB89xIgzGe18lFD+w2ZYz5OnADuY1i/Vq4Ak=";
    aarch64-linux = "sha256-RNJaJs2IDaSrwgPiiROI/d0+vIfM+ycC72UkZBJzC5c=";
  };
})
