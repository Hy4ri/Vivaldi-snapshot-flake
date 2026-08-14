{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.1.4087.66";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-fwwJ07JmPT+6st8aYgvmkQtn6Pc8aP4GcSf1jAnRBAg=";
    aarch64-linux = "sha256-7cTCzyIb0e+y0Pa6Im0QGBp7J5KhbYWsYEAgTtcNZIw=";
  };
})
