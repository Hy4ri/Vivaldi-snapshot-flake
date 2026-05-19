{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.0.4033.19";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-K5pB0wEBWT4AXRXubBgc5FRqxBw1XYvl47L2corTDPM=";
    aarch64-linux = "sha256-9z0TotkvioqpzOXBbHixxWejTzXh7C1mS3iVQNmPXyg=";
  };
})
