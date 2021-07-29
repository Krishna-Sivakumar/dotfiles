starship init fish | source
abbr toclipb "xclip -o | xclip -selection clipboard -i"

cat ~/.cache/wal/sequences &
bash ~/.cache/wal/colors-tty.sh

export BROWSER=firefox
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/ktimespi/.ghcup/bin # ghcup-env

set -x PATH $PATH $HOME/.local/bin

set fish_greeting
