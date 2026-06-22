{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.1.4078.4";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-Gchon8C5EF0DWiCJwB2pWnpA8cu5P0umFNzQuNxa2IQ=";
    aarch64-linux = "sha256-wIhNFbhInexHtxBPCi2OeIMskp+UwoSuiFbBmrmLmmk=";
  };
})
