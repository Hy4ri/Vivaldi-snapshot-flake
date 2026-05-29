{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.1.4057.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-OoMQx1ad3nRriAbIZtAaGBKjIuQr9McnfEsEFZVXEdk=";
    aarch64-linux = "sha256-bTjZcJqwsEXUapCmKQi3yvxoG3JSrsT3/Yg3ohn+Qis=";
  };
})
