{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.0.4033.42";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-abaU3PiUQNhpliCnmih96pkU6CgW/S1GgxFKFo8PBmo=";
    aarch64-linux = "sha256-qHIUVfD+rVIrBse5xsmJwVjCAszieAJzuHAC/oKzCHA=";
  };
})
