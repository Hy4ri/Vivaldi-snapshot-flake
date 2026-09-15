{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.3.4161.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-4aHz9K/CcNTlY7zmSTxCuaD5NBUP3nvbrdlLQ2m1vDI=";
    aarch64-linux = "sha256-IQWvgGjBh6gjWEfFIjllW95VnI5ZlnrQzFNlOBzPTUk=";
  };
})
