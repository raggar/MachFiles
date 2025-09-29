# New Mac Setup

NOTE: plugins should be installed from `~/.config` NOT `~/.MachFiles/...` never commit any plugins, history, or cache
NOTE: changes should be made in `~/.MachFiles` NOT `~/.config` to ensure changes are reflected in git

## Getting Started

Clone dotfiles

```
cd $HOME && git clone git@github.com:raggar/MachFiles.git
```

Run setup script to install casks, packages, and create "stow" symlinks

```
chmod +x MachFiles/scripts/.config/scripts/setup.sh
./MachFiles/scripts/.config/scripts/setup.sh
```

Restart your computer.

NOTE: If any functionality is back to its default behaviour, most likely the files were not stowed correctly

## Update ZSH

Run `sudo nvim /etc/shells` and add `/opt/homebrew/opt/zsh/bin/zsh` (you can only use chsh on shells in this file).
Run `chsh -s /opt/homebrew/opt/zsh/bin/zsh` 
Open a new shell and run `echo $SHELL` to confirm everything is set properly.

## Alacritty

When getting the error about alacritty not being allowed, enable via security settings. If it does not work try

```
sudo spctl --master-disable
```

## Tmux

Enter the following command to start a tmux session

```
tmux
tmux source ~/.config/tmux/tmux.conf
```

Install plugins by pressing `prefix + I` inside a tmux window.

## Neovim

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

Enable vim keybindings

## Machine

Cleanup Finder (sidebar, remove tags etc.).

Cleanup dock and minimize

Cleanup menubar (add bluetooth icon and remove sound).

Setup Arc Browser
    - Extensions: Ad block, Bitwarden, Vimium
    - Set to default browser `System Settings -> Desktop & Dock -> Default Browser`
    - Change links to use default space: Preferences > Links > Air Traffic Control > Default: Most Recent Space
    - Setup bookmarks

MacOS Settings
    - Uncheck `shake mouse pointer to locate` go into `Accessibility` -> `Display`.
    - Increase Key Repeat (makes vim feel smooth) --> `System Preferences -> Keyboard`, maximize `Key Repeat`, and minimize `Delay until repeat`.
    - Hide dock
    - Hide desktop items

Change Screenshots to copy to clipboard (`cmd + shift + 5`)

Disable Hot Corners

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

