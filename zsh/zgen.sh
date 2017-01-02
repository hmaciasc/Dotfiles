# installation
echo "Cloning Zgen"
cd ~
git clone https://github.com/tarjoilija/zgen.git .zgen
echo "Finished cloning"

# load zgen
echo "source "${HOME}/.zgen/zgen.zsh"" >> ~/.zshrc
cat zgenrc > ~/.zshrc


# Copy config
echo "Importing configuration files"
cp zgenrc > ~/.zshrc
cp themes/bullet-train.zsh-theme .zgen/caiogondim/bullet-train-oh-my-zsh-theme-master
echo "Zgen installed"
