echo path1 $PATH
export PATH="./bin:/usr/local/bin:/usr/local/sbin:$ZSH/bin:$PATH"
# Move PATH up to ensure dotfile paths preceed homebrew and system paths
# export PATH="./bin:$ZSH/bin:$PATH:/usr/local/sbin"
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

echo path2 $PATH

# # path (without)
# /Users/eddieleffler/.rbenv/shims:
# /Users/eddieleffler/.nvm/versions/node/v10.15.3/bin:
# /Users/eddieleffler/.jenv/bin:
# /Users/eddieleffler/Code/go/bin:
# /usr/local/bin:
# /usr/bin:
# /bin:
# /usr/sbin:
# /sbin:
# /usr/local/bin

# # path (with) 
# ./bin:
# /usr/local/bin:
# /usr/local/sbin:
# /Users/eddieleffler/.dotfiles/bin:
# /Users/eddieleffler/.rbenv/shims:
# /Users/eddieleffler/.nvm/versions/node/v10.15.3/bin:
# /Users/eddieleffler/.jenv/bin:
# /Users/eddieleffler/Code/go/bin:
# /usr/local/bin:
# /usr/bin:
# /bin:
# /usr/sbin:
# /sbin:
# /usr/local/bin
