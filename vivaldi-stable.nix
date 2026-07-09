{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.1.4087.46";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-1b6IRSnnYC5TclmB9wfk1wzi9CPmPdMQXh5umx+p/Tc=";
    aarch64-linux = "sha256-gZ5AAZ9/KEn6wpt7wu0KR39+NwRBmaXqaxif1sKDqEo=";
  };
})
