[![pipeline status](https://gitlab.devops.agilitynetworks.com.br/ansible/playbooks/win_http_git/badges/master/pipeline.svg)](https://gitlab.devops.agilitynetworks.com.br/ansible/playbooks/win_http_git/commits/master)

win_http_git
=========

Clona projetos GIT via http ou https.

Requerimentos
------------

1. **Git** - Instalado durante a execução da receita

Role Variables
--------------

- `win_http_git_clone_path:` "C:\\Windows\\Temp\\"
- `win_http_git_username:` "administrator"
- `win_http_git_password:` "@admin123"
- `win_http_git_protocol:` "http"
- `win_http_git_host:` "10.2.32.14"
- `win_http_git_port:` '8080'
- `win_http_git_uri:` '/tfs/DefaultCollection/demo/_git/dotnet-core'
- `win_http_git_checkout:` "master"

Examplo Playbook
----------------

```yml
- name: win http git clone
  hosts: all
  connection: winrm
  gather_facts: no
  vars:
    windows_temp: "C:\\Windows\\Temp\\"
  tasks:
  - name: test clone
    block:
      - name: clone
        include_role:
            name: ../../win_http_git
        vars:
          win_http_git_clone_path: "{{windows_temp}}"
          win_http_git_username: "{{git_username}}"
          win_http_git_password: "{{git_password}}"
          win_http_git_checkout: master
          win_http_git_host: gitlab.devops.agilitynetworks.com.br
          win_http_git_port: "80"
          win_http_git_uri: "/ituranDevOps/AppExemplo.git"
```

requirements.yml
------------

```yml
- src: git@gitlab.devops.agilitynetworks.com.br:ansible/playbooks/win_http_git.git
  scm: git

```
