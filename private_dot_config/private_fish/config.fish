# Load rbenv automatically
# https://github.com/rbenv/rbenv#using-package-managers
status --is-interactive; and rbenv init - fish | source


if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
end
