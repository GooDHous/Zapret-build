>nul chcp 65001
@echo off
title Zapret_Build Сделанный Weh, DocFreeman и Chara
cls
:menu
echo.
echo               Параметры билда
echo ************************************************************
echo *                                                          *
echo *       1  -  Запустить билд                               *
echo *                                                          *
echo *       2  -  Закрыть все экземпляры  билда                *
echo *                                                          *
echo *       3  -  Добавить в автозагрузку                      *
echo *                                                          *
echo *       4  -  Удалить из автозагрузки                      *
echo *                                                          *
echo *       5  -  Вручную обновить список хостов               *
echo *                                                          *
echo *       6  -  Выйти                                        *
echo *                                                          *
echo ************************************************************
echo.
color b
choice /C 123456 /N  
echo.

If Errorlevel 6 Goto End
If Errorlevel 5 Goto 5
If Errorlevel 4 Goto 4
If Errorlevel 3 Goto 3
If Errorlevel 2 Goto 2
If Errorlevel 1 Goto 1



:5
cls
>nul cd lists
>nul curl -o hosts.txt https://raw.githubusercontent.com/GooDHous/HostsList/refs/heads/main/hosts.txt
If Errorlevel 1 Goto :ErrorHosts
echo Успешно обновлен список Хостов
echo ---------------------------------------------
>nul curl -o rules.txt https://raw.githubusercontent.com/GooDHous/HostsList/refs/heads/main/rules.txt
If Errorlevel 1 Goto :ErrorHosts
echo Успешно обновлен список Правил
cls
Goto menu

:4
cls
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Run /f /v ZapretBuild
cls
If Errorlevel 1 Goto ErrorNoAutorun
Echo Билд удален из автозагрузки
>nul timeout /t 3 /nobreak
Goto menu

:3
cls
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Run /f /v ZapretBuild /t REG_SZ /d "%cd%\build\run.bat"
cls
Echo Успешно добавлено в автозагрузку

>nul timeout /t 3 /nobreak
cls
Goto menu
:ErrorNoAutorun
Echo Билд не находится в автозагрузке
>nul timeout /t 3 /nobreak
cls
Goto menu
:2
>nul taskkill /f /im winws.exe
cls
If Errorlevel 128 Goto ErrorCloseAll
Echo Все экземпляры билда были успешно закрыты!
>nul timeout /t 3 /nobreak 
cls
Goto menu

:1
run.bat
Goto End

:ErrorCloseAll
cls
Echo Не удалось закрыть экземпляр(ы) билда
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