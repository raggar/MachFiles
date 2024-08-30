# Load zsh functions
fpath=($fpath "/Users/raggarwal/.config/zsh/.zfunctions")

# paths
path+=('.nvm/versions/node/v16.17.0/bin')

# Load external files
source "$HOME/.config/zsh/vim-mode.zsh"
source "$HOME/.config/zsh/functions.zsh"
source "$HOME/.config/zsh/aliases.zsh"

# Enabling and setting git info var to be used in prompt config
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
# This line obtains information from the vcs.
zstyle ':vcs_info:git*' formats "(%b) "
precmd() {
    vcs_info
}

# Enable substitution in the prompt.
setopt prompt_subst

# Config for the prompt. PS1 synonym.
prompt='%F{cyan}%~ %F{magenta}${vcs_info_msg_0_}%F{white}$ '

# Colours
autoload -Uz colors && colors

# Enable fzf keybinds
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Run ls on directory change
chpwd() lsd

eval "$(zoxide init zsh)"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(pyenv init --path)"

# Created by `pipx` on 2024-05-14 13:39:59
export PATH="$PATH:/Users/raggarwal/.local/bin"

source $ZPLUG_HOME/init.zsh
zplug "hlissner/zsh-autopair"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "undg/zsh-nvm-lazy-load" # loading nvm takes a long time, do it lazily

# Plugins
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
# Keep this as last line!
zplug load

# bun completions
[ -s "/Users/raggarwal/.bun/_bun" ] && source "/Users/raggarwal/.bun/_bun"
