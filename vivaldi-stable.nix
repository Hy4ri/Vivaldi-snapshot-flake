{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.0.4033.35";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-9hcbrYSY7p0mWzXGbrtLj9lwIhTXwF7Evcc2EmajalA=";
    aarch64-linux = "sha256-Fr8zh4O2Dcs5iuZyM1qEzO4F/NAOd+moiw+5b1TmP1Y=";
  };
})
