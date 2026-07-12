function kl
    set name $argv

    if grep -q $name ~/.kube/config
        return
    end

    rm -rf ~/.kube/config
    ln -s ~/.kube/config.$name ~/.kube/config
    return
end
