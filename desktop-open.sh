#!/bin/sh
PCMANFM_QT_CONF="$HOME/.config/.config/pcmanfm-qt/default/settings.conf"
XRANKMIRRORS_CONF="$HOME/.config/xrankmirrors.conf"
if [ -e $XRANKMIRRORS_CONF ]; then
    TERM_CMD="$(cat $XRANKMIRRORS_CONF | grep terminal | cut -d"=" -f2)"
elif [ -e /usr/bin/exo-open ]; then
    TERM_CMD="exo-open --launch TerminalEmulator"
elif [ -e $PCMANFM_QT_CONF ]; then
    TERM_CMD="$(cat $PCMANFM_QT_CONF | grep Terminal | cut -d"=" -f2)"
elif [ -e /usr/bin/lxterminal ]; then
    TERM_CMD="lxterminal"
elif [ -e /usr/bin/mate-terminal ]; then
    TERM_CMD="mate-terminal"
elif [ -e /usr/bin/konsole ]; then
    TERM_CMD="konsole"
elif [ -e /usr/bin/gnome-terminal ]; then
    TERM_CMD="gnome-terminal"
elif [ -e /usr/bin/urxvt ]; then
    TERM_CMD="urxvt"
elif [ -e /usr/bin/kitty ]; then
    TERM_CMD="kitty"
elif [ -e /usr/bin/tilix ]; then
    TERM_CMD="tilix"
elif [ -e /usr/bin/xterm ]; then
    TERM_CMD="xterm"
else
    echo "No terminal emulator were found, please install one, or define your custom terminal at ~/.config/xrankmirrors.conf like this:"
    echo 'terminal="your_terminal_emulator"'
    exit 1
fi

pkexec env XAUTHORITY=${XAUTHORITY} DISPLAY=${DISPLAY} $TERM_CMD -e xrankmirrors -i
