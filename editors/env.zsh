if (( $+commands[antigravity] )); then
  export EDITOR='antigravity'
elif (( $+commands[code] )); then
  export EDITOR='code --wait'
else
  export EDITOR='vim'
fi
