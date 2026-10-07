{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.2.4133.84";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-3whviT+Fd2q2jq9tuZHe7eE00oD9stbHST+j/zDIMB4=";
    aarch64-linux = "sha256-vIJpeC7WcSCVR+t8JPUtqUy4h2NhdPq7APNF5G8DpS4=";
  };
})
