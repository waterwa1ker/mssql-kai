#!/bin/zsh

HEIGHT=500

source ~/.zshrc

sqlcmd -d librarydb -i auto01.sql -h -1 -y $HEIGHT -o ../files/auto01.xml
