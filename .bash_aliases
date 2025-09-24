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
alias debian='sudo systemctl start docker && distrobox enter --root ubuntu-24-04'
alias pwa='firefoxpwa'
alias pwalist='firefoxpwa profile list'
alias cppsetup='n *.cpp *.h'
alias csetup='n *.c *.h'
alias thunar='nohup thunar'
alias nautilus='nohup nautilus .'
alias stopdebian='distrobox-stop distrobox enter --root ubuntu-24-04'
alias diskusageanalyze='ncdu'
alias zerotier-cli='o zerotier-cli'
alias src='source ~/.bashrc'
alias srcc='clear && source ~/.bashrc'
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
alias snapper='sudo snapper'
alias docker='sudo docker'
alias dockerExport='docker export --output="docker.tar"'
alias rm='trash'
alias analyzeNetworkUsage='vnstat --help'
alias mac='docker start -ai 202ff2ef8872'
alias windows='docker run -it --rm --name windows -p 8006:8006 --device=/dev/kvm --device=/dev/net/tun --cap-add NET_ADMIN -v "${PWD:-.}/windows:/storage" --stop-timeout 120 dockurr/windows'
alias selenium='source  /home/huseyin/Documents/venvs/selenium/bin/activate'
alias playw='source /home/huseyin/Documents/venvs/playwright/bin/activate'
alias maria='sudo mariadb -u root -p -h localhost'
alias post='psql -U postgres'
alias c='clear'
alias lineCount='wc -l'
alias deleteEmptyFiles='find . -size 0 -print -delete'
alias cs342Start='nohup VBoxHeadless -s cs342'
alias cs342Connect='ssh -p 3022 vboxuser@localhost'
alias cs342Mount='sshfs -p 3022 vboxuser@localhost:/ ~/Documents/cs342Root/'
alias cs342Home='cd ~/Documents/cs342Root/home/vboxuser'
alias condaEnvironments='conda env list'
alias latestPackages='grep -i installed /var/log/pacman.log'
alias rrepo='sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
alias switchTopbar='nohup waybar &'
alias tMuxMain='tmux new-session -A -s main'
alias ttyTurkish='sudo loadkeys tr_q-latin5'
alias updateGrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias installGnome='yay -Syu baobab evince gdm gnome-backgrounds gnome-control-center gnome-disk-utility gnome-menus gnome-menus gnome-settings-daemon gnome-shell gnome-shell-extensions gnome-system-monitor gvfs gvfs-mtp snapshot xdg-desktop-portal-gnome xdg-user-dirs-gtk thunar'
alias diff='nvim -d'
alias pacmanListInstalled='pacman -Q'
alias pacmanListInstalledExplicit='pacman -Qe'
alias bilkentVPN='sudo openvpn /home/huseyin/Documents/Backup/bilkent-client-2023.ovpn'
alias dijkstraMount='sshfs huseyin.aydin@dijkstra.cs.bilkent.edu.tr:/ ~/Documents/dijkstra/'
alias dijkstraConnect='ssh huseyin.aydin@dijkstra.cs.bilkent.edu.tr'

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

dockerInteractive() {
        docker run -it "$1" /bin/bash
}

duplicateLines() {
        sort "$1" | uniq -cd

}

duplicateLinesAll() {
        sort "$1" | uniq -c
}

clearCache(){
        yay -Scc
        gpg-connect-agent reloadagent /bye
}

omitspaces(){
        python << 'END'
from os import getcwd, listdir, chdir, rename
from re import sub

chdir(getcwd())
for path in listdir():
        if " " in path or "-" in path or "_" in path or "("  in path or ")" in path or "{" in path or "}" in path or "[" in path or "]" in path:
                oldpath = path
                path = path.replace(" ", "_").replace("-","_").replace("{", "_").replace("}", "_").replace("[", "_").replace("]", "_").replace("(", "_").replace(")", "_")
                path = sub(r"\_+", r"_", path)
                print(path)
                rename(oldpath, path)
END
}
