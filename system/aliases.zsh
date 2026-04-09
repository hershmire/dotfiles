# Modern CLI aliases
if (( $+commands[eza] )); then
  alias ls="eza"
  alias l="eza -1"
  alias ll="eza -l"
  alias la="eza -la"
elif $(gls &>/dev/null); then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

if (( $+commands[bat] )); then
  alias cat="bat"
  export BAT_THEME="ansi"
fi