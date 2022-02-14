### ENV ###

# might need to change for macos? works on wsl
# set -x Z_SCRIPT_PATH /home/linuxbrew/.linuxbrew/etc/profile.d/z.sh
# use fish z plugin: https://github.com/jethrokuan/z

### INTERACTIVE ###
if status is-interactive
    # Commands to run in interactive sessions
    rbenv init - fish | source
    starship init fish | source
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

