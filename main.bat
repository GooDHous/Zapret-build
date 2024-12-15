>nul chcp 65001
@echo off
title Zapret_Build Сделанный Weh, DocFreeman и Chara / Zapret_Build Made by Weh, DocFreeman and Chara (Build V1.5.2)
cls
:menu
color b
cls
echo.
echo               Параметры билда / Build parameters                              V1.5.2
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

choice /C 1234567 /N  
echo.

If Errorlevel 7 Goto End
If Errorlevel 6 Goto 6
If Errorlevel 5 Goto 5
If Errorlevel 4 Goto 4
If Errorlevel 3 Goto 3
If Errorlevel 2 Goto 2
If Errorlevel 1 Goto 1

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
echo.   *       Последняя версия билда: 1.5.2                                            *       *** 
echo.   *       Версия бинарников: v69.7                                                 *     *******
echo.   *       Хэш бинарников: 594e613fcb3669e377d1f564873e15459dc5f229                 *        *
echo.   *       Дата создания обновления: 15.12.2024                                     *       
echo.   ************************************************************************************************
echo.                  Для возврата в меню нажмите любую кнопку
echo.                       Press any key to back to menu
>nul pause
color f
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
cls
Goto menu

:4
cls
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Run /f /v ZapretBuild
cls
If Errorlevel 1 Goto ErrorNoAutorun
Echo Билд удален из автозагрузки / The build has been removed from autorun
>nul timeout /t 3 /nobreak
Goto menu

:3
cls
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Run /f /v ZapretBuild /t REG_SZ /d "%cd%\build\run.bat"
cls
Echo Успешно добавлено в автозагрузку / Successfully added to autorun
>nul timeout /t 3 /nobreak
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

:1
run.bat
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