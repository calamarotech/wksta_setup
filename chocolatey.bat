:: Install choco .exe and add choco to PATH
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

:: Install Applications
choco install vscode -fy
choco install greenshot -fy
choco install googlechrome -fy
choco install firefox -fy
choco install cmder -fy
choco install git -fy
choco install slack -fy
choco install steam -fy
choco install thunderbird -fy
choco install obs-studio -fy
choco install signal -fy
choco install discord -fy
choco install gitkraken -fy
choco install vmwareworkstation --version 14.1.3 -fy
choco install 7zip -fy

:: Install Utilities
choco install vagrant -fy
choco install terraform -fy
choco install awscli -fy
::choco install packer -fy
::choco install boostnote -fy
::choco install qbittorrent -fy
::choco install ds4windows -fy
::choco install geforce-experience -fy
::choco install google-backup-and-sync -fy 
::choco install logitech-options -fy
::choco install windirstat

:: Install VS Code Extensions
call "C:\Program Files\Microsoft VS Code\bin\code" --install-extension -f equinusocio.vsc-material-theme
call "C:\Program Files\Microsoft VS Code\bin\code" --install-extension -f pkief.material-icon-theme
call "C:\Program Files\Microsoft VS Code\bin\code" --install-extension -f vscoss.vscode-ansible
call "C:\Program Files\Microsoft VS Code\bin\code" --install-extension -f coenraads.bracket-pair-colorizer
call "C:\Program Files\Microsoft VS Code\bin\code" --install-extension -f peterjausovec.vscode-docker
call "C:\Program Files\Microsoft VS Code\bin\code" --install-extension -f ritwickdey.liveserver
call "C:\Program Files\Microsoft VS Code\bin\code" --install-extension -f mauve.terraform
call "C:\Program Files\Microsoft VS Code\bin\code" --install-extension -f ms-python.python
call "C:\Program Files\Microsoft VS Code\bin\code" --install-extension -f oderwat.indent-rainbow
call "C:\Program Files\Microsoft VS Code\bin\code" --install-extension -f ms-vscode.theme-materialkit
