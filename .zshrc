# Linux antigen file
source /usr/local/Cellar/antigen/2.2.3/share/antigen/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle compleat
antigen bundle git-extras
antigen bundle git-flow
antigen bundle npm
antigen bundle web-search
antigen bundle z
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh
# Syntax autosugestion bundle.
antigen bundle zsh-users/zsh-autosuggestions
# Pure Theme
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
# Tell Antigen that you're done.
antigen apply
# Load custom aliases
[ -f ~/.zsh_aliases ] && source ~/.zsh_aliases || echo "\e[1m\e[31m[KO] - {~/.zsh_aliases} - NOT EXISTS\e[0m\e[21m"

# ASDF
. /usr/local/opt/asdf/asdf.sh

function pruneGit(){
    git branch --merged | grep -v "master" >/tmp/merged-branches && vi /tmp/merged-branches && xargs git branch -d </tmp/merged-branches
}

