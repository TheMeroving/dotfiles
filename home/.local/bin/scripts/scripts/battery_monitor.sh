#!/bin/bash

while :
do
	POWER=$(acpi -b | grep "Battery 0" | grep -o '[0-9]\+%' | tr -d '%')
	if [[ $POWER -le 15 ]]; then
    notify-send --icon=battery "Battery power is lower than 15% ($POWER%)!"
	fi
sleep 30
done
