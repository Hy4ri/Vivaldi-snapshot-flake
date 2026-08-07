{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.2.4126.4";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-7dqwAtW8+TMrK7Jjs36eR2G9g8MiOXMi5aLx7THm954=";
    aarch64-linux = "sha256-AsQhLIlWbSkmsrbH/Li1I2UJ4ayy8Uu9fZiKsZt4wNE=";
  };
})
