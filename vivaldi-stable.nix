{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.2.4133.45";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-7OQv1c5tFySd2fwOCJlXlvlOnIB5wg32lI2G1cqMenA=";
    aarch64-linux = "sha256-z5g4BZ+CPqs3gYO/xakwOFdtTdJ5MTWYC/uJBZ3tmH4=";
  };
})
