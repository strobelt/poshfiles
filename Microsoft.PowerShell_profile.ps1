Import-Module posh-git
Import-Module oh-my-posh
Import-Module DockerCompletion
Import-Module PSReadLine
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Import-Module z
Set-Theme Agnoster

function make-link ($target, $link) {
    New-Item -Path $link -ItemType HardLink -Value $target
}

function mkcdir([string] $args1) {
    New-Item -Name "$args1" -ItemType "directory" -Path .
    Set-Location "$args1"
}

function sln { 
    Invoke-Item *.sln
}

function git-update([Parameter(Mandatory=$false)][string] $mainBranch = "main") {
    git checkout $mainBranch
    git pull
    git fetch -ap
}

function git-clean-all-branches {
    git for-each-ref --format '%(refname:short)' refs/heads | ForEach-Object { If("main","master"-notcontains $_) { git branch $_ -D} }
}

