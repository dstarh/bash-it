#!/usr/bin/env bash

function tweet() {
	/usr/local/bin/ttytter -silent -status="$1"
}
