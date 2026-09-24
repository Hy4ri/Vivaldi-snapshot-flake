{ callPackage, ... }@args:
callPackage ./package.nix (args // {
  pname = "vivaldi-stable";
  version = "8.2.4133.76";
  channel = "stable";
  installDir = "vivaldi";
  launcherName = "vivaldi";
  binaryName = "vivaldi-stable";
  metaDescription = "Browser for our Friends, powerful and personal";
  hashes = {
    x86_64-linux = "sha256-WPfZYy+cCxSKFdLbD5MpTb4lovGk0nDVRcjpXxbOwGI=";
    aarch64-linux = "sha256-co8BxKbDVyjYWOEIg4MOHiNB1GnHQjm8Z9nWabyaivA=";
  };
})
