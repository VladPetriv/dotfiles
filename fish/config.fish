if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

set fish_key_bindings fish_user_key_bindings
set -gx PATH $PATH (go env GOPATH)/bin
