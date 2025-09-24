#!/bin/zsh

HEIGHT=500

source ~/.zshrc

sqlcmd -d librarydb -i path00.sql -y $HEIGHT -o ../files/path00.xml
