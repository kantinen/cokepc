#!/bin/sh

feh --bg-scale cokepc/content/cokepc.png
export PATH=/home/odroid/bin:/usr/local/bin:$PATH
xdotool mousemove 2000 2000

# If X has restarted then tmux with the kantinfo script may already
# be running - if so, kill it before we start a new one.
tmux kill-session -t kantinfo

dbus-launch tmux new-session -s kantinfo -d 'cd kantinfo; ./kantinfo.py --random ../cokepc/content; bash'
exec matchbox-window-manager -use_titlebar no
