{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.3.4191.23";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-TgR4m4AH28l/tQ1MiJfiUXZ/x6hoBdMOfOB5CcHhN1A=";
    aarch64-linux = "sha256-8hZ6bKyYfyRVOoa7UgaYywrKKmTCK0F0vfaNxpL7HX4=";
  };
})
