{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.1.4087.55";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-GicxDYZJxerEEDu08ZlyegLLZSknZtuRZrCUYT+Q1N0=";
    aarch64-linux = "sha256-cSDu1cjfCIkn0wWm6cWaBrfgGZH4+qs3JnXYx+JfC7k=";
  };
})
