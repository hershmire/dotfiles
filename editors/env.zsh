if [[ -x "$HOME/.antigravity-ide/antigravity-ide/bin/antigravity-ide" ]]; then
  export EDITOR='antigravity-ide'
elif (( $+commands[code] )); then
  export EDITOR='code --wait'
else
  export EDITOR='vim'
fi
