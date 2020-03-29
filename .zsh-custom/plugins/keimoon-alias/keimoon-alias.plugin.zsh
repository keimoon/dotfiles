function title {
    echo -ne "\033]0;"$*"\007"
}

function docker_clean_containers {
    for container in `docker ps -aq`; do
	docker rm $container
    done
}

function docker_remove_none_image {
    for image in `docker images | grep '<none>' | awk '{print $3}'`; do docker rmi $image; done
}

function docker_remove_volume {
    for v in `docker volume ls -qf dangling=true`; do
	docker volume inspect $v | grep '"persist": "true"' > /dev/null 2>&1
	if [ $? -ne 0 ]; then
	    docker volume rm $v;
	fi
    done
}

function docker_clean_all {
    docker_clean_containers
    docker_remove_none_image
    docker_remove_volume
}

function strlen {
    str=$1
    echo ${#str}
}

function base64Copy {
    if [ $# -lt 1 ]; then
        from=`pbpaste`
    else
        from=$1
    fi
    case `uname -s` in
        Darwin)
            result=`echo -n "$from" | base64`
            echo "$result"
            echo -n "$result" | pbcopy
            ;;
        Linux)
            result=`echo -n "$from" | base64 -w 0`
            echo "$result"
            case $XDG_SESSION_TYPE in
                x11)
                    echo -n "$result" | xclip -i -selection clipboard
                    ;;
                wayland)
                    echo -n "$result" | wl-copy
                    ;;
            esac
            ;;
    esac
}

alias ssh-nohost='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias scp-nohost='scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
alias dr='docker run -it'

alias config='/usr/bin/git --git-dir=$HOME/.dotconfig/ --work-tree=$HOME'

case `uname -s` in
    Linux)
        case $XDG_SESSION_TYPE in
            x11)
                alias pbcopy='xclip -i -selection clipboard'
                alias pbpaste='xclip -o -selection clipboard'
                ;;
            wayland)
                alias pbcopy=wl-copy
                alias pbpaste=wl-paste
                ;;
        esac
        ;;
esac

alias d="kitty +kitten diff"
alias ic="kitty +kitten icat"
alias gd="git difftool --no-symlinks --dir-diff"
alias catc="pygmentize -g"
