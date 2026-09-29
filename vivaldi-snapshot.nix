{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.3.4175.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-lFpUpR4weZG03BypXsleP9PnV0oJRESLXJx3rlZwfe0=";
    aarch64-linux = "sha256-VDRZoy97M37aI2JyWogfY58zY+5gURcZNt1jYG8ZlzE=";
  };
})
