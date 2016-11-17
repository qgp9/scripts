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


echo "## Make library Set 'myperl' at $HOME/perl5/myperl"
echo "## This is template dictory to generate library set in easy."
echo "## Hence, Don't use this lib set directly."
export MYPERL=$HOME/perl5/myperl

echo "### Install CPANM"
curl -L http://cpanmin.us | perl -I $MYPERL - -f -l $MYPERL App::cpanminus

echo "### Install Loca::Lib"
$MYPERL/bin/cpanm -l $MYPERL local::lib

echo "## Make library set 'mydev' at $HOME/perl5/mydev:" 
cp -a $MYPERL $MYPERL/../mydev


echo "## add 'myperl' to ~/.bash_profile"
echo 'export MYPERL=$HOME/perl5; myperl () { S=${1-mydev};eval `perl -I $MYPERL/$S/lib/perl5 -Mlocal::lib=$MYPERL/$S`; }' >> ~/.bash_profile
