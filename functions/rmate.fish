function rmate -d "Search for rails project and open in Textmate"
	if test $argv
		set dir (rdir $argv)
		if test $dir
			mate $dir
		else
			echo "Cannot find any project named '$argv'"
		end
	else
		echo "Usage: rmate <project>"
	end
end