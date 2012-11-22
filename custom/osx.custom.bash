#!/usr/bin/env bash

function copy() {
  if [ ! $(uname) = "Darwin" ]
  then
    echo "This function only works with Mac OS X"
	  return 1
	fi
	cat "$*" | /usr/bin/pbcopy
}

function psize(){
	pbpaste | wc
}

function pste() {
	if [ ! $(uname) = "Darwin" ]
	then
		echo "This funcion only works with Mac OS X"
		return 1
	fi
	/usr/bin/pbpaste > $1
}
function prev(){
 open -a "Preview" $1 &
}


function subGitDiff(){
	git diff -w $1 | subl -n -w
}`