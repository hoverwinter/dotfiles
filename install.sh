#!/bin/bash

echo "Plz run with bash"
# Install Softwares

if [[ $UID -ne 0 ]]
then
    echo "Please run as ROOT"
    exit 1
fi

echo "============ Install Software ==========="
sfrs=(zsh tmux git vim terminator curl wget exuberant-ctags cmake clang build-essential python-dev silversearcher-ag ack-grep binutils)

#
#   for the reason that build-essential and python-dev etc have no suitable cmd for which,
#   so use package manager to detect installation
#
for sf in ${sfrs[*]}
do
    # echo $sf
    echo "######## $sf #########"
    info=`dpkg -l | grep $sf`
    if [ -n "$info" ]
    then
        echo "ALREADY INSTALLED: $sf"
    else
        apt-get install -y $sf
    fi
done


#
#   install fonts
#

echo "============= Install Fonts =============="
cst_ft_dir="/usr/share/fonts/custom"
if ! [ -d $cst_ft_dir ]
then
    mkdir -p $cst_ft_dir
fi

cp fonts/Monaco.ttf $cst_ft_dir
chmod 744 ${cst_ft_dir}/Monaco.ttf

mkfontscale
mkfontdir
fc-cache -fv
