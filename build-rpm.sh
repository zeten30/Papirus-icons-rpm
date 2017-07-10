#!/bin/bash

# rm old rpms
rm -rf *.rpm

# Get current fedora release
RELEASE=$(cat /etc/fedora-release | cut -d ' ' -f 3)

# Build SRPM
mock -r fedora-${RELEASE}-x86_64 --spec papirus.spec --sources . --resultdir . --buildsrpm

# Get SRPM name
SRPM=$(ls papirus-*.src.rpm)

# Build RPM's
mock -r fedora-${RELEASE}-x86_64 --rebuild ${SRPM} --resultdir .

# COPR
copr-cli build mzink/Utils ${SRPM}
