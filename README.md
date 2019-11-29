# dotfiles-ansible

Setup my configs with ansible

## Get roles

```
ansible-galaxy install -r requirements.yml -p roles
```

## Run

```
ansible-playbook -i inventory  site.yml
```
