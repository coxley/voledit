#!/bin/bash
#
# voledit.sh
#
# This script is for managing OSD (volnoti) for display brightness and volume
# levels.
#
# Arguments:
#
#   sound       (up|down|mute)
#   brightness  (up|down)


case "$1" in
    "sound")
        STEP=5      # 5 == volnoti level
        UNIT="%"    # db, %, etc
        SETVOL="/usr/bin/amixer -q -D pulse set Master"
        case "$2" in
            # Appending with unmute makes sure that volume changes will bring
            # device out of mute if that's the case. Otherwise, would be
            # jarring if taking out of mute you realized it was at 100% vol
            "up")
                $SETVOL playback $STEP$UNIT+ unmute
                ;;
            "down")
                $SETVOL playback $STEP$UNIT- unmute
                ;;
            "mute")
                $SETVOL toggle
                ;;
        esac
        VOLUME=$(amixer -D pulse get Master | grep 'Front Left:' | \
                 cut -d ' ' -f 7 | sed -e 's/[^0-9]//g')
        STATE=$(amixer -D pulse get Master | grep 'Front Left:' | \
                grep -o "\[off\]")
        if [[ -n $STATE ]]; then
            volnoti-show -m
        else
            volnoti-show $VOLUME
        fi
        ;;
    "brightness")
        STEP=5
        INC="xbacklight -inc"
        DEC="xbacklight -dec"
        case "$2" in
            "up")
                $INC $STEP
                ;;
            "down")
                $DEC $STEP
                ;;
        esac
        BRIGHTNESS=$(xbacklight | sed 's/\..*//g')
        volnoti-show \
            -s \
            /usr/share/pixmaps/volnoti/display-brightness-symbolic.svg \
            $BRIGHTNESS
        ;;
esac
