function wallmenu
	find $argv *.* | rofi -dmenu -i > ~/.cache/wallpaper
	set img_dir (cat ~/.cache/wallpaper &)
	nitrogen --set-scaled $img_dir 
	wal -q --saturate 1.0 -i "$img_dir"
end
