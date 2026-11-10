{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.4.4226.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-mkQQyL/WKIdTzV9GNdSfEAzRAw0WJAKodjWqwJZxJFE=";
    aarch64-linux = "sha256-YJP2jGCx1E1NOeKuo0RGuiNO1ldplHQaE6Qq5NT33UM=";
  };
})
