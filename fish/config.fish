if status is-interactive
  # Commands to run in interactive sessions can go here
  zoxide init fish | source
  starship init fish | source
end

fish_vi_key_bindings

set fish_greeting ""

abbr -a vi vim
abbr -a nv nvim
abbr -a cl clear
abbr -a ll lsd -l
abbr -a t tmux

# set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
