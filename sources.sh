#!/bin/bash

# Upstream sync
cd upstream || exit 1

if [ -d papirus-icon-theme ]; then
  rm -rf papirus-icon-theme
fi

if [ -d papirus-libreoffice-theme ]; then
  rm -rf papirus-libreoffice-theme
fi


git clone https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git
git clone https://github.com/PapirusDevelopmentTeam/papirus-libreoffice-theme

# Make src dir?
cd ../
if [ ! -d papirus-icon-theme ]; then
  mkdir -p papirus-icon-theme
else
  rm -rf  papirus-icon-theme/*
fi


# Prepare sources
cp -r upstream/papirus-icon-theme/ePapirus papirus-icon-theme/
cp -r upstream/papirus-icon-theme/Papirus papirus-icon-theme/
cp -r upstream/papirus-icon-theme/Papirus-Dark papirus-icon-theme/
cp -r upstream/papirus-icon-theme/Papirus-Light papirus-icon-theme/


# Clean old ?
if [ -f rpmbuild/papirus-*-theme.tar.gz ]; then
  rm -rf rpmbuild/papirus-*-theme.tar.gz
fi


# Create new source tar.gz
tar cfz papirus-icon-theme.tar.gz papirus-icon-theme

cd upstream
tar cfz papirus-libreoffice-theme.tar.gz papirus-libreoffice-theme
mv papirus-libreoffice-theme.tar.gz ../rpmbuild/
cd ..

mv papirus-icon-theme.tar.gz rpmbuild/

