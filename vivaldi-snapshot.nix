{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.2.4133.31";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-+0nsjAs6X2s/Od92hXTmtr6C4tsdwG23GPz9LiAEEzI=";
    aarch64-linux = "sha256-aLYnwuBdW4z51CNaArqJ9J/ilsDgzu5DzFS3pURiygk=";
  };
})
