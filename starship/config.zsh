if (( $+commands[starship] )); then
  export STARSHIP_CONFIG="$HOME/.starship.toml"
  eval "$(starship init zsh)"
fi
