#!/usr/bin/env bash


sudo rm /var/lib/apt/lists/lock

sudo rm /var/cache/apt/archives/lock

sudo rm /var/lib/dpkg/lock

sudo dpkg --configure -a


sudo apt-get update

sudo apt-get install -y curl git

curl -L https://nixos.org/nix/install | sh

. "$HOME"/.nix-profile/etc/profile.d/nix.sh

cat ~/.nix-channels

nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager

nix-channel --update

nix-shell '<home-manager>' -A install

git clone https://github.com/PedroRegisPOAR/Teste-06-07-2016.git

cd Teste-06-07-2016/nix-notes

cp home.nix ~/.config/nixpkgs/home.nix


home-manager --help

home-manager switch

