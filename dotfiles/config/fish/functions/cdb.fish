function cdb
    if test "$argv[1]" = ""
        set cdb_hostname "employes-pg-dev.employes.dev"
    else
        set cdb_hostname "employes-pg-pro-$argv[1].employes.dev"
    end

    if test "$argv[2]" = ""
        set cdb_port 5432
    else
        set cdb_port $argv[2]
    end

    echo "Connecting to \"$cdb_hostname\""
    cloudflared access tcp --hostname $cdb_hostname --url 0.0.0.0:$cdb_port
end
