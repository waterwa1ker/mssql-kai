#!/bin/zsh

HEIGHT=200

source ~/.zshrc

sqlcmd -d librarydb -i auto00.sql -y $HEIGHT -o ../files/auto00.xml
