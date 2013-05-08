function __cache_or_get_rake_completion -d "Create rake completions"
  mkdir -p "/tmp/rake_completion_cache_for_$USER"
  set -l hashed_pwd (md5pwd)
  set -l rake_cache_file "/tmp/rake_completion_cache_for_$USER/$hashed_pwd"

  if not test -f "$rake_cache_file"
    rake -T 2>&1 | sed -e "s/^rake \([a-z:_0-9!\-]*\).*#\(.*\)/\1\t\2/" > "$rake_cache_file"
  end
  cat "$rake_cache_file"
end

function __run_rake_completion
  test -f rakefile; or test -f Rakefile; or test -f rakefile.rb; or test -f Rakefile.rb
end

complete -x -c rake -a "(__cache_or_get_rake_completion)" -n __run_rake_completion