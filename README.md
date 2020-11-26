# Exclude Updates from Play Store

A Magisk module for excludes apps from update lists of the Play Store

## Requirements
* Android 4.2+
* Architecture type: arm64-v8a/armeabi-v7a/x86/x86_64
* Magisk v20.4+

## How to Use
#### 0. If possible, disable the auto-update of Play Store.

#### 1. Install zip from Magisk Manager.

#### 2. Make a list of apps to exclude.
Create a list of apps to exclude to `/cache/peulist.txt`.
The list is separated by line breaks.

e.g. `/cache/peulist.txt`:
```
com.github.android
com.google.android.gm
com.android.chrome
```

#### 3. Reboot the phone
The list is loaded when the service starts, so a reboot is required for the changes to take effect.