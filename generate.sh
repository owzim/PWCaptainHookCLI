#!/bin/sh

# config
PW_REPO_DIR_NAME="processwire"
PW_REPO_URL="https://github.com/ryancramerdesign/ProcessWire"
OUTPUT_DIR_NAME="output"
PHP_SCRIPT_NAME="generate-html.php"

function message() {	
	echo "### $1"
}

SCRIPT_DIR=$(pwd)

OUTPUT_DIR="$SCRIPT_DIR/$OUTPUT_DIR_NAME"
OUTPUT_MASTER="$OUTPUT_DIR/master.html"
OUTPUT_DEV="$OUTPUT_DIR/dev.html"
PHP_SCRIPT="$SCRIPT_DIR/$PHP_SCRIPT_NAME"

if ! [ -d "$OUTPUT_DIR" ]
then
	mkdir "$OUTPUT_DIR"
fi

#  if processwire repo not existent yet, clone it from github
if ! [ -d "$PW_REPO_DIR_NAME" ]
then
	message "pw repo not there yet, cloning ..."
	git clone "$PW_REPO_URL" "$PW_REPO_DIR_NAME"
	cd "$PW_REPO_DIR_NAME"
else
	message "pw repo already there"
fi

cd "$PW_REPO_DIR_NAME"

message "checking out master"
git checkout master

message "pulling updates from master"
git pull

message "saving output to $OUTPUT_MASTER"
php "$PHP_SCRIPT" "." > "$OUTPUT_MASTER"



message "checking out dev"
git checkout dev

message "pulling updates from dev"
git pull

message "saving output to $OUTPUT_DEV"
php "$PHP_SCRIPT" "." > "$OUTPUT_DEV"

message "done"

