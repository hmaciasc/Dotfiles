ZSH=$HOME/.oh-my-zsh
ZSH_THEME="cobalt2"
ZSH_THEME="rbates"
#ZSH_THEME="mh"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="true"

plugins=(git bundler brew gem rbates npm bower docker)

export PATH="/usr/local/bin:$PATH"
export EDITOR='mate -w'

source $ZSH/oh-my-zsh.sh

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
. `brew --prefix`/etc/profile.d/z.sh
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
