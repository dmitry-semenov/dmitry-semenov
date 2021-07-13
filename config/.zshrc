export ZSH="/Users/$(whoami)/.oh-my-zsh"
ZSH_THEME=""
ZSH_TMUX_AUTOSTART=true

plugins=(
  zsh-autosuggestions
  history-substring-search
  zsh-syntax-highlighting
  fzf-tab
  tmux
  dotenv
)

source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
source $ZSH/oh-my-zsh.sh

unsetopt correct
unsetopt correct_all

alias h="git rev-parse HEAD"
alias p="fzf --preview 'bat --style=numbers --color=always {} | head -500'"
alias v="nvim"
alias ag="ag --pager='less -XFR'"
alias k="kubectl"

. /usr/local/opt/asdf/asdf.sh

autoload -U promptinit; promptinit
prompt pure
