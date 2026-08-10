{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.2.4129.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-+V8kh6vm2KC3Mb7sKOCnhmMoP3bQwEm2Vdkr8OqJfcQ=";
    aarch64-linux = "sha256-JSWANIKf1ARhI6unnZBt5Klri8UC0543x2Cu8skduCA=";
  };
})
