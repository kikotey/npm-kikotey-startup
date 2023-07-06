#!/bin/bash
# Action to execute (mandatoty)
action="$1"  
path="$2"
device="$3"
# Friendly service name (optional)
serviceName=cli
# Command to run (optional, array variable)
command=()
# Working Directory (optional)
#workDir=
# On start (optional, array variable)
#onStart=()
# On finish (optional, array variable)
#onFinish=()

@e() {
  echo "# $*"
}

@warn() {
  @e "Warning: $*" >&2
}

@err() {
  @e "Error! $*" >&2
  exit 1
}

# Service menu
function main() {
  case "$action" in
    android80)
      @android80
      ;;
    android82)
      @android82
      ;;
    android83)
      @android83
      ;;
    android84)
      @android84
      ;;
    android85)
      @android85
      ;;
    adb)
      @adb
      ;;
    kill80)
      @kill80
      ;;
    kill82)
      @kill82
      ;;
    kill83)
      @kill83
      ;;
    kill84)
      @kill84
      ;;
    kill85)
      @kill85
      ;;
    status)
      @status
      ;;
    ps)
      @ps
      ;;
    debug)
      @debug
      ;;
    killdebug)
      @killdebug
      ;;
    packages)
      @packages
      ;;
    install)
      @install
      ;;
    uninstall)
      @uninstall
      ;;
    processsys)
      @processsys
      ;;
    processport)
      @processport
      ;;
    killprocess)
      @killprocess
      ;;
    *)
            @e "Usage: { android80 (6080) | android82 (6082) | android83 (6083) | android84 (6084) | android85 (6085) | adb | status | ps | debug | | kill80 | kill82 | kill83 | kill84 | kill85 | killdebug | packages | install | uninstall | processsys | processport | killprocess }"
      exit 1
      ;;
  esac
}

@processsys() {
    ps -aux
}

@processport() {
    netstat -peanut
}

@killprocess() {
     fuser -k $2/tcp
}

@packages() {
    if [[ -z "${device}" ]]; then
      adb -s "emulator-5554" shell pm list packages
    else
      adb -s $device shell pm list packages
    fi
}

@install() {
    if [[ -z "${device}" ]]; then
      adb -s "emulator-5554" install $path
    else
      adb -s $device install $path
    fi
}


@uninstall() {
    if [[ -z "${device}" ]]; then
      adb -s "emulator-5554" uninstall $path
    else
      adb -s $device uninstall  $path
    fi
}

@kill80() {
 docker rm android-container80 -f
}

@kill82() {
 docker rm android-container82 -f
}

@kill83() {
 docker rm android-container83 -f
}

@kill84() {
 docker rm android-container84 -f
}

@kill85() {
 docker rm android-container85 -f
}

@killdebug() {
 echo " "
 echo "Debugger kill"
 echo " "
 fuser -k 52342/tcp
}

@debug() {
 cd 
 npx flipper-server
 cd -
 echo " "
 echo "Debugger run on port 52342"
 echo " "

}

@status() {
echo " "
echo "Devices status"
echo " "
adb devices
echo " "
}

@ps() {
echo " "
echo "Devices process"
echo " "
docker ps
echo " "
}

@android80() {
result=$(sudo apt-get install -y cpu-checker)
already_data=$(echo $result | grep "already")
if [ -n "$already_data" ]; then echo "kvm is ready"; else echo "'$result'"; fi

touch /dev/kvm
kvm-ok

docker run --privileged -d -p 6080:6080 -p 5554:5554 -p 5555:5555 -e EMULATOR_DEVICE="Samsung Galaxy S10" -e WEB_VNC=true -e WEB_VNC_PORT=6080 -e EMULATOR_LANGUAGE="French" -e EMULATOR_COUNTRY="fr_FR" -e DATAPARTITION="2000m" --device /dev/kvm --name android-container80 kikotey/docker-android:emulator_11.0
}


@android82() {
result=$(sudo apt-get install -y cpu-checker)
already_data=$(echo $result | grep "already")
if [ -n "$already_data" ]; then echo "kvm is ready"; else echo "'$result'"; fi

touch /dev/kvm
kvm-ok

 docker run --privileged -d -p 6082:6080 -p 5556:5554 -p 5557:5555 -e EMULATOR_DEVICE="Samsung Galaxy S10" -e WEB_VNC=true -e WEB_VNC_PORT=6082 -e EMULATOR_LANGUAGE="English" -e EMULATOR_COUNTRY="en_US" -e DATAPARTITION="2000m" --name android-container82 kikotey/docker-android:emulator_11.0
}

@adb() {
sudo adb kill-server
sudo adb start-server
adb devices
}


@android83() {
result=$(sudo apt-get install -y cpu-checker)
already_data=$(echo $result | grep "already")
if [ -n "$already_data" ]; then echo "kvm is ready"; else echo "'$result'"; fi

touch /dev/kvm
kvm-ok

 docker run --privileged -d -p 6083:6080 -p 5558:5554 -p 5559:5555 -e EMULATOR_DEVICE="Samsung Galaxy S10" -e WEB_VNC=true -e WEB_VNC_PORT=6083 -e EMULATOR_LANGUAGE="English" -e EMULATOR_COUNTRY="en_US" -e DATAPARTITION="2000m" --name android-container83 kikotey/docker-android:emulator_11.0
}


@android84() {
result=$(sudo apt-get install -y cpu-checker)
already_data=$(echo $result | grep "already")
if [ -n "$already_data" ]; then echo "kvm is ready"; else echo "'$result'"; fi

touch /dev/kvm
kvm-ok

 docker run --privileged -d -p 6084:6080 -p 5560:5554 -p 5561:5555 -e EMULATOR_DEVICE="Samsung Galaxy S10" -e WEB_VNC=true -e WEB_VNC_PORT=6084 -e EMULATOR_LANGUAGE="English" -e EMULATOR_COUNTRY="en_US" -e DATAPARTITION="2000m" --name android-container84 kikotey/docker-android:emulator_11.0
}


@android85() {
result=$(sudo apt-get install -y cpu-checker)
already_data=$(echo $result | grep "already")
if [ -n "$already_data" ]; then echo "kvm is ready"; else echo "'$result'"; fi

touch /dev/kvm
kvm-ok

 docker run --privileged -d -p 6085:6080 -p 5562:5554 -p 5563:5555 -e EMULATOR_DEVICE="Samsung Galaxy S10" -e WEB_VNC=true -e WEB_VNC_PORT=6085 -e EMULATOR_LANGUAGE="English" -e EMULATOR_COUNTRY="en_US" -e DATAPARTITION="2000m" --name android-container85 kikotey/docker-android:emulator_11.0
}


main "$@"
