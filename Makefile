# Коллекции и роли ставятся в tmp, он в .gitignore
export ANSIBLE_COLLECTIONS_PATH := $(CURDIR)/tmp/ansible-collections

install: deps
	mise exec -- hk install --mise

# Роли ставятся отдельно от хуков, чтобы lint не трогал git-конфиг
deps:
	ansible-galaxy install --role-file=cm/requirements.yml --roles-path=tmp/ansible-roles

provision:
	ansible-playbook cm/vagrant.yml -i 'localhost, ' -c local -vv

lint: deps
	ansible-lint cm/vagrant.yml
	rumdl check .
	typos

.PHONY: install deps provision lint
