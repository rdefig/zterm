#!/bin/sh

# Save previous shell to revert for uninstall
echo "PREV_SHELL=$SHELL" >> ".config"

# Disable login message
touch "$HOME/.hushlogin"

# Install zsh to /usr/local/bin
brew install zsh

# install hack nerd font
brew tap caskroom/fonts
brew cask install font-hack-nerd-font

# Add homebrew-installed zsh to recognized shells
sudo sh -c "echo /usr/local/bin/zsh >> /etc/shells"

# Change default shell to zsh
chsh -s "/usr/local/bin/zsh"

echo "Setup complete. Please restart your terminal."
