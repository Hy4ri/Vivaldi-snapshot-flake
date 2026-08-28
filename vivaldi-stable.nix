{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.1.4087.75";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-nLfNB2SB3Z7PQ0gRXbegQ0JD6RHie2EVdQkuNLLUiZw=";
    aarch64-linux = "sha256-MyGnFbWXjbD5TzHzlXyV1Qg17dx/MjjNWRDRieqksCw=";
  };
})
