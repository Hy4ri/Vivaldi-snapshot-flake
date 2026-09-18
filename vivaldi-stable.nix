{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.2.4133.68";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-iP8qRGGQbDmnL3Mfgsx0eQX15DcHOvZ0Wu9hr1ALBME=";
    aarch64-linux = "sha256-SgP94CaOmQJfbZFIIap41dHWc/1cgbEhMI5rpHQ+eGc=";
  };
})
