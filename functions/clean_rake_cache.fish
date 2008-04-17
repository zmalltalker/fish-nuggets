function clean_rake_cache -d "Clean the rake autocomplete cache"
    for a in /tmp/rake_completion_cache/*
        rm "$a"
    end
end