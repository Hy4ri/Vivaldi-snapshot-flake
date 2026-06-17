{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.0.4033.50";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-IVytlw5NzxV1TwLHeX81AgWEHHVzksVC3a0S/WuWEaA=";
    aarch64-linux = "sha256-5n5+DY03lRDKLWX/WPX17Wg7IeTl4MDKEWOZEYHaPDE=";
  };
})
