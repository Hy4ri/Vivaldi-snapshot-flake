{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.0.4033.28";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-l6XzArL+2tdfVGkBNv+RaziER7KArBR+u8CuS1unBcU=";
    aarch64-linux = "sha256-OE1eUlSunBPu3Q3+oaEII1OdTSwcpt0mML1mTY6HLA8=";
  };
})
