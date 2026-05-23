{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.0.4033.32";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-RS34ZKQGDdCSqTItoU2cseXylpvm57D+jtS8SSIEKXw=";
    aarch64-linux = "sha256-735g7bbOHUHGozl5ine7SndNl9//sltK76Rq6lZRc04=";
  };
})
