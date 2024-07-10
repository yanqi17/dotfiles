oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/di4am0nd.omp.json" | Invoke-Expression

Remove-Alias -Name ni -Force
Remove-Alias -Name r -Force

$env:POWERSHELL_UPDATECHECK = 'Off'

function update {& { $(Invoke-RestMethod aka.ms/install-powershell.ps1 ) } -UseMSI}
function touch($filename) {New-Item -ItemType File -Name "$filename"}
function vi($filename) {notepad $filename}
function nio {ni --prefer-offline}
function com {wmic path Win32_PnPEntity where "PNPClass = 'Ports'" get Caption}

function p($param) {ping $param -t}
function s {nr start}
function d {nr dev}
function b {nr build}
function t {nr test}

function w1 {ssh root@192.168.1.101}
function a1 {ssh root@120.76.43.169}
function t1 {ssh ubuntu@43.163.240.55 -p 23333}
function y1 {ssh yanqi@154.12.37.219 -p 23333}
function u1 {ssh sonna@192.168.40.233}
function o1 {ssh orangepi@192.168.6.101}

function c {cat C:\Users\yanqi\Documents\PowerShell\Microsoft.PowerShell_profile.ps1}
function r {notepad C:\Users\yanqi\Documents\PowerShell\Microsoft.PowerShell_profile.ps1}
function x {rm ‪C:\Users\yanqi\.ssh\known_hosts}

function .ssh {cat $env:USERPROFILE\.ssh\id_rsa.pub}
function ssh-copy-id([string]$userAtMachine, $args){   
    $publicKey = "$ENV:USERPROFILE" + "/.ssh/id_rsa.pub"
    if (!(Test-Path "$publicKey")){
        Write-Error "ERROR: failed to open ID file '$publicKey': No such file"            
    }
    else {
        & cat "$publicKey" | ssh $args $userAtMachine "umask 077; test -d .ssh || mkdir .ssh ; cat >> .ssh/authorized_keys || exit 1"      
    }
}
function i($1) {
  cd D:\Github\$1
}
function serve($1) {
  if (!($1)){
    live-server dist
  }  
  else{
    live-server $1
  }
}