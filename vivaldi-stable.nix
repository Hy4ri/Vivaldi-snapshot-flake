{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.0.4033.46";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-1rvqwRIRHbGo5vYCIeDFYdOQVMW8K2mshoju75H46qE=";
    aarch64-linux = "sha256-Eq6dH65FY8u0OyeoqiCjx+c37Vt//CTVm245OMzxbdk=";
  };
})
