# Bradley's Dotfiles

🎩 Inspired by [The Primeagen](https://github.com/ThePrimeagen/.dotfiles)

This repository houses public dotfiles that I like to apply to my dev envs.

💡 If you use my [Ansible](https://github.com/bradleygore/ansible) playbook, these can be auto-applied and dependencies installed for you 😎

## Prerequisites

- [`homebrew`](https://docs.brew.sh/Installation)
- `stow`
  - `brew install stow`

## Execution

- `install.zsh`
  - un-stow's anything that has been stowed from this repo and then does a clean stow
- `clean-env.zsh`
  - un-stow's anything that has been stowed from this repo
- `make apps`
  - brew install based on the Brewfile
- `make export`
  - export brew packages to file

