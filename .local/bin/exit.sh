#!/bin/sh

RET=$(echo -e "shutdown\nreboot\nlogout\nsleep\ncancel" | dmenu -l 5 -p "Logout")

case $RET in
	shutdown) systemctl poweroff ;;
	reboot) systemctl reboot ;;
	logout)   betterlockscreen --off 5 -l ;;
  sleep)  systemctl  sleep ;;
	*) ;;
esac
