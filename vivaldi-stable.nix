{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.3.4191.35";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-RS1Rabhp01smGGAFcPqasGNhDIebNdR87p4LIE9P+ng=";
    aarch64-linux = "sha256-8+PTbBjWIpe7mZ7xrtxQf3DnuZ+BblQ0MeYI3aKs3hY=";
  };
})
