function tunnel
    if test "$argv[1]" = ""
        set tunnel_port 80
    else
        set tunnel_port $argv[1]
    end

    echo "Creating tunnel on port \"$tunnel_port\""
    cloudflared tunnel --url "http://localhost:$tunnel_port"
end
