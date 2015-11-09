#!/bin/sh

xsetroot -solid white
export PATH=/home/odroid/bin:$PATH
xdotool mousemove 2000 2000

# If X has restarted then tmux with the kantinfo script may already
# be running - if so, kill it before we start a new one.
tmux kill-session -t kantinfo

dbus-launch tmux new-session -s kantinfo -d './kantinfo/kantinfo.py cokepc/content; bash'
exec matchbox-window-manager -use_titlebar no
