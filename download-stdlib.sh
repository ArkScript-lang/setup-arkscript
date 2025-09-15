#!/usr/bin/env bash

curl https://github.com/ArkScript-lang/std/archive/refs/heads/master.zip -O -J -L
unzip -oq std-master.zip "std-master/*.ark" -x "std-master/tests/*"

rm std-master.zip
rm -rf .arkscript/lib/std/
mv std-master/ .arkscript/lib/std/

