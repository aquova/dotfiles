{ lib, fetchurl, appimageTools }:

let
  pname = "rmg";
  version = "0.5.1";
  name = "${pname}-${version}";
  src = fetchurl {
    url = "https://github.com/Rosalie241/RMG/releases/download/v${version}/RMG-Portable-Linux64-v${version}.AppImage";
    sha256 = "7ccd8893276e723cd181a825a7da311ba869eb697907a7130c7a40b03d970af5";
  };
  appimageContents = appimageTools.extractType2 { inherit name version src; };
in
appimageTools.wrapType2 {
  inherit name version src;

  extraInstallCommands = ''
    mv $out/bin/{${pname}-${version},${pname}}
    mkdir -p $out/share/{applications,pixmaps}
    cp ${appimageContents}/com.github.Rosalie241.RMG.desktop $out/share/applications/${pname}.desktop
    cp ${appimageContents}/com.github.Rosalie241.RMG.svg $out/share/pixmaps/${pname}.svg
    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace 'Exec=RMG' 'Exec=${pname}' \
      --replace 'Icon=com.github.Rosalie241.RMG' 'Icon=${pname}'
  '';

  meta = with lib; {
    description = "Free and open-source mupen64plus front-end written in C++.";
    homepage = "https://github.com/Rosalie241/RMG";
    license = licenses.gpl3;
    platforms = [ "x86_64-linux" ];
  };
}
