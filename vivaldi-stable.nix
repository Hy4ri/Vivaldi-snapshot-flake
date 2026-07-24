{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.1.4087.58";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-/2GdNvj9+O6LDfqJdjNNdNWJymNAtnpTnzznW/4jINE=";
    aarch64-linux = "sha256-Yvs3HRbsrgTeYXAKrRliLArXtK96jnjjf7x/sdpwvig=";
  };
})
