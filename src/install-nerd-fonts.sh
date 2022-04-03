#!/bin/bash     
# fonts=("3270.zip" "Agave.zip" "AnonymousPro.zip" "Arimo.zip" "AurulentSansMono.zip" "BigBlueTerminal.zip" "BitstreamVeraSansMono.zip" "CascadiaCode.zip" "CodeNewRoman.zip" "Cousine.zip" "DaddyTimeMono.zip" "DejaVuSansMono.zip" "DroidSansMono.zip" "FantasqueSansMono.zip" "FiraCode.zip" "FiraMono.zip" "Go-Mono.zip" "Hack.zip" "Hasklig.zip" "HeavyData.zip" "Hermit.zip" "iA-Writer.zip" "IBMPlexMono.zip" "Inconsolata.zip" "InconsolataGo.zip" "InconsolataLGC.zip" "Iosevka.zip" "JetBrainsMono.zip" "Lekton.zip" "LiberationMono.zip" "Meslo.zip" "Monofur.zip" "Monoid.zip" "Mononoki.zip" "MPlus.zip" "Noto.zip" "OpenDyslexic.zip" "Overpass.zip" "ProFont.zip" "ProggyClean.zip" "RobotoMono.zip" "ShareTechMono.zip" "SourceCodePro.zip" "SpaceMono.zip" "Terminus.zip" "Tinos.zip" "Ubuntu.zip" "UbuntuMono.zip" "VictorMono.zip")

fonts=("FiraCode.zip" "Hack.zip" "InconsolataLGC.zip" "JetBrainsMono.zip" "Meslo.zip" "SourceCodePro.zip" "CascadiaCode.zip")
response=$(curl https://github.com/ryanoasis/nerd-fonts/releases/latest)
version=${response:88:6}
download_url=https://github.com/ryanoasis/nerd-fonts/releases/download/${version}/

echo "CREATING TEMPORAL FOLDER "
mkdir temp_fonts
cd temp_fonts

echo "DOWNLOADING FONTS "
for i in ${!fonts[@]}; do
    wget ${download_url}${fonts[$i]}
done

echo "DESCOMPRESSING FILES "
for i in ${!fonts[@]}; do
    unzip ${fonts[$i]}
    rm ${fonts[$i]}
done

# echo "DELETING WINDOWS FONT FILES "
rm *Windows*

# echo "DELETING MACOS FONT FILES "
rm *Retina*

echo "MOVING FONTS TO USER FONTS FOLDER "
mkdir ~/.local/share/fonts
mv *otf  ~/.local/share/fonts
mv *ttf  ~/.local/share/fonts
mv *OTF  ~/.local/share/fonts
mv *TTF  ~/.local/share/fonts

# echo "DELETING TEMPORAL FOLDER AND HIS FILES "
cd ..
rm -rfd temp_fonts

# echo "REFRESHING FONT CACHE "
fc-cache -f -v
