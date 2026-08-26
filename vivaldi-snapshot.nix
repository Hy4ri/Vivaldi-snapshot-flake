{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.2.4133.29";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-5dXroub+CvXzZ7y2uf+LG9olmOvQHNC4CHmS/YdDfy4=";
    aarch64-linux = "sha256-izgK/6tbAVbvmLUsLTsltAInr44+jUPY1XCN2tvocVc=";
  };
})
