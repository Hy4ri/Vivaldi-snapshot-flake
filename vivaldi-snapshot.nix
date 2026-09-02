{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.2.4133.43";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-6pPacfwHdAK+5ph1u00CgwClOgX6I8Nz33cKzKn5Buc=";
    aarch64-linux = "sha256-7aVXJeLrz2dMD4/Gd0ywEshfeAFHgJA+dMuDq92w1K4=";
  };
})
