{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.0.4033.48";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-oypDwZEeAXCrhRIHlbUXRC2kjbKIcxwpVa3SaaGiQmk=";
    aarch64-linux = "sha256-RjLQcbJ0oKNUuVoDIc5ujn54MZJXlZ3xG20a26OQZrc=";
  };
})
