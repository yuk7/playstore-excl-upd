# Exclude Updates from Play Store

A Magisk module for excludes apps from update lists of the Play Store

![GitHub Workflow Status](https://img.shields.io/github/workflow/status/yuk7/playstore-excl-upd/Build%20CI?style=flat-square)
[![Github All Releases](https://img.shields.io/github/downloads/yuk7/playstore-excl-upd/total.svg?style=flat-square)](https://github.com/yuk7/playstore-excl-upd/releases/latest)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
![License](https://img.shields.io/github/license/yuk7/playstore-excl-upd.svg?style=flat-square)

### [Download](https://github.com/yuk7/playstore-excl-upd/releases/latest) 

## Requirements
* Android 4.2+
* Architecture type: arm64-v8a/armeabi-v7a/x86/x86_64
* Magisk v20.4+

## How to Use
#### 0. If possible, disable the auto-update of Play Store.
v2.0 or higher forces automatic updates to be disabled.

#### 1. Install [zip](https://github.com/yuk7/playstore-excl-upd/releases/latest) from Magisk Manager.

#### 2. Make a list of apps to exclude.
Create a list of apps to exclude to `/data/cache/peulist.txt`.
The list is separated by line breaks.

e.g. `/data/cache/peulist.txt`:
```
com.github.android
com.google.android.gm
com.android.chrome
```

#### 3. Reboot the phone
The list is loaded when the service starts, so a reboot is required for the changes to take effect.
