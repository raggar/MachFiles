echo "Running setup script ..."
echo "Installing brew .."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update

# Install brew packages and casks
echo "Installing brew packages ..."
brew bundle install --file=$HOME/MachFiles/brewfile/.config/brewfile/Brewfile

echo "Symlinking dotfiles ..."
cd $HOME/MachFiles/ && stow */

cd ..

# Remove Message of the day prompt
touch $HOME/.hushlogin

# fzf https://github.com/junegunn/fzf
# install useful keybindings
$(brew --prefix)/opt/fzf/install

# nvm should be installed via brew
nvm install node 
nvm use node

# tpm https://github.com/tmux-plugins/tpm
echo "Installing TPM ..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

gitsetup() {
    echo "WARNING: not checking for existing SSH keys\!"

    # Set nvim as editor
    git config --global core.editor "nvim"

    # Use current branch only when doing git push
    git config --global push.default current
    git config --global user.name "Rahul Aggarwal"
    git config --global user.email "rahulaggarwal1016@gmail.com"

    echo "Now configuring SSH keys..."
    ssh-keygen -t rsa -C "rahulaggarwal1016@gmail.com"

    echo "Let’s start the ssh-agent..."
    eval "$(ssh-agent -s)"

    echo "Adding SSH key..."
    ssh-add ~/.ssh/id_rsa

    echo "Now copying SSH key to clipboard..."
    pbcopy < ~/.ssh/id_rsa.pub
}

echo "Done :), please restart your computer"
