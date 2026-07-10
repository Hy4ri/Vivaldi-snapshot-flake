{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.1.4087.48";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-/Bgh+Y6DHWe7al9vLsWWH1HM5JQGwv91KUxQ9TNkqjs=";
    aarch64-linux = "sha256-T6mBi4FpHz2iGXeF91giTbuVp4KjFG1DUnPNpKEV06c=";
  };
})
