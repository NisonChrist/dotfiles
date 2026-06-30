if status is-interactive
  # Commands to run in interactive sessions can go here
  set fish_greeting ""

  fish_vi_key_bindings

  abbr -a vi "vim"
  abbr -a nv "nvim"
  abbr -a cl "clear"
  abbr -a ff "fastfetch"
  abbr -a t "tmux"

  set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
  starship init fish | source

  zoxide init fish | source
end

