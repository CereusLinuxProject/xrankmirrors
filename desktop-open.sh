#!/bin/sh
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
PCMANFM_QT_CONF="$XDG_CONFIG_HOME/pcmanfm-qt/lxqt/settings.conf"
PCMANFM_QT_ETC_CONF="/etc/pcmanfm-qt/lxqt/settings.conf"
XRANKMIRRORS_CONF="$XDG_CONFIG_HOME/xrankmirrors.conf"
XRANKMIRRORS_ETC_CONF="/etc/xrankmirrors.conf"
TERM_TITLE="xrankmirrors"
TERM_ARGS=""
RUN_CMD="/usr/share/xrankmirrors/pkexec-launch"

if [ -e "$XRANKMIRRORS_CONF" ]; then
    TERM_CMD="$(cat $XRANKMIRRORS_CONF | grep terminal | cut -d"=" -f2)"
    TERM_ARGS="$(cat $XRANKMIRRORS_CONF | grep args | cut -d"=" -f2)"
elif [ -e "$XRANKMIRRORS_ETC_CONF" ]; then
	TERM_CMD="$(cat $XRANKMIRRORS_ETC_CONF | grep terminal | cut -d"=" -f2)"
	TERM_ARGS="$(cat $XRANKMIRRORS_ETC_CONF | grep args | cut -d"=" -f2)"
elif [ -e /usr/bin/exo-open ]; then
    TERM_CMD="exo-open"
elif [ -e $PCMANFM_QT_CONF ]; then
    TERM_CMD="$(cat $PCMANFM_QT_CONF | grep Terminal | cut -d"=" -f2)"
elif [ -e "$PCMANFM_QT_ETC_CONF" ]; then
	TERM_CMD="$(cat $PCMANFM_QT_ETC_CONF | grep Terminal | cut -d"=" -f2)"
elif [ -e /usr/bin/xfce4-terminal ]; then
	TERM_CMD="xfce4-terminal"
elif [ -e /usr/bin/lxterminal ]; then
    TERM_CMD="lxterminal"
elif [ -e /usr/bin/qterminal ]; then
	TERM_CMD="qterminal"
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

case $TERM_CMD in
	exo-open)
		TERM_ARGS="--launch TerminalEmulator" ;;
	lxterminal)
		TERM_ARGS="-T $TERM_TITLE -e" ;;
	mate-terminal)
		TERM_ARGS="-t $TERM_TITLE -e" ;;
	konsole)
		TERM_ARGS="-T $TERM_TITLE -e" ;;
	gnome-terminal)
		TERM_ARGS="-t $TERM_TITLE --" ;;
	urxvt)
		TERM_ARGS="-T $TERM_TITLE -e" ;;
	xfce4-terminal)
		TERM_ARGS="-T $TERM_TITLE -e" ;;
	kitty)
		TERM_ARGS="-T $TERM_TITLE" ;;
	tilix)
		TERM_ARGS="-t $TERM_TITLE -e" ;;
	xterm)
		TERM_ARGS="-T $TERM_TITLE -e" ;;
	qterminal)
		# Qterminal does not support to change the title through launch arguments.
		TERM_ARGS="-e" ;;
esac

exec $TERM_CMD $TERM_ARGS ${RUN_CMD}
