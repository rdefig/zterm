#!/bin/sh

[[ -n $1 ]] && INSTALL_DIR="$1" || INSTALL_DIR="$HOME"
echo "INSTALL_DIR=$INSTALL_DIR" >> ".config"

# Disable login message
touch "$HOME/.hushlogin"

# Install zsh to /usr/local/bin
brew install zsh

# Add homebrew-installed zsh to recognized shells
sudo sh -c "echo /usr/local/bin/zsh >> /etc/shells"

# Change default shell to zsh
chsh -s "/usr/local/bin/zsh"

# clone rdefig/prezto.git
git clone --recursive https://github.com/rdefig/prezto.git "$INSTALL_DIR/.zprezto"

# set remote upstream to sorin-ionescu/prezto.git (for updates)
cd $INSTALL_DIR/.zprezto && git remote add upstream https://github.com/sorin-ionescu/prezto.git

# copy zsh config files provided by prezto
setopt EXTENDED_GLOB
for rcfile in "$INSTALL_DIR"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "$INSTALL_DIR/.${rcfile:t}"
done

# install hack nerd font
brew tap caskroom/fonts
brew cask install font-hack-nerd-font

# symlink prompt_jumbozshrimp_setup (use the FULL path to the file!)
ln -s "$INSTALL_DIR/.zprezto/modules/prompt/external/jumbo-zshrimp/jumbo-zshrimp.zsh" "$INSTALL_DIR/.zprezto/modules/prompt/functions/prompt_jumbozshrimp_setup"
