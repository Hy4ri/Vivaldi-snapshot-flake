{
  lib,
  stdenv,
  coreutils,
  fetchurl,
  zlib,
  libX11,
  libXext,
  libSM,
  libICE,
  libxkbcommon,
  libxshmfence,
  libXfixes,
  libXt,
  libXi,
  libXcursor,
  libXScrnSaver,
  libXcomposite,
  libXdamage,
  libXtst,
  libXrandr,
  alsa-lib,
  dbus,
  cups,
  libexif,
  ffmpeg,
  systemd,
  libva,
  libGL,
  freetype,
  fontconfig,
  libXft,
  libXrender,
  libxcb,
  expat,
  libuuid,
  libxml2,
  glib,
  gtk3,
  pango,
  gdk-pixbuf,
  cairo,
  atk,
  at-spi2-atk,
  at-spi2-core,
  qt6,
  libdrm,
  libgbm,
  vulkan-loader,
  nss,
  nspr,
  patchelf,
  makeWrapper,
  wayland,
  pipewire,
  proprietaryCodecs ? true,
  vivaldi-ffmpeg-codecs ? null,
  enableWidevine ? false,
  widevine-cdm ? null,
  # Performance options
  enableHardwareAcceleration ? true,
  commandLineArgs ? "",
  pulseSupport ? stdenv.hostPlatform.isLinux,
  libpulseaudio,
  kerberosSupport ? true,
  libkrb5,
}:
stdenv.mkDerivation rec {
  pname = "vivaldi-snapshot";
  version = "7.8.3925.53";

  suffix =
    {
      aarch64-linux = "arm64";
      x86_64-linux = "amd64";
    }
    .${
      stdenv.hostPlatform.system
    } or (throw "Unsupported system: ${stdenv.hostPlatform.system}");

  src = fetchurl {
    url = "https://downloads.vivaldi.com/snapshot/vivaldi-snapshot_${version}-1_${suffix}.deb";
    hash =
      {
        aarch64-linux = "sha256-jX1N0SHNa25KHSAB9Vs64R3nlAglS9E0CpAPRDJj3W8=";
        x86_64-linux = "sha256-u1i+6XX7gFNaaroUdg+3D4T2Xv6qTiMW7hFxvC5KWrI=";
      }
      .${
        stdenv.hostPlatform.system
      } or (throw "Unsupported system: ${stdenv.hostPlatform.system}");
  };

  unpackPhase = ''
    runHook preUnpack
    ar vx $src
    tar -xvf data.tar.xz
    runHook postUnpack
  '';

  nativeBuildInputs = [
    patchelf
    makeWrapper
    qt6.wrapQtAppsHook
  ];

  dontWrapQtApps = true;

  buildInputs =
    [
      stdenv.cc.cc
      stdenv.cc.libc
      zlib
      libX11
      libXt
      libXext
      libSM
      libICE
      libxcb
      libxkbcommon
      libxshmfence
      libXi
      libXft
      libXcursor
      libXfixes
      libXScrnSaver
      libXcomposite
      libXdamage
      libXtst
      libXrandr
      atk
      at-spi2-atk
      at-spi2-core
      alsa-lib
      dbus
      cups
      gtk3
      gdk-pixbuf
      libexif
      ffmpeg
      systemd
      libva
      qt6.qtbase
      qt6.qtwayland
      freetype
      fontconfig
      libXrender
      libuuid
      expat
      glib
      nss
      nspr
      libGL
      libxml2
      pango
      cairo
      libdrm
      libgbm
      vulkan-loader
      wayland
      pipewire
    ]
    ++ lib.optional proprietaryCodecs vivaldi-ffmpeg-codecs
    ++ lib.optional pulseSupport libpulseaudio
    ++ lib.optional kerberosSupport libkrb5;

  libPath =
    lib.makeLibraryPath buildInputs
    + lib.optionalString (stdenv.hostPlatform.is64bit) (
      ":" + lib.makeSearchPathOutput "lib" "lib64" buildInputs
    )
    + ":$out/opt/vivaldi-snapshot/lib";

  buildPhase =
    ''
      runHook preBuild
      echo "Patching Vivaldi binaries"
      for f in chrome_crashpad_handler vivaldi-bin vivaldi-sandbox ; do
        patchelf \
          --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
          --set-rpath "${libPath}" \
          opt/vivaldi-snapshot/$f
      done

      for f in libGLESv2.so libqt5_shim.so libqt6_shim.so; do
        patchelf --set-rpath "${libPath}" opt/vivaldi-snapshot/$f
      done
    ''
    + lib.optionalString proprietaryCodecs ''
      ln -s ${vivaldi-ffmpeg-codecs}/lib/libffmpeg.so opt/vivaldi-snapshot/libffmpeg.so.''${version%\.*\.*}
    ''
    + ''
      echo "Finished patching Vivaldi binaries"
      runHook postBuild
    '';

  dontPatchELF = true;
  dontStrip = true;

  installPhase =
    ''
      runHook preInstall
      mkdir -p "$out"
      cp -r opt "$out"
      mkdir -p "$out/share"
      cp -r usr/share/{applications,xfce4} "$out"/share
      substituteInPlace "$out"/share/applications/*.desktop \
        --replace-fail /usr/bin/vivaldi-snapshot "$out"/bin/vivaldi-snapshot
      local d
      for d in 16 24 32 48 64 128 256; do
        mkdir -p "$out"/share/icons/hicolor/''${d}x''${d}/apps
        ln -s \
          "$out"/opt/vivaldi-snapshot/product_logo_''${d}.png \
          "$out"/share/icons/hicolor/''${d}x''${d}/apps/vivaldi-snapshot.png
      done
      # Wrap the actual binary (vivaldi-bin), not the shell script (vivaldi)
      wrapProgram "$out/opt/vivaldi-snapshot/vivaldi-bin" \
        --add-flags ${lib.escapeShellArg (lib.concatStringsSep " " (lib.optionals enableHardwareAcceleration [
          "--enable-gpu-rasterization"
          "--enable-zero-copy"
          "--enable-features=VaapiVideoDecoder,VaapiVideoEncoder,VaapiIgnoreDriverChecks"
          "--disable-features=UseChromeOSDirectVideoDecoder"
          "--ignore-gpu-blocklist"
        ]
        ++ lib.optionals (commandLineArgs != "") [commandLineArgs]))} \
        --prefix XDG_DATA_DIRS : ${gtk3}/share/gsettings-schemas/${gtk3.name}/ \
        --prefix LD_LIBRARY_PATH : ${libPath} \
        --prefix PATH : ${coreutils}/bin \
        ''${qtWrapperArgs[@]}
      # Create bin directory and symlink to the launcher script
      mkdir "$out/bin"
      ln -s "$out/opt/vivaldi-snapshot/vivaldi-snapshot" "$out/bin/vivaldi-snapshot"
    ''
    + lib.optionalString enableWidevine ''
      ln -sf ${widevine-cdm}/share/google/chrome/WidevineCdm $out/opt/vivaldi-snapshot/WidevineCdm
    ''
    + ''
      runHook postInstall
    '';

  meta = {
    description = "Browser for our Friends, powerful and personal (Snapshot)";
    homepage = "https://vivaldi.com";
    license = lib.licenses.unfree;
    sourceProvenance = with lib.sourceTypes; [binaryNativeCode];
    mainProgram = "vivaldi-snapshot";
    platforms = [
      "x86_64-linux"
      "aarch64-linux"
    ];
  };
}
