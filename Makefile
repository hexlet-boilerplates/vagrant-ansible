# Коллекции ставятся в tmp, он в .gitignore
export ANSIBLE_COLLECTIONS_PATH := $(CURDIR)/tmp/ansible-collections

install: deps
	mise exec -- hk install --mise

# Коллекции ставятся отдельно от хуков, чтобы lint не трогал git-конфиг
deps:
	ansible-galaxy collection install --requirements-file=cm/requirements.yml

provision:
	ansible-playbook cm/vagrant.yml -i 'localhost, ' -c local -vv

lint: deps
	ansible-lint cm/vagrant.yml
	rumdl check .
	typos
	jactionlint

.PHONY: install deps provision lint
