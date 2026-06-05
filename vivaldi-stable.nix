{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.0.4033.44";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-KzDaOntRz8DOcWX5+GhMyGAr+FIh2RC3S6JEIGaBQfE=";
    aarch64-linux = "sha256-qMz06CR48uLUpw9SCcrvyl/faUq7uIXRIAo0TWmToA8=";
  };
})
