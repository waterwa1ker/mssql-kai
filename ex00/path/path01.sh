#!/bin/zsh

HEIGHT=600

source ~/.zshrc

sqlcmd -d librarydb -i path01.sql -h -1 -y $HEIGHT -o ../files/path01.xml
