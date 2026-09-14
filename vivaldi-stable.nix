{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.2.4133.55";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-a950rq0oRw7mOr1JM07jcW/gJNlmX52ELAlams1WjoM=";
    aarch64-linux = "sha256-oO0SdA8MeXjrY17KGH8yYCPZS80Dzg/R6u4ezX+d060=";
  };
})
