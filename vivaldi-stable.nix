{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.0.4033.26";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-6BexB3ZQLNqMPjM9XQgX3RowF+cEJcQmV/Z9QpzhKOE=";
    aarch64-linux = "sha256-WJLEdzqF+HBdSSYLlkbxlSwO9IcYeFh7BTAk+2FQln8=";
  };
})
