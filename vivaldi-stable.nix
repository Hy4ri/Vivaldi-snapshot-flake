{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.1.4087.53";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-ZpO2xbf92KkreO4CkUMUweiqOJIbI/YMcRgE5PsaM+Q=";
    aarch64-linux = "sha256-nB2fUcZTKWVTcHl7U5P1+1ZSeurrJsb5ug9kAofPJjQ=";
  };
})
