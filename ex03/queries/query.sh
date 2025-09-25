#!/bin/zsh

source ~/.zshrc

sqlcmd -y 0 -d librarydb -i query$1.sql -o files/query$1.xml
