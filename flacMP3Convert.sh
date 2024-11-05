#!/bin/bash

flac_files=(*.flac)
# create an array called flac_files based on files ending in .flac, the array notation is the () around the .*flac 
  for i in "${flac_files[@]}"
  # for loop - [@] is to properly expand the loop to each individual element (in the case of any special characters in the name), [] has a variety of uses but here it's needed for the aforementioned reason
  do
  # do marks the beginning of the loop
    output="${i%.flac}.mp3"
    ffmpeg -i "$i" -codec:a libmp3lame -q:a 0 "$i.mp3"
  # use ffmpeg (command line accessing the program) 
  # (-i "$i") to access the inputted file (the i in the flac_files)
  # (-codec:a libmp3lame) set the audio codec to lamemp3
  # (-q:a 0) set the quality to highest
  # ("$i.mp3") output file name extension changed to mp3
done
