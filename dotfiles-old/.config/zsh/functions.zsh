# vim: set ft=sh

# Extract archives
function extract {
	if [ -z "$1" ]; then
		# display usage if no parameters given
			echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
		else
			if [ -f $1 ] ; then
				# NAME=${1%.*}
				# mkdir $NAME && cd $NAME
				case $1 in
					*.tar.bz2)   tar xvjf ../$1    ;;
					*.tar.gz)    tar xvzf ../$1    ;;
					*.tar.xz)    tar xvJf ../$1    ;;
					*.lzma)      unlzma ../$1      ;;
					*.bz2)       bunzip2 ../$1     ;;
					*.rar)       unrar x -ad ../$1 ;;
					*.gz)        gunzip ../$1      ;;
					*.tar)       tar xvf ../$1     ;;
					*.tbz2)      tar xvjf ../$1    ;;
					*.tgz)       tar xvzf ../$1    ;;
					*.zip)       unzip ../$1       ;;
					*.Z)         uncompress ../$1  ;;
					*.7z)        7z x ../$1        ;;
					*.xz)        unxz ../$1        ;;
					*.exe)       cabextract ../$1  ;;
					*)           echo "extract: '$1' - unknown archive method" ;;
				esac
			else
				echo "$1 - file does not exist"
			fi
		fi
	}


# Create archive
mktar() { name="${${1:t}:r}"; tar -I pxz -cf "$name".tar.xz "$@"; }

# Transfer files
transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

# Pastebin stuff
# Examples:
#     paste hello.txt              # paste file (name/ext will be set).
#     echo Hello world. | paste    # read from STDIN (won't set name/ext).
#     paste -n 1 self_destruct.txt # paste will be deleted after one read.
#     paste -i ID hello.txt        # replace ID, if you have permission.
#     paste -d ID
paste() {
    local opts
    local OPTIND
    [ -f "$HOME/.netrc" ] && opts='-n'
    while getopts ":hd:i:n:" x; do
        case $x in
            h) echo "paste [-d ID] [-i ID] [-n N] [opts]"; return;;
            d) $echo curl $opts -X DELETE ix.io/$OPTARG; return;;
            i) opts="$opts -X PUT"; local id="$OPTARG";;
            n) opts="$opts -F read:1=$OPTARG";;
        esac
    done
    shift $(($OPTIND - 1))
    [ -t 0 ] && {
        local filename="$1"
        shift
        [ "$filename" ] && {
            curl $opts -F f:1=@"$filename" $* ix.io/$id
            return
        }
        echo "^C to cancel, ^D to send."
    }
    curl $opts -F f:1='<-' $* ix.io/$id
}
