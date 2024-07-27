{ lib, fetchurl, appimageTools }:

let
  pname = "mqtt-explorer";
  version = "0.3.5";
  name = "${pname}-${version}";
  src = fetchurl {
    url = "https://github.com/thomasnordquist/MQTT-Explorer/releases/download/v${version}/${name}.AppImage";
    sha256 = "61fcf8dbe755231df1c083a6625b69e5ef6b6246be2ac92f42ec495550606e0e";
  };
  appimageContents = appimageTools.extractType2 { inherit name version src; };
in
appimageTools.wrapType2 {
  inherit name version src;

  extraInstallCommands = ''
    mv $out/bin/{${pname}-${version},${pname}}
    mkdir -p $out/share/{applications,pixmaps}
    cp ${appimageContents}/mqtt-explorer.desktop $out/share/applications/${pname}.desktop
    cp ${appimageContents}/mqtt-explorer.png $out/share/pixmaps/${pname}.png
    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace 'Exec=AppRun' 'Exec=${pname}' \
      --replace 'Icon=mqtt-explorer' 'Icon=${pname}'
  '';

  meta = with lib; {
    description = "An all-round MQTT client that provides a structured topic overview ";
    homepage = "https://github.com/thomasnordquist/MQTT-Explorer";
    license = licenses.cc-by-nd-30;
    platforms = [ "x86_64-linux" ];
  };
}
