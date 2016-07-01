# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/
    zgen load zsh-users/zsh-syntax-highlighting


    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train
    # Bullet-Train fix
    cp Dotfiles/zsh/themes/bullet-train.zsh-theme .zgen/caiogondim/bullet-train-oh-my-zsh-theme-master
    #zgen oh-my-zsh themes/bullet-train

    # save all to init script
    zgen save
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
