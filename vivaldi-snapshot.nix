{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.3.4191.1";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-ARfObpw55IvHyrbenA3BWtSurg5jD2WxGbmLzTCgYfs=";
    aarch64-linux = "sha256-xu6UgGcJ5HqbZ/VSCLmQM0Mei2u7gOTrp862iZbSOyw=";
  };
})
