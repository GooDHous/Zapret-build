chcp 65001
@echo off
cls
echo Пожалуйста убедитесь что данный скрипт запущен от имени администратора
pause
cls
sc stop "Zapret_Build"
cls
If Errorlevel 6 Goto Unkownerror
If Errorlevel 5 Goto Administrator
If Errorlevel 1 Goto Unkownerror
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Run /f /v ZapretBuildUpdate >nul
sc delete "Zapret_Build"

cls
If Errorlevel 1 Goto ErrorNoAutorun
Echo Билд удален из автозагрузки / The build has been removed from autorun
>nul timeout /t 3 /nobreak
goto end
:ErrorNoAutorun
Echo Билд не находится в автозагрузке / Build is not in autorun
>nul timeout /t 3 /nobreak
pause
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