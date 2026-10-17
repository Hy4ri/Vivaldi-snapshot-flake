{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.2.4133.89";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-XajkvUyWpJJkBhHW+iNyf6DjFGo0bSR99XIHmn1fJ0g=";
    aarch64-linux = "sha256-f+iwFBr34bHMhHEP3NjMG8qKQlwYCjaKzabyaL0Y/Ag=";
  };
})
