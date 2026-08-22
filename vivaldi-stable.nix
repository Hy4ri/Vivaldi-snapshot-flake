{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.1.4087.70";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-8abo9bxEphuM+AK+vFSBLyFCLi26U6D6YlyL9yFnRlk=";
    aarch64-linux = "sha256-Px6gpOjM9uRqwNSnluIKdYJV7MaFWxyf/6gns6G94QA=";
  };
})
