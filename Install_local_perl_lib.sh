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
#
# Usage 
# curl https://raw.githubusercontent.com/qgp9/scripts/master/Install_local_perl_lib.sh | bash

echo
echo "## Make library Set 'myperl' at $HOME/perl5/myperl"
echo "## This is template dictory to generate library set in easy."
echo "## Hence, Don't use this lib set directly."
echo
export MYPERL=$HOME/perl5/myperl

echo
echo "### Install CPANM"
echo
curl -L http://cpanmin.us | perl -I $MYPERL - -f -l $MYPERL App::cpanminus

echo
echo "### Install Loca::Lib"
echo
$MYPERL/bin/cpanm -l $MYPERL local::lib

echo
echo "## Make library set 'mydev' at $HOME/perl5/mydev:" 
echo
cp -a $MYPERL $MYPERL/../mydev


echo "## add 'myperl' to ~/.bash_profile"
echo 'export MYPERL=$HOME/perl5; myperl () { S=${1-mydev};eval `perl -I $MYPERL/$S/lib/perl5 -Mlocal::lib=$MYPERL/$S`; }' >> ~/.bash_profile
