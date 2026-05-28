#!/bin/bash

TMP_DIR="/tmp/cliphist"
ICON_PATH="$HOME/.icons"
SOUND_PATH="$HOME/.sounds"

THEME_SELECTOR="$HOME/.config/rofi/clipboard.rasi"
THEME_TEXT="$HOME/.config/rofi/clipboard-text.rasi"
THEME_IMG="$HOME/.config/rofi/clipboard-img.rasi"

menu_options=$(echo -e " Text\n Images" | rofi -dmenu -mesg "Clipboard mode" -theme "$THEME_SELECTOR")

show_text() {
	selected=$(cliphist list | grep -vE "\[\[\s?binary.*(jpg|jpeg|png|bmp)" | rofi -dmenu \
		-display-columns 2 \
		-mesg "Clipboard text history" \
		-theme "$THEME_TEXT")
}

show_image() {
	rm -rf "$TMP_DIR" && mkdir -p "$TMP_DIR"
	read -r -d '' prog <<EOF
match(\$0, /^([0-9]+)\s(\[\[\s)?binary.*(jpg|jpeg|png|bmp)/, grp) {
    system("echo " grp[1] "\\\\\t | cliphist decode >$TMP_DIR/"grp[1]"."grp[3])
    print grp[1] "\t \0icon\x1f$TMP_DIR/"grp[1]"."grp[3]
}
EOF
	selected=$(cliphist list | grep -E "\[\[\s?binary" | gawk "$prog" | rofi -dmenu \
		-show-icons \
		-mesg "Clipboard image history" \
		-theme "$THEME_IMG")
}

case "$menu_options" in
" Text") show_text ;;
" Images") show_image ;;
*) exit 0 ;;
esac

if [ -n "$selected" ]; then
	printf "%s" "$selected" | cliphist decode | wl-copy
	paplay "$SOUND_PATH/pick.mp3" &
	notify-send -i "$ICON_PATH/clipboard.svg" -a "gray" "Element copied to clipboard"
fi
