# dotfiles-ansible

Setup my configs with ansible

## Get roles

```
git clone --recurse-submodules git@github.com:pinpox/dotfiles-ansible.git
```

## Run

```
ansible-playbook site.yml --check --diff
```

Remove `--check` and/or `--diff` for real run (no dry run)

## Roles used

- [ansible-alacritty](https://github.com/pinpox/ansible-alacritty)
- [ansible-fonts](https://github.com/pinpox/ansible-fonts.git)
- [ansible-i3](https://github.com/binaryplease/ansible-i3)
- [ansible-neomutt](https://github.com/binaryplease/ansible-neomutt)
- [ansible-polybar](https://github.com/binaryplease/ansible-polybar)
- [ansible-rofi](https://github.com/binaryplease/ansible-rofi)
- [ansible-termite](https://github.com/binaryplease/ansible-termite)
- [ansible-tmux](https://github.com/binaryplease/ansible-tmux)
- [ansible-vim](https://github.com/binaryplease/ansible-vim)
- [ansible-xfce4-terminal](https://github.com/pinpox/ansible-xfce4-terminal)
- [ansible-xresources](https://github.com/binaryplease/ansible-xresources)
- [ansible-zsh](https://github.com/binaryplease/ansible-zsh)
