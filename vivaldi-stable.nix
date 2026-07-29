{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.1.4087.61";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-fluTiicLsQgqGsdBZlRo8QSLI03xjhhXwuZog3Dc44Y=";
    aarch64-linux = "sha256-dr6elx+KCmwqwPDnGXO8M4vMmEjCUfILULBKuKvQMEg=";
  };
})
