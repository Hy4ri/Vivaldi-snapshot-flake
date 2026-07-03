{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.0.4033.57";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-tSzjiIGmTMmZw3sC5nXN/23Ll9QhwW9KICe4dU2j2J4=";
    aarch64-linux = "sha256-fXWo1rjzxPQFdYGC4ai0gCd4ktxI05RBEPqF8qq74c8=";
  };
})
