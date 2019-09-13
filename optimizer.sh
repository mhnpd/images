#!/bin/bash
# A simple script
function cecho(){
    local exp=$1;
    local color=$2;
    if ! [[ $color =~ '^[0-9]$' ]] ; then
       case $(echo $color | tr '[:upper:]' '[:lower:]') in
        black) color=0 ;;
        red) color=1 ;;
        green) color=2 ;;
        yellow) color=3 ;;
        blue) color=4 ;;
        magenta) color=5 ;;
        cyan) color=6 ;;
        white|*) color=7 ;; # white or invalid color
       esac
    fi
    tput setaf $color;
    echo $exp;
    tput sgr0;
}

cecho "Installing Package" green
sudo apt install jpegoptim optipng -y -qq

cecho "Starting to optimize JPG & JPEG files" blue 

jpegoptim -qq --force --strip-all –max=90 ./**.jpg
jpegoptim -qq --force --strip-all –max=90 ./**.jpeg

cecho "JPG & jpeg image optimization completed." green

cecho "Starting to optimize PNG files" blue 

optipng -o7 -f4 -strip all ./**.png

cecho "png image optimization completed." green




