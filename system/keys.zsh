# Pipe my public key to my clipboard.
if [[ -f ~/.ssh/id_ed25519.pub ]]; then
  alias pubkey="pbcopy < ~/.ssh/id_ed25519.pub && echo '=> Public key copied to pasteboard.'"
elif [[ -f ~/.ssh/id_rsa.pub ]]; then
  alias pubkey="pbcopy < ~/.ssh/id_rsa.pub && echo '=> Public key copied to pasteboard.'"
fi
