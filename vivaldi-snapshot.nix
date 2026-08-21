{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.2.4133.24";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-M7YOD+QZB7J3XWR3PmQ8UsKnQA2dzqzuzwPNVNT4aWY=";
    aarch64-linux = "sha256-zBvLxT5ZDe1dhNHpSEoZvO1xILl6mzQAk8JsY0Dz9SM=";
  };
})
