#!/bin/bash

cd $HOME/working/openvslam/build/

echo "run openvslam"
./run_video_localization \
-v ./orb_vocab/orb_vocab.dbow2 \
-m ./aist_living_lab_2/video.mp4 \
-c ./aist_living_lab_2/config.yaml \
--map-db map.msg &

echo "run consolemove"
console_ID=`xdotool search --onlyvisible --name kohei`
echo $console_ID
xdotool windowsize $console_ID 833 600
xdotool windowmove $console_ID 0 600

while :
do
map_ID=`xdotool search --onlyvisible --name Map`
if [ "$map_ID" != "$null" ]; then
break
fi
done

while :
do
frame_ID=`xdotool search --onlyvisible --name Frame`
if [ "$frame_ID" != "$null" ]; then
break
fi
done

xdotool windowsize $map_ID 1853 511
xdotool windowmove $map_ID 0 0

xdotool windowmove $frame_ID 896 598

xdotool windowactivate $map_ID
