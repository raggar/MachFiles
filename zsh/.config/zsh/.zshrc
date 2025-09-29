# Load external files
# eval $(ssh-agent -s)

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export BAT_CONFIG_PATH=~/.config/bat/config

# use bat with man page
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export ZPLUG_HOME=$(brew --prefix)/opt/zplug # if brew was used
export XDG_CONFIG_HOME=$HOME/.config/ # neovim will look in here for init
export XDG_CACHE_HOME=$HOME/.cache/
export XDG_DATA_HOME=$HOME/.local/share/

# not officially support , use variable where needed
export FD_DEFAULT_OPTS="--ignore-case --type f --hidden"
export RIP_OPTS="--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g '!{**/raycast/*, **/tmux/plugins/*, **/karabiner/automatic_backups/**}'"

export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FD_IGNORE_FILE="$HOME/.ignore"
export FZF_TMUX_OPTS="-p" # use fzf-tmux by default for commands like ctrl+r

setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS

export HISTSIZE=100000
export SAVEHIST=200000
export HISTFILE=~/.zsh_history
# for history searching
export FZF_CTRL_R_OPTS="
  --no-sort
  --reverse
  --bind 'ctrl-r:reload(history -n; history -r; fc -l 1)' \
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)' \
  --color header:italic"

export EDITOR=nvim
export TERMINAL=alacritty
export GRAVEYARD=~/.local/share/Trash
export HOMEBREW_NO_AUTO_UPDATE=1

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# export BIFROST_DIR="/Users/rahulaggarwal/bifrost"
# export PYTHONPATH=$BIFROST_DIR:$PYTHONPATH

export PYTHONPATH=/Users/rahulaggarwal/bifrost/apps:$PYTHONPATH

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

# Where to store history
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Share history instantly between all zsh sessions
setopt INC_APPEND_HISTORY       # append commands as they are typed, not at exit
setopt SHARE_HISTORY            # share history between all sessions
setopt HIST_IGNORE_ALL_DUPS     # don’t store duplicate commands
setopt HIST_REDUCE_BLANKS       # trim superfluous blanks
setopt HIST_IGNORE_SPACE        # ignore commands starting with space

# Enable fzf keybinds
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Run ls on directory change
chpwd() lsd

# Load zsh functions
fpath=($fpath "/Users/raggarwal/.config/zsh/.zfunctions")

# paths
path+=('~/Library/Python/3.8/bin')
path+=('./node_modules/.bin')
path+=('.nvm/versions/node/v16.17.0/bin')

# For M1 Macs add homebrew to path
if [[ $OSTYPE == darwin* && $CPUTYPE == arm64 ]]; then
  path+=('/opt/homebrew/bin')
fi

eval "$(zoxide init zsh)"

# zsh plugins
export ZPLUG_HOME=$HOMEBREW_PREFIX/opt/zplug
source $ZPLUG_HOME/init.zsh 
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && . "$(brew --prefix nvm)/nvm.sh"
[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && . "$(brew --prefix nvm)/etc/bash_completion.d/nvm"

zplug "hlissner/zsh-autopair"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "undg/zsh-nvm-lazy-load" # loading nvm takes a long time, do it lazily
#
# # Plugins
# # Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
# Keep this as last line!
zplug load

# pnpm
export PNPM_HOME="/Users/rahulaggarwal/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/rahulaggarwal/.bun/_bun" ] && source "/Users/rahulaggarwal/.bun/_bun"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/rahulaggarwal/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/rahulaggarwal/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/rahulaggarwal/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/rahulaggarwal/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

export PATH="/Users/rahulaggarwal/miniconda3/bin:$PATH"
# <<< conda initialize <<<

export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"

