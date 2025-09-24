#!/bin/zsh

HEIGHT=1200

source ~/.zshrc

sqlcmd -d librarydb -i exp01.sql -y $HEIGHT -o ../files/exp01.xml -h -1
