{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.2.4133.87";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-DiWdhnEJzqo9AR33/Jn6XMlITkx32zOnBV5d2UHLJC8=";
    aarch64-linux = "sha256-KGs2aJjgVROPy95y5otGowA+AguUmoihmHmNBvftr+M=";
  };
})
