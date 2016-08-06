#!/bin/bash

info=`dpkg -l | grep libgtk2.0-dev`
if [ ! -n "$info" ]
then
    sudo apt-get install libgtk2.0-dev
fi

if [ ! -f "libsublime-imfix.so" ]
then
    gcc -shared -o libsublime-imfix.so sublime_imfix.c  `pkg-config --libs --cflags gtk+-2.0` -fPIC
fi

sudo cp libsublime-imfix.so /usr/lib/
sudo cp subl /usr/bin/
sudo cp sublime_text.desktop /usr/share/applications/sublime_text.desktop
