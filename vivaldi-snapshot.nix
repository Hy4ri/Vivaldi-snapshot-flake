{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.4.4241.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-nPVza3lqr7N6awMEReBSXRYrFRjmZF4NQCHDv97Ghs0=";
    aarch64-linux = "sha256-zFvkeF/7P8qiobaXJ3/dkSP3Mu8w1dai/PjESLQUOpI=";
  };
})
