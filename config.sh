#!/bin/bash

# set <C-t> mapped with Terminator
gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'

BASEDIR=$PWD
DATE=`date +%Y%m%d%H%M%S`

# config terminator
conf_term() {
    TERM_CONFIG_DIR=$HOME/.config/terminator
    if [[ -d "$TERM_CONFIG_DIR" && -f "$TERM_CONFIG_DIR/config" ]]
    then
        mv $TERM_CONFIG_DIR/config $TERM_CONFIG_DIR/config.$DATE
    else
        mkdir -p $TERM_CONFIG_DIR
    fi
    ln -s $BASEDIR/dotconf/terminator.conf $TERM_CONFIG_DIR/config
}


# config oh-my-zsh
conf_zsh() {
    chsh -s /bin/zsh

    for item in $HOME/.zshrc $HOME/.oh-my-zsh
    do
        [ -L $item ] && unlink $item
    done

    for item in $HOME/.zshrc $HOME/.oh-my-zsh
    do
        [ -e $item ] && mv $item $item.$DATE
    done

    ln -s $BASEDIR/shell/oh-my-zsh $HOME/.oh-my-zsh
    cp $BASEDIR/shell/oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc
}

conf_term
conf_zsh

