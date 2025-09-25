#!/bin/zsh

source ~/.zshrc

HEIGHT=500

sqlcmd -d librarydb -i ex01.sql -y $HEIGHT
