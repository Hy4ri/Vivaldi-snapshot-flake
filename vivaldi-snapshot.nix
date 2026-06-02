{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.1.4061.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-DK6zGZrk0OFOw5npKA/uqniMc58UjySE9qaMKWiHSzA=";
    aarch64-linux = "sha256-qeRydY4dZpmnWxSzyE5aG8yHfAYICAaXvInaI8LUP64=";
  };
})
