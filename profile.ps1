# Austin Bricker PowerShell profile

### Installation ###
# Needs to go into directory $PROFILE.CurrentUserAllHosts
# If it doesn't exist, run `New-Item $PROFILE.CurrentUserAllHosts -ItemType File -Force`
# This should be \User\username\Documents\WindowsPowerShell\profile.ps1
# May need to run `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`

### Set prompt to mimic my bash PS1 ###
function prompt {
    $ESC = [char]27                                                 # Define escape character for ANSI colors

    "$ESC[31mPS " +                                                 # Red 'PS' to show this is PowerShell
    "$ESC[36m$env:USERNAME$ESC[35m@$ESC[36m$env:COMPUTERNAME" +     # USERNAME @ HOSTNAME
    "$ESC[32m[$(Get-Date -UFormat '%T')] " +                        # Current time
    "$ESC[33m$(get-location)$ESC[0m> "                              # Current directory
}

### Mimic behaviors from my Unix configs ###

function .. { cd .. } # alias ..='cd ..'
function ... { cd ../.. } # alias ...='cd ../..'

### Windows-specific functions ###

# Compute file hashes
function md5    { Get-FileHash -Algorithm MD5 $args }
function sha1   { Get-FileHash -Algorithm SHA1 $args }
function sha256 { Get-FileHash -Algorithm SHA256 $args }
