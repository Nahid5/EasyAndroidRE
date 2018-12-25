# EasyAndroidRE

## Setup
Scripts to easily modify apk files.

1. Get the latest apk tool
```
https://github.com/iBotPeaches/Apktool/releases
```

2. Generate the keystore cert
```
keytool -genkey -v -keystore ~/.android/debug.keystore -alias signkey -keyalg RSA -keysize 2048 -validity 20000
```

3. Go into compile.sh and put in the password and alias you used

4. Decompile using decompile.sh <APK_FILE>

5. Make any changes in the folder

6. Resign and compile using compile.sh

You can also use apksigner to sign the apk
```
apksigner sign --ks  ~/.android/debug.keystore --ks-key-alias <KEY_ALIAS> <REPACKAGED_PACK_LOCATION>.apk
```

## Things you can add.
To enable debugging the following to the manifest <application>
```
android:debuggable = "true"
```

