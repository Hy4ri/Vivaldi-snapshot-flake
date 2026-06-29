{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.1.4087.2";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-sMo2mAsFxD7bc3RFExY6/2wBabvEsbvF6zOmq4D1AeU=";
    aarch64-linux = "sha256-nFfXRSQPNFyHl91/iom7BEieJu5tkskdjgJnYQbS/iA=";
  };
})
