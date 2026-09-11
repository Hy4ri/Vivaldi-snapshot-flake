{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.2.4133.52";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-QOXpNQULSr7dR98o2AODBHMbvw/3NhqXlh1iB6i8rQM=";
    aarch64-linux = "sha256-5v9DCL6B8JnZrFoniAFg5fpLD1ojOnT7HIt4HuQZJzI=";
  };
})
