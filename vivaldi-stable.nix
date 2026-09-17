{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.2.4133.64";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-YnLipEQSGlpiwQ7mahwAT0jGKsa8dTJQm3gdS8PR7vg=";
    aarch64-linux = "sha256-jb8E6DJGMkF9RFUjx2ejEf1iu5rpCmiPvklBIK5UCxY=";
  };
})
