{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.2.4133.47";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-St7C8XxA1PIegF1JDUoPHV9Q/UBuemKzcRfLQqWKX24=";
    aarch64-linux = "sha256-oyS7p7B8kxRPl0KxXuWQBgEhIPkP36vI6MNDRfkl7UY=";
  };
})
