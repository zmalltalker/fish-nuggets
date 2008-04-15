# function create_rake_completion -d "Create rake completions"
# 	echo "Caching the completions..."
# 	rake -T 2>&1 | sed -e "/^(/d" -e "s/^rake \([a-z:_0-9!\-]*\).*/\1/" > "tmp/.rake_completions"
# 	echo "Done caching completions, you may now use rake with auto completion"
# end
# 
# complete -x -c rake -a '(cat tmp/.rake_completions)' --description 'Rake Task'
# function __cache_or_get_rake_completion -d "Create rake completions"
# 	set -l rake_cache_file "tmp/.rake_completions"
# 	
# 	if not test -f "$rake_cache_file"
# 		echo "Caching the completions..."
# 		rake -T 2>&1 | sed -e "/^(/d" -e "s/^rake \([a-z:_0-9!\-]*\).*/\1/" > "$rake_cache_file"
# 	end
# 	
# 	cat "$rake_cache_file"
# end

function __cache_or_get_rake_completion -d "Create rake completions"
	set -l hashed_pwd (md5 -q -s "(pwd)")
	set -l rake_cache_file "/tmp/rake_completion_cache_$hashed_pwd" 
	
	if not test -f "$rake_cache_file"
		rake -T 2>&1 | sed -e "/^(/d" -e "s/^rake \([a-z:_0-9!\-]*\).*/\1/" > "$rake_cache_file"
	end
	
	cat "$rake_cache_file"
end

complete -x -c rake -a "(__cache_or_get_rake_completion)" --description 'Rake Task'