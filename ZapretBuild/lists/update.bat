@echo off
@set a=Успешно
cls
title Updating hosts
chcp 866
color 2
curl -o hosts.txt  https://raw.githubusercontent.com/GooDHous/HostsList/refs/heads/main/hosts.txt?token=GHSAT0AAAAAAC2MAV2VSR7MO5CXZ3CPQM6QZZUUK2A
curl -o rules.txt https://raw.githubusercontent.com/GooDHous/HostsList/refs/heads/main/rules.txt?token=GHSAT0AAAAAAC2MAV2V6BSUIHODVTWYWKPOZZUUOCA
echo %a%
