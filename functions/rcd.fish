function rcd -d "Search for rails project and change dir"
	if test $argv
		set dir (rdir $argv)
		if test $dir
			cd $dir
		else
			echo "Cannot find any project named '$argv'"
		end
	else
		echo "Usage: rcd <project>"
	end
end