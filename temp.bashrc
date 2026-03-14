unset TZ # for disc sanity

alias edit='nvim ~/.bashrc.user'
alias sb='source ~/.bashrc.user'
alias clear='clear; clear'
alias cls='clear'

alias nvmi='nvim'
alias nimv='nvim'
alias nivm='nvim'
alias nmiv='nvim'
alias nmvi='nvim'

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=10000
export HISTFILESIZE=20000

hg() { history | grep "$1" --color=always; } # history grep
fif() { grep "$1" -nrIi . --color=always; } # find in files
fg() { find . | grep "$1" --color; } # find grep

aurInstall() {
    sudo git clone "https://aur.archlinux.org/$1"
    sudo chmod 777 "$1"
    makepkg -sicD "$1"
    sudo rm -rf "$1"
}

# Pretty Looks
# \h for machine name
# \u for user name
# \[$(tput sgr0)\]\ for color reset
# \`foo\` to execute foo
export PROMPT_DIRTRIM=3
export PS1="\
\[\033[38;5;11m\][\t] \
\[\033[38;5;201m\][\w] \
\[\033[38;5;15m\]> \
\[\033[1;32m\]\
"
trap 'echo -ne "\e[0m"' DEBUG

clear
