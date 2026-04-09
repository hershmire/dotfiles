# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at $completion below (this is where Homebrew
# tosses it, at least).
completion='$(brew --prefix)/share/zsh/site-functions/_git'

if test -f $completion
then
  source $completion
fi

# Complete git aliases like their underlying commands
# compdef <alias>=git makes the alias complete as `git <subcommand>`
compdef g=git
compdef _git gco=git-checkout
compdef _git gb=git-branch
compdef _git gc=git-commit
compdef _git gca=git-commit
compdef _git ga=git-add
compdef _git gd=git-diff
compdef _git gl=git-pull
compdef _git gp=git-push
compdef _git gs=git-status
compdef _git glog=git-log
compdef _git gac=git-commit

# GitHub CLI completion
if (( $+commands[gh] )); then
  eval "$(gh completion -s zsh)"
fi
