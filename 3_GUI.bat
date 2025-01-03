 >nul chcp 65001
@echo off
set buildver=V1.8      
set builddate=03.01.2025 
title Zapret_Build Сделанный Weh, DocFreeman и Chara / Zapret_Build Made by Weh, DocFreeman and Chara (Build %buildver%)
cls
:menu
color b
cls
echo.
echo               Параметры билда / Build parameters                                %buildver%
echo.   *********************************************************************************
echo.   *                                                                               *
echo.   *       1  -  Запустить билд / Run build                                        *
echo.   *                                                                               *
echo.   *       2  -  Закрыть все экземпляры билда / Close all instances of the build   *
echo.   *                                                                               *
echo.   *       3  -  Добавить в автозагрузку / Add to autorun                          *
echo.   *                                                                               *
echo.   *       4  -  Удалить из автозагрузки / Remove from autorun                     *
echo.   *                                                                               *
echo.   *       5  -  Вручную обновить список хостов / Manually update the host list    *
echo.   *                                                                               *
echo.   *       6  -  Информация / Information                                          *
echo.   *                                                                               *
echo.   *       7  -  Выйти / Exit                                                      *
echo.   *                                                                               *
echo.   *********************************************************************************
echo.
echo. Билд - Данное приложение для обхода блокировок / Build - This is an application for bypassing blockades
echo.
echo.
echo. Выберите пункт / Select an item 

choice /C 1234567s /N  
echo.

If Errorlevel 8 Goto secret
If Errorlevel 7 Goto End
If Errorlevel 6 Goto 6
If Errorlevel 5 Goto 5
If Errorlevel 4 Goto 4
If Errorlevel 3 Goto 3
If Errorlevel 2 Goto 2
If Errorlevel 1 Goto 1

Goto menu
:6
cls
color 2
echo. Информация:
echo.   ************************************************************************************************
echo.   *       Главные разработчики: Weh, DocFreeman                                    *
echo.   *       Идея: DocFreeman https://github.com/GooDHous                             *        * 
echo.   *       Большая проделанная работа: Weh https://github.com/WehZB                 *       ***  
echo.   *       Помощь в реализации: Chara                                               *      *****
echo.   *       Бинарники: Bol-van https://github.com/bol-van                            *    *********
echo.   *       Последняя версия билда: %buildver%                                       *       *** 
echo.   *       Версия бинарников: v69.9                                                 *     *******
echo.   *       Хэш бинарников: 594e613fcb3669e377d1f564873e15459dc5f229                 *        *
echo.   *       Дата создания обновления: %builddate%                                    *       
echo.   ************************************************************************************************
echo.                  Для возврата в меню нажмите любую кнопку
echo.                       Press any key to back to menu
>nul pause
color f
Goto secret

:secret
cls
color 4
curl https://raw.githubusercontent.com/GooDHous/zapretHostsForm/refs/heads/main/curl/Weh.txt
>nul timeout /t 4 /nobreak
cls
color 6
curl https://raw.githubusercontent.com/GooDHous/zapretHostsForm/refs/heads/main/curl/DocFreeman.txt
>nul timeout /t 4 /nobreak
cls
color 2
curl https://raw.githubusercontent.com/GooDHous/zapretHostsForm/refs/heads/main/curl/Chara.txt
>nul timeout /t 4 /nobreak
cls
Goto menu

:5
cls
>nul cd lists
>nul curl -o hosts.txt https://raw.githubusercontent.com/GooDHous/HostsList/refs/heads/main/hosts.txt
If Errorlevel 1 Goto :ErrorHosts
echo Успешно обновлен список Хостов / The list of Hosts has been successfully updated
echo ---------------------------------------------
>nul curl -o rules.txt https://raw.githubusercontent.com/GooDHous/HostsList/refs/heads/main/rules.txt
If Errorlevel 1 Goto :ErrorHosts
echo Успешно обновлен список Правил / The list of Rules has been successfully updated
>nul timeout /t 3 /nobreak
cls
Goto menu

:4
cls
sc stop "Zapret_Build"
cls
If Errorlevel 6 Goto Unkownerror
If Errorlevel 5 Goto Administrator
If Errorlevel 1 Goto Unkownerror

sc delete "Zapret_Build"
cls
If Errorlevel 1 Goto ErrorNoAutorun
Echo Билд удален из автозагрузки / The build has been removed from autorun
>nul timeout /t 3 /nobreak
Goto menu

:3
cls

REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Run /f /v ZapretBuild >nul
sc stop "Zapret_Build"
sc delete "Zapret_Build"
sc create "Zapret_Build" binPath= "\"%~dp0build\main-build\winws.exe\" --wf-raw="@%~dp0lists\rules.txt" --wf-tcp=80,443 --wf-udp=443,50000-65535 --filter-udp=443 --hostlist="%~dp0lists\hosts.txt" --methodeol --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-udplen-increment=10 --dpi-desync-udplen-pattern=0xDEADBEEF --dpi-desync-fake-quic="%~dp0build\main-build\quic_initial_www_google_com.bin" --new --filter-udp=50000-65535 --dpi-desync=fake --dpi-desync-any-protocol --dpi-desync-cutoff=d3 --dpi-desync-repeats=6 --dpi-desync-fake-quic="%~dp0build\main-build\quic_initial_www_google_com.bin" --new --filter-tcp=80 --hostlist="%~dp0lists\hosts.txt" --methodeol --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new --filter-tcp=443 --hostlist="%~dp0lists\hosts.txt" --methodeol --dpi-desync=fake,split --dpi-desync-autottl=2 --dpi-desync-repeats=6 --dpi-desync-fooling=badseq --dpi-desync-fake-tls="%~dp0build\main-build\tls_clienthello_www_google_com.bin"
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
Goto menu
:ErrorNoAutorun
Echo Билд не находится в автозагрузке / Build is not in autorun
>nul timeout /t 3 /nobreak
cls
Goto menu

:2
>nul taskkill /f /im winws.exe
cls
If Errorlevel 128 Goto ErrorCloseAll
Echo Все экземпляры билда были успешно закрыты! / All instances of the build have been successfully closed!
>nul timeout /t 3 /nobreak 
cls
Goto menu
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
:1
taskkill /f /im winws.exe >nul
cls
cd lists
taskkill /f /im winws.exe >nul
cls
autoupdate.vbs
cd ..
cls
color e 
timeout /T 1 /NOBREAK > NUL
color e 
cls
echo.                                            Пожалуйста подождите
echo                                     ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
timeout /T 1 /NOBREAK > NUL
cls
echo.                                            Пожалуйста подождите
echo                                     ▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
timeout /T 1 /NOBREAK > NUL
cls
echo.                                            Пожалуйста подождите
echo                                     ▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
timeout /T 1 /NOBREAK > NUL
cls
echo.                                            Пожалуйста подождите
echo                                     ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
timeout /T 1 /NOBREAK > NUL
cls
echo.                                            Пожалуйста подождите
echo                                     ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒▒▒▒▒
timeout /T 1 /NOBREAK > NUL
cls
echo.                                            Пожалуйста подождите
echo                                     ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒
timeout /T 1 /NOBREAK > NUL 
cls
echo.                                            Пожалуйста подождите
echo                                     ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
timeout /T 1 /NOBREAK > NUL 
cls
color f
fastrun.bat
Goto End

:ErrorCloseAll
cls
Echo Не удалось закрыть экземпляр(ы) билда / Failed to close the build instance(s)
>nul timeout /t 3 /nobreak
cls
Goto menu

:ErrorHosts
cls
echo Не удается обновить список хостов
>nul timeout /t 3 /nobreak
cls
Goto menu


: End