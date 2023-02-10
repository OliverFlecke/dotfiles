#!/usr/bin/env sh

# Install tools from `cargo`. 
# NOTE: This first of all requires Rust and cargo to be installed.
# See the `rush.sh` script located in this repo to install that.
# Secondly, to compile Rust programs, the machine also need to have a linker
# installed locally, usually with `gcc`. On linux, this is usually installed with
# `apt install build-essentials`

dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

while IFS="" read -r tool || [ -n "$t" ]
do
  cargo install $tool
done < $dir/tools/cargo.txt
