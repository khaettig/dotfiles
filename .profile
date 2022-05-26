if [ -f "$HOME/.bashrc" ]; then
. "$HOME/.bashrc"
fi

export $(gnome-keyring-daemon -s)
. "$HOME/.cargo/env"
