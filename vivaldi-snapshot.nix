{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.1.4087.32";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-UsotWgGxcIZn3GdOY5OMZ/b7fzmb0+iFXvNGChRBnGw=";
    aarch64-linux = "sha256-Du2hSVlRu8OE6Mfa9fG8tiL2mgcuJuDPKy5qkVL/dyE=";
  };
})
