{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.4.4238.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-6/fGpOBnFAznSvY4sRCfL6GnzLia4y/nL4lBNVqAOX0=";
    aarch64-linux = "sha256-2mSPPr2ad+qz0vFoWDnkFN9XjmgMeQZvCT4O28jTNOs=";
  };
})
