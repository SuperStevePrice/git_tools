#!/usr/bin/env ksh
# Set git user name and email

git=$(which git)

print "$git config --global user.name 'SuperStevePrice'"
$git config --global user.name "SuperStevePrice"

print "$git config --global user.email 'SuperStevePrice@gmail.com'"
$git config --global user.email "SuperStevePrice@gmail.com"

# EOF --------------------------------------------------------------------------
