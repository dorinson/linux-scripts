#!/bin/bash     
# fonts=("3270.zip" "Agave.zip" "AnonymousPro.zip" "Arimo.zip" "AurulentSansMono.zip" "BigBlueTerminal.zip" "BitstreamVeraSansMono.zip" "CascadiaCode.zip" "CodeNewRoman.zip" "Cousine.zip" "DaddyTimeMono.zip" "DejaVuSansMono.zip" "DroidSansMono.zip" "FantasqueSansMono.zip" "FiraCode.zip" "FiraMono.zip" "Go-Mono.zip" "Hack.zip" "Hasklig.zip" "HeavyData.zip" "Hermit.zip" "iA-Writer.zip" "IBMPlexMono.zip" "Inconsolata.zip" "InconsolataGo.zip" "InconsolataLGC.zip" "Iosevka.zip" "JetBrainsMono.zip" "Lekton.zip" "LiberationMono.zip" "Meslo.zip" "Monofur.zip" "Monoid.zip" "Mononoki.zip" "MPlus.zip" "Noto.zip" "OpenDyslexic.zip" "Overpass.zip" "ProFont.zip" "ProggyClean.zip" "RobotoMono.zip" "ShareTechMono.zip" "SourceCodePro.zip" "SpaceMono.zip" "Terminus.zip" "Tinos.zip" "Ubuntu.zip" "UbuntuMono.zip" "VictorMono.zip")

FONTS=("FiraCode.zip" "Hack.zip" "InconsolataLGC.zip" "JetBrainsMono.zip" "Meslo.zip" "SourceCodePro.zip" "CascadiaCode.zip")
RESPONSE=$(curl https://github.com/ryanoasis/nerd-fonts/releases/latest)
VERSION=${RESPONSE:88:6}
DOWNLOAD_URL=https://github.com/ryanoasis/nerd-fonts/releases/download/${VERSION}/
TEMP_FONTS_FOLDER=temp_fonts
FONTS_FOLDER_FEDORA=~/.fonts

clear
echo " > CREATING TEMPORAL FOLDER"
mkdir ${TEMP_FONTS_FOLDER}
cd ${TEMP_FONTS_FOLDER}

echo -n " > DOWNLOADING FONTS: "
for i in ${!FONTS[@]}; do
    echo -n "${FONTS[i]::-4}, "
done

echo ""

for i in ${!FONTS[@]}; do
    wget --quiet --show-progress ${DOWNLOAD_URL}${FONTS[$i]}
done

echo " > DESCOMPRESSING FILES"
for i in ${!FONTS[@]}; do
    unzip -q ${FONTS[$i]}
    rm ${FONTS[$i]}
done

echo " > DELETING WINDOWS AND MAC FONT FILES"
rm *Windows*
rm *Retina*

echo " > MOVING FONTS TO USER FONTS FOLDER"
mkdir -p ${FONTS_FOLDER_FEDORA}
mv *otf  ${FONTS_FOLDER_FEDORA}
mv *ttf  ${FONTS_FOLDER_FEDORA}
# mv *OTF  ${FONTS_FOLDER_FEDORA}
# mv *TTF  ${FONTS_FOLDER_FEDORA}

echo " > DELETING TEMPORAL FOLDER AND HIS FILES"
cd ..
rm -rfd temp_fonts

echo " > REFRESHING FONT CACHE "
fc-cache -f
