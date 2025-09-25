#!/bin/zsh

source ~/.zshrc

sqlcmd -d librarydb -i modify.sql
