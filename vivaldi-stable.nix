{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.2.4133.96";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-b3WAVJrdD+IQ4Hs/5iiIBTNN71uvQ3CtciUDFPD0724=";
    aarch64-linux = "sha256-KiYHDdLwFqmUN1w/npAZ8Th+Yx3Ke+SBplB21q4NjAM=";
  };
})
