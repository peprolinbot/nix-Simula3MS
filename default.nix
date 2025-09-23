{
  stdenv,
  lib,
  fetchurl,
  makeWrapper,
  jre,
}:
stdenv.mkDerivation rec {
  name = "Simula3MS";
  version = "4.13";

  src = fetchurl {
    url = "https://simula3ms.des.udc.es/${name}v${builtins.replaceStrings ["."] ["_"] version}.jar";
    sha256 = "sha256-EjhCLKmm4dzfWRVNIlJJJH9bPXSC84aYulTS1IfEs2I=";
  };
  dontUnpack = true;

  nativeBuildInputs = [makeWrapper];

  installPhase = ''
    mkdir -pv $out/share/java $out/bin
    cp ${src} $out/share/java/${name}-${version}.jar

    makeWrapper ${jre}/bin/java $out/bin/Simula3MS \
      --add-flags "-jar $out/share/java/${name}-${version}.jar" \
      --set _JAVA_OPTIONS '-Dswing.defaultlaf=javax.swing.plaf.metal.MetalLookAndFeel -Dawt.useSystemAAFontSettings=on'
  '';

  meta = {
    homepage = "https://simula3ms.des.udc.es";
    description = "MIPS simulator developed by the GAC at the UDC)";
    platforms = lib.platforms.unix;
  };
}
