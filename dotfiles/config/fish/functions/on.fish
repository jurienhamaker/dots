function on
    set location $argv[2]
    if test -z "$argv[1]"
        echo "Error: A file name must be set, e.g. on \"the wonderful thing about tiggers\"."
        return
    end

    if test -z "$argv[2]"
        set location inbox
    end


    set file_name $(echo "$argv[1]" | tr ' ' '-')
    set formatted_file_name $(date "+%Y-%m-%d")_{$file_name}.md
    cd "/home/jurien/vault/$location" || exit
    touch $formatted_file_name
    nvim $formatted_file_name
end
