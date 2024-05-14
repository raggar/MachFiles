# Remove Message of the day prompt
touch $HOME/.hushlogin

# fzf https://github.com/junegunn/fzf
# install useful keybindings
$(brew --prefix)/opt/fzf/install

# nvm https://github.com/nvm-sh/nvm
echo "Installing NVM ..."
mkdir $HOME/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
nvm install 'lts/*'

# tpm https://github.com/tmux-plugins/tpm
echo "Installing TPM ..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

gitsetup() {
    echo "WARNING: not checking for existing SSH keys\!"

    # Set nvim as editor
    git config --global core. editor "nvim"

    # Use current branch only when doing git push
    git config --global push.default current

    echo "What’s your git name?"
    read GIT_SETUP_NAME
    git config --global user.name $GIT_SETUP_NAME

    echo "What’s your git email?"
    read GIT_SETUP_EMAIL
    git config --global user.email $GIT_SETUP_EMAIL

    echo "Now configuring SSH keys..."
    ssh-keygen -t rsa -C $GIT_SETUP_EMAIL

    echo "Let’s start the ssh-agent..."
    eval "$(ssh-agent -s)"

    echo "Adding SSH key..."
    ssh-add ~/.ssh/id_rsa

    echo "Now copying SSH key to clipboard..."
    pbcopy < ~/.ssh/id_rsa.pub
}

echo "Done :), please restart your computer"
