{
  stdenv,
  lib,
  fetchurl,
  makeWrapper,
  makeDesktopItem,
  copyDesktopItems,
  imagemagick,
  jre,
}: let
  icon = ./icon.svg;
in
  stdenv.mkDerivation (finalAttrs: rec {
    name = "Simula3MS";
    version = "4.13";

    src = fetchurl {
      url = "https://simula3ms.des.udc.es/${name}v${builtins.replaceStrings ["."] ["_"] version}.jar";
      sha256 = "sha256-EjhCLKmm4dzfWRVNIlJJJH9bPXSC84aYulTS1IfEs2I=";
    };
    dontUnpack = true;

    nativeBuildInputs = [makeWrapper copyDesktopItems imagemagick];

    desktopItems = [
      (makeDesktopItem {
        name = "Simula3MS";
        desktopName = "Simula3MS";
        exec = "Simula3MS";
        icon = "Simula3MS";
        comment = finalAttrs.meta.description;
        mimeTypes = ["text/x-asm"];
        categories = ["Education"];
        keywords = [
          "MIPS"
          "Simulator"
        ];
      })
    ];

    installPhase = ''
      runHook preInstall

      mkdir -pv $out/share/java $out/bin
      cp ${src} $out/share/java/${name}-${version}.jar

      makeWrapper ${jre}/bin/java $out/bin/Simula3MS \
        --add-flags "-jar $out/share/java/${name}-${version}.jar" \
        --set _JAVA_OPTIONS '-Dswing.defaultlaf=javax.swing.plaf.metal.MetalLookAndFeel -Dawt.useSystemAAFontSettings=on'

      # Icon
      for i in 16 24 48 64 96 128 256 512; do
        mkdir -p $out/share/icons/hicolor/''${i}x''${i}/apps
        convert -background none -resize ''${i}x''${i} ${icon} $out/share/icons/hicolor/''${i}x''${i}/apps/${name}.png
      done

      runHook postInstall
    '';

    meta = {
      homepage = "https://simula3ms.des.udc.es";
      description = "Education-oriented MIPS simulator developed by the GAC at the UDC";
      mainProgram = "Simula3MS";
      sourceProvenance = with lib.sourceTypes; [binaryBytecode];
      platforms = lib.platforms.unix;
    };
  })
