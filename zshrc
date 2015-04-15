ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"

plugins=(git brew cabal docker encode64 gem jira lein npm pod pip python tmuxinator)

source $ZSH/oh-my-zsh.sh

### Prompt:
[[ -n "$SSH_CLIENT" ]] || export DEFAULT_USER="root"

prompt_context() {
  local user=`whoami`
 
  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$user@%m"
  else
    prompt_segment black default "D"
  fi
}
prompt_dir() {
  prompt_segment blue black '%c'
}

source /root/.nvm/nvm
