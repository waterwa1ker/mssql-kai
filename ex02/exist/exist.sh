#!/bin/zsh

source ~/.zshrc

HEIGHT=500

sqlcmd -d librarydb -i exist.sql -y $HEIGHT
