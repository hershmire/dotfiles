if [[ -x "$HOME/.antigravity/antigravity/bin/antigravity" ]]; then
  export EDITOR='antigravity'
elif (( $+commands[code] )); then
  export EDITOR='code --wait'
else
  export EDITOR='vim'
fi
