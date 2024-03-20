# theme
set -g theme_display_date no

# aliases
if type -q eza
    alias ls "exa"
    alias tree "exa --tree"
end
alias ll "ls -l"
alias la "ll -A"

if type -q xclip
    alias toclip "xclip -selection c"
    alias fromclip "xclip -selection clipboard -o"
end

alias btctl "bluetoothctl"

alias decToHex "printf '0x%x\n'"
alias hexToDec "printf '%d\n'"

function posix-source
    sed -re 's/export (.*)=(.*)/set -x \1 \2/g' -e 's/(.*)=(.*)/set \1 \2/g' $argv[1] 
end

# env
set -gx EDITOR nvim

# .local bin
set -U fish_user_paths $HOME/.local/bin $fish_user_paths

# Go bin
set -U fish_user_paths $HOME/go/bin $fish_user_paths

# pnpm
set -gx PNPM_HOME "/home/glo/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Solana bin
set -U fish_user_paths ~/.local/share/solana/install/active_release/bin $fish_user_paths

# Pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

# Load pyenv automatically by appending
# the following to ~/.config/fish/config.fish:

pyenv init - | source

