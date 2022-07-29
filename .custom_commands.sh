#!/bin/bash

# opens movie site
function movie() {
    echo 'Opening movie site...'
    open https://www1.attacker.tv
}

# searches google
function google() {
  echo "Googling ${@} ..."
  query=''
  for word in $@
  do 
    query+='+'
    query+=$word
  done
  open -a Safari "https://google.com/search?q=${query:1}"
}

# small beginnings
smallbeginnings() {
  ruby ~/custom-commands/repeating_checklist.rb restart
}

check() {
  ruby ~/custom-commands/repeating_checklist.rb remove $1
}

function checklist() {
  ruby ~/custom-commands/repeating_checklist.rb display
}

function add() {
  ruby ~/custom-commands/repeating_checklist.rb add $1 $2
}

le() {
  open -a  /Applications/League\ of\ Legends.app/Contents/LoL/LeagueClient.app
  echo 'Opening League...'
}