#!/usr/bin/env bash

# Manage perl5 library under user directory by name
#
# This scripts install
# 
# 1. cpanm
# 2. Local::Lib
#
# Under $HOME/perl5/mydev
#
# `myperl` on a command line will give you a localize perl environment
# 
# Later you can set isolated libs like; `myperl mojo`, `myperl dev2`


export MYPERL=$HOME/perl5/mydev

echo "## Install CPANM"
curl -L http://cpanmin.us | perl -I $MYPERL - -f -l $MYPERL App::cpanminus

echo "## Install Loca::Lib"
$MYPERL/bin/cpanm -l $MYPERL local::lib

echo "## add 'myperl' to ~/.bash_profile"
echo 'export MYPERL=$HOME/perl5; myperl () { S=${1-mydev};eval `perl -I $MYPERL/$S/lib/perl5 -Mlocal::lib=$MYPERL/$S`; }' >> ~/.bash_profile
