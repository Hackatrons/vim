# function to refresh the path variable for powershell
function refresh-path {
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") +
                ";" +
                [System.Environment]::GetEnvironmentVariable("Path","User")
}
# enable tls 1.2
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;

# install chocolately
Set-ExecutionPolicy Bypass -Scope Process -Force;
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# refresh the path to ensure chocolately commands are available
refresh-path

# install node
cinst nodejs.install -y

# refresh the path to ensure node commands are available
refresh-path

# install node packages
npm install eslint eslint-plugin-react babel-eslint -g

# install vim
cinst vim -y

# symlink so vim can find our configuration files
cmd /c mklink "%USERPROFILE%\.vimrc" "%USERPROFILE%\.vim\.vimrc"
cmd /c mklink /D "%USERPROFILE%\vimfiles" "%USERPROFILE%\.vim"
cmd /c mklink "%USERPROFILE%\.vsvimrc" "%USERPROFILE%\.vim\.vsvimrc"

# neovim
cmd /c mkdir "%USERPROFILE%\AppData\Local\nvim"
cmd /c mklink "%USERPROFILE%\AppData\Local\nvim\init.vim" "%USERPROFILE%\.vim\.nvimrc"
cmd /c mklink "%USERPROFILE%\AppData\Local\nvim\coc-settings.json" "%USERPROFILE%\.vim\coc-settings.json"