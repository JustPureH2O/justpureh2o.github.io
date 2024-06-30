---
date: ''
title: ''
updated: '2024-06-12T19:45:21.098+08:00'
---
Write-Host "$([char]0x673a)$([char]0x623f)$([char]0x7ba1)$([char]0x7406)$([char]0x6740)$([char]0x624b) $([char]0x5728)$([char]0x7ebf)$([char]0x7248) v1.0"
Write-Host "$([char]0x4f5c)$([char]0x8005): JustPureH$([char]0x2082)O"
Write-Host "$([char]0x8bbf)$([char]0x95ee) https://justpureh2o.cn/articles/64010 $([char]0x4ee5)$([char]0x4e86)$([char]0x89e3)$([char]0x66f4)$([char]0x591a)..."
Write-Host ""
Write-Host "$([char]0x4ec5)$([char]0x4f5c)$([char]0x5b66)$([char]0x4e60)$([char]0x4ea4)$([char]0x6d41)$([char]0x7528)$([char]0x9014) $([char]0x4e25)$([char]0x7981)$([char]0x5546)$([char]0x7528)" -ForegroundColor Red
Write-Host ""

$crack_type = Read-Host "$([char]0x8f93)$([char]0x5165)$([char]0x7834)$([char]0x89e3)$([char]0x547d)$([char]0x4ee4)$([char]0xff08)$([char]0x673a)$([char]0x623f)$([char]0x7ba1)$([char]0x7406)$([char]0x52a9)$([char]0x624b): 1; $([char]0x6781)$([char]0x57df): 2; $([char]0x6302)$([char]0x8d77): 3; $([char]0x89e3)$([char]0x6302): 4; $([char]0x9000)$([char]0x51fa): $([char]0x5176)$([char]0x4ed6)$([char]0xff09)"

if (1 -eq $crack_type) {
Invoke-WebRequest -Uri "https://justpureh2o.cn/store/jfglzs.inf" -OutFile "jfglzs.inf"
cmd /c "InfDefaultInstall ./jfglzs.inf"
$key_tskk = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\"
$name_tskk = "taskkill.exe"
$res_tskk = (Get-ItemProperty -Path "Registry::$key_tskk" -ErrorAction SilentlyContinue).$Name
if ("null" -eq $res_tskk) {
Write-Host -ForegroundColor Red "$([char]0x89e3)$([char]0x9664) taskkill.exe $([char]0x6620)$([char]0x50cf)$([char]0x52ab)$([char]0x6301) $([char]0x5931)$([char]0x8D25)"
} else {
Write-Host -ForegroundColor Green "$([char]0x89e3)$([char]0x9664) taskkill.exe $([char]0x6620)$([char]0x50cf)$([char]0x52ab)$([char]0x6301) $([char]0x6210)$([char]0x529f)"
}
$key_tskmgr = "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\"
$name_tskmgr = "DisableTaskMgr"
$res_tskmgr = (Get-ItemProperty -Path "Registry::$key_tskmgr" -ErrorAction SilentlyContinue).$Name
if (0 -lt $res_tskmgr) {
Write-Host -ForegroundColor Red "$([char]0x89e3)$([char]0x9501) $([char]0x4efb)$([char]0x52a1)$([char]0x7ba1)$([char]0x7406)$([char]0x5668) $([char]0x5931)$([char]0x8d25)"
} else {
Write-Host -ForegroundColor Green "$([char]0x89e3)$([char]0x9501) $([char]0x4efb)$([char]0x52a1)$([char]0x7ba1)$([char]0x7406)$([char]0x5668) $([char]0x6210)$([char]0x529f)"
}
$key_reg = "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\"
$name_reg = "DisableRegistryTools"
$res_reg = (Get-ItemProperty -Path "Registry::$key_reg" -ErrorAction SilentlyContinue).$Name
if (0 -lt $res_reg) {
Write-Host -ForegroundColor Red "$([char]0x89e3)$([char]0x9501) $([char]0x6ce8)$([char]0x518c)$([char]0x8868)$([char]0x7ba1)$([char]0x7406)$([char]0x5668) $([char]0x5931)$([char]0x8d25)"
} else {
Write-Host -ForegroundColor Green "$([char]0x89e3)$([char]0x9501) $([char]0x6ce8)$([char]0x518c)$([char]0x8868)$([char]0x7ba1)$([char]0x7406)$([char]0x5668) $([char]0x6210)$([char]0x529f)"
}
$key_mmc = "HKEY_CURRENT_USER\Software\Policies\Microsoft\MMC\{8FC0B734-A0E1-11D1-A7D30000F87571E3}\"
$name_mmc = "Restrict_Run"
$res_mmc = (Get-ItemProperty -Path "Registry::$key_mmc" -ErrorAction SilentlyContinue).$Name
if (0 -lt $res_mmc) {
Write-Host -ForegroundColor Red "$([char]0x89e3)$([char]0x9501) $([char]0x7ec4)$([char]0x7b56)$([char]0x7565)$([char]0x7ba1)$([char]0x7406)$([char]0x5668) $([char]0x5931)$([char]0x8d25)"
} else {
Write-Host -ForegroundColor Green "$([char]0x89e3)$([char]0x9501) $([char]0x7ec4)$([char]0x7b56)$([char]0x7565)$([char]0x7ba1)$([char]0x7406)$([char]0x5668) $([char]0x6210)$([char]0x529f)"
}
Write-Host -ForegroundColor Green "$([char]0x64cd)$([char]0x4f5c)$([char]0x6210)$([char]0x529f)$([char]0x5b8c)$([char]0x6210)!"
} elseif (2 -eq $crack_type) {
Invoke-WebRequest -Uri "https://justpureh2o.cn/store/ClassX.bat" -OutFile "ClassX.bat"
cmd /c "ClassX.bat" -ErrorAction SilentlyContinue
cmd /c "./ClassX.bat" -ErrorAction SilentlyContinue
Write-Host -ForegroundColor Green "$([char]0x64cd)$([char]0x4f5c)$([char]0x6210)$([char]0x529f)$([char]0x5b8c)$([char]0x6210)!"
} else {
Write-Host "$([char]0x9000)$([char]0x51fa)..."
exit
}
pause
