{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.2.4133.91";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-eoVzU11vLb/p4r3oUiISgFh6e9/jfmxJvroSIAcur9A=";
    aarch64-linux = "sha256-yz58olLUjOZ1dmnsTu179KovyehycSGXvRGR9aGGUGo=";
  };
})
