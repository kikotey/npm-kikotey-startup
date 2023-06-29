#!/bin/bash
# Action to execute (mandatoty)
action="$1"  
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
    android)
      @android
      ;;
    android2)
      @android2
      ;;
    adb)
      @adb
      ;;
    kill1)
      @kill1
      ;;
    kill2)
      @kill2
      ;;
    status)
      @status
      ;;
    ps)
      @ps
      ;;
    *)
            @e "Usage: { android (6080) | android2 (6082) | adb | status | ps | debug | | kill1 | kill2 | killdebug }"
      exit 1
      ;;
  esac
}

@kill1() {
 docker rm android-container -f
}

@kill2() {
 docker rm android-container2 -f
}

@killdebug() {
 echo " "
 echo "Debugger kill"
 echo " "
 fuser -k 52342/tcp
}

@debug() {
 npx flipper-server &
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

@android() {
result=$(sudo apt-get install -y cpu-checker)
already_data=$(echo $result | grep "already")
if [ -n "$already_data" ]; then echo "kvm is ready"; else echo "'$result'"; fi

touch /dev/kvm
kvm-ok

docker run --privileged -d -p 6080:6080 -p 5554:5554 -p 5555:5555 -e EMULATOR_DEVICE="Samsung Galaxy S10" -e WEB_VNC=true -e WEB_VNC_PORT=6080 -e EMULATOR_LANGUAGE="French" -e EMULATOR_COUNTRY="fr_FR" -e DATAPARTITION="2000m" --device /dev/kvm --name android-container kikotey/docker-android:emulator_11.0
}


@android2() {
result=$(sudo apt-get install -y cpu-checker)
already_data=$(echo $result | grep "already")
if [ -n "$already_data" ]; then echo "kvm is ready"; else echo "'$result'"; fi

touch /dev/kvm
kvm-ok

 docker run --privileged -d -p 6082:6080 -p 5556:5554 -p 5557:5555 -e EMULATOR_DEVICE="Samsung Galaxy S10" -e WEB_VNC=true -e WEB_VNC_PORT=6082 -e EMULATOR_LANGUAGE="English" -e EMULATOR_COUNTRY="en_US" -e DATAPARTITION="2000m" --name android-container2 kikotey/docker-android:emulator_11.0
}

@adb() {
sudo adb kill-server
sudo adb start-server
adb devices
}

main "$@"
