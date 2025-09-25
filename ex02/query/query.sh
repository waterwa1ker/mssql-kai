#!/bin/zsh

source ~/.zshrc

HEIGHT=500

sqlcmd -d librarydb -i query.sql -y $HEIGHT
