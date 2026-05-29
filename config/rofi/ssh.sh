#!/bin/bash

launch_rofi() {
	rofi -show ssh \
		 -theme "$HOME/.config/rofi/ssh.rasi"
}

launch_rofi
