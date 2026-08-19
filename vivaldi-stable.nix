{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.1.4087.68";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-lomG8ENL0X3cLbNC27j517J39G7IHHbi7BXaharMPWg=";
    aarch64-linux = "sha256-mNpBk1LyTbglYW0KLRYJtMNkodO7S2MT9ZqSlC4O+ys=";
  };
})
