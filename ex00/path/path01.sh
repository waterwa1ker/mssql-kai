#!/bin/zsh

HEIGHT=500

source ~/.zshrc

sqlcmd -d librarydb -i path01.sql -y $HEIGHT -o ../files/path01.xml
