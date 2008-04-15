function tunnel_monit -d "Tunnel monit requests to host provided as parameter"
	ssh -L 2812:localhost:2812 $argv -l capistrano
end