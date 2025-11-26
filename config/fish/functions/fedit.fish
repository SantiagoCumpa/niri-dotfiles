function fedit --description "Pick file → open in micro"
    set -l file (fd --type f -H | fzf --preview='bat --color=always --style=numbers --line-range :300 {}')
    test -n "$file"; and nvim $file
end
