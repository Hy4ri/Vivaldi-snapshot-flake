{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.0.4033.54";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-a4ZLX/DpygZgPPjt4BQxTuRbFoPmNuRgdZFiI6UclQI=";
    aarch64-linux = "sha256-i2FAMp3MFsnXTjQoF4Y/BuB6j+x3ugfsu0ePGI/h5Po=";
  };
})
