source $HOME/.zshrc_exports

if ! echo $PATH | grep -q "$HOME/.local/bin"; then
    export PATH=$PATH:$HOME/.local/bin
fi

if ! echo $PATH | grep -q "$HOME/.local/share/gem/ruby/3.0.0/bin"; then
    export PATH=$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin
fi

if grep -q "i5" /proc/cpuinfo; then
    export LAPTOP=""
fi

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    if [ -v LAPTOP ]; then
	exec startx &> /dev/null
    else
	exec startx
    fi
fi
