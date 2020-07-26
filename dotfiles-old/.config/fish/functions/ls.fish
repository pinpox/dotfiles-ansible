# Defined in - @ line 1
function ls --description 'alias ls=ls --color=tty  --sort=extension --group-directories-first'
	command ls --color=tty  --sort=extension --group-directories-first $argv;
end
