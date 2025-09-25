#!/bin/zsh

source ~/.zshrc

sqlcmd -i nodes.sql -d librarydb
