# The following lines were added by compinstall

zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/nailyk/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# When using a hist thing, make a newline show the change before executing it.
setopt HIST_VERIFY

# Save the time and how long a command ran
setopt EXTENDED_HISTORY

# keep only different lines into history
setopt HIST_IGNORE_ALL_DUPS

#pour la couleur et mettre le prompt_nailyk ici? 
#host_color=cyan
#if [[ $USER == root ]]; then
#    post_prompt="%{$fg_bold[$root_color]%}%#%{$reset_color%}"
#else
#    post_prompt="%{$fg_bold[$user_color]%}%#%{$reset_color%}"
#fi
#history_prompt1="%{$fg_bold[$history_color]%}[%{$reset_color%}"

PATH="$HOME/bin:$PATH"


case "$TERM" in 
	## on est dans un tmux
#    (screen)
#      function preexec()
#      {
#	  printf "\ek$1\e\\"
#	}
#      function precmd()
#      {
#	  echo -ne "\ek${USER}\e\\"
#      }
#      ;;

	## on est dans un screen
    (screen-256color)
      function preexec()
      {   
          printf "\ek$1\e\\"
        }   
      function precmd()
      {   
          echo -ne "\ek${USER}\e\\"
      } 
      ;;
esac

# fait main
autoload -Uz promptinit
promptinit
prompt nailyk
setopt prompt_subst


alias ls='ls --color=auto'
alias ll='ls --color=auto -lh'
alias la='ls -A --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias rgrep='grep --exclude-dir=.git --exclude-dir=.repo --exclude-dir=out -Rn'
alias gd='git diff HEAD^'
alias gdc='git diff --cached'
alias gl='git log --pretty=oneline --abbrev-commit --decorate'
alias gc='git commit -s'
alias ga='git commit --amend -s'
alias gp='git push gerrit HEAD:refs/for/android-8.1'
alias gpd='git push gerrit HEAD:refs/drafts/android-8.1'
alias bb='time mka bootimage 2>&1 | tee /tmp/buildBoot && echo -e "\007" || echo -e "\007"'
alias bt='time mka recoveryimage 2>&1 | tee /tmp/buildBoot && echo -e "\007" || echo -e "\007"'
alias br='time mka bacon 2>&1 | tee /tmp/buildFull && echo -e "\007" || echo -e "\007"'
alias avc='./external/selinux/prebuilts/bin/audit2allow -p out/target/product/z3/root/sepolicy -i '

alias src='source ~/.zshrc'
alias sshtemp='ssh -o "UserKnownHostsFile /dev/null" -o "StrictHostKeyChecking no"' 
alias scptemp='scp -o "UserKnownHostsFile /dev/null" -o "StrictHostKeyChecking no"'
alias v='vim'
alias sudo='sudo '

alias cdex='abcde -o "mp3:-b 192"'

#export USE_NINJA=false
export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx8192m"
export ANDROID_JACK_VM_ARGS=$JACK_SERVER_VM_ARGUMENTS
export VISUAL=vim
export EDITOR="$VISUAL"
export WITH_SU=true

export SSH_AUTH_SOCK=~/.ssh-socket
ssh-add -l > /dev/null 2>&1
if test $? -eq 2; then
  rm -f "${SSH_AUTH_SOCK}" >/dev/null 2>&1
  SSH_SCRIPT=$(mktemp)
  ssh-agent -a ${SSH_AUTH_SOCK} >| "${SSH_SCRIPT}"
  source "${SSH_SCRIPT}"
  echo ${SSH_AGENT_PID} >| ~/.ssh-agent-pid
  rm -f "${SSH_SCRIPT}"
fi


ssh() {
    case "$TERM" in 
	  ## on est dans un tmux
	(screen)
	    #tmux rename-window "$*"
	    printf "\033k$*\033\\"
	    command ssh "$@"
	    #tmux rename-window "${USER}@${HOST}"
	    printf "\033k${HOST}\033\\"
	;;
	  ## on est dans un screen
	(screen-256color)
	    echo -ne "\ek$*\e\\"
	    command ssh "$@"
	    echo -ne "\ek${USER}\e\\"
	;;
	(*)
	   command ssh "$@"
	;;
    esac
}

ins_sudo () {
  prefix="sudo"
  BUFFER="$prefix $BUFFER"
  CURSOR=$(($CURSOR + $#prefix + 1))
}
zle -N ins-sudo ins_sudo
bindkey "^f" ins-sudo

mkcd() {
  if [[ ${1:-} ]] then
    mkdir ${1}
    cd ${1}
  else
	echo "To create and cd into newly created directory"
  fi
}


export LC_ALL=C.UTF-8
autoload bashcompinit
bashcompinit
FILE=/usr/share/bash-completion/completions/VBoxManage && test -f $FILE && source $FILE
FILE=~/.zshfct_android && test -f $FILE && source $FILE
FILE=~/prompt_nailyk_setup && test -f $FILE && source $FILE
