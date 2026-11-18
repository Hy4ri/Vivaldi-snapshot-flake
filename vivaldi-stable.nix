{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.3.4191.45";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-qZWKWQhcT927cp+DbHOmca7FEyQAHB0gvXJjT9MJK+Y=";
    aarch64-linux = "sha256-/tlagc3Oj09O/UpsTInSUbI5+Lwm33Lh6X2TNi22fiI=";
  };
})
