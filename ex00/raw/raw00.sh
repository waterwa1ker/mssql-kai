#!/bin/zsh

HEIGHT=557

source ~/.zshrc

sqlcmd -d librarydb -i raw00.sql -y $HEIGHT -o ../files/raw00.xml -h -1
