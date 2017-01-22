#!/bin/bash -ex

# libsqlite3-dev
if [[ "$OSTYPE" == "linux-gnu" ]]; then
	sudo apt update
	sudo apt install libsqlite3-dev
elif [[ "$OSTYPE" == "darwin"* ]]; then
	# macOS
	# libsqlite3-dev is installed by default on any recent macOS
else
    echo "error can't install package `libsqlite3-dev`, unknown OS $OSTYPE"
    exit 1;
fi

command -v rustup >/dev/null 2>&1 || { echo 'I require `rustup` but it’s not installed. Install it with `curl https://sh.rustup.rs -sSf | sh`. Aborting.' >&2; exit 1; }
rustup override set nightly

cargo install diesel_cli --force

sudo npm install -g brunch
