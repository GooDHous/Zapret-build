chcp 65001
@echo off
cls
>nul cd %~dp0lists
>nul curl -o hosts.txt https://raw.githubusercontent.com/GooDHous/HostsList/refs/heads/main/hosts.txt
If Errorlevel 1 Goto :ErrorHosts
echo Успешно обновлен список Хостов / The list of Hosts has been successfully updated
cls
