function fish_prompt

    set -l last_status $status

    set -l seg_user_bg  "#b4befe"   # lavender 
    set -l seg_user_fg  "#11111b"   # text
    set -l seg_host_bg  "#fab387"   # orange
    set -l seg_host_fg  "#11111b"   # text
    set -l seg_pwd_bg   "#f9e2af"   # yelow
    set -l seg_pwd_fg   "#11111b"   # text
    set -l seg_git_bg   "#a6e3a1"   # green
    set -l seg_git_fg   "#11111b"   # text
    set -l seg_err_bg   "#f38ba8"   # red
    set -l seg_err_fg   "#181825"   # text

    # 1. USER and HOST
    set_color -b $seg_user_bg $seg_user_fg --bold
    printf '  %s ' (whoami)
    set_color -b $seg_host_bg $seg_host_fg
    printf '  %s ' (prompt_hostname)

    # 2. Current Working Directory (CWD)
    set_color -b $seg_pwd_bg $seg_pwd_fg
    printf '  %s ' (basename $PWD)

    # 2b. Tool
    set -l tool_info (_get_tool)
    if test (count $tool_info) -ge 2
       set -l tool_bg $tool_info[1]
       set -l tool_text $tool_info[2]
        
       # We apply the dynamic background, and use your existing tool foreground color
       set_color -b $tool_bg 
       printf ' %s ' $tool_text
    end

    # 3. Git (if whe're inside a repository)
    set -l git_info (fish_git_prompt)
    if test -n "$git_info"
       set_color -b $seg_git_bg $seg_git_fg
       printf ' 󰊤%s  ' $git_info
    end

    # 4. Exit-code (on error)
    if test $last_status -ne 0
       set_color -b $seg_err_bg $seg_err_fg
       printf '  [%s] ' $last_status
    end

    # 5. Prompt 
    set_color normal

    set_color red
    printf '\n❯'
    set_color yellow
    printf '❯'
    set_color green
    printf '❯ '
    set_color white

    set_color normal
    
    # reset stopwatch
    set -g __cmd_start (date '+%s%3N')
end

set -g __cmd_start (date '+%s%3N')


function _get_tool
     set -l tool_icon ""
     set -l tool_name ""
     set -l tool_version ""
     set -l tool_color ""

     if test -f Cargo.toml
        set tool_icon ""
        set tool_name "Rust"
	set tool_color "#fab387" # Rust Orange
        # if type -q cargo
        #     # Extracts '1.75.0' from 'cargo 1.75.0 (....)'
        #     set tool_version (cargo --version 2>/dev/null | string split ' ')[2]
        # end

     else if test -f go.mod
        set tool_icon "󰟓"
        set tool_name "Go"
	set tool_color "#76a8f7" # Go Cyan
        # if type -q go
        #     # Extracts '1.21.0' from 'go version go1.21.0 linux/amd64'
        #     set -l raw_version (go version 2>/dev/null | string split ' ')[3]
        #     set tool_version (string replace 'go' '' $raw_version)
        # end
    
    else if test -f bun.lockb -o -f bun.lock -o -f bunfig.toml
        set tool_icon ""
        set tool_name "Bun"
	set tool_color "#f4d3e5" # Bun Pink/White
        # if type -q bun
        #     # Bun outputs just the version number, e.g., '1.0.0'
        #     set tool_version (bun --version 2>/dev/null)
        # end

     else if test -f package.json
        set tool_icon ""
        set tool_name "Node"
	set tool_color "#a6d189" # Node Green
        # if type -q node
        #     # Extracts '20.10.0' from 'v20.10.0'
        #     set tool_version (node --version 2>/dev/null | string trim -l -c v)
        # end 
     
    else if test -f pyproject.toml -o -f requirements.txt -o -f Pipfile
        set tool_icon ""
        set tool_name "Python"
	set tool_color "#89b4fa" # Python Blue
        # if type -q python3
        #     set tool_version (python3 --version 2>/dev/null | string split ' ')[2]
        # else if type -q python
        #     set tool_version (python --version 2>/dev/null | string split ' ')[2]
        # end

     else if test -f CMakeLists.txt -o -f Makefile
        set tool_icon ""
        set tool_name "C++"
	set tool_color "#44acfc" # C++ Blue
        # if test -f CMakeLists.txt; and type -q cmake
        #     # Extracts version from CMake
        #     set tool_version (cmake --version 2>/dev/null | head -n 1 | string split ' ')[3]
        # end
     end

     # Format and return the final string
     if test -n "$tool_name"
	echo $tool_color 
        # if test -n "$tool_version"
        #     echo "$tool_icon $tool_name v$tool_version"
        # else
            # Fallback if the file exists but the tool isn't installed locally
            echo "$tool_icon $tool_name" 
        # end
     end
end
