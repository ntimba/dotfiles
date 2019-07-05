#!/usr/bin/env bash

echo -e "\n\t\tConfiguration de mysql"
echo -e "\t\t**********************"

sudo mysql_secure_installation

# utilise la fonction newuser de .dotfiles/bin
newuser mysql