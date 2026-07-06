{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.1.4087.40";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-wOG4n7cOF7rVV6Xiqbc1V3GJbXsCFrSDcpCQwvv5mhg=";
    aarch64-linux = "sha256-0XDz6U4QyTkwmPhJufwtVw1O/fWtLVMa0Nz9WiheMpU=";
  };
})
