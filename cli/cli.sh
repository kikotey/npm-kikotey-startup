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
    adb)
      @adb
      ;;
    *)
      @e "Usage: {android|adb}"
      exit 1
      ;;
  esac
}

@android() {
docker run --privileged -d -p 6080:6080 -p 5554:5554 -p 5555:5555 -e DEVICE="Samsung Galaxy S9" -e DATAPARTITION="2000m" --name android-container budtmo/docker-android-x86-8.1
}

@adb() {
sudo adb kill-server
sudo adb start-server
adb devices
}

main "$@"

