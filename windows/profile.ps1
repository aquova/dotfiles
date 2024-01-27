# Austin Bricker PowerShell profile
# 2019-2021

### Installation ###
# Needs to go into directory $PROFILE.CurrentUserAllHosts
# If it doesn't exist, run `New-Item $PROFILE.CurrentUserAllHosts -ItemType File -Force`
# Or just put it in `\User\username\Documents\WindowsPowerShell\profile.ps1` yourself
# May need to run `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`

Set-PSReadlineKeyHandler -Key Tab -Function Complete                # Autocomplete bash style
Set-PSReadlineOption -BellStyle None                                # Turn off bell

$ESC = [char]27                                                     # Define escape character for ANSI colors
# ANSI colors
$RED = "$ESC[31m"
$YELLOW = "$ESC[33m"
$GREEN = "$ESC[32m"
$BLUE = "$ESC[36m"
$PURPLE = "$ESC[35m"
$WHITE = "$ESC[0m"

### Set prompt to mimic my bash PS1 ###
# Note: This requires git for Windows to be installed
function prompt {
    $FORMATTED_NAME = ''
    $GIT_BRANCH = git rev-parse --abbrev-ref HEAD                   # Get git branch name

    if ($GIT_BRANCH -eq "HEAD") {                                   # When not at branch head, display truncated SHA
        $GIT_BRANCH = git rev-parse --short HEAD
    }

    if ($GIT_BRANCH -ne $NULL) {                                    # If git branch exists, format nicely
        $FORMATTED_NAME = " $ESC[36m($GIT_BRANCH)"
    }

    $RED + "PS " +                                                  # Red 'PS' to show this is PowerShell™
    $BLUE + "$env:USERNAME" +                                       # USERNAME
    $PURPLE + "@" +                                                 # Separator
    $BLUE + "$env:COMPUTERNAME" +                                   # HOSTNAME
    $GREEN + "[$(Get-Date -UFormat '%T')]" +                        # Current time
    $WHITE + ": " +                                                 # Separator
    $YELLOW + "$(get-location)" +                                   # Current directory
    $FORMATTED_NAME +                                               # Add formatted git branch name
    $WHITE + "> "                                                   # End
}

### Aliases to mimic Unix commands ###
New-Alias which Get-Command

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
