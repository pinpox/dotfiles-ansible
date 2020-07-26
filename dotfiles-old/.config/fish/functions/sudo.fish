# Defined in - @ line 1
function sudo --description 'alias sudo=sudo --askpass'
	command sudo --askpass $argv;
end
