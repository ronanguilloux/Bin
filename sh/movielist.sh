#!/bin/bash

VIDEO_FOLDER=(
/home/ronan/Films/films
/home/ronan/Films/series
/home/ronan/Téléchargements
/home/ronan/Vidéos
)
VIDEO_EXTENTION=(avi mkv mpg mpeg)

OUTPUT='movie_list.txt'
OUTPUT_TEMP=${OUTPUT}.temp


`>$OUTPUT_TEMP`

for folder in "${VIDEO_FOLDER[@]}"
do
    if [ -d $folder ]; then
        for ext in "${VIDEO_EXTENTION[@]}"
        do
            find $folder -iname "*.$ext" >> $OUTPUT_TEMP
        done
    fi
done

`cat $OUTPUT_TEMP | awk -F "/" '{print $NF;}' | sort | uniq > $OUTPUT`
`rm $OUTPUT_TEMP`

