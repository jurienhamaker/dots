alias p="cd /mnt/Programming"

alias e_up="p; cd employes; docker compose up app"
alias e_bash="p; cd employes; docker compose exec app bash"
alias ec_up="p; cd employes; docker compose up capacitor"
alias ec_bash="p; cd employes; docker compose exec capacitor bash"
alias ew_up="p; cd employes; docker compose up web"
alias ew_bash="p; cd employes; docker compose exec web bash"
alias eo_up="p; cd employes; docker compose up office"
alias eo_bash="p; cd employes; docker compose exec office bash"

alias es_up="p; cd employes-style; docker compose up"
alias es_bash="p; cd employes-style; docker compose exec style bash"

alias p_up="p; cd paperless; docker compose up storybook"
alias p_bash="p; cd paperless; docker compose exec storybook bash"
alias p_act="p; cd paperless; act -P ubuntu-latest=nektos/act-environments-ubuntu:18.04"
alias pn_up="p; cd paperless; docker compose up ng-playground"
alias pn_bash="p; cd paperless; docker compose exec ng-playground bash"

alias juriendev="ssh jurien@51.15.23.40"
alias media="ssh root@87.212.147.76"
alias work="ssh jurien@192.168.1.40 -Y -t 'fish -li'"

alias dnode="docker run -it --name dnode -v /mnt/Programming:/opt/app -w /opt/app -p 4200:4200 -p 3000:3000 --rm --entrypoint bash node:latest"
alias dgo="docker run -it -u $(whoami) --name go -v /mnt/Programming:/opt/app -p 3000:3000 --rm --entrypoint bash jurienhamaker/golang:latest"
