{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.2.4133.83";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-O9VbOMwgTnbBizK3nhmqOWz65efBhwGHiWcobs1bGTI=";
    aarch64-linux = "sha256-V9/QmggzB032MHuNNpsTog2Urgv/jvnlO3oGZqQASvw=";
  };
})
