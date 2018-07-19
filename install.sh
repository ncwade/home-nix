#!/bin/bash

if [ ! -d /nix ]; then
    bash <(curl https://nixos.org/nix/install)
fi

if [ ! -L ~/.config/nixpkgs ]; then
    ln -s `pwd` ~/.config/nixpkgs
fi

if [ ! -L ~/.oh-my-zsh ]; then
    ln -s `pwd` ~/.oh-my-zsh
fi

source ~/.nix-profile/etc/profile.d/nix.sh
nix-env --uninstall home-manager
nix-env -f '<nixpkgs>' -iA home-manager
home-manager switch
