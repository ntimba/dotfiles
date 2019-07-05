# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# **** dotfiles ****
if [[ -d "$HOME/.dotfiles" ]]; then
	DOTFILES_DIR="$HOME/.dotfiles"
else
	echo "Unable to find dotfiles"
	return
fi

# Make utilities available
export PATH="$DOTFILES_DIR/bin:$PATH"
for DOTFILE in `find ~/.dotfiles`
do
  [ -f “$DOTFILE” ] && source “$DOTFILE”
done 

# source files
# vérifier si on doit exporter .bash_alias ou non
DOTFILES_DIR="$HOME/.dotfiles"
for file in `ls -a "$DOTFILES_DIR/system"` 
do
  if [ ! -d $file ] || [ -f $file ]; then
    source $DOTFILES_DIR/system/$file
  fi
done

# ajouter java dans path 
# si le dossier existe
# JAVA_HOME=/usr/java/jdk-12.0.1/
# PATH=$JAVA_HOME/bin/:$PATH

# editeur par défaut
export EDITOR=nano
