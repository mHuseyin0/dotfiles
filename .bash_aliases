alias ls='ls --color=auto -a'
alias grep='grep --color=auto'
alias p='sudo pacman'
alias pacman='sudo pacman'
alias o='sudo'
alias n='nvim'
alias l='ls'
alias la='ls -l'
alias e='exit'
alias less='less -S'
alias copy='wl-copy'
alias downloads='cd ~/Downloads'
alias documents='cd ~/Documents'
alias mtp_directory='cd /run/user/1000/gvfs'
alias hyprconf='n ~/.config/hypr/hyprland.conf'
alias printsize='du -ah'
alias sys='systemctl'
alias pr='progress'
alias pdf='nohup firefox'
alias nala='sudo nala'
alias apt='sudo nala'
alias apt-get='sudo nala'
alias nala='sudo nala'
alias debian='sudo systemctl start docker && distrobox enter --root debian'
alias gnome='sudo systemctl start gdm'
alias pwa='firefoxpwa'
alias pwalist='firefoxpwa profile list'
alias cppsetup='n *.cpp *.h'
alias csetup='n *.c *.h'
alias thunar='nohup thunar'
alias nautilus='nohup nautilus'
alias stopdebian='distrobox-stop debian --root'
alias diskusageanalyze='ncdu'
alias manalternative='tldr'
alias zerotier-cli='o zerotier-cli'
alias src='source ~/.bashrc'
alias vim='nvim'
alias da='date "+%Y-%m-%d %A %T %Z"'
alias mkdir='mkdir -p'
alias vi='nvim'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias cat="bat"
alias sys="sudo systemctl"
alias privateSession="unset HISTFILE"
alias weather="curl wttr.in"
alias csv='csvlens --no-headers'
alias dnf='sudo dnf'

# nohup wrapper to not generate nohup.out
nohup() { command nohup "$@" >/dev/null 2>&1 & }

cppcompile() {
        if [[ -z "$1" ]]; then
                g++ *.cpp -o cppAutoCompile;
        else
                g++ *.cpp -o "$1";
        fi
}
ccompile() {
        if [[ -z "$1" ]]; then
                gcc *.c -o cAutoCompile;
        else
                gcc *.c -o "$1";
        fi
}

valgrindrun() {
        valgrind\
                --leak-check=full\
                --show-leak-kinds=all\
                --track-origins=yes\
                --max-stackframe=10000000\
                --main-stacksize=10000000\
                --log-file=valgrind-out.txt\
                ./"$1" > executable_output.txt 2>&1;
}

openScript() {
        nvim $(which "$1");
}

# Would have been better if supported opening multiple file types
openFiles() {
        nvim *."$1";
}

lo() {
        nohup libreoffice "$@";
}

printAliases() {
        head ~/.bash_aliases -n $((45*$1)) | tail -n 45 | cat
}

transposeCSV() {
        ruby -rcsv -e 'puts CSV.parse(STDIN).transpose.map &:to_csv' < "$1" > "$2"
}
