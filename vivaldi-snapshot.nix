{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.3.4191.19";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-yxJw+wza1nxVrqjAx3gcd1v9TQvmkGupc5Qucwedf1k=";
    aarch64-linux = "sha256-vAM0gTIS2XFBObWNa0M5mN4DfIKAUD2Q0RCH7Xycyn0=";
  };
})
