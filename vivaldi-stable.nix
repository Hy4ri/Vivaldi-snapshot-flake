{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.2.4133.94";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-L2NxgSniCiMePE5QOpI1560hB6AoXd9eWq32y/fGON0=";
    aarch64-linux = "sha256-CW+cS7DqVTineRSCY2rCk+6ZdbhgADGizoG4VMSvL/c=";
  };
})
