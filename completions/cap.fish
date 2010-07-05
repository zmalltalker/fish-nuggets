function __cache_or_get_cap_completion -d "Create cap completions"
    mkdir -p "/tmp/cap_completion_cache"
	set -l hashed_pwd (md5pwd)
	set -l cap_cache_file "/tmp/cap_completion_cache/$hashed_pwd"
	
	if not test -f "$cap_cache_file"
    cap -T 2>&1 | grep "^cap" |cut -d " " -f 2 > "$cap_cache_file"
	end
	
	cat "$cap_cache_file"
end

complete -x -c cap -a "(__cache_or_get_cap_completion)" --description 'Capistrano task'
