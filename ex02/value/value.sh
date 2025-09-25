#!/bin/zsh

source ~/.zshrc

HEIGHT=500

sqlcmd -d librarydb -i value.sql -y $HEIGHT
