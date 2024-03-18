function cdb
    if test "$argv[1]" = ""
        set cdb_hostname "postgresql-development.employes.dev"
    else
        set cdb_hostname "postgresql-$argv[1].employes.dev"
    end

    echo "Connecting to \"$cdb_hostname\""
    cloudflared access tcp --hostname $cdb_hostname --url localhost:54320;
end
