#!/bin/zsh

HEIGHT=1000

source ~/.zshrc

sqlcmd -d librarydb -i exp00.sql -y $HEIGHT -o ../files/exp00.xml -h -1
