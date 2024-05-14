# Development Workflow Setup

NOTE: plugins should be installed from `~/.config` NOT `~/.MachFiles/...` never commit any plugins, history, or cache
NOTE: changes should be made in `~/.MachFiles` NOT `~/.config` to ensure changes are reflected in git

## Getting Started

Install Homebrew, clone dotfiles, install apps/packages, clone with stow etc.
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
path+=('/opt/homebrew/bin')
brew update
cd $HOME && git clone https://github.com/raggar/MachFiles.git
brew bundle install --file=$HOME/MachFiles/brewfile/.config/brewfile/Brewfile
cd $HOME/MachFiles/ && stow */
```

Open a new terminal shell and run setup script.

```
chmod +x ~/MachFiles/scripts/.config/scripts/setup.sh
~/.MachFiles/scripts/.config/scripts/setup.sh
```

Restart your computer.

## Update ZSH

Run `sudo nvim /etc/shells` and add `/opt/homebrew/opt/zsh/bin/zsh` (you can only use chsh on shells in this file).

Run `chsh -s /opt/homebrew/opt/zsh/bin/zsh` 

Open a new shell and run `echo $SHELL` to confirm everything is set properly.

## Alacritty

Below is the manual installation for when the company cannot verify Alacritty as an app (when installed with `brew install --cask alacritty`).

```
git clone https://github.com/alacritty/alacritty.git $HOME
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
export PATH="$HOME/.cargo/bin:$PATH"
rustup override set stable
rustup update stable
cd $HOME/alacritty
make app
cp -r target/release/osx/Alacritty.app /Applications/
rm -rf $HOME/alacritty
```

Give alacritty full disk access

```
System Preferences -> Security & Privacy -> Privacy -> Full Disk Access
```

## Tmux

Enter the following command to start a tmux session

```
tmux
tmux source ~/.config/tmux/tmux.conf
```

Install plugins by pressing `prefix + I` inside a tmux window.

## Neovim

![image](https://user-images.githubusercontent.com/35639417/147967100-96f9dd12-26f3-4e13-9d40-e05f9a174e66.png)
![image](https://user-images.githubusercontent.com/35639417/147967067-f6d91fe5-7668-4227-a54b-a498630a833d.png)

Running neovim will setup the initial plugin installations.

```
cd ~/.config/nvim && nvim
```

By default no lsp servers (besides for lua) are installed. Reference https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md for 
additional installations.

Additional Notes:
    - setup any formatters/linters as needed with Mason
        - create a autocommand (`BufWrite` on save) to use a custom binary not supported by null-ls
    - performance enhancements can be made for certain lsp servers i.e. ignoring directories 
        - disable unneeded options for specific LSP server (ex, `update_in_insert`, `virtual_text`)

## Karabiner Elements

Add Karabiner to login items (System Preferences --> Login Items)

Launch Karabiner elements and grant full permissions.

## Alt-tab

Add Alt-tab to login items (System Preferences --> Login Items)

Set shortcut to "Command Tab" to override default MacOS Switcher

Change keybinds i.e prev tab --> command + shift   

## Raycast

Disable Spotlight keybind with `System Preferences -> Keyboard Shortcuts -> Spotlight`.

Add Raycast to login items (System Preferences --> Login Items) if not done automatically

Change keybind to `Command + Space`

Go to raycast settings -> advanced -> import settings stored in `MachFiles/raycast`

## Machine

Cleanup Finder (sidebar, remove tags etc.).

Cleanup menubar (remove spotlight, sound, etc.), add bluetooth

Setup Google Chrome
    - Enable bookmarks bar
    - Install Vimium
        - import vimium css and blocked websites (if on personal)

MacOS Settings
    - Uncheck `shake mouse pointer to locate` go into `Accessibility` -> `Display`.
    - Minimize doc and hide automatically
    - Increase Key Repeat (makes vim feel smooth) --> `System Preferences -> Keyboard`, maximize `Key Repeat`, and minimize `Delay until repeat`.

Change Screenshots to copy to clipboard (`cmd + shift + 5`)

## Random Errors 

Treesitter linting errors appearing in neovim help doc

```
:TSUpdate vimdoc
```

## Window Management (Optional)

Open several desktops
Keyboard Settings -> Shortcuts -> Mission Control -> Enable shortcuts for switching spaces
System Settings -> Accessibility -> Display -> Turn on "Reduce motion"
System Settings -> Mission Control -> Turn off "Automatically rearrange spaces based on recent use", enable "Displays have seperate spaces", and enable "Switch to a Space with open windows for the application"

## **Tips for Work Machine**
- Hook into build systems (ex, bazel) to increase performance if using neovim as editor
- Add any aliases needed for (ex, jumping into a directory, running linter, running tests etc.)
- Setup .gitconfig as needed
- Modify .ignore to ignore specific build files etc.

