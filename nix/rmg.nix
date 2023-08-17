{ lib, fetchurl, appimageTools }:

let
  pname = "rmg";
  version = "0.5.0";
  name = "${pname}-${version}";
  src = fetchurl {
    url = "https://github.com/Rosalie241/RMG/releases/download/v0.5.0/RMG-Portable-Linux64-v${version}.AppImage";
    sha256 = "3c9e391b4e086486f8b643f3594abc086d87b9c4c6ad303e542e4bdb7c3c442a";
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
