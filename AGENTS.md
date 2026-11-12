# AGENTS.md

Виртуальная машина Vagrant, которую настраивает Ansible. Плейбук лежит в `cm/vagrant.yml`, список коллекций в `cm/requirements.yml`.

## Команды

| Команда | Что делает |
| --- | --- |
| `make install` | Ставит коллекции Ansible и git-хуки |
| `make deps` | Ставит коллекции Ansible в `tmp/` |
| `make provision` | Применяет плейбук к машине, на которой запущена команда |
| `make lint` | Ставит коллекции и проверяет плейбук через `ansible-lint` |

## Проверки

`make lint` также проверяет Markdown (`rumdl`), опечатки (`typos`) и workflow GitHub Actions (`jactionlint`). Тестов нет. `make install` ставит git-хуки hk, перед коммитом они запускают `make lint`.

Перед завершением задачи запусти `make lint`, команда должна проходить.

## Окружение

Инструменты и их версии задаёт `mise.toml`, ставит их `mise install`.

Vagrant и провайдер виртуальных машин mise не ставит. Машину поднимает `vagrant up`.
