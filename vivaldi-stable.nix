{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.1.4087.64";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-JXu8TkrWPby/yyC29R9EpitzSpBwYHpH9bWwK2rzb10=";
    aarch64-linux = "sha256-F+2qVC4KXEQO70J5acGT4n6GcWrQSTJ0wHUBeJhrzc0=";
  };
})
