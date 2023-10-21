case $- in
  *i*) ;;
    *) return;;
esac
export FORCE_COLOR=true
export OSH='/home/hakim/.oh-my-bash'
alias ls='ls --color'
export PS1='\u@\h:\[\e[33m\]\w\[\e[0m\]\$ '
export EDITOR='nano'
export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
ss -a | grep -q $SSH_AUTH_SOCK
if [ $? -ne 0 ]; then
    rm -f $SSH_AUTH_SOCK
    (setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"$HOME/npiperelay/npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork &) >/dev/null 2>&1
fi
OSH_THEME="agnoster"
OMB_USE_SUDO=true
completions=(
  git
  composer
  ssh
)
aliases=(
  general
)
plugins=(
  git
  bashmarks
)
source "$OSH"/oh-my-bash.sh