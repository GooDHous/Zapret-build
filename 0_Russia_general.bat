@echo off
title Zapret_Build By Weh, DocFreeman and Chara (Build V1.8) 
chcp 65001
cls
taskkill /f /im winws.exe >nul
cls
cd lists
taskkill /f /im winws.exe >nul
cls
cd ..
cls
color e 
timeout /T 1 /NOBREAK > NUL
color e 
cls
call 2_update_hosts
echo:

cd /d "%~dp0"
set BIN=%~dp0build\main-build\
start "Zapret_Build By Weh, DocFreeman and Chara (Build V1.8)" "%BIN%\winws.exe"  --wf-raw="@lists\rules.txt" --wf-tcp=80,443 --wf-udp=443,50000-65535 --filter-udp=443 --hostlist="lists\hosts.txt" --methodeol --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-udplen-increment=10 --dpi-desync-udplen-pattern=0xDEADBEEF --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new --filter-udp=50000-65535 --dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-cutoff=d3 --dpi-desync-repeats=6 --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new --filter-tcp=80 --hostlist="lists\hosts.txt" --methodeol --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new --filter-tcp=443 --hostlist="lists\hosts.txt" --methodeol --dpi-desync=fake,split --dpi-desync-autottl=2 --dpi-desync-repeats=6 --dpi-desync-fooling=badseq --dpi-desync-fake-tls="%BIN%tls_clienthello_www_google_com.bin"
