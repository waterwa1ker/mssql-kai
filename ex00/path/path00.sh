#!/bin/zsh

HEIGHT=600

source ~/.zshrc

sqlcmd -d librarydb -i path00.sql -h -1 -y $HEIGHT -o ../files/path00.xml
