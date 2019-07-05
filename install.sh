#!/usr/bin/env bash

# installation minimal sans applications graphiques
# changer d'editeur de text par défaut, mètre GEDIT en avant
# fichiers recovery, enlever l'heure, et laisser la date uniquement
# amelioration de recovery, apache impossible de demarrer apache2 après la recovery

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export DOTFILES

sudo apt install dos2unix
dosToUnix () 
{
	# rendre les fichier d'un dossier exécutable
	for file in `ls -a $1`
	do
		sudo dos2unix $1/$file
	done
}

changeRight()
{
	# changer les droit des fichier
	for file in `ls -a $1`
	do
		sudo chmod $2 $1/$file
	done
}


# Rendre tout les fichier compatible linux
dosToUnix $DOTFILES/bin
dosToUnix $DOTFILES/packages
dosToUnix $DOTFILES/runcom
dosToUnix $DOTFILES/system

# changer les droit des fichier


# include functions (system/.function)
# source $DOTFILES/system/.function

# Installation dotfiles
if [[ -f "$HOME/.profile" ]]; then
	if [[ ! -f $HOME/.profile.bak  ]]; then
		mv $HOME/.profile $HOME/.profile.bak
		ln -svf "$DOTFILES/runcom/.profile" $HOME/ 
	else
		echo -e "\t[x] Dotfiles est déjà installé"
	fi
fi

# Prendre en compte le fichier .profile
source ~/.profile

# rendre tout les fichiers du dotfiles exécutable
make_executable $DOTFILES/bin
make_executable $DOTFILES/scripts


# installer les alias des commandes
ln -svf $DOTFILES/system/.bash_aliases ~/