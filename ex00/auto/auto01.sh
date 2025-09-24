#!/bin/zsh

HEIGHT=500

source ~/.zshrc

sqlcmd -d librarydb -i auto01.sql -y $HEIGHT -o ../files/auto01.xml
