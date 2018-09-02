Import-Module posh-git
Import-Module oh-my-posh
Import-Module DockerCompletion
Set-Theme Agnoster

function make-link ($target, $link) {
    New-Item -Path $link -ItemType HardLink -Value $target
}

function mkcdir([string] $args1) {
    New-Item -Name "$args1" -ItemType "directory" -Path .
    Set-Location "$args1"
}