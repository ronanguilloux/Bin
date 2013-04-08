#!/bin/sh
# Source: http://goo.gl/XOZ7i 
# Prend en paramètre le nom de la session tmux a créer ou à laquelle se rattacher.
# Puis ouvre un terminal ou en utilise un déjà existant et lui donne le focus.

WINDOW_NAME="Comete's TMUX Terminal"
TERM_EXIST=`wmctrl -l|grep "$WINDOW_NAME"`

if [ -z $1 ]; then
    echo "Merci de préciser le nom de la session tmux en paramètre."
    echo -e "\nExemple: ./terminux.sh MaSession"
    exit 0
fi

# Si aucun terminal n'est ouvert, on le lance
# et on y attache la session tmux
if [ -z $TERM_EXIST ]; then
    urxvt -T "$WINDOW_NAME" -e tmux -2 attach -t "$1" &
    sleep 0.5
fi

# On donne le focus au terminal
wmctrl -a "$WINDOW_NAME"
