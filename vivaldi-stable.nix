{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.1.4087.62";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-Fu0CRlEQBKeKr2tuMsEV6elknej8wO3fuH10DjdwkRk=";
    aarch64-linux = "sha256-DTDO6a3fsnuIko3oHMXlVUx/AUuVZCc/Mtw1QiLNj8U=";
  };
})
