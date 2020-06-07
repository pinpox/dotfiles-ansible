# Defined in - @ line 1
function weather --description 'alias weather=curl -4 http://wttr.in/Koeln'
	curl -4 http://wttr.in/Koeln $argv;
end
