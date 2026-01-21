function cdb
    set type ""

    if test -n "$argv[3]"
        set type "-$argv[3]"
    end

    if test "$argv[1]" = "" || test "$argv[1]" = dev
        set cdb_hostname "employes$type-pg-dev.employes.dev"
    else if test "$argv[1]" = jh
        set cdb_hostname "employes$type-pg-jh.employes.dev"
    else
        set cdb_hostname "employes$type-pg-pro-$argv[1].employes.dev"
    end

    if test "$argv[2]" = ""
        set cdb_port 5432
    else
        set cdb_port $argv[2]
    end

    echo "Connecting to \"$cdb_hostname\""
    cloudflared access tcp --hostname $cdb_hostname --url 0.0.0.0:$cdb_port
end
