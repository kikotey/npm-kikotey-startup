 CLI SERVICE STARTER
=====================

New Usages:
 - android emulator starter
 - adb starter

## kikotey-startup by kikotey.com - cli service starter 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache2.0)
[![Version](https://img.shields.io/badge/node-%3E%3D%2012-brightgreen)](https://nodejs.org/)
[![React-Native](https://reactnative.dev/docs/environment-setup?guide=native)](https://reactnative.dev/docs/environment-setup?guide=native)
[![Adb](https://developer.android.com/tools/adb)](https://developer.android.com/tools/adb)


## Terminology

**Emulator** -  is a program or device that enables a computer system to behave like another device. An emulator essentially allows one computer system (aka “the host”) to imitate the functions of another (aka “the guest”).

**NoVNC** - noVNC runs well in any modern browser including mobile browsers (iOS and Android).

**Android** - a Linux-based mobile operating system that primarily runs on smartphones and tablets. 

**ADB** - Android Debug Bridge ( adb ) is a versatile command-line tool that lets you communicate with a device. 

**Device** -  is a small hand-held device that has a display screen with touch input and/or a QWERTY keyboard and may provide users with telephony


## Install

Install via npm or yarn

```
npm i -g @kikotey/kikotey-startup-service-cli
```


## With CLI


### Step 1:
### a): Run the first emulator android on port 6080
```
emulator android
```
Browse the android device (novnc) http://localhost:6080


### b): Run the seconde emulator android on port 6082
```
emulator android2
```
Browse the android2 device (novnc) http://localhost:6082


### c): Verify if the process device run with : 
```
emulator ps
```


### Step 2:
### a): Run ADB for paired the subnetwork with the emulator android
```
emulator adb
```

### b): Verify if the device is paired with : 
```
emulator status
```

### Step 3:
### a): Kill device 1 on port 6080 with : 
```
emulator kill1
```

### b): Kill device 2 on port 6082 with : 
```
emulator kill2
```



if the target device is not paired rerun the cli command for adb


