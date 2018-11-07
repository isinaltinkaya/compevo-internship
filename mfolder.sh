#!/bin/bash
#set -x

NPWD="$(dirname "$(realpath "$0")")" #--> scriptin ilk calistirildigi PWD
INPUT=$1 #--> scriptin alacagi filename yani ./omgwtfbbq p1

charmander(){
    COUNTER=1 #--> counter init
    while read p; do #--> her satir icin do
        CURR_DIR=${NPWD}/${INPUT}_results/${COUNTER} #--> p1_results diye dir set et, hatta $PWD/p1_results/1 gibi (her satir icin)
        mkdir -p "$CURR_DIR" #--> o diri olustur
        cd "$CURR_DIR" #--> o dire evim de
        echo "$p" > line_${COUNTER} #--> her satiri o dir icin line_1 seklinde bi dosyaya yaz
        mfold SEQ=line_${COUNTER} NA=DNA #--> o dosyayi mfold'a ver
        ((COUNTER++)) #--> ((COUNTER++)) bunu anlamadım bu ne şekilli şukullu bişey --> counter += 1 --> counter = counter + 1 haaa bu bashte böyle mi yazılıyoooo --> bissuru yontemi var, ben bunu hatirliom :D 
        cd ${NPWD} #--> ilk dir'e geri don
    done < $INPUT #--> bu loopa input dosyasini besle
}

charmander "$@" | tee ${NPWD}/${INPUT}_charmander.log #--> charmander buyuyunce charizard vs, scriptin aldigi tum argumanlari buna besle "$@" ile, ve olan biteni ekrana bas + charmander.log'a bas
