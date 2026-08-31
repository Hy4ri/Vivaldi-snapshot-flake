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
  addDriverRunpath,
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
  kerberosSupport ? false,
  libkrb5,
  hashes,
  pname,
  version,
  channel,
  installDir,
  launcherName,
  binaryName,
  metaDescription,
  ...
}:
stdenv.mkDerivation rec {
  inherit pname version;

  suffix =
    {
      aarch64-linux = "arm64";
      x86_64-linux = "amd64";
    }
    .${
      stdenv.hostPlatform.system
    } or (throw "Unsupported system: ${stdenv.hostPlatform.system}");

  src = fetchurl {
    url = "https://downloads.vivaldi.com/${channel}/${pname}_${version}-1_${suffix}.deb";
    hash = hashes.${stdenv.hostPlatform.system} or (throw "Unsupported system: ${stdenv.hostPlatform.system}");
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
    + ":$out/opt/${installDir}:$out/opt/${installDir}/lib";

  buildPhase =
    ''
      runHook preBuild
      echo "Patching Vivaldi binaries"
      for f in chrome_crashpad_handler vivaldi-bin vivaldi-sandbox ; do
        patchelf \
          --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
          --set-rpath "${libPath}" \
          opt/${installDir}/$f
      done

      for f in libGLESv2.so libqt5_shim.so libqt6_shim.so; do
        so=opt/${installDir}/$f
        if [ -f "$so" ]; then
          patchelf --set-rpath "${libPath}" "$so"
        fi
      done
    ''
    + lib.optionalString proprietaryCodecs ''
      ln -s ${vivaldi-ffmpeg-codecs}/lib/libffmpeg.so opt/${installDir}/libffmpeg.so.''${version%\.*\.*}
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
      cp -r usr/share/applications "$out/share"
      if [ -d usr/share/xfce4 ]; then
        cp -r usr/share/xfce4 "$out/share"
      fi
      substituteInPlace "$out"/share/applications/*.desktop \
        --replace-fail /usr/bin/${binaryName} "$out"/bin/${binaryName}
      local d
      for d in 16 24 32 48 64 128 256; do
        mkdir -p "$out"/share/icons/hicolor/''${d}x''${d}/apps
        ln -s \
          "$out"/opt/${installDir}/product_logo_''${d}.png \
          "$out"/share/icons/hicolor/''${d}x''${d}/apps/${binaryName}.png
      done
      # Replace bundled vulkan-loader with NixOS-patched one for Vulkan ICD discovery
      if [ -f "$out/opt/${installDir}/libvulkan.so.1" ]; then
        rm "$out/opt/${installDir}/libvulkan.so.1"
        ln -s "${lib.getLib vulkan-loader}/lib/libvulkan.so.1" "$out/opt/${installDir}/libvulkan.so.1"
      fi
      # Create bin directory and symlink to the launcher script (wrap launcher, not vivaldi-bin)
      mkdir -p "$out/bin"
      ln -s "$out/opt/${installDir}/${launcherName}" "$out/bin/${binaryName}"
      wrapProgram "$out/bin/${binaryName}" \
        --add-flags ${lib.escapeShellArg (lib.concatStringsSep " " (lib.optionals enableHardwareAcceleration [
          "--enable-gpu-rasterization"
          "--enable-zero-copy"
          "--enable-features=VaapiVideoDecoder,VaapiVideoEncoder,VaapiIgnoreDriverChecks"
          "--disable-features=UseChromeOSDirectVideoDecoder"
          "--ignore-gpu-blocklist"
        ]
        ++ lib.optionals (commandLineArgs != "") [commandLineArgs]))} \
        --prefix XDG_DATA_DIRS : "${addDriverRunpath.driverLink}/share:${gtk3}/share/gsettings-schemas/${gtk3.name}" \
        --prefix LD_LIBRARY_PATH : ${libPath} \
        --prefix PATH : ${coreutils}/bin \
        ''${qtWrapperArgs[@]}
    ''
    + lib.optionalString enableWidevine ''
      ln -sf ${widevine-cdm}/share/google/chrome/WidevineCdm $out/opt/${installDir}/WidevineCdm
    ''
    + ''
      runHook postInstall
    '';

  meta = {
    description = metaDescription;
    homepage = "https://vivaldi.com";
    license = lib.licenses.unfree;
    sourceProvenance = with lib.sourceTypes; [binaryNativeCode];
    mainProgram = binaryName;
    maintainers = with lib.maintainers; [
      marcusramberg
      max06
      wineee
    ];
    platforms = [
      "x86_64-linux"
      "aarch64-linux"
    ];
  };
}
