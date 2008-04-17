function rdir -d "Find dir for rails project"
    if test "$argv" = "clean"
        for a in /tmp/rdir_cache/*
            rm "$a"
        end
        echo "Cache cleaned"
	else
		if test "$argv"
			set -l hashed_project (md5 -q -s "$argv")
			set -l rdir_cache_file "/tmp/rdir_cache/$hashed_project" 
			if not test -f "$rdir_cache_file"
				find ~/**/$argv/config/environment.rb | head -n 1 | sed -e 's/\/config\/environment.rb$//g' > "$rdir_cache_file"
			end
			cat "$rdir_cache_file"
		else
			set -l rdir_cache_file "/tmp/rdir_cache/all_projects"
			if not test -f "$rdir_cache_file"
				mkdir -p "/tmp/rdir_cache"
				find ~/**/config/environment.rb | sed -e 's/\/config\/environment.rb$//g' > "$rdir_cache_file"
			end
			cat "$rdir_cache_file"
		end
	end
end