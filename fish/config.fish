if status is-interactive
    # Commands to run in interactive sessions can go here
end

if type -q eza
    alias ll "eza -g -g --icons"
    alias lla "ll -q"
end

set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias bfg "java -jar ~/Apps/bfg-1.14.0.jar"
alias la "ls -A"
alias g git
alias gst 'git status'
alias d docker
alias dc "docker compose"
alias avim "NVIM_APPNAME=avim nvim"
alias lvim "NVIM_APPNAME=lvim nvim"

set -gx EDITOR lvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH /opt/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return

    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end

set --universal nvm_default_version v20.8.1

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

if test -f ./secrets.fish
    source ./secrets.fish
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
status is-interactive && eval /home/avernotte/mambaforge/bin/conda "shell.fish" hook $argv | source

if test -f "/home/avernotte/mambaforge/etc/fish/conf.d/mamba.fish"
    source "/home/avernotte/mambaforge/etc/fish/conf.d/mamba.fish"
end
# <<< conda initialize <<<

source ~/.asdf/asdf.fish

zoxide init fish | source

# bun
set --export BUN_INSTALL "$HOME/.local/share/reflex/bun"
set --export PATH $BUN_INSTALL/bin $PATH
