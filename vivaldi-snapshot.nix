{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.2.4133.38";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-XV4GrRWXdhG7rja4RDJPkxHydy0F0iwtnyEkNdK8HKE=";
    aarch64-linux = "sha256-MUDXrGRv05P2PQJ7x0s3dHNY8ZEMMvhdAjlq9qrm+dA=";
  };
})
