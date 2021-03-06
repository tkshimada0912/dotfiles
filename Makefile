DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*) 
EXCLUSIONS := .DS_Store .git .gitmodules
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

deploy:
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	mkdir -p ${HOME}/.docker && ln -sfnv $(abspath config.json) ${HOME}/.docker/config.json
	./maketmuxext.sh
