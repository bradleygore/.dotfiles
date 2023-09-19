.PHONY: export apps 

apps:
	brew bundle --file ${HOME}/.dotfiles/Brewfile
export:
	brew bundle dump --file ${HOME}/.dotfiles/Brewfile --force
