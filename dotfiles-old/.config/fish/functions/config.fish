# Defined in - @ line 1
function config --description 'alias config=/usr/bin/git --git-dir=/home/binaryplease/.dotfiles/ --work-tree=/home/binaryplease'
	/usr/bin/git --git-dir=/home/binaryplease/.dotfiles/ --work-tree=/home/binaryplease $argv;
end
