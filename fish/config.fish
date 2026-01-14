if status is-interactive
    # Commands to run in interactive sessions can go here
    fastfetch
end

abbr -a vi vim
abbr -a nv nvim
abbr -a cl clear

set fish_greeting ""

# set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
starship init fish | source
