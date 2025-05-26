#!/bin/bash

## Use with : `curl -s https://raw.github.com/nailyk-fr/dot/setup/setup.sh | bash`
##    or    : `wget -q https://raw.github.com/nailyk-fr/dot/setup/setup.sh -O - | bash`

cd
mv .bashrc .bashrc.orig
wget "https://raw.github.com/nailyk-fr/dot/master/.zshrc" -O .zshrc
wget "https://raw.github.com/nailyk-fr/dot/master/.bashrc" -O .bashrc
wget "https://raw.github.com/nailyk-fr/dot/master/prompt_nailyk_setup" -O prompt_nailyk_setup
wget "https://raw.github.com/nailyk-fr/dot/master/.screenrc" -O .screenrc
wget "https://raw.github.com/nailyk-fr/dot/master/.vimrc" -O .vimrc
sudo ln -sf ~/.bashrc /root/
sudo ln -sf ~/.vimrc /root/
sudo ln -sf ~/.zshrc /root/
sudo ln -sf ~/prompt_nailyk_setup /root/
sudo chsh -s /bin/zsh $USER
sudo chsh -s /bin/zsh root

echo 'Envoy =)'
