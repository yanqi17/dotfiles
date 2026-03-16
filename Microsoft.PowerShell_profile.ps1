Remove-Item -Path Alias:ni -Force
Remove-Item -Path Alias:r -Force

$envPOWERSHELL_UPDATECHECK = 'Off'

function r {notepad $PROFILE}

function t {ssh ubuntu@43.160.207.44 -p 23333}
function o {ssh orangepi@192.168.6.101}

function .. {cd ..}
function d {nr dev}

function a($1) {
  cd D:\a\$1
}
function i($1) {
  cd D:\i\$1
}
function p($1) {
  cd D:\p\$1
}
function v($1) {
  cd D:\v\$1
}
function z($1) {
  cd D:\z\$1
}

function vi($path) {
  if (-not (Test-Path $path)) {
    New-Item -ItemType File -Path $path | Out-Null
  }
  notepad $path
}

function com {
    wmic path Win32_PnPEntity where PNPClass = 'Ports' get Caption
}

# 核心跳转：回到 Git 根目录
function grt { cd $(git rev-parse --show-toplevel) }

# 基础操作
function gs { git status }
function gp { git push $args }
function gpf { git push --force $args }
function gpft { git push --follow-tags $args }
function gpl { git pull --rebase $args }
function gcl { git clone $args }
function gst { git stash $args }
function grm { git rm $args }
function gmv { git mv $args }

# 分支管理
function main { git checkout main }
function gco { git checkout $args }
function gcob { git checkout -b $args }
function gb { git branch $args }
function gbd { git branch -d $args }

# 变基操作
function grb { git rebase $args }
function grbom { git rebase origin/master $args }
function grbc { git rebase --continue }

# 日志与重置
function gl { git log $args }
function glo { git log --oneline --graph $args }
function grh { git reset HEAD $args }
function grh1 { git reset HEAD~1 $args }

# 暂存与提交
function ga { git add $args }
function gA { git add -A }
function gc { git commit $args }
function gcm { git commit -m $args }
function gca { git commit -a $args }

# 清理
function gxn { git clean -dn }
function gx { git clean -df }

# 特殊工具
# 注意：Windows 默认没有 pbcopy，改用 Set-Clipboard
function gsha { git rev-parse HEAD | Set-Clipboard }
function ghci { gh run list -L 1 $args }