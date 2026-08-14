{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.2.4133.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-0JvxxazCgc8Ic56NxHhpyF5XBq/mSdHBqkQNg/1/zwY=";
    aarch64-linux = "sha256-wIzMGVa3RtO5LurkdN9vCPjGgdMBxT7HByE9ikWPGf0=";
  };
})
