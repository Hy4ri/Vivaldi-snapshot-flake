{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.1.4085.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-fYasIfF86N4cPvru1UesVzof2oLeuFZms6qVQYxBlR0=";
    aarch64-linux = "sha256-+6lXR7P6LpSAyWItZguwmiL1AxsP08HKym6q9Bloba4=";
  };
})
