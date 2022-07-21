#!/bin/bash

# opens movie site
function movie() {
    echo 'Opening movie site...'
    open https://www1.ummagurau.com
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

list=("A" "B")
function addToList() {
  list=("C")
}

function listIt() {
  echo $list
}