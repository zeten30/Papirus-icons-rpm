#!/bin/bash

mkdir -p papirus-icon-theme-git papirus-icon-theme

cd papirus-icon-theme-git
git pull
cd ..

rm -rf papirus-icon-theme/*
cp -r papirus-icon-theme-git/ePapirus papirus-icon-theme-git/Papirus papirus-icon-theme-git/Papirus-Dark papirus-icon-theme-git/Papirus-Light papirus-icon-theme/

rm -rf papirus-icon-theme.tar.gz

tar cfz papirus-icon-theme.tar.gz papirus-icon-theme
