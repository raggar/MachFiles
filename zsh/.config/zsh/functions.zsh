# Function to source files if they exist
function zsh_add_file() {
  [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

function timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
#
function c() {
   tmux clear-history
   clear
}

# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$_";
}

function zsh_add_plugin() {
  PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
  if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then 
      # For plugins
      zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
      zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
  else
      git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
  fi
}

function fp() {
  ### PATH
  # mnemonic: [F]ind [P]ath
  # list directories in $PATH, press [enter] on an entry to list the executables inside.
  # press [escape] to go back to directory listing, [escape] twice to exit completely

  local loc=$(echo $PATH | sed -e $'s/:/\\\n/g' | eval "fzf ${FZF_DEFAULT_OPTS} --header='[find:path]'")

  if [[ -d $loc ]]; then
    echo "$(rg --files $loc | rev | cut -d"/" -f1 | rev)" | eval "fzf ${FZF_DEFAULT_OPTS} --header='[find:exe] => ${loc}' >/dev/null"
    fp
  fi
}

function kp() {
  ### PROCESS
  # mnemonic: [K]ill [P]rocess
  # show output of "ps -ef", use [tab] to select one or multiple entries
  # press [enter] to kill selected processes and go back to the process list.
  # or press [escape] to go back to the process list. Press [escape] twice to exit completely.

  local pid=$(ps -ef | sed 1d | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[kill:process]'" | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
    kp
  fi
}
