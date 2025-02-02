fpath=(/usr/local/share/zsh/site-functions $fpath)

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in $ZSH/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="pygmalion"
#export ZSH_THEME="random"

# Set to this to use case-sensitive completion
export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.dotfiles/oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(brew cloudapp colorize compleat dirpersist gem git git-flow github osx mvn node npm nvm rvm ssh-agent)
plugins=(brew cloudapp colorize compleat dirpersist gem git git-flow osx mvn node npm nvm rvm ssh-agent)

source $ZSH/oh-my-zsh.sh

export NVM_DIR=~/.nvm
source /usr/local/opt/nvm/nvm.sh

# Customize to your needs...
unsetopt correct

if which rbevenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH="/Users/"$(whoami)"/.rbenv/shims:${PATH}"
source "/usr/local/Cellar/rbenv/1.0.0/libexec/../completions/rbenv.zsh"
rbenv rehash 2>/dev/null

nvm use stable
# run fortune on new terminal :)
fortune

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

# command history per directory
# http://unix.stackexchange.com/questions/204833/keeping-history-per-working-directory-cf-per-shell-session
HISTSIZE=1000
SAVEHIST=10000
setopt HIST_SAVE_NO_DUPS INC_APPEND_HISTORY
HISTFILE=~/.zsh/dirhist/${PWD//\//@}
chpwd() {
  [[ $PWD = $OLDPWD ]] || fc -Pp ~/.zsh/dirhist/${PWD//\//@}
}

# scalaenv
eval "$(scalaenv init -)"
