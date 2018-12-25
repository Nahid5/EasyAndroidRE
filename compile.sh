#!/bin/bash -e
if ! [ "$1" ]; then
    echo "usage: $0 <original.apk>"
    exit -1
fi

fn=${1%.apk}

rm -f $fn.unaligned.apk $fn.smali.apk
rm -rf smali/build
#Requires locaiton of apktool, keystore password, and keystore alias
<PATH_TO_APKTOOL.JAR> b -f smali/ -o $fn.unaligned.apk
jarsigner -verbose -sigalg MD5withRSA -digestalg SHA1 -keystore ~/.android/debug.keystore  -storepass <KEYSTORE_PASSWORD> $fn.unaligned.apk <KEYSTORE_ALIAS>
zipalign -v 4 $fn.unaligned.apk $fn.smali.apk
rm -rf smali/build
