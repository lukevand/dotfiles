# export PATH="$HOME/bin:$PATH"
# from /etc/profile
umask 077
# root's PATH in /etc/profile
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/gradle/gradle-6.5.1/bin"

PATH="${PATH}:$(find "$HOME/bin" -maxdepth 1 -type d | xargs | sed 's/ /:/g')"

export PATH="$PATH:/usr/games:$HOME/.local/bin:/usr/lib/execline/bin:/snap/bin:$HOME/.gem/ruby/2.7.0/bin"

export BROWSER="firefox"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export SUDO_EDITOR=/usr/bin/vi

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export MYPY_CACHE_DIR=~/.cache/mypy_cache

export NNN_USE_EDITOR=1

export LESSHISTFILE='-'
export LESS='--LONG-PROMPT -R --ignore-case --quiet'
export SDCV_HISTSIZE=0
export SXHKD_SHELL=/usr/lib/execline/bin/execlineb
export NO_AT_BRIDGE=1

export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"

export WORKON_HOME=~/.local/share/python_env


# export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=true
export _JAVA_OPTIONS='-Dsun.java2d.opengl=true -Dawt.useSystemAAFontSettings=lcd'

[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
[ -n "$ZSH_VERSION" ] && [ -f "$HOME/.zshrc" ] && . "$HOME/.zshrc"

[ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ] && exec startx -- -nolisten tcp
