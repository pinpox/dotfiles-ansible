# Defined in - @ line 1
function cc --description 'alias cc=clang -Wall -Wextra -pedantic -std=c99 -Wshadow -Weverything'
	clang -Wall -Wextra -pedantic -std=c99 -Wshadow -Weverything $argv;
end
