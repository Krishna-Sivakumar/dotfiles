function aurbuild
	if test "$argv" = ""
		echo ""
	else
		git clone $argv
		set dir (ls -t | head -n 1)
		cd $dir 
		makepkg -si
		cd ..
		rm -rf $dir
	end
end
