@echo off
@set a=Успешно
cls
title Updating hosts
chcp 866
color 2
curl -o hosts.txt  https://raw.githubusercontent.com/GooDHous/HostsList/refs/heads/main/hosts.txt
curl -o rules.txt https://raw.githubusercontent.com/GooDHous/HostsList/refs/heads/main/rules.txt
echo %a%
