#!/usr/bin/env bash

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export DOTFILES


# vérifier si on doit exporter .bash_alias ou non
for file in `ls -a "$DOTFILES/system"` 
do
  if [ ! -d $file ] || [ -f $file ] && [ $file != '.bash_aliases' ]; then
    echo $DOTFILES/system/$file
  fi
done

