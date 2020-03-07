# Setup fzf
# ---------
if [[ ! "$PATH" == */home/bjn/src/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/bjn/src/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/bjn/src/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/bjn/src/fzf/shell/key-bindings.zsh"
