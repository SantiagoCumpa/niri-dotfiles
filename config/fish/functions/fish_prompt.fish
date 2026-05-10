function fish_prompt
	set -l last_status $status

	set -l rosewater "#f5e0dc"
	set -l flamingo "#f2cdcd"
	set -l pink      "#f5c2e7"
	set -l mauve     "#cba6f7"
	set -l red       "#f38ba8"
	set -l maroon    "#eba0ac"
	set -l peach     "#fab387"
	set -l yellow    "#f9e2af"
	set -l green     "#a6e3a1"
	set -l teal      "#94e2d5"
	set -l sky       "#89dceb"
	set -l sapphire  "#74c7ec"
	set -l blue      "#89b4fa"
	set -l lavender  "#b4befe"

	set -l text      "#cdd6f4"
	set -l subtext1  "#bac2de"
	set -l subtext0  "#a6adc8"
	set -l overlay2  "#9399b2"
	set -l overlay1  "#7f849c"
	set -l overlay0  "#6c7086"
	set -l surface2  "#585b70"
	set -l surface1  "#45475a"
	set -l surface0  "#313244"

	set -l base      "#1e1e2e"
	set -l mantle    "#181825"
	set -l crust     "#11111b"

	# 1.USER
	set_color $mauve
	printf ' %s ' (whoami)
	set_color normal
	printf "on" 
	set_color $blue
    	printf '  %s ' (prompt_hostname)

    	# 2.CWD
	set_color normal
	printf "in"
	set_color $yellow
   	printf '  %s ' (basename $PWD)

    	# 3.TOOL
    	set -l tool_info (_get_tool)
    	if test (count $tool_info) -ge 2
       		set -l tool_color $tool_info[1]
		set -l tool_name $tool_info[2]
        
		set_color normal
		printf "using"
       		set_color $tool_color 
       		printf ' %s ' $tool_name
    	end

    	# 3. GIT
    	set -l git_info (fish_git_prompt)
    	if test -n "$git_info"
       		set_color $green
       		printf '- 󰊢%s  ' $git_info
    	end

    	# 4. EXIT CODE
    	if test $last_status -ne 0
       		set_color $red
       		printf '-  [%s] ' $last_status
    	end

	set_color normal
	printf '\n '

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
        
     	else if test -f go.mod
        	set tool_icon "󰟓"
        	set tool_name "Go"
		set tool_color "#76a8f7" # Go Cyan
            
	else if test -f bun.lockb -o -f bun.lock -o -f bunfig.toml
        	set tool_icon ""
        	set tool_name "Bun"
		set tool_color "#f4d3e5" # Bun Pink/White
       
     	else if test -f package.json
        	set tool_icon ""
        	set tool_name "Node"
		set tool_color "#a6d189" # Node Green
            
    	else if test -f pyproject.toml -o -f requirements.txt -o -f Pipfile
        	set tool_icon ""
        	set tool_name "Python"
		set tool_color "#89b4fa" # Python Blue
       
     	else if test -f CMakeLists.txt -o -f Makefile
        	set tool_icon ""
        	set tool_name "C++"
		set tool_color "#44acfc" # C++ Blue
     	end

     	if test -n "$tool_name"
		echo $tool_color 
        	echo "$tool_icon $tool_name" 
     	end
end
