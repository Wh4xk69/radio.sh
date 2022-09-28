#!/usr/bin/bash

# author: Weverson Quaresma <@weversonfurtado>
# describe: Runs radio stations from Pará in the terminal.
# version: 0.5
# license: GNU Gereral Public License v3.0

declare -A STREAM
# A listagem de todos os link de estações de rádio Paraense
STREAM=(
	["Radio Metropolitana Fm 94"]="http://9320.brasilstream.com.br/mp3"
	["Radio Rauland FM 95,1"]="https://stm1.srvif.com:6672"
	["Radio 99 FM Belem"]="http://hts02.kshost.com.br:8862/live"
	["Radio Mix 100.9 FM Belem"]="https://playerservices.streamtheworld.com/api/livestream-redirect/MIXFM_BELEMPARAAAC.aac"
	["Radio Liberal FM 97.5 Belem"]="http://177.105.192.70:9750/liberalfm.mp3"
)

function main(){
	PS3="Digite opcao de Radio disponivel=>"
	select radio in "${!STREAM[@]}" ; do
		title="${radio}"
		ip="${STREAM[$radio]}"
		echo -e "\033[31;1mVoce esta ouvindo $title (Digite CTRL+C para Sair!)\033[m"
		ffplay -nodisp "$ip" &> /dev/null
	done
}
# checagem do programa que será usado na função acima.
if [ $(which ffplay) ]; then
        main
else
        sudo apt install ffmpeg -y
fi
