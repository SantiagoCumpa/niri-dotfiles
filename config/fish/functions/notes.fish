function notes -d "Open notes directory with nvim"
    set -l dir "$HOME/Notes"

    if not test -d $dir
        mkdir -p $dir
    end

    nvim $dir
end
