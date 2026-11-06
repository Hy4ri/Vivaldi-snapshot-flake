{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.3.4191.30";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-9lfwg4RH0RV4T/QGX5FR8BDwgtYkweLhJsSFNVllf4s=";
    aarch64-linux = "sha256-h0O6ju12DcMYff0YU2gKcZy95KazEnqmOHd0rGrmiSo=";
  };
})
