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


#pour la couleur et mettre le prompt_nailyk ici? 
#host_color=cyan
#if [[ $USER == root ]]; then
#    post_prompt="%{$fg_bold[$root_color]%}%#%{$reset_color%}"
#else
#    post_prompt="%{$fg_bold[$user_color]%}%#%{$reset_color%}"
#fi
#history_prompt1="%{$fg_bold[$history_color]%}[%{$reset_color%}"



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


alias ls='ls --color=auto'
alias ll='ls --color=auto -lh'
alias la='ls -A --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias rgrep='grep --exclude-dir=.git --exclude-dir=.repo -Rn'
alias gd='git diff HEAD^'
alias gl='git log --pretty=oneline --abbrev-commit'
alias bb='time mka bootimage 2>&1 | tee /tmp/buildBoot && echo -e "\007" || echo -e "\007"'
alias bt='time mka recoveryimage 2>&1 | tee /tmp/buildBoot && echo -e "\007" || echo -e "\007"'
alias br='time mka cookies 2>&1 | tee /tmp/buildFull && echo -e "\007" || echo -e "\007"'
alias avc='./external/selinux/prebuilts/bin/audit2allow -p out/target/product/leo/root/sepolicy -i '




ssh() {
    case "$TERM" in 
	  ## on est dans un tmux
	(screen)
	    tmux rename-window "$*"
	    command ssh "$@"
	    tmux rename-window "${USER}@${HOST}"
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


ins_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N ins-sudo ins_sudo
bindkey "^s" ins-sudo

export LC_ALL=fr_FR.UTF-8
autoload bashcompinit
bashcompinit
source /usr/share/bash-completion/completions/VBoxManage
source ~/.zshfct_android
