{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.2.4133.80";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-betYiRiqOS/FRo+8IAZGd4Aa3ppZy1zaIvc8KiuUQyA=";
    aarch64-linux = "sha256-DZ+o4enp8t4TnkIfZ2yafq7ovTFxVIMSJIuLsmVWaAk=";
  };
})
