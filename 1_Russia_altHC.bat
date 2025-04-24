@echo off
title Zapret_Build By Weh, DocFreeman and Chara (Build V2.0) 
chcp 65001
cls
taskkill /f /im winws.exe >nul
color e 
cls
call 2_update_hosts
echo:

cd /d "%~dp0"
set BIN=%~dp0build\main-build\

start "Zapret_Build By Weh, DocFreeman and Chara (Build V2.0)" "%BIN%\winws.exe"  --wf-raw="@lists\rules.txt" --wf-tcp=80,443 --wf-udp=443,50000-65535 --filter-udp=443 --hostlist="lists\hosts.txt" --methodeol --dpi-desync=fake --dpi-desync-repeats=20 --dpi-desync-udplen-increment=18 --dpi-desync-udplen-pattern=0xDEADBEEF --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new --filter-udp=50000-65535 --dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-cutoff=d3 --dpi-desync-repeats=20 --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --new --filter-tcp=80 --hostlist="lists\hosts.txt" --methodeol --dpi-desync=fake,split2 --dpi-desync-autottl=3 --dpi-desync-fooling=md5sig --new --filter-tcp=443 --hostlist="lists\hosts.txt" --methodeol --dpi-desync=fake,split --dpi-desync-autottl=3 --dpi-desync-repeats=20 --dpi-desync-fooling=badseq --dpi-desync-fake-tls="%BIN%tls_clienthello_www_google_com.bin"
