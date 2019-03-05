#!/usr/bin/env zsh

# Save install directory (default $HOME)
[[ -n $1 ]] && INSTALL_DIR="$1" || INSTALL_DIR="$HOME"
echo "INSTALL_DIR=$INSTALL_DIR" >> ".config"

# clone rdefig/prezto.git
git clone --recursive https://github.com/rdefig/prezto.git "$INSTALL_DIR/.zprezto"

# set remote upstream to sorin-ionescu/prezto.git (for updates)
cd $INSTALL_DIR"/.zprezto" && git remote add upstream https://github.com/sorin-ionescu/prezto.git

# copy zsh config files provided by prezto
setopt EXTENDED_GLOB
for rcfile in "$INSTALL_DIR"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "$INSTALL_DIR/.${rcfile:t}"
done

# symlink prompt_jumbozshrimp_setup (use the FULL path to the file!)
ln -sf "$INSTALL_DIR/.zprezto/modules/prompt/external/jumbo-zshrimp/jumbo-zshrimp.zsh" "$INSTALL_DIR/.zprezto/modules/prompt/functions/prompt_jumbozshrimp_setup"

# Add Jumbo ZSHrimp submodule to prezto repo
cd $INSTALL_DIR"/.zprezto" && git submodule add https://github.com/rdefig/jumbo-zshrimp.git $INSTALL_DIR"/.zprezto/modules/prompt/external/jumbo-zshrimp"

