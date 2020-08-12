# dotfiles-ansible

Setup my configs with ansible

## Get roles

```
git submodule init
git submodule update   
```

## Run

```
ansible-playbook -i inventory  site.yml
```

## Roles used

- [ansible-i3](https://github.com/binaryplease/ansible-i3)
- [ansible-neomutt](https://github.com/binaryplease/ansible-neomutt)
- [ansible-polybar](https://github.com/binaryplease/ansible-polybar)
- [ansible-rofi](https://github.com/binaryplease/ansible-rofi)
- [ansible-termite](https://github.com/binaryplease/ansible-termite)
- [ansible-tmux](https://github.com/binaryplease/ansible-tmux)
- [ansible-vim](https://github.com/binaryplease/ansible-vim)
- [ansible-xresources](https://github.com/binaryplease/ansible-xresources)
- [ansible-zsh](https://github.com/binaryplease/ansible-zsh)
