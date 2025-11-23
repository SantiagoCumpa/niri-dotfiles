function fish_prompt
    set -l last_status $status

    # HYBRID GRAYSCALE PALETTE (using your colors)
    set -l c_dark "#161616" # gray1
    set -l c_dark2 "#262626" # gray2
    set -l c_mid "#6f6f6f" # gray4
    set -l c_midlight "#a8a8a8" # gray6
    set -l c_light "#c6c6c6" # gray7
    set -l c_ulight "#dde1e6" # gray8
    set -l c_fg_dark "#0b0b0b" # gray0
    set -l c_fg_light "#f2f4f8" # fg

    # === USER (dark background) ===
    set_color -b $c_ulight $c_fg_dark
    printf '  %s ' (whoami)

    # === HOST (slightly lighter dark gray) ===
    set_color -b $c_dark2 $c_fg_light
    printf '  %s ' (prompt_hostname)

    # === PWD (mid-light section) ===
    set_color -b $c_midlight $c_fg_dark
    printf '  %s ' (prompt_pwd)

    # === GIT SECTION (light gray background) ===
    set -l git_info (fish_git_prompt)
    if test -n "$git_info"
        set_color -b $c_light $c_fg_dark
        printf ' 󰊤%s  ' $git_info
    end

    # === ERROR SECTION (high contrast mid-gray) ===
    if test $last_status -ne 0
        set_color -b $c_mid $c_fg_light
        printf '  %s ' $last_status
    end

    # === PROMPT (very light background, dark text) ===
    set_color -b "#000000" "#ffffff"
    printf '\n 󱞩 '

    set_color normal

    # stopwatch reset
    set -g __cmd_start (date '+%s%3N')
end

# timing utility
set -g __cmd_start (date '+%s%3N')

function _omp_since_start
    set -l now (date '+%s%3N')
    echo (math -s0 "$now - $__cmd_start")
end
