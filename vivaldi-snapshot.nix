{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.1.4087.30";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-FlHVp+7zfZl3if0tBG49Jtkbj3mH/tG+2JYdHL8EIgE=";
    aarch64-linux = "sha256-qxgruTdXZnki0SerWAEm4pHBi8X5jBcAiBxWDFF+QoM=";
  };
})
