{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.1.4087.56";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-MkbUv3r/A1XBt9ENJOgJc7awOQkG+Nk5ZGo40HKzuj8=";
    aarch64-linux = "sha256-wkUEnpmwggmkX2K4xng8qAczDUCRPIE56n9zdDvPG8c=";
  };
})
