if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting ""

    fish_vi_key_bindings

    abbr -a vi vim
    abbr -a nv nvim
    abbr -a cl clear
    abbr -a ff fastfetch
    abbr -a t tmux
    abbr -a h herdr

    set -gx LANG en_US.UTF-8
    set -gx STARSHIP_CONFIG ~/.config/starship/starship.toml
    starship init fish | source
    zoxide init fish | source
end

# >>> otty shell integration >>>
# Added by Otty — toggle in Settings > Shell > Shell Integration.
# Inert unless launched by Otty (it sets $OTTY_SHELL_INTEGRATION).
if test -n "$OTTY_SHELL_INTEGRATION" -a -r "$OTTY_SHELL_INTEGRATION/otty-integration.fish"
    source "$OTTY_SHELL_INTEGRATION/otty-integration.fish"
end
# <<< otty shell integration <<<


/Users/ziv/.local/bin/mise activate fish | source # added by https://mise.run/fish
