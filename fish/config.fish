if status is-interactive
    # Commands to run in interactive sessions can go here
end

abbr -a nv nvim
abbr -a cl clear
abbr -a t tree

# set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
starship init fish | source
