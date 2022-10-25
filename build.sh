#!/bin/bash

terminalColorWarning='\033[1;34m'
terminalColorClear='\033[0m'
terminalColorError='\033[1;31m'
echoError() {
    echo -e "${terminalColorError}ERROR: $1${terminalColorClear}"
}
echoWarning() {
    echo -e "${terminalColorWarning}WARNING: $1${terminalColorClear}"
}

############################################################
# Help                                                     #
############################################################
helpFunction()
{
   # Display Help
   echo "Syntax: ./build.sh -b [stm32f4_disco|rpi_pico]"
   echo "options:"
   echo "-h / --help     Print this Help."
   echo "-b / --board    Specify the board to build to project for."
   echo "-f / --flash    Flash the device."
   echo
   exit
}


############################################################
# Start of normal script                                   #
############################################################
flash=false
board=""

# Get cli arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -b|--board) board="$2"; shift; shift;;
        -h|--help) helpFunction; shift;;
        -f|--flash) flash=true; shift;;
    esac
done


# Print help and exit if no board is specified or the board type is not supported
if [ -z "$board" ]; then
    echoError "No board specified"
    helpFunction
fi

if [ ! "${board,,}" = {"stm32f4_disco",,} ] && [ ! "${board,,}" = {"rpi_pico",,} ]; then
    echoError "Your board is currently not supported by this script, try building manual and add a overlay for your board"
    helpFunction
fi


# Build project
if [ "${board,,}" = {"stm32f4_disco",,} ]; then
    west build -p auto -b stm32f4_disco -d ./build_stm32f4 app -- -DDTC_OVERLAY_FILE="overlays/f4_disco.overlay"
elif [ "${board,,}" = {"rpi_pico",,} ]; then
    west build -p auto -b rpi_pico -d ./build_rpi_pico app -- -DDTC_OVERLAY_FILE="overlays/pico.overlay"
fi 

if [ "${board,,}" = {"stm32f4_disco",,} ] && $flash; then
    cd ./build_stm32f4
    west flash
elif [ "${board,,}" = {"rpi_pico",,} ] && $flash; then
    cd ./build_rpi_pico
    west flash
fi

