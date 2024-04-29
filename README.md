# Development Workflow Setup

Note that any plugins should be installed from `~/.config` NOT `~/.MachFiles/...` i.e never commit any plugins, history, or cache

## Getting Started

Clone dotfiles

```
cd $HOME && git clone https://github.com/raggar/MachFiles.git
```

Run setup script,

```
chmod +x MachFiles/scripts/.config/scripts/setup.sh
./MachFiles/scripts/.config/scripts/setup.sh
```

Restart your computer

## Update ZSH

Perform `which zsh` to determine which binary to add. 

Should be `user/local/bin/zsh` for intel and `opt/homebrew/bin/zsh` for M1 macs.

```
sudo vim /etc/shells # lists shells which you can switch too
# add shell
`chsh -s shell` 
```

Restart terminal, open a new shell and run `which zsh`, verify result is correct

## Alacritty

Install latest Alacritty (to use toml configuration)
- can use `brew install --cask alacritty` (NOTE: this may not install the latest version)
- download dmg from Github release page and add binary to path
- build from source `sudo cp /Applications/Alacritty.app/Contents/MacOS/alacritty /usr/bin/`

```
git clone https://github.com/alacritty/alacritty.git

// install rust dependency
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup override set stable
rustup update stable

cd /alacritty
make app
cp -r target/release/osx/Alacritty.app /Applications/
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

Install all necessary plugins (you will see treesitter installing a bunch of parsers the first time neovim is loaded).

```
cd ~/.config/nvim && nvim
```

Setup LSP servers https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

Disable unneeded options for specific LSP server (ex, `update_in_insert`, `virtual_text`)
LSP's can ignore specific directories (ex, lsp.setup -> settings -> gopls -> directoryFilters)

Setup any formatters using null-ls or create a autocommand (`BufWrite` on save) to use a custom binary not supported by null-ls

## Karabiner Elements

Launch Karabiner elements and grant full permissions.

## Alt-tab

Ensure start at login is checked and blacklist all required applications

Make sure to set shortcut to "Command Tab" to override default MacOS Switcher

Change keybinds as you wish i.e prev tab --> command + shift   

## Raycast

1. Disable Spotlight, uncheck `System Preferences -> Spotlight -> Keyboard Shortcuts -> Show Spotlight Search`.

2. Ensure Raycast runs at login and is bound to `Command + Space`.

3. Go to settings -> advanced -> import settings stored in `MachFiles/raycast`

## Machine

1. Cleanup Finder (sidebar, remove tags etc.).

2. Cleanup dock and minimize

3. Cleanup menubar (add bluetooth icon and remove sound).

4. Setup Google Chrome
    - Setup bookmarks
    - Install Momentum, 1Password etc.
    - Install Vimium
        - import vimium css and blocked websites (if on personal)

5. MacOS Settings
    - Uncheck `shake mouse pointer to locate` go into `Accessibility` -> `Display`.
    - Hide dock
    - Increase Key Repeat (makes vim feel smooth) --> `System Preferences -> Keyboard`, maximize `Key Repeat`, and minimize `Delay until repeat`.
    - Hide desktop items

6. Change Spotify to not open on startup.

7. Select blurred background wallpaper.

8. Change Screenshots to copy to clipboard (`cmd + shift + 5`)

9. Add the following to your `.gitconfig` to have better git diffs

```
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true    # use n and N to move between diff sections

    # delta detects terminal colors automatically; set one of these to disable auto-detection
    # dark = true
    # light = true

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default
```

## Random Errors 

1. Treesitter linting errors appearing in neovim help doc

```
:TSUpdate vimdoc
```

## Window Management (Optional)

1. Open several desktops
2. Keyboard Settings -> Shortcuts -> Mission Control -> Enable shortcuts for switching spaces
3. System Settings -> Accessibility -> Display -> Turn on "Reduce motion"
4. System Settings -> Mission Control -> Turn off "Automatically rearrange spaces based on recent use", enable "Displays have seperate spaces", and enable "Switch to a Space with open windows for the application"

## **Tips for Work Machine**
- Hook into build systems (ex, bazel) to increase performance if using neovim as editor
- Add any aliases needed for (ex, jumping into a directory, running linter, running tests etc.)
- Setup .gitconfig as needed
- Modify .ignore to ignore specific build files etc.

