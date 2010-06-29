function fg
	f $argv[1] | xargs grep $argv[2]
end
