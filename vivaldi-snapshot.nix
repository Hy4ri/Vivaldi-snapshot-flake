{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.1.4086.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-VwOyMfXcWdcEjRO5y9svc4S/4/+YI5QqlBMtzjl2foM=";
    aarch64-linux = "sha256-FXYTgy5B5ic9WUO1jcJu+SQYQ6qFT2qgi0cS8xB/9vM=";
  };
})
