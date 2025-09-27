#!/bin/zsh

HEIGHT=675

source ~/.zshrc

sqlcmd -d librarydb -i raw01.sql -o ../files/raw01.xml -y $HEIGHT -h -1
