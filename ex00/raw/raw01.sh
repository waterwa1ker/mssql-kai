#!/bin/zsh

HEIGHT=175

source ~/.zshrc

sqlcmd -d librarydb -i raw01.sql -o ./files/raw01.xml -y $HEIGHT
