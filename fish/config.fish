if status is-interactive
    # Commands to run in interactive sessions can go here
    # fastfetch
    # tmux a
end

abbr -a vi vim
abbr -a nv nvim
abbr -a cl clear
abbr -a ll lsd -l
abbr -a t tmux

set fish_greeting ""

test -r '/Users/ziv/.opam/opam-init/init.fish' && source '/Users/ziv/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true

# set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
starship init fish | source
