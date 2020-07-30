#!/bin/bash

set -e

if [ -z "$1" ]; then
    echo "Informe o arquivo de inventario e Extra vars \for ansible"
    echo "Exemplo ./run.sh ~/dev.ini -e 'git_username=<username> git_password=<password>' "
    exit 1
fi

function title() {
    echo -e "\e[105m\e[1m$1\e[0m"
}

export ANSIBLE_STDOUT_CALLBACK=yaml

title ">_ playbook: test.yml"
ansible-playbook -i "$1" test.yml "$2" "$3"

if [ -f /usr/bin/notfy-send ]; then
    notify-send "end playbook: win_http_git"
fi
