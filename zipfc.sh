#!/bin/bash
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
countTotal=0
sizeTotal=0
sizeTotalCompressed=0
files=$@
verbose=0
if [[ $# -eq 0 || ( $# -eq 1 && $1 == "-v") ]]
then
  files="*.zip"
  echo "No arguments provided. Scanning all .zip files in current folder."
fi
for arg in $@; do
  if [[ "$arg" == "-v" ]]
  then
    verbose=1
  fi
done

for f in $files; do
  if [[ "$f" =~ \.zip$ ]]
  then
    if [ $verbose -ne 0 ]
    then
      echo Scanning $f
    fi
    res="$(zipinfo -t "$f" -x */ 2> temp.err | grep ^[0-9])"
    count="$(echo "$res" | awk '{print $1}')"
    countTotal=$(( $countTotal + $count ))
    size="$(echo "$res" | awk '{print $3}')"
    sizeTotal=$(( $sizeTotal + $size ))
    sizeCompressed="$(echo "$res" | awk '{print $3}')"
    sizeTotalCompressed=$(( $sizeTotalCompressed + $sizeCompressed ))
  else
    if [ $verbose -ne 0 ] && [ $f != "-v" ]
    then
      printf "Skipped %s. Not a zip file.\n" $f
    fi
  fi
done
rm temp.err
printf "%'.0f files in archives\n" $countTotal
printf "%'.0f uncompressed bytes\n" $sizeTotal
printf "%'.0f compressed bytes\n" $sizeTotalCompressed
printf "\n"
printf "files, uncompressed, compressed:\n"
printf "%d, %d, %d\n" $countTotal $sizeTotal $sizeTotalCompressed