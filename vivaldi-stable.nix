{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.3.4191.44";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-Z+3S0Udjl+xTfPjyv81IK7pH5i60ONd+twT5MUrc0ss=";
    aarch64-linux = "sha256-+KnN3SWpORI8a1cK9f+aoTNIP8FkJCPN7ijfwd0wIvI=";
  };
})
