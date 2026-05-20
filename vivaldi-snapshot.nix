{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.0.4033.24";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-m4F8h5In3LoI7BQys4Mjbu4Cn21jQKBm3qlfCoIcWWI=";
    aarch64-linux = "sha256-Iazb5q1Cw8Qq0d21ZarMBmBIwClf28k2AJ5iig+AS8E=";
  };
})
