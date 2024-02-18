# Easier navigation
alias ..='cd ..'
alias ~='cd ~'
alias d='cd ~/Desktop'
alias dl='cd ~/Downloads'
alias dev='cd ~/Dev'

# school
alias uw='ssh -Y r28aggar@linux.student.cs.uwaterloo.ca'
alias transfer='() { scp $@ r28aggar@linux.student.cs.uwaterloo.ca:~/cs247 }'

# tmux aliases
alias t='tmux attach || tmux'
alias tls='tmux ls'
alias tks='tmux kill-session -t'

# alias ls='ls'
alias tree='lsd --tree'
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

alias lg='lazygit'

# confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'

# shortcuts 
alias al='nvim ~/MachFiles/zsh/.config/zsh/aliases.zsh'
alias ncfg='cd ~/MachFiles/nvim/.config/nvim/ && f'
alias zrc='nvim ~/MachFiles/zsh/.config/zsh/.zshrc'
alias gbls='brew list && npm list -g --depth 0'
alias xcode='open -a Xcode'

# search files (include hidden, ignore git)
alias f="fd --ignore-case --type f --hidden | fzf-tmux -p --reverse | xargs nvim"

# git
alias gc="git branch --sort=-committerdate | grep --invert-match '\*' | cut -c 3- | fzf-tmux -p --reverse | xargs git checkout"
alias gm="git branch --sort=-committerdate | grep --invert-match '\*' | cut -c 3- | fzf-tmux -p --reverse | xargs git merge"
alias gdel="git branch --sort=-committerdate | grep --invert-match '\*' | cut -c 3- | fzf-tmux -p --reverse | xargs git branch -D"
alias gs='git status'
alias gca='fmt && git add -u && git commit'
alias ga='git commit --amend -a --no-edit'
alias gcb='git checkout -b'
alias gcl='git clone'
alias glg='git log | bat'
alias gd='git diff -- ':!package-lock.json' ':!yarn.lock' | bat'
alias gpl='git pull origin'
alias gra='git remote add origin'
alias undo='git reset --soft HEAD~1'

alias src='exec zsh' 
alias paths='echo -e ${PATH//:/\\n}'

alias upgrade'brew update && npm update -g'

# colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ls='lsd'

# docker cache 
alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'

# ports 
alias fport='() { sudo lsof -i:$@ }'
