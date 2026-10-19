{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.3.4190.36";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-xLU6TWjuu+SD+f7KPGs32xTYme/VWAOm4IkEwzndVjw=";
    aarch64-linux = "sha256-CVTf8dutOK/NOfNT4U3C0uR5zYLGKhxz3Ded2kfVKlo=";
  };
})
