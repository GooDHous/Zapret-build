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

start "Zapret_Build By Weh, DocFreeman and Chara (Build V2.0)" "%BIN%\winws.exe"  --wf-tcp=80,443 --wf-udp=443,50000-50100 --filter-udp=443 --hostlist="%~dp0lists\hosts.txt" --dpi-desync=fake --dpi-desync-repeats=12 --dpi-desync-fake-quic="%~dp0build\main-build\quic_initial_www_google_com.bin" --new --filter-udp=50000-50100 --dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-cutoff=d3 --dpi-desync-repeats=12 --new --filter-tcp=80 --hostlist="%~dp0lists\hosts.txt" --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new --filter-tcp=443 --hostlist="%~dp0lists\hosts.txt" --dpi-desync=split2 --dpi-desync-split-seqovl=652 --dpi-desync-split-pos=2 --dpi-desync-split-seqovl-pattern="%~dp0build\main-build\tls_clienthello_www_google_com.bin" --new --filter-udp=443 --dpi-desync=fake --dpi-desync-repeats=12 --dpi-desync-fake-quic="%~dp0build\main-build\quic_initial_www_google_com.bin" --new --filter-tcp=80 --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new --filter-tcp=443  --dpi-desync=split2 --dpi-desync-split-seqovl=652 --dpi-desync-split-pos=2 --dpi-desync-split-seqovl-pattern="%~dp0build\main-build\tls_clienthello_www_google_com.bin"