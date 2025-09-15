curl -o master.zip https://github.com/ArkScript-lang/std/archive/refs/heads/master.zip
unzip -oq master.zip "std-master/*.ark" -x "std-master/tests/*"

rm master.zip
rm -rf .arkscript/lib/std/
mv std-master/ .arkscript/lib/std/

