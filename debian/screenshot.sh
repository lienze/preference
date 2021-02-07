#!/bin/bash

gnome-screenshot -ac
xclip -selection clipboard -t image/png -o > ~/Pictures/`date +%Y%m%d%H%M%S`

