#!/bin/bash

# Upstream sync
cd upstream || exit 1

if [ ! -d papirus-icon-theme ]; then
  git clone https://github.com/PapirusDevelopmentTeam/papirus-icon-theme.git
else
  cd papirus-icon-theme || exit 1
  git pull
  cd ..
fi


# Make src dir?
cd ..
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
if [ -f rpmbuild/papirus-icon-theme.tar.gz ]; then
  rm -rf rpmbuild/papirus-icon-theme.tar.gz
fi

# Crete new source tar.gz
tar cfz papirus-icon-theme.tar.gz papirus-icon-theme
mv papirus-icon-theme.tar.gz rpmbuild/
