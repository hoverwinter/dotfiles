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

    ln -s $BASEDIR/shell/zsh/oh-my-zsh $HOME/.oh-my-zsh
    ln -s $BASEDIR/shell/zsh/zshrc $HOME/.zshrc
}

# config vundle
install_vundle() {
    mkdir -p .vim/bundle/
    VUNDLE_DIR=$HOME/.vim/bundle/vundle
    [ -e $VUNDLE_DIR ] && mv $VUNDLE_DIR $VUNDLE_DIR.$DATE
    git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
}

# config vim
conf_vim() {
    for item in $HOME/.vimrc $HOME/.vim.bundles
    do
        [ -L $item ] && unlink $item
    done

    for item in $HOME/.vimrc $HOME/.vim.bundles
    do
        [ -e $item ] && mv $item $item.$DATE
    done

    install_vundle
    
    ln -s $BASEDIR/dotrc/vimrc $HOME/.vimrc
    ln -s $BASEDIR/dotrc/vimrc.bundles $HOME/.vimrc.bundles

    vim +PluginInstall +qall
}

conf_term
conf_zsh
conf_vim

