{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-snapshot";
  version = "8.3.4191.3";
  channel = "snapshot";
  installDir = "vivaldi-snapshot";
  launcherName = "vivaldi-snapshot";
  binaryName = "vivaldi-snapshot";
  metaDescription = "Browser for our Friends, powerful and personal (Snapshot)";
  hashes = {
    x86_64-linux = "sha256-sKJz8aXGnWE0qMoa3j44GIQQoFIHdCJmhBnC23jXuGU=";
    aarch64-linux = "sha256-jRpW9I4wJndLfpYf/HedaT/uzTLKumoNo8RLztD6gh8=";
  };
})
