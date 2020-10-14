# Austin Bricker PowerShell profile

### Installation ###
# Needs to go into directory $PROFILE.CurrentUserAllHosts
# If it doesn't exist, run `New-Item $PROFILE.CurrentUserAllHosts -ItemType File -Force`
# Or just put it in `\User\username\Documents\WindowsPowerShell\profile.ps1` yourself
# May need to run `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`

Set-PSReadlineKeyHandler -Key Tab -Function Complete                # Autocomplete bash style
Set-PSReadlineOption -BellStyle None                                # Turn off bell

### Set prompt to mimic my bash PS1 ###
function prompt {
    $ESC = [char]27                                                 # Define escape character for ANSI colors
    $FORMATTED_NAME = ''
    $GIT_BRANCH = git rev-parse --abbrev-ref HEAD                   # Get git branch name

    if ($GIT_BRANCH -eq "HEAD") {                                   # When not at branch head, display truncated SHA
        $GIT_BRANCH = git rev-parse --short HEAD
    }

    if ($GIT_BRANCH -ne $NULL) {                                    # If git branch exists, format nicely
        $FORMATTED_NAME = " $ESC[36m($GIT_BRANCH)"
    }

    "$ESC[31mPS " +                                                 # Red 'PS' to show this is PowerShell™
    "$ESC[36m$env:USERNAME$ESC[35m@$ESC[36m$env:COMPUTERNAME" +     # USERNAME @ HOSTNAME
    "$ESC[32m[$(Get-Date -UFormat '%T')]$ESC[0m: " +                # Current time
    "$ESC[33m$(get-location)" +                                     # Current directory
    "$FORMATTED_NAME" +                                             # Add formatted git branch name
    "$ESC[0m> "                                                     # End
}

### Mimic behaviors from my Unix configs ###
# TODO: See if you can iterate to generate these, as we do for bash
function .. { cd .. }
function ... { cd ../.. }
function .... { cd ../../.. }
function ..... { cd ../../../.. }
function .2 { cd .. }
function .3 { cd ../.. }
function .4 { cd ../../.. }
function .5 { cd ../../../.. }

function gittree { git log --graph --pretty=oneline --abbrev-commit }
function gitsha { git rev-parse HEAD }

# Activate Python virtualenv
# Assuming we are in root of virtualenv directory
function activate { .\Scripts\activate.ps1 }

### Windows-specific functions ###
# Compute file hashes
function md5    { Get-FileHash -Algorithm MD5 $args }
function sha1   { Get-FileHash -Algorithm SHA1 $args }
function sha256 { Get-FileHash -Algorithm SHA256 $args }

### Additional programs in PATH ###

# bat: https://github.com/sharkdp/bat
$env:PATH += "C:\Program Files (x86)\bat;"
# lazygit: https://github.com/jesseduffield/lazygit
$env:PATH += "C:\Program Files (x86)\lazygit;"
# ripgrep: https://github.com/BurntSushi/ripgrep
$env:PATH += "C:\Program Files (x86)\ripgrep;"
