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
	["Radio Rede Aleluia SP"]="https://34398c.ha.azioncdn.net/primary/radiorasp.sdp/chunklist_4ef93c5d-80ac-4155-a412-cc9096a6dbef.m3u8"
	["Radio Mercosul Guaíra"]="https://ice.fabricahost.com.br/mercosulguaira"
	["Radio Melody"]="http://srv4.ipstm.net:10558"
	["Radio Metropolitana 98,5 FM - SP"]="https://f41.fabricahost.com.br/metropolitana985sp?f=1672187702N01GNB2ETZHZC6G6YKQN210C3Q5&tid=01GNB2ETZHQTFDWSYGVPTFA8KW"
	["Radio Kboing"]="https://stream.knbcdn.com.br/kboing-fm/kbostream/playlist.m3u8"
	["Radio FFH Leider Geil"]="https://mp3.ffh.de/ffhchannels/hqvoting.aac"
	["Radio Hit FM"]="https://stream-26.zeno.fm/88ck6ggfqm0uv?zs=eRq0Z-VqRlW0MllPWhyJEA"
)

function main(){
	PS3="Digite opcao de Radio disponivel=>"
	select radio in "${!STREAM[@]}" ; do
		title="${radio}"
		ip="${STREAM[$radio]}"
		echo -e "\033[31;1mVoce esta ouvindo $title (Digite CTRL+C para Sair!)\033[m"
		mpv --term-osd-bar --volume=50 "$ip"
		clear
		main
	done
}
# checagem do programa que será usado na função acima.
if [ $(which ffplay) ]; then
        main
else
        sudo apt install ffmpeg -y
fi
