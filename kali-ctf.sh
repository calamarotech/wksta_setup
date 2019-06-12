#!/bin/bash
RED="\033[01;31m"
GREEN="\033[01;32m"
YELLOW="\033[01;33m"
BLUE="\033[01;34m"
BOLD="\033[01;01m"
RESET="\033[00m"
### .bashrc
echo -e "\n${BLUE}[-] Starting .bashrc${RESET}"
# variables
echo 'RED="\033[01;31m"' >> /root/.bashrc
echo 'GREEN="\033[01;32m"' >> /root/.bashrc
echo 'YELLOW="\033[01;33m"' >> /root/.bashrc
echo 'BLUE="\033[01;34m"' >> /root/.bashrc
echo 'BOLD="\033[01;01m"' >> /root/.bashrc
echo 'RESET="\033[00m"' >> /root/.bashrc
# aliases
echo 'alias vi="vim"' >> /root/.bashrc
echo 'alias http="python -m SimpleHTTPServer"' >> /root/.bashrc
echo 'alias clip="xclip -sel clip"' >> /root/.bashrc
# environment variables
echo 'export GOCOW=1' >> /root/.bashrc          # Always MSF cow
echo 'export CHEATCOLORS=true' >> /root/.bashrc # syntax highlighting for 'cheat'
# tmux bash completion
curl "https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/master/completions/tmux" > /root/.tmux-completion.sh
echo 'source /root/.tmux-completion.sh' >> /root/.bashrc
echo -e "\n${GREEN}[+] .bashrc Complete${RESET}"
### git
echo -e "\n${BLUE}[-] Starting git${RESET}"
git clone -q -b master https://github.com/rebootuser/LinEnum.git /opt/linux-priv-esc/LinEnum-git/
echo -e "\n${GREEN}[+] Git - Linux-Priv-Esc Complete${RESET}"
git clone -q -b master https://github.com/GDSSecurity/Windows-Exploit-Suggester.git /opt/windows-priv-esc/Windows-Exploit-Suggester-git/
git clone -q -b master https://github.com/rasta-mouse/Sherlock.git /opt/windows-priv-esc/Sherlock-git
echo -e "\n${GREEN}[+] Git - Windows-Priv-Esc Complete${RESET}"
git clone -q -b master https://github.com/infodox/python-pty-shells.git /opt/shell/python-pty-shells/
git clone -q -b master https://github.com/JohnTroony/php-webshells.git /opt/shell/php-webshells/
git clone -q -b master https://github.com/0x00-0x00/Shellkiller.git /opt/shell/shellkiller-git/
git clone -q -b master https://github.com/bettercap/bettercap.git /opt/bettercap-git
echo -e "\n${GREEN}[+] Git - Shell Complete${RESET}"
git clone -q -b master https://github.com/PowerShellMafia/PowerSploit.git /opt/powershell/PowerSploit-git/
git clone -q -b master https://github.com/samratashok/nishang.git /opt/powershell/nishang-git/
git clone -q -b master https://github.com/jaredhaight/PSAttack.git /opt/powershell/PSAttack-git/
git clone -q -b master https://github.com/besimorhino/powercat.git /opt/powershell/powercat-git/
git clone -q -b master https://github.com/peewpw/Invoke-PSImage.git /opt/powershell/Invoke-PSImage-git/
git clone -q -b master https://github.com/0x00-0x00/Shellkiller.git /opt/powershell/Shellkiller-git/
echo -e "\n${GREEN}[+] Git - Powershell Complete${RESET}"
git clone -q -b master https://github.com/CoreSecurity/impacket.git /opt/impacket-git/
git clone -q -b master https://github.com/Ganapati/RsaCtfTool.git /opt/RsaCtfTool-git
git clone -q -b master https://github.com/EmpireProject/Empire.git /opt/empire-git/
git clone -q -b master https://github.com/yudai/gotty.git /opt/gotty-git/
git clone -q -b master https://github.com/ankh2054/windows-pentest.git /opt/windows-pentest-git/
git clone -q -b master https://github.com/D4Vinci/One-Lin3r.git /opt/one-liner-git/
git clone -q -b master https://github.com/UltimateHackers/Decodify.git /opt/decodify-git/
git clone -q -b master https://github.com/PProvost/vim-ps1.git ~/.vim/
echo -e "\n${GREEN}[+] Git - Misc Complete${RESET}"
git clone -q -b master https://github.com/trustedsec/unicorn.git /opt/scan/unicorn-git/
git clone -q -b master https://github.com/superkojiman/onetwopunch.git /opt/scan/onetwopunch-git/
git clone -q -b master https://github.com/codingo/Reconnoitre.git /opt/scan/Reconnoitre-git/
echo -e "\n${GREEN}[+] Git - Scan Complete${RESET}"
git clone -q -b master https://github.com/adaywithtape/stegbrute.git /opt/steg/stegbrute-git/
git clone -q -b master https://github.com/zed-0xff/zsteg.git /opt/steg/zsteg-git/
echo -e "\n${GREEN}[+] Git - Steg Complete${RESET}"
git clone -q -b master https://github.com/radare/radare2.git ~/.radare2/
git clone -q -b master https://github.com/longld/peda.git ~/.peda/ \
   && echo 'source /root/.peda/peda.py' >> /root/.gdbinit
echo -e "\n${GREEN}[+] Git - RE Complete${RESET}"
git clone -q -b master https://github.com/danielmiessler/SecLists.git /usr/share/SecLists/
echo -e "\n${GREEN}[+] Git - SecLists Complete${RESET}"
### packages
echo -e "\n${BLUE}[-] Starting Packages${RESET}"
apt install -y -qq \
vim \
lolcat \
cmatrix \
pv \
ncftp \
fimap \
smbmap \
gobuster \
screenfetch
pip install -q tmux2html pwntools cheat
echo -e "\n${GREEN}[+] Packages Complete${RESET}"
### disable screensaver
echo -e "\n${BLUE}[-] Starting screensave${RESET}"
xset s 0 0
xset s off
gsettings set org.gnome.desktop.session idle-delay 0
echo -e "\n${GREEN}[+] Screensaver Complete${RESET}"
### configure GRUB
echo -e "\n${BLUE}[-] Starting GRUB${RESET}"
grubTimeout=1
file=/etc/default/grub; [ -e "${file}" ] && cp -n $file{,.bkup}
sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT='${grubTimeout}'/' "${file}"
update-grub
echo -e "\n${GREEN}[+] GRUB Complete${RESET}"
### configure autologin
echo -e "\n${BLUE}[-] Starting Autologin${RESET}"
file=/etc/gdm3/daemon.conf; [ -e "${file}" ] && cp -n $file{,.bkup}
sed -i 's/^.*AutomaticLoginEnable = .*/AutomaticLoginEnable = true/' "${file}"
sed -i 's/^.*AutomaticLogin = .*/AutomaticLogin = root/' "${file}"
echo -e "\n${GREEN}[+] Autologin Complete${RESET}"
### GNOME settings
echo -e "\n${BLUE}[-] Starting GNOME${RESET}"
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height true      # Set dock to use the full height
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true         # Set dock to always be visible
echo -e "\n${GREEN}[+] GNOME Complete${RESET}"
### bash settings
echo -e "\n${BLUE}[-] Starting bash settings${RESET}"
file=/etc/bash.bashrc; [ -e "${file}" ] && cp -n $file{,.bkup}   #~/.bashrc
echo "shopt -sq checkwinsize" >> "${file}"         # Wrap lines correctly after resizing
echo "shopt -sq nocaseglob" >> "${file}"           # Case insensitive pathname expansion
echo -e "\n${GREEN}[+] Bash Complete${RESET}"
### configure tmux
echo -e "\n${BLUE}[-] Starting tmux configuration${RESET}"
file=~/.tmux.conf; [ -e "${file}" ] && cp -n $file{,.bkup}   #/etc/tmux.conf
cat <<EOF > "${file}"
#-Settings---------------------------------------------------------------------
## Pane switching (SHIFT+ARROWS)
bind-key -n S-Left select-pane -L
bind-key -n S-Right select-pane -R
bind-key -n S-Up select-pane -U
bind-key -n S-Down select-pane -D
## Windows switching (ALT+ARROWS)
bind-key -n M-Left  previous-window
bind-key -n M-Right next-window
## Windows re-ording (SHIFT+ALT+ARROWS)
bind-key -n M-S-Left swap-window -t -1
bind-key -n M-S-Right swap-window -t +1
## Set defaults
set -g default-terminal screen-256color
set -g history-limit 5000
## Default windows titles
set -g set-titles on
set -g set-titles-string '#(whoami)@#H - #I:#W'
EOF
echo -e "\n${GREEN}[+] Tmux Complete${RESET}"
### bookmarks
echo -e "\n${BLUE}[-] Starting bookmarks${RESET}"
file=~/bookmarks.html; [ -e "${file}" ] && cp -n $file{,.bkup}
cat <<EOF > "${file}"
<A HREF="https://paulschou.com/tools/xlate/">XLATE</A>
<A HREF="https://hackvertor.co.uk/public">HackVertor</A>
<A HREF="http://www.irongeek.com/skiddypad.php">SkiddyPad</A>
<A HREF="https://www.exploit-db.com/search/">Exploit-DB</A>
<A HREF="http://offset-db.com/">Offset-DB</A>
<A HREF="http://shell-storm.org/shellcode/">Shelcodes</A>
<A HREF="http://ropshell.com/">ROP Shell</A>
<A HREF="https://ifconfig.io/">ifconfig</A>
EOF
echo -e "\n${GREEN}[+] Bookmarks Complete${RESET}"
### accesscheck-5.0.2
echo -e "\n${BLUE}[-] Starting accesschk${RESET}"
curl --progress -k -L -f "https://web.archive.org/web/20080530012252/http://live.sysinternals.com/accesschk.exe" > /usr/share/windows-binaries/accesschk_v5.02.exe
echo -e "\n${GREEN}[+] Accesschk-5.0.2 Complete${RESET}"
### DBeaver - clean up
echo -e "\n${BLUE}[-] Starting DBeaver${RESET}"
curl --progress -k -L -f "http://dbeaver.jkiss.org/files/dbeaver-ce_latest_amd64.deb" > /tmp/dbeaver.deb 
dpkg -i /tmp/dbeaver.deb
mkdir -p /usr/local/bin/
ln -sf /usr/share/dbeaver/dbeaver /usr/local/bin/dbeaver
echo -e "\n${GREEN}[+] DBeaver Complete${RESET}"
### set audio level
systemctl --user enable pulseaudio
systemctl --user start pulseaudio
pactl set-sink-mute 0 0
pactl set-sink-volume 0 25%
echo -e "\n${GREEN}[+] Volume Complete${RESET}"
### reminders
echo -e "\n${YELLOW}[-] Reminders:${RESET}"
#echo -e "\n${YELLOW}[-] cd /opt/decodify-git && make install${RESET}"
echo -e "\n${YELLOW}[-] FireFox: FoxyProxy Basic${RESET}"
echo -e "\n${YELLOW}[-] FireFox: Cookie Manager${RESET}"
screenfetch

