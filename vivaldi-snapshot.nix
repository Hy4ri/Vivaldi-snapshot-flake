{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.0.4033.27";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-dBwOWVJnDgeKMCntWomFL0W/67BWbepLeyVpFNalbiQ=";
    aarch64-linux = "sha256-jmAhmL91HUJr6BGhK8+3PuQwrLIIPRrwb1bPqTL/jFU=";
  };
})
