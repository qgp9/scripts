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
# curl https://qgp9.github.io/scripts/Install_local_perl_lib.sh | bash

echo
echo "## Make library Set 'myperl' at $HOME/perl5/"
echo "## This is template dictory to generate library set in easy."
echo "## Hence, Don't use this lib set directly."
echo
MYPERL="$HOME/perl5"
LIBTMPL="$MYPERL/myperl"

echo
echo "### Install CPANM"
echo
curl -L http://cpanmin.us | perl -I "$LIBTMPL" - -f -l "$LIBTMPL" App::cpanminus

echo
echo "### Install Loca::Lib"
echo
"$LIBTMPL"/bin/cpanm -l "$LIBTMPL" local::lib

echo
echo "## Make library set 'mydev' at $MYPERL/mydev:" 
echo
mkdir -p $MYPERL/mydev 
cp -a "$LIBTMPL/" "$MYPERL/mydev/"


echo "## add 'myperl' to ~/.bash_profile"
echo 'export MYPERL=$HOME/perl5; myperl () { S=${1-mydev};eval `perl -I $MYPERL/$S/lib/perl5 -Mlocal::lib=$MYPERL/$S`; }' >> ~/.bash_profile
