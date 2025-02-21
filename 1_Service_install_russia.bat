chcp 65001
@echo off
cls
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Run /f /v ZapretBuildUpdate >nul
sc stop "Zapret_Build"
sc delete "Zapret_Build"
sc stop "Zapret_Build_Update"
sc delete "Zapret_Build_Update"

	

reg add "hklm\software\microsoft\windows\currentversion\run" /f /v ZapretBuildMain /t REG_SZ /d "cmd /c start \"\" /min %~dp0lists\update.bat"
sc create "Zapret_Build" binPath= "\"%~dp0build\main-build\winws.exe\" --wf-raw="@%~dp0lists\rules.txt" --wf-tcp=80,443 --wf-udp=443,50000-65535 --filter-udp=443 --hostlist="%~dp0lists\hosts.txt" --methodeol --dpi-desync=fake --dpi-desync-repeats=18 --dpi-desync-udplen-increment=16 --dpi-desync-udplen-pattern=0xDEADBEEF --dpi-desync-fake-quic="%~dp0build\main-build\quic_initial_www_google_com.bin" --new --filter-udp=50000-65535 --dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-cutoff=d3 --dpi-desync-repeats=18 --dpi-desync-fake-quic="%~dp0build\main-build\quic_initial_www_google_com.bin" --new --filter-tcp=80 --hostlist="%~dp0lists\hosts.txt" --methodeol --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new --filter-tcp=443 --hostlist="%~dp0lists\hosts.txt" --methodeol --dpi-desync=fake,split --dpi-desync-autottl=2 --dpi-desync-repeats=18 --dpi-desync-fooling=badseq --dpi-desync-fake-tls="%~dp0build\main-build\tls_clienthello_www_google_com.bin"


cls
If Errorlevel 6 Goto Unkownerror
If Errorlevel 5 Goto Administrator
If Errorlevel 1 Goto Unkownerror
sc config "Zapret_Build" start= "auto"
sc description "Zapret_Build" "DPI blocking bypass program"
sc start "Zapret_Build" 
cls
Echo Успешно добавлено в автозагрузку / Successfully added to autorun
>nul timeout /t 4 /nobreak
cls
Goto end
:ErrorNoAutorun
Echo Билд не находится в автозагрузке / Build is not in autorun
>nul timeout /t 3 /nobreak
cls
goto end
:Administrator
Echo. Пожалуйста перезапустите данный файл от имени администратора
Echo. ПКМ - Запуск от имени администратора
Echo. 
Echo. Для продолжения нажмите любую кнопку
pause >nul
Goto end
:Unkownerror
Echo. Неизвестная ошибка
Echo.
echo Для продолжения нажмите любую кнопку
pause >nul
:end