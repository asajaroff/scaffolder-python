WORKING_DIR = ${PWD}
PYENV_VERSION := $(shell pyenv version | awk '{print $$1}')
.DEFAULT_GOAL = help
.PHONY: ALL

help:
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

install:
	ln -s ${DOTFILES_DIR}/config/zshrc ~/.zshrc

replace: ## Replaces project name
	@echo "Enter the new project name: "
	@read project_name; \
	echo "Replacing project name with $$project_name"; \

pyenv-setup: ## Detect local version of Python and setup pyenv
	pyenv local $$PYENV_VERSION
	pyenv version

setup: pyenv-setup ## Create virtual environment and install dependencies
	python3 -m venv .venv
	. .venv/bin/activate
	pip install -r $/requirements.txt

lock-dependencies: ## Generate a new version of the requirements.txt file
	. .venv/bin/activate
	pip freeze > requirements.txt
