{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "7.9.3970.67";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-fvw2FajFP5Aspwdb+C0XUJLWABrZ7/clD4OX8FLtIKI=";
    aarch64-linux = "sha256-GXG1e5d+wxmrzryDQdGplJlAnxAl6kGWzopgE4qH8Zw=";
  };
})
