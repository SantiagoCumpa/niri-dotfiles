if status is-interactive
    set -g fish_greeting ""
    fastfetch
end

# FZF Default Style
set -gx FZF_DEFAULT_OPTS "\
  --color=bg+:#1c1c22,bg:#000000,spinner:#e0e1e6,hl:#9a9a9e \
  --color=fg:#f2f2f4,header:#ababaf,info:#cfcfd1,pointer:#e0e1e6 \
  --color=marker:#75757a,fg+:#ffffff,prompt:#ffffff,hl+:#bdbdc0 \
  --color=selected-bg:#3e3e44 \
  --color=border:#636368,label:#e0e1e6 \
  --style=full"

# General aliases
alias ls='eza --icons -lh --group-directories-first'
alias tree='eza --icons --tree --level 3 --group-directories-first'
alias bat='bat --color=always'
alias sup='sudo pacman'

# Git aliases
alias lg='lazygit'
alias gini='git init'
alias gend='rm -r .git'
alias gclo='git clone'
alias gadd='git add'
alias gcom='git commit -m'
alias gpsh='git push'
alias gsts='git status'
alias gcho='git checkout -b'
alias gpll='git pull'
alias glog='git log'

# Docker aliases
alias ld='lazydocker'
alias dps='docker ps'
alias dpull='docker pull'
alias drun='docker run'
