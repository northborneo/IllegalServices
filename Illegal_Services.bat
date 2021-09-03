@ECHO OFF
REM  QBFC Project Options Begin
REM  HasVersionInfo: Yes
REM  Companyname: Illegal Services
REM  Productname: Illegal Services
REM  Filedescription: Illegal Services
REM  Copyrights: Copyright (C) 2020 IB_U_Z_Z_A_R_Dl
REM  Trademarks: Copyright (C) 2020 IB_U_Z_Z_A_R_Dl
REM  Originalname: Illegal_Services.exe
REM  Comments: Illegal Services
REM  Productversion:  5. 8. 3. 2
REM  Fileversion:  5. 8. 3. 2
REM  Internalname: Illegal_Services.exe
REM  Appicon: Ressources\Icons\icon.ico
REM  AdministratorManifest: Yes
REM  QBFC Project Options End
@ECHO ON
@echo off
cd /d "%~dp0"
setlocal enabledelayedexpansion
cls
set "hidecursor=<nul set /p=[?25l"
set "showcursor=<nul set /p=[?25h"
%hidecursor%
if defined Language for %%a in (FAQ SCANWEBSITES NMAP YOUTUBEDL PINGER) do if "%*"=="%%a" (
call :APPLY_SETTINGS
for /f "tokens=6" %%a in ('cmdwiz.exe getconsoledim') do if %%a lss 120 call :SCALE 120 30
goto :PROCESS_%%a
)
call :SCALE 125 19
if exist "cmdwiz.exe" cmdwiz.exe setquickedit 0
set IS_Reg=HKCU\SOFTWARE\IB_U_Z_Z_A_R_Dl\Illegal Services
call :CHECK_LANGUAGE
call :CHECK_USERNAME
title Welcome [!IS_USERNAME!] to Illegal Services . . .
if defined TEMP (set "TMPF=!TEMP!") else if defined TMP (set "TMPF=!TMP!") else (
if "!Language!"=="EN" set t="Your 'TEMP' and 'TMP' environment variables do not exist." "Please fix one of them and try again."
if "!Language!"=="FR" set t="Vos variables d'environnement 'TEMP' et 'TMP' n'existent pas." "Veuillez rparer l'une d'entre elles et ressayer."
call :MSGBOX 2 !t! 69648 "Illegal Services Checker"
start https://t.me/illegal_services_forum
exit
)
if not exist "Curl" <nul set /p="%~dp0" | >nul findstr /c:"!TEMP!" /c:"!TMP!" && (
if "!Language!"=="EN" set t="Illegal Services cannot start because you are running it from an archive. Reopen it once the archive is extracted."
if "!Language!"=="FR" set t="Illegal Services ne peut pas dmarrer car vous l'excutez … partir d'une archive. Rouvrez-le une fois l'archive extraite."
call :MSGBOX 1 !t! 69680 "Illegal Services Checker"
exit
)
if defined lastversion (
rem if "%~nx0"=="Illegal Services.exe" if "!version!" leq "!lastversion!" start Illegal_Services.exe UPDATE_FAILED
echo  ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ
if "!Language!"=="EN" echo  ณ Debugging: This is a developer-only message for future improvement of the Illegal Services updater.
if "!Language!"=="FR" echo  ณ Dbogage: Ceci est un message rserv au dveloppeur pour une future amlioration de l'updater d'Illegal Services.
echo  รฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ
echo  ณ Current Version: !version!
echo  ณ Last Version: !lastversion!
echo  ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ
echo.
if "!Language!"=="EN" echo Press {ENTER} to continue...
if "!Language!"=="FR" echo Appuyez sur {ENTRER} pour continuer...
>nul pause
cls
)
if /i "%~x0"==".exe" (set "IS_Process=%~nx0") else set "IS_Process=cmd.exe" & goto :LAUNCHER
if "%~nx0"=="Illegal Services.exe" >nul move /y "%~nx0" "Illegal_Services.exe" && start Illegal_Services.exe && exit
for /f %%a in ('tasklist /fo csv /fi "imagename eq %~nx0" ^| findstr /c:"%~nx0"') do set /a cn+=1
pushd "!TMPF!"
set batused=
for /f %%a in ('dir "????????.bat" /a:-d /o:-d /b ^| findstr /rc:"........\.bat"') do (
if not defined batused (
set "batused=%%a"
attrib -s -h "%%a"
attrib +s +h +i "%%a"
)
if !cn! gtr 1 goto :LAUNCHER
if not "%%a"=="!batused!" del /f /q /a "%%a"
)

:LAUNCHER
popd
set version=v5.8.3.2 - 03/09/2021
set "el=bgblack=[40m,bgyellow=[43m,bgwhite=[47m,black=[30m,red=[31m,green=[32m,yellow=[33m,blue=[34m,magenta=[35m,cyan=[36m,white=[37m,grey=[90m,brightred=[91m,brightblue=[94m,brightmagenta=[95m,underline=[4m,underlineoff=[24m"
set "%el:,=" && set "%"
echo !bgblack!!brightblue!
call :DRAW_LOGO
echo:
echo [29C!cyan!{!red!+!cyan!}---------------------------------------------------------------{!red!+!cyan!}!red!
if "!Language!"=="EN" call :DRAW_CENTER "   !yellow!Welcome [!red!!IS_USERNAME!!yellow!] to Illegal Services !version:~,8!   !red!" 20
if "!Language!"=="FR" call :DRAW_CENTER "   !yellow!Bienvenue [!red!!IS_USERNAME!!yellow!] dans Illegal Services !version:~,8!   !red!" 20
echo [29C!cyan!{!red!+!cyan!}---------------------------------------------------------------{!red!+!cyan!}
for /f %%a in ('2^>nul dir "!TMPF!\URL????.url" /a:-d /b ^| findstr /rc:"URL....\.url"') do del /f /q "!TMPF!\%%a"
for %%a in (README.md "Illegal Services.exe" "!TMPF!\msgbox.vbs" "!TMPF!\IS.Setup.exe") do if exist "%%~a" del /f /q "%%~a"
for %%a in ("!cd:~,2!\AI_RecycleBin" "!SystemDrive!\AI_RecycleBin" "!TMPF!\IB_U_Z_Z_A_R_Dl") do if exist "%%~a" 2>nul rd /s /q "%%~a"
set "sp=!grey![30C$ [!red!!IS_USERNAME!!grey!] "
echo !grey!
if defined ProgramFiles(x86) (set arch=64) else set arch=86
set "IS_Dir=%~dp0Illegal Services\"
set "IS_Dir=!IS_Dir:Illegal Services\Illegal Services\=Illegal Services\!"
for %%a in (Curl\x!arch!\curl.exe) do if not exist "%%a" (
if "!Language!"=="EN" set t="Illegal Services can't start because '!IS_Dir!%%a' is missing." "Please reinstall Illegal Services and try again."
if "!Language!"=="FR" set t="Illegal Services ne peut pas dmarrer car '!IS_Dir!%%a' est manquant." "Veuillez rinstaller Illegal Services et ressayer."
call :MSGBOX 2 !t! 69648 "Illegal Services Checker"
start https://t.me/illegal_services
exit
)

:LAUNCHER_PROXY
if "!Language!"=="EN" set t=Searching a
if "!Language!"=="FR" set t=Recherche d'un
<nul set /p=!sp!!t! proxy ^>
set git_list=bitbucket.org/IllegalServices/illegal_services git.teknik.io/Illegal-Services/Illegal_Services github.com/Illegal-Services/Illegal_Services gitee.com/Illegal-Services/illegal_services
call :PROXY

:LAUNCHER_VERSION
if defined git for /f "delims=/" %%a in ("!git:*://=!") do if defined git_backup (echo  !green![!red!Git backup server: !green!%%a] . . .) else if "!git!"=="404 Git proxy not found" (echo  !red![FAILED] . . .) else echo  !green![%%a] . . .
if "!Language!"=="EN" <nul set /p=!sp!Searching for a new update ^>
if "!Language!"=="FR" <nul set /p=!sp!Recherche d'une nouvelle mise … jour ^>
call :CHECK_VOICEASSISTANT
call :GET_VERSION
if defined lastversion (echo  !green![!lastversion!] . . .) else echo  !red![FAILED] . . .
if "!errorlevel!"=="1" call :CHECKER_SETUP_FOUND
if "!errorlevel!"=="2" call :CHECKER_BUILD_FOUND

:CHECKERINTEGRITY
if "!Language!"=="EN" echo !sp!Checking files integrity . . .
if "!Language!"=="FR" echo !sp!Vrification de l'intgrite des fichiers . . .
for %%a in (COPYING ChangeLog.txt cmdbkg.exe cmdwiz.exe SaveFileBox.exe OpenFileBox.exe EULA.rtf Tutorial.html 7za\x!arch!\7zxa.dll 7za\x!arch!\7za.dll 7za\x!arch!\7za.exe Speak\speak-x!arch!.exe Speak\extd.exe Speak\!Language!.lang) do if not exist "%%a" (
set el=%%a
set el=!el:\=/!
call :MISSING_FILE %%a
call :CURL "%%a" "`git_raw_main`/!el!" || call :ERROR_FATAL %%a
)
for /l %%a in (1,1,12) do if not exist "Backgrounds\background-%%a.jpg" (
call :MISSING_FILE Backgrounds\background-%%a.jpg
call :CURL "Backgrounds.7z" "`git_raw_downloads`/Backgrounds.7z" || call :ERROR_FATAL Backgrounds\background-!el!.jpg
goto :CHECKERWINDOWS
)

:CHECKERWINDOWS
if "!Language!"=="EN" <nul set /p=!sp!Checking Windows version ^>
if "!Language!"=="FR" <nul set /p=!sp!Vrification de votre version de Windows ^>
for /f "tokens=4-7delims=[.] " %%a in ('ver') do if /i "%%a"=="Version" (set "windowsversion=%%b.%%c") else set "windowsversion=%%a.%%b"
for /f "tokens=2delims=:" %%a in ('chcp') do set /a CP=%%a
if defined windowsversion (echo  !green![!windowsversion!, x!arch!] . . .) else echo  !red![?, !green!x!arch!!red!] . . .
if not "!windowsversion!"=="10.0" if not "!windowsversion!"=="6.3" if not "!windowsversion!"=="6.2" if not "!windowsversion!"=="6.1" (
if "!Language!"=="EN" set t="ERROR: Your computer does not reach the minimum Windows version compatible with Illegal Services." "You need Windows 7 or higher."
if "!Language!"=="FR" set t="ERREUR: Votre ordinateur n'atteint pas la version minimale de Windows compatible avec Illegal Services." "Vous avez besoin de Windows 7 ou suprieur."
call :MSGBOX 2 !t! 69648 "Illegal Services Checker"
exit
)
if not "!windowsversion!"=="10.0" call :INSTALL_ANSICON "%~f0"

:LAUNCHER_APPLY_SETTINGS
if "!Language!"=="EN" echo !sp!Applying your settings . . .
if "!Language!"=="FR" echo !sp!Applique vos paramtres . . .
call :APPLY_SETTINGS

:LAUNCHER_START
call :ROSE "Welcome Back"
if "!Language!"=="EN" echo !sp!Starting Illegal Services . . .
if "!Language!"=="FR" echo !sp!Dmarrage d'Illegal Services . . .
for /f "tokens=2*" %%a in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal"') do set "ISOutputDirectory=%%b\Illegal Services"
set "checked=!cyan![!yellow!x!cyan!]!white! "
set "unchecked=!cyan![ ]!white! "
call :CHECK_VOICEASSISTANTCHOICE
if "!VoiceAssistantChoice!"=="1" call :ROSE_SETUP
:L1
for %%a in (extd speak-x!arch!) do tasklist /fo csv /fi "imagename eq %%a.exe" | >nul findstr /c:"%%a.exe" && goto :L1
if "!VoiceAssistant!"=="0" >nul timeout /t 1 /nobreak
call :SCALE 125 29
set is_title=Illegal Services v
for /l %%a in (1,1,18) do title !is_title:~,%%a! & cmdwiz.exe delay 20

:MAINMENU
title Illegal Services !version:~,4!  ^|Git !git_backup!proxy: !git!^|
if defined MAINMENU (call :ROSE) else (call :ROSE "Main Menu" & set MAINMENU=1)
call :SCALE 125 29
echo !grey!
call :DRAW_LOGO
echo !cyan!
echo [19Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
<nul set /p=!brightred!                                  !underline!!version:~,8!!underlineoff!             !red!Û!bgyellow! MAIN MENU !bgblack!!red!Û!bgblack!!brightred!
if "!Language!"=="EN" (set t=Welcome) else set t=Bienvenue
call :DRAW_CUSTOM_CENTER 37 "!underline!!t! !IS_USERNAME!!underlineoff!!cyan!" 14
echo [19Cฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
echo [19Cบ    !yellow!1!cyan!  ^>  !white!Internet Protocol TV (IPTV)!cyan!    Û    !yellow!10!cyan!  ^>  !white!IP Denial of Services (DDoS)!cyan!    บ
echo [19Cบ    !yellow!2!cyan!  ^>  !white!Direct Download Link (DDL)!cyan!     Û    !yellow!11!cyan!  ^>  !white!IP Address Lookup!cyan!               บ
echo [19Cบ    !yellow!3!cyan!  ^>  !white!Streaming!cyan!                      Û    !yellow!12!cyan!  ^>  !white!IP Port Scanning!cyan!                บ
echo [19Cบ    !yellow!4!cyan!  ^>  !white!Torrenting!cyan!                     Û    !yellow!13!cyan!  ^>  !white!IP Port Pinger!cyan!                  บ
echo [19Cบ    !yellow!5!cyan!  ^>  !white!Subtitles!cyan!                      Û    !yellow!14!cyan!  ^>  !white!IP Pinger!cyan!                       บ
echo [19Cบ    !yellow!6!cyan!  ^>  !white!Cracked Windows apps!cyan!           Û    !yellow!15!cyan!  ^>  !white!IP Loggers!cyan!                      บ
echo [19Cบ    !yellow!7!cyan!  ^>  !white!Cracked Android APK's!cyan!          Û    !yellow!16!cyan!  ^>  !white!Doxing!cyan!                          บ
echo [19Cบ    !yellow!8!cyan!  ^>  !white!YouTube Downloader!cyan!             Û    !yellow!17!cyan!  ^>  !white!Portable Apps!cyan!                   บ
echo [19Cบ    !yellow!9!cyan!  ^>  !white!Useful Websites!cyan!                Û    !yellow!18!cyan!  ^>  !white!More Features!cyan!                   บ
echo [19Cฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
if "!Language!"=="EN" echo [19Cบ    !yellow!C!cyan!  ^>  !white!Credits!cyan!!underlineoff!     บ    !yellow!N!cyan!  ^>  !brightred!Our Social Networks!cyan!    บ      !yellow!S!cyan!  ^>  !white!Settings!cyan!!underlineoff!        บ
if "!Language!"=="FR" echo [19Cบ    !yellow!C!cyan!  ^>  !white!Credits!cyan!!underlineoff!     บ    !yellow!R!cyan!  ^>  !brightred!Nos Rseaux Sociaux!cyan!    บ      !yellow!P!cyan!  ^>  !white!Paramtres!cyan!!underlineoff!      บ
echo [19Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!HELP!grey!" / "!yellow!FAQ!grey!" / "!yellow!CHANGELOG!grey!" !t2! !yellow!{!t3!}!grey!." 40
echo:
call :CHECK_FIRSTLAUNCH
if "!version:~5,3!"=="0.0" if "!FirstLaunch!"=="1" (
call :CHECK_FIRSTLAUNCH
if "!Language!"=="EN" set t="News in !version:~,8!:"" & Chr(10) & Chr(10) & ""Updated: IS Source, Internet Protocol Television, Direct Download Link, Streaming, Torrenting, Subtitles, Cracked Windows Apps, Cracked Android APK's, Useful Websites, IP Denial of Services, Portable Apps, More Features."
if "!Language!"=="FR" set t="Nouveauts dans la !version:~,8!:"" & Chr(10) & Chr(10) & ""Mise … jour de: IS Source, Internet Protocol Television, Direct Download Link, Streaming, Torrenting, Subtitles, Cracked Windows Apps, Cracked Android APK's, Useful Websites, IP Denial of Services, Portable Apps, More Features."
mshta vbscript:Execute^("msgbox "!t!",69696,""Illegal Services News"":close"^)
if "!Language!"=="EN" set t="Developer Note:"" & Chr(10) & Chr(10) & ""In this update, I added 'Warez Wikis' and 'Ebooks' menus in 'More Features'. Reviewed the 'Torrenting' and 'Cracked Windows apps' categories. Updated many categories. Fixed minor bugs."
if "!Language!"=="FR" set t="Note du dveloppeur:"" & Chr(10) & Chr(10) & ""Dans cette mise … jour, j'ai ajout les menus 'Warez Wikis' et 'Ebooks' dans 'More Features'. Pass en revue les catgories 'Torrenting' et 'Cracked Windows apps'. Mis … jour de nombreuses catgories. Corrig des bugs mineurs."
mshta vbscript:Execute^("msgbox "!t!",69696,""Illegal Services News"":close"^)
>nul reg add "!IS_Reg!" /v "FirstLaunch" /t REG_DWORD /d 0 /f
)
call :PROMPT
for %%a in (3 4) do if "!x!"=="1%%a" call :CHECK_INTERNET || (call :ERROR_INTERNET & goto :MAINMENU)
set cn=
for %%a in (IPTV DDL STREAMING TORRENTING SUBTITLES WINDOWS ANDROID YOUTUBEDL USEFULWEBSITES DDOS IPLOOKUP PORT PINGERPORT IPPINGER IPLOGGERS DOXING PORTABLEAPPS MOREFEATURES) do (
set /a cn+=1
if "!x!"=="!cn!" goto :%%a
)
call :CHOOSE credit && goto :CREDITS
if "!Language!"=="EN" set t=networks
if "!Language!"=="FR" set t=reseaux
call :CHOOSE !t! && (
start https://bitbucket.org/IllegalServices/illegal_services && cmdwiz.exe delay 1500
start https://t.me/illegal_services_forum && cmdwiz.exe delay 1500
start https://t.me/illegal_services && cmdwiz.exe delay 1500
start https://discord.gg/rU2w2E83KF && cmdwiz.exe delay 1500
start https://twitter.com/illegalservices && cmdwiz.exe delay 1500
start https://addons.mozilla.org/addon/illegal-services
goto :MAINMENU
)
if "!Language!"=="EN" set t=settings
if "!Language!"=="FR" set t=parametres
call :CHOOSE !t! && goto :SETTINGS
call :CHOOSE help && (start /max tutorial.html & goto :MAINMENU)
call :CHOOSE changelog && (start /max changeLog.txt & goto :MAINMENU)
call :CHOOSE faq && (call :SHOW_WINDOW "Frequently Asked Questions" || (start "" "%~0" FAQ) & goto :MAINMENU)
call :ERRORMESSAGE
goto :MAINMENU

:CREDITS
call :SCALE 99 34
if "!Language!"=="EN" title Credits / Thanks / Helpers
if "!Language!"=="FR" title Crdits / Remerciement / Aideurs
call :ROSE Credits

:CONTINUECREDITS
call :SCALE 94 34
echo !cyan!
echo [39Cอออออออออออออออ
echo [38C// !red!Û!bgyellow!!black! CREDITS !red!Û!bgblack!!cyan! \\
echo [9Cษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [9CฬอออออออออออออออออออออออออออþÛ!bgyellow!!red!Û DEPENDENCIES Û!bgblack!!cyan!Ûþอออออออออออออออออออออออออออน
echo [9Cบ                                                                          บ
echo [9Cบ      !yellow!1!cyan!  ^>  !white!Open/SaveFileBox     : 'Open/Save file box dialog'!cyan!            บ
echo [9Cบ      !yellow!2!cyan!  ^>  !white!Speak by soyalk 2019 : 'Rose voice assistant'!cyan!                 บ
echo [9Cบ      !yellow!3!cyan!  ^>  !white!Speak by Fatih Kodak : 'Rose voice assistant'!cyan!                 บ
echo [9Cบ      !yellow!4!cyan!  ^>  !white!Advanced Installer   : 'Setup Installer'!cyan!                      บ
echo [9Cบ      !yellow!5!cyan!  ^>  !white!ANSICON: 'Support for Windows 2000, Vista, 7, 8 and 8.1'!cyan!      บ
echo [9Cบ      !yellow!6!cyan!  ^>  !white!CmdWiz : 'Background Transparency, Hide Cursor, ...'!cyan!          บ
echo [9Cบ      !yellow!7!cyan!  ^>  !white!CmdBkg : 'Background Image'!cyan!                                   บ
echo [9Cบ      !yellow!8!cyan!  ^>  !white!7-Zip  : 'Decompressing Tool'!cyan!                                 บ
echo [9Cบ      !yellow!9!cyan!  ^>  !white!curl   : 'Web Requests'!cyan!                                       บ
echo [9Cบ                                                                          บ
echo [9CฬออออออออออออออออออออออþÛ!bgyellow!!red!Û DEVELOPERS and HELPERS Û!bgblack!!cyan!Ûþออออออออออออออออออออออน
echo [9Cบ                                                                          บ
echo [9Cบ                   !yellow!10!cyan!  ^>  !white!Program Dream Discord Server!cyan!                    บ
echo [9Cบ                   !yellow!11!cyan!  ^>  !white!server.bat Discord Server!cyan!                       บ
echo [9Cบ                   !yellow!12!cyan!  ^>  !white!@anic17!cyan!                                         บ
echo [9Cบ                   !yellow!13!cyan!  ^>  !white!@^<Tim^>!cyan!                                          บ
echo [9Cบ                   !yellow!14!cyan!  ^>  !white!@sintrode!cyan!                                       บ
echo [9Cบ                   !yellow!15!cyan!  ^>  !white!@Grub4K!cyan!                                         บ
echo [9Cบ                   !yellow!16!cyan!  ^>  !white!@Rosalyn!cyan!                                        บ
echo [9Cบ                   !yellow!17!cyan!  ^>  !white!@Ms.CatFire!cyan!                                     บ
echo [9Cบ                   !yellow!18!cyan!  ^>  !white!All other contributors!cyan!                          บ
echo [9Cศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" !t2! !yellow!{!t3!}!grey!." 20
echo:
call :PROMPT
if "!x!"=="1" start https://www.robvanderwoude.com/dialogboxes.php
if "!x!"=="2" start https://github.com/soyalk/speak-text-windows
if "!x!"=="3" start https://f2ko.de/programme/cmd-tools/
if "!x!"=="4" start https://www.advancedinstaller.com/
if "!x!"=="5" start https://github.com/adoxa/ansicon
if "!x!"=="6" start https://www.dostips.com/forum/viewtopic.php?t=7407
if "!x!"=="7" start https://www.dostips.com/forum/viewtopic.php?t=7402
if "!x!"=="8" start https://www.7-zip.org/
if "!x!"=="9" start https://curl.se/
if "!x!"=="10" start https://discord.com/invite/eCMBHUB
if "!x!"=="11" start https://discord.com/invite/eXjp7PQ
if "!x!"=="12" (
if "!Language!"=="EN" set t="Helped improving and reducing code." "Helped fixing a bug that where creating temporary files without deleting them." "Helped improving IP Lookup API's." "Helped adding launcher updater."
if "!Language!"=="FR" set t="A aid … amliorer et … rduire le code." "A aid … la correction d'un bug qui entranait la cration de fichiers temporaires sans les supprimer." "A aid … amliorer l'API de l'IP Lookup." "A aid … l'ajout des mises … jour du launcher."
call :MSGBOX 4 !t! 69696 "anic17 'Task failed successfully'"
start https://github.com/anic17
)
if "!x!"=="13" (
if "!Language!"=="EN" set t="Helped improving and reducing code." "Helped adding launcher updater." "Helped creating windows repair." "Helped adding Rose voice assistant."
if "!Language!"=="FR" set t="A aid … amliorer et … rduire le code." "A aid … l'ajout des mises … jour du launcher." "A aid … la cration de windows repair." "A aid … l'ajout de l'assistante vocal Rose."
call :MSGBOX 4 !t! 69696 "<Tim>"
start https://tim-greller.de/home/
)
if "!x!"=="14" (
if "!Language!"=="EN" set t="Helped improving and reducing code." "Helped using curl for IS source." "Helped adding Rose voice assistant." "Helped adding choice verification."
if "!Language!"=="FR" set t="A aid … amliorer et … rduire le code." "A aid … l'utilisation de curl pour la source d'IS." "A aid … l'ajout de l'assistante vocale Rose." "A aid … l'ajout de la vrification des choix."
call :MSGBOX 4 !t! 69696 "sintrode"
if "!Language!"=="EN" set t="Helped adding Automatic proxy switcher."
if "!Language!"=="FR" set t="A aid … ajouter le proxy switcher automatique."
call :MSGBOX 1 !t! 69696 "sintrode"
start https://github.com/sintrode
)
if "!x!"=="15" (
if "!Language!"=="EN" set t="Helped improving and reducing code." "Created IS Bookmarks web extension." "Created the timer in seconds to scan indexed websites." "Fixed a bug with the stack memory overflow causing IS to crash. "
if "!Language!"=="FR" set t="A aid … amliorer et … rduire le code." "Cration de l'extension Web IS Bookmarks." "Cration de la minuterie en secondes du scan des sites internet indexs." "Correction d'un bug avec le dbordement de la mmoire de la pile provoquant le plantage d'IS."
call :MSGBOX 4 !t! 69696 "Grub4K"
if "!Language!"=="EN" set t="Created the code to center the text on the UI."
if "!Language!"=="FR" set t="A cr le code pour centrer le texte sur l'UI."
call :MSGBOX 1 !t! 69696 "Grub4K"
start https://github.com/Grub4K
)
if "!x!"=="16" (
if "!Language!"=="EN" set t="Helping testing alpha versions." "Helping to find existing bugs." "Gave me a lot of motivation and encouragement." "                                            *Notice you the shine ?"
if "!Language!"=="FR" set t="A aid … tester les versions alpha." "A aid … trouver les bugs existants." "M'a donn beaucoup de motivation et d'encouragement." "                                                           *Notice you the shine ?"
call :MSGBOX 4 !t! 69696 "Rosalyn 'Shine brightest'"
)
if "!x!"=="17" (
if "!Language!"=="EN" set t=Logo designer for
if "!Language!"=="FR" set t=Conceptrice du logo de la
call :MSGBOX 1 "!t! v4.0" 69696 "Ms.CatFire"
)
if "!x!"=="18" (
if "!Language!"=="EN" (
echo Dim Msg,Style,Title,Response
echo Msg="@Agam - Added ON/OFF switches."^&vbCrLf^&"@Vincent - Helped finding a bug with wrong choices."^&vbCrLf^&"@cocorisss - Updated Python Port Scanner."^&vbCrLf^&"@Chonkus - Added Internet Protocol TV (IPTV)."^&vbCrLf^&"@KiritoLeFakePK - Helped finding existing bugs."^&vbCrLf^&"@Simi - Helped with some English translation."^&vbCrLf^&"@Saltyy - Helped improving UI choices."^&vbCrLf^&"@AMIT - Fixed 'ControlSet001' to 'CurrentControlSet'."^&vbCrLf^&"@LeSaintFisti - Added 6 websites."^&vbCrLf^&"@Trident Security - Added 2 websites."^&vbCrLf^&"@Bastien - Added 1 website."^&vbCrLf^&"@RaaFii1 - Added 1 website."^&vbCrLf^&"@snipercat - Added 1 website."^&vbCrLf^&"@PistachePoilue - Added 1 website."^&vbCrLf^&"@Eiralys - Added 1 website."
echo Style=69696
echo Title="All other contributors:"
echo Response=MsgBox^(Msg,Style,Title^)
)>"!TMPF!\msgbox.vbs"
if "!Language!"=="FR" (
echo Dim Msg,Style,Title,Response
echo Msg="@Agam - A ajout้ les interrupteurs ON/OFF."^&vbCrLf^&"@Vincent - A aid้ เ trouver un bug avec les mauvais choix."^&vbCrLf^&"@cocorisss - Mise เ jour du Port Scanner Python."^&vbCrLf^&"@Chonkus - A ajout้ Internet Protocol TV (IPTV)."^&vbCrLf^&"@KiritoLeFakePK - A aid้ เ trouver les bugs existants."^&vbCrLf^&"@Simi - A aid้ pour certaines traductions Anglaise."^&vbCrLf^&"@Saltyy - A aid้ เ am้liorer les choix d'interface utilisateur."^&vbCrLf^&"@AMIT - A corrig้ 'ControlSet001' vers 'CurrentControlSet'."^&vbCrLf^&"@LeSaintFisti - A ajout้ 6 sites internet."^&vbCrLf^&"@Trident Security - A ajout้ 2 sites internet."^&vbCrLf^&"@Bastien - A ajout้ 1 site internet."^&vbCrLf^&"@RaaFii1 - A ajout้ 1 site internet."^&vbCrLf^&"@snipercat - A ajout้ 1 site internet."^&vbCrLf^&"@PistachePoilue - A ajout้ 1 site internet."^&vbCrLf^&"@Eiralys - A ajout้ 1 site internet."
echo Style=69696
echo Title="Toutes les autres personnes qui m'ont aid้"
echo Response=MsgBox^(Msg,Style,Title^)
)>"!TMPF!\msgbox.vbs"
cscript //nologo "!TMPF!\msgbox.vbs"
del /f /q "!TMPF!\msgbox.vbs"
)
for /l %%a in (1,1,18) do if "!x!"=="%%a" goto :CONTINUECREDITS
call :CHOOSE back && goto :MAINMENU
call :ERRORMESSAGE
goto :CONTINUECREDITS

:SETTINGS
call :SCALE 113 26
title Settings
call :ROSE Settings

:CLEARSETTINGS
call :CHECK_SETTINGS
if !BackgroundTransparency! lss 10 (set "el= ") else set el=
if "!Language!"=="EN" (
set "BackgroundTransparencyInfo=Change background transparency. !cyan!(!yellow!!BackgroundTransparency!!cyan!)     !el!บ"
if "!BackgroundBorderTransparencyValue!"=="1" set "BackgroundBorderTransparencyInfo=Borders transparency !cyan!(!green!ON!!cyan!)                บ"
if "!BackgroundBorderTransparencyValue!"=="0" set "BackgroundBorderTransparencyInfo=Borders transparency !cyan!(!red!OFF!!cyan!)               บ"
if "!BackgroundDisabled!"=="0" set "BackgroundDisabledInfo=Wallpaper background !cyan!(!green!ON!!cyan!)                บ"
if "!BackgroundDisabled!"=="1" set "BackgroundDisabledInfo=Wallpaper background !cyan!(!red!OFF!!cyan!)               บ"
if "!VoiceAssistant!"=="1" set "VoiceAssistantInfo=Rose voice assistant !cyan!(!green!ON!!cyan!)                บ"
if "!VoiceAssistant!"=="0" set "VoiceAssistantInfo=Rose voice assistant !cyan!(!red!OFF!!cyan!)               บ"
if "!DeveloperMode!"=="1" (
set "DeveloperModeInfo=Developer mode !cyan!(!green!ON!!cyan!)                      บ"
set "ExtractSourceInfo=!yellow!24!cyan!  ^> !white! Extract IS source code.!cyan!                  บ"
)
if "!DeveloperMode!"=="0" (
set "DeveloperModeInfo=Developer mode !cyan!(!red!OFF!!cyan!)                     บ"
set "ExtractSourceInfo=                                                บ"
)
set "ScanWebsitesInfo=Scan down or changed domain websites.!cyan!    บ"
)
if "!Language!"=="FR" (
set "BackgroundTransparencyInfo=Changer background transparence. !cyan!(!yellow!!BackgroundTransparency!!cyan!)!cyan!    !el!บ"
if "!BackgroundBorderTransparencyValue!"=="1" set "BackgroundBorderTransparencyInfo=Transparence des bords !cyan!(!green!ON!!cyan!)              บ"
if "!BackgroundBorderTransparencyValue!"=="0" set "BackgroundBorderTransparencyInfo=Transparence des bords !cyan!(!red!OFF!!cyan!)             บ"
if "!BackgroundDisabled!"=="0" set "BackgroundDisabledInfo=Fond d'cran !cyan!(!green!ON!!cyan!)                        บ"
if "!BackgroundDisabled!"=="1" set "BackgroundDisabledInfo=Fond d'cran !cyan!(!red!OFF!!cyan!)                       บ"
if "!VoiceAssistant!"=="1" set "VoiceAssistantInfo=Assistance vocal Rose !cyan!(!green!ON!!cyan!)               บ"
if "!VoiceAssistant!"=="0" set "VoiceAssistantInfo=Assistance vocal Rose !cyan!(!red!OFF!!cyan!)              บ"
if "!DeveloperMode!"=="1" (
set "DeveloperModeInfo=Mode dveloppeur !cyan!(!green!ON!!cyan!)                    บ"
set "ExtractSourceInfo=!yellow!24!cyan!  ^>  !white!Extraire le code source d'IS.!cyan!            บ"
)
if "!DeveloperMode!"=="0" (
set "DeveloperModeInfo=Mode dveloppeur !cyan!(!red!OFF!!cyan!)                   บ"
set "ExtractSourceInfo=                                                บ"
)
set "ScanWebsitesInfo=Scan les sites internet indexs.!cyan!         บ"
)

:CONTINUESETTINGS
call :SCALE 113 26
title Settings
echo !cyan!
if "!Language!"=="EN" (
echo [47Cออออออออออออออออ
echo [46C// !red!Û!bgyellow!!black! SETTINGS !red!Û!bgblack!!cyan! \\
)
if "!Language!"=="FR" (
echo [46Cออออออออออออออออออ
echo [45C// !red!Û!bgyellow!!black! PARAMETRES !red!Û!bgblack!!cyan! \\
)
echo [7Cษอออออออออออออออออออออออออออออออออออออออออออออหอออออออออออออออออออออออออออออออออออออออออออออออออออป
if "!Language!"=="EN" echo [7CฬอออออออออออออþÛ!bgyellow!!red!Û WALLPAPERS Û!bgblack!!cyan!ÛþออออออออออออออฮอออออออออออออออออþÛ!bgyellow!!red!Û SETTINGS Û!bgblack!!cyan!Ûþออออออออออออออออออน
if "!Language!"=="FR" echo [7CฬออออออออออออþÛ!bgyellow!!red!Û FOND D'ECRANS Û!bgblack!!cyan!ÛþออออออออออออฮออออออออออออออออþÛ!bgyellow!!red!Û PARAMETRES Û!bgblack!!cyan!Ûþอออออออออออออออออน
echo [7Cบ                                             บ                                                   บ
echo [7Cบ    !yellow!1!cyan!  ^> !white! Kirito 1 (IS v1.4 icon)!cyan!            บ   !yellow!13!cyan!  ^> !white! !BackgroundTransparencyInfo!
echo [7Cบ    !yellow!2!cyan!  ^> !white! Kirito 2!cyan!                           บ   !yellow!14!cyan!  ^> !white! !BackgroundBorderTransparencyInfo!
echo [7Cบ    !yellow!3!cyan!  ^> !white! Kirito 3!cyan!                           บ   !yellow!15!cyan!  ^> !white! !BackgroundDisabledInfo!
echo [7Cบ    !yellow!4!cyan!  ^> !white! Kirito 4!cyan!                           บ   !yellow!16!cyan!  ^> !white! !VoiceAssistantInfo!
echo [7Cบ    !yellow!5!cyan!  ^> !white! 49206C6F766520796F75204C697361!cyan!     บ   !yellow!17!cyan!  ^> !white! !DeveloperModeInfo!
echo [7Cบ    !yellow!6!cyan!  ^> !white! Even Roses are colorless !cyan!          บ   !yellow!18!cyan!  ^> !white! !ScanWebsitesInfo!
if "!Language!"=="EN" echo [7Cบ    !yellow!7!cyan!  ^> !white! Tree!cyan!                               บ   !yellow!19!cyan!  ^> !white! Check for updates.!cyan!                       บ
if "!Language!"=="FR" echo [7Cบ    !yellow!7!cyan!  ^> !white! Arbre!cyan!                              บ   !yellow!19!cyan!  ^> !white! Vrifiez les mises … jour.!cyan!               บ
if "!Language!"=="EN" echo [7Cบ    !yellow!8!cyan!  ^> !white! Dark Guy!cyan!                           บ   !yellow!20!cyan!  ^> !white! Change username.!cyan!                         บ
if "!Language!"=="FR" echo [7Cบ    !yellow!8!cyan!  ^> !white! Homme sombre!cyan!                       บ   !yellow!20!cyan!  ^> !white! Changer le nom d'utilisateur.!cyan!            บ
if "!Language!"=="EN" echo [7Cบ    !yellow!9!cyan!  ^> !white! Girl eyes!cyan!                          บ   !yellow!21!cyan!  ^> !white! Change language to French.!cyan!               บ
if "!Language!"=="FR" echo [7Cบ    !yellow!9!cyan!  ^> !white! Yeux fille!cyan!                         บ   !yellow!21!cyan!  ^> !white! Changer la langue en Anglais.!cyan!            บ
if "!Language!"=="EN" echo [7Cบ   !yellow!10!cyan!  ^> !white! World map (bytes)!cyan!                  บ   !yellow!22!cyan!  ^> !white! Export\Import settings.!cyan!                  บ
if "!Language!"=="FR" echo [7Cบ   !yellow!10!cyan!  ^> !white! Carte du monde (bytes)!cyan!             บ   !yellow!22!cyan!  ^> !white! Exporter\Importer les paramtres.!cyan!        บ
if "!Language!"=="EN" echo [7Cบ   !yellow!11!cyan!  ^> !white! World map (Corona Virus)!cyan!           บ   !yellow!23!cyan!  ^> !white! Uninstall Illegal Services.!cyan!              บ
if "!Language!"=="FR" echo [7Cบ   !yellow!11!cyan!  ^> !white! Carte du monde (Corona Virus)!cyan!      บ   !yellow!23!cyan!  ^> !white! Dsinstaller Illegal Services.!cyan!           บ
if "!Language!"=="EN" echo [7Cบ   !yellow!12!cyan!  ^> !white! World map (cool)!cyan!                   บ   !ExtractSourceInfo!
if "!Language!"=="FR" echo [7Cบ   !yellow!12!cyan!  ^> !white! Carte du monde (cool)!cyan!              บ   !ExtractSourceInfo!
echo [7Cบ                                             บ                                                   บ
echo [7Cศอออออออออออออออออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!OPEN!grey!" / "!yellow!BACK!grey!" !t2! !yellow!{!t3!}!grey!." 30
echo:
call :PROMPT
for %%a in (8,9) do if "!x!"=="1%%a" call :CHECK_INTERNET || (call :ERROR_INTERNET & goto :CONTINUESETTINGS)
for /l %%a in (1,1,12) do if "!x!"=="%%a" goto :SETTING_BACKGROUND_WALLPAPER
if "!x!"=="13" goto :SETTING_BACKGROUND_TRANSPARENCY
if "!x!"=="14" goto :SETTING_BACKGROUND_BORDER_TRANSPARENCY
if "!x!"=="15" goto :SETTING_BACKGROUND
if "!x!"=="16" goto :SETTING_ROSE
if "!x!"=="17" goto :SETTING_DEVELOPERMODE
if "!x!"=="18" call :SHOW_WINDOW "websites indexed" || (start "" "%~f0" SCANWEBSITES) & goto :CONTINUESETTINGS
if "!x!"=="19" goto :SETTING_VERSION
if "!x!"=="20" goto :SETTING_USERNAME
if "!x!"=="21" goto :SETTING_LANGUAGE
if "!x!"=="22" goto :SETTING_EXPORTIMPORT
if "!x!"=="23" goto :SETTING_UNINSTALL
if "!x!"=="24" if "!DeveloperMode!"=="1" goto :SETTING_EXTRACT_SOURCE
call :CHOOSE open && (call :OPEN_FOLDER "!ISOutputDirectory!" & goto :CONTINUESETTINGS)
call :CHOOSE back && goto :MAINMENU
call :ERRORMESSAGE
goto :CONTINUESETTINGS

:SETTING_BACKGROUND_WALLPAPER
>nul reg add "!IS_Reg!" /v "BackgroundWallpaper" /t REG_DWORD /d !x! /f
>nul reg add "!IS_Reg!" /v "BackgroundDisabled" /t REG_DWORD /d 0 /f
call :APPLY_SETTINGS
goto :CLEARSETTINGS

:SETTING_BACKGROUND_TRANSPARENCY
echo:
if "!Language!"=="EN" echo     Choose the transparency level from 1 to 100. We recommend a value beetwen 5 and 30 for a good looking.
if "!Language!"=="FR" echo     Choisissez la transparence de 1 … 100. Nous recommandons une valeur entre 5 et 30 pour un bon rendu.
call :PROMPT
for /l %%a in (1,1,100) do if "!x!"=="%%a" (
>nul reg add "!IS_Reg!" /v "BackgroundTransparency" /t REG_DWORD /d !x! /f
call :APPLY_SETTINGS
goto :CLEARSETTINGS
)
call :ERRORMESSAGE x "une valeur" value
goto :CLEARSETTINGS

:SETTING_BACKGROUND_BORDER_TRANSPARENCY
if "!BackgroundBorderTransparencyValue!"=="0" >nul reg add "!IS_Reg!" /v "BackgroundBorderTransparency" /t REG_DWORD /d 1 /f
if "!BackgroundBorderTransparencyValue!"=="1" if "!BackgroundDisabled!"=="0" >nul 2>&1 reg add "!IS_Reg!" /v "BackgroundBorderTransparency" /t REG_DWORD /d 0 /f
call :APPLY_SETTINGS
goto :CLEARSETTINGS

:SETTING_BACKGROUND
if "!BackgroundDisabled!"=="0" (
>nul reg add "!IS_Reg!" /v "BackgroundDisabled" /t REG_DWORD /d 1 /f
>nul reg add "!IS_Reg!" /v "BackgroundBorderTransparency" /t REG_DWORD /d 1 /f
)
if "!BackgroundDisabled!"=="1" >nul reg add "!IS_Reg!" /v "BackgroundDisabled" /t REG_DWORD /d 0 /f
call :APPLY_SETTINGS
goto :CLEARSETTINGS

:SETTING_ROSE
for %%a in (extd speak-x!arch!) do >nul 2>&1 taskkill /f /im "%%a.exe" /t
if "!VoiceAssistant!"=="1" >nul reg add "!IS_Reg!" /v "VoiceAssistant" /t REG_DWORD /d 0 /f
if "!VoiceAssistant!"=="0" >nul reg add "!IS_Reg!" /v "VoiceAssistant" /t REG_DWORD /d 1 /f
goto :CLEARSETTINGS

:SETTING_DEVELOPERMODE
if "!DeveloperMode!"=="1" (
set DeveloperMode=
>nul reg add "!IS_Reg!" /v "DeveloperMode" /t REG_DWORD /d 0 /f
goto :CLEARSETTINGS
)
echo !brightred!
echo =================================================================================================================
if "!Language!"=="EN" echo [15C^^!^^! You need to be part of the Illegal Services developers to enable that option ^^!^^!
if "!Language!"=="FR" echo [11C^^!^^! Vous devez faire partie des dveloppeurs d'Illegal Services pour activer cette option ^^!^^!
echo =================================================================================================================
echo !cyan!
if "!Language!"=="EN" set t=Enter your developer license key
if "!Language!"=="FR" set t=Entrez votre cl de licence dveloppeur
%showcursor%
set DeveloperKey=
set /p "DeveloperKey=!t!: !yellow!"
%hidecursor%
echo:
if defined DeveloperKey >nul 2>&1 reg add "!IS_Reg!" /v "DeveloperMode" /t REG_DWORD /d !DeveloperKey! /f
call :CHECK_DEVELOPERMODE
if "!DeveloperMode!"=="1" (
if "!Language!"=="EN" set t=Developer mode has been activated successfully. You can now extract the source code.
if "!Language!"=="FR" set t=Le mode dveloppeur a t activ avec succs. Vous pouvez maintenant extraire le code source.
call :MSGBOX 1 "!t!." 69696 "Illegal Services Checker"
goto :CLEARSETTINGS
)
if "!DeveloperMode!"=="0" call :ERRORMESSAGE DeveloperKey "une cl de license" "licence key"
goto :CLEARSETTINGS

:SETTING_VERSION
call :GET_VERSION
if "!errorlevel!"=="0" (
if "!Language!"=="EN" set t="Illegal Services is up to date." "Current version: !version!" "Latest version   : !lastversion!"
if "!Language!"=="FR" set t="Illegal Services est … jour." "Version actuelle : !version!" "Dernire version: !lastversion!"
call :MSGBOX UPDATER !t! 69696 "Illegal Services Checker"
)
if "!errorlevel!"=="1" call :CHECKER_SETUP_FOUND
if "!errorlevel!"=="2" call :CHECKER_BUILD_FOUND
goto :CONTINUESETTINGS

:SETTING_USERNAME
echo !cyan!
if "!Language!"=="EN" (
echo NOTE: 1. Leaving blank will replace the original username.
echo       2. Username cannot exceed 20 characters.
echo       3. Do not use the following characters: "^! %% ^^".
)
if "!Language!"=="FR" (
echo NOTE: 1. Laisser vide remplacera le nom d'utilisateur d'origine.
echo       2. Le nom d'utilisateur ne peut pas dpasser 20 caractres.
echo       3. N'utiliser les caractres suivants: "^! %% ^^".
)
:L2
if "!Language!"=="EN" set t=Enter your new username
if "!Language!"=="FR" set t=Entrez votre nouveau nom d'utilisateur
setlocal disabledelayedexpansion
call :INPUTBOX "%t%: "
setlocal enabledelayedexpansion
if defined ID (
set "ID=!ID:%%=%%%%!"
if defined %ID:~1,-1% goto :ERROR_USERNAME
if not "!ID:~20!"=="" goto :ERROR_USERNAME
>nul reg add "!IS_Reg!" /v "Username" /t REG_SZ /d "!ID:~,20!" /f
) else >nul reg add "!IS_Reg!" /v "Username" /t REG_SZ /d "!username:~,20!" /f
call :CHECK_USERNAME
if "!Language!"=="EN" set t=Your new username has been changed to
if "!Language!"=="FR" set t=Votre nouveau nom d'utilisateur a t remplac par
call :MSGBOX 1 "!t!: '!IS_USERNAME!'" 69696 "Illegal Services Checker"
)
goto :CONTINUESETTINGS

:ERROR_USERNAME
echo:
call :ERRORMESSAGE ID "un nom d'utilisateur" username
goto :L2

:SETTING_LANGUAGE
if "!Language!"=="EN" set t=FR
if "!Language!"=="FR" set t=EN
>nul reg add "!IS_Reg!" /v "Language" /t REG_SZ /d !t! /f
for %%a in (extd speak-x!arch!) do >nul 2>&1 taskkill /f /im "%%a.exe" /t
goto :CLEARSETTINGS

:SETTING_EXPORTIMPORT
if not exist "!ISOutputDirectory!" md "!ISOutputDirectory!"
echo !cyan!
if "!Language!"=="EN" echo Do you want to [!yellow!E!cyan!]xport or [!yellow!I!cyan!]mport your current settings ?
if "!Language!"=="FR" echo Voulez-vous [!yellow!E!cyan!]xporter ou [!yellow!I!cyan!]mporter vos paramtres actuels ?
>nul choice /n /c EI
if "!errorlevel!"=="1" goto :SETTING_EXPORT
if "!errorlevel!"=="2" goto :SETTING_IMPORT

:SETTING_EXPORT
if "!Language!"=="EN" (
set t1=Registration Files
set t2=Save As
)
if "!Language!"=="FR" (
set t1=Fichiers d'enregistrements
set t2=Enregistrer sous
)
for /f "delims=" %%a in ('SaveFileBox.exe IS_Settings.reg "!t1! (*.reg)|*.reg" "!ISOutputDirectory!" "!t2!" /f') do set el=%%a
>nul 2>&1 reg export "!IS_Reg!" "!el!" /y && (
if "!Language!"=="EN" (
set t1=Settings exported successfully.
set t2=You can now import them using the generated file at:
)
if "!Language!"=="FR" (
set t1=Paramtres exports avec succs.
set t2=Vous pouvez maintenant les importer … l'aide du fichier gnr …:
)
mshta vbscript:Execute("msgbox ""!t1!"" & Chr(10) & ""!t2!"" & Chr(10) & Chr(10) & ""!el!"",69696,""Illegal Services Checker"":close"^)
)
goto :CONTINUESETTINGS

:SETTING_IMPORT
if "!Language!"=="EN" (
set t1=Registration Files
set t2=Open
)
if "!Language!"=="FR" (
set t1=Fichiers d'enregistrements
set t2=Ouvrir
)
for /f "delims=" %%a in ('OpenFileBox.exe "!t1! (*.reg)|*.reg" "!ISOutputDirectory!" "!t2!"') do if /i "%%~xa"==".reg" set _el=%%a
>nul 2>&1 find /i "[HKEY_CURRENT_USER\SOFTWARE\IB_U_Z_Z_A_R_Dl\Illegal Services]" "!_el!" && >nul 2>&1 reg import "!_el!" && (
for %%a in (LANGUAGE USERNAME YOUTUBEDLPRIORITY PORTPRIORITY FIRSTLAUNCH VOICEASSISTANT VOICEASSISTANTCHOICE YOUTUBEDLP YOUTUBEDLOUTPUTDIRECTORY YOUTUBEDLGEOBYPASS DEVELOPERMODE) do call :CHECK_%%a
call :APPLY_SETTINGS
if "!Language!"=="EN" set t=Settings imported successfully from
if "!Language!"=="FR" set t=Paramtres imports avec succs … partir de
mshta vbscript:Execute("msgbox ""!t!:"" & Chr(10) & ""!_el!"",69696,""Illegal Services Checker"":close"^)
)
if not "!errorlevel!"=="0" (
if "!Language!"=="EN" set t="File '!_el!' invalid." "You need to import a '*.reg' file."
if "!Language!"=="FR" set t="Le fichier '!_el!' est invalide." "Vous devez importer un fichier '*.reg'."
call :MSGBOX 2 !t! 69680 "Illegal Services Checker"
)
goto :CLEARSETTINGS

:SETTING_UNINSTALL
cls
title Illegal Services uninstaller
echo:
echo:
echo:
echo:
echo !red!
call :DRAW_CENTER "Are you sure you want to permanently delete Illegal Services from your system without leaving traces ?"
call :DRAW_CENTER "You will lose all of the following settings and personal data:"
echo:
echo !cyan!
echo =================================================================================================================
echo [22C!red!Illegal Services    !cyan!^>  !magenta!%~dp0
echo [22C!red!Settings            !cyan!^>  !magenta!!IS_Reg!
echo [22C!red!YouTube Downloader  !cyan!^>  !magenta!!YouTubeDLOutputDirectory!
echo [22C!red!IP Address Lookup   !cyan!^>  !magenta!!ISOutputDirectory!
echo [22C!red!Temporary IS files  !cyan!^>  !magenta!!TMPF!!cyan!
echo =================================================================================================================
echo:
echo:
if "!Language!"=="EN" (
call :DRAW_CENTER "Are you sure you want to continue ? Press !yellow![Y]!cyan! for Yes and !yellow![N]!cyan! for No.!yellow!" 25
>nul choice /n /c YN
)
if "!Language!"=="FR" (
call :DRAW_CENTER "Etes vous sur de vouloir continuer ? Appuyez sur !yellow![O]!cyan! pour Oui ou !yellow![N]!cyan! pour Non.!yellow!" 25
>nul choice /n /c ON
)
if not "!errorlevel!"=="1" goto :CONTINUESETTINGS
if "!Language!"=="EN" set t=ERROR: This feature is still in development and will be released soon
if "!Language!"=="FR" set t=ERREUR: Cette fonctionnalit est toujours en cours de dveloppement et sera publie prochainement
call :MSGBOX 1 "!t!." 69696 "Illegal Services Checker"
goto :CONTINUESETTINGS
start IS.Uninstaller.bat
exit

:SETTING_EXTRACT_SOURCE
if /i "!IS_Process!"=="cmd.exe" (
echo:
if "!Language!"=="EN" set t=ERROR: Impossible to extract the source code if you are running the batch file
if "!Language!"=="FR" set t=ERREUR: Impossible d'extraire le code source si vous excutez le fichier batch
echo !red!!t! ^(%~nx0^).!yellow!
timeout /t 5
) else if defined batused (
attrib -s -h -i "!TMP!\!batused!"
>nul copy /y "!TMPF!\!batused!" "Illegal_Services.bat"
attrib +s +h +i "!TMP!\!batused!"
2>nul powershell Get-childitem $Illegal_Services.bat ^| ForEach-Object -process {if ^(^($_.attributes -band 0x100^) -eq 0x100^) {$_.attributes = ^($_.attributes -band 0xFEFF^)}}
start /max explorer.exe "%~dp0"
)
goto :CONTINUESETTINGS

:IPTV
call :SCALE 91 32
title Internet Protocol Television (IPTV)
call :ROSE "Internet Protocol Television"

:CLEARIPTV
call :CLEAR 1 38
set db=iptvcat.com/home_11 `pro.allkaicerteam.com/ www.iptvm3ulist.com/ip-tv-free/ www.iptvm3ufree.com/ iptvmate.net/m3u_iptv/ www.links-iptv.com/ iptvforpcwindows.com/ www.techtoreview.com/top-picks/m3u-playlist-url.html www.iptv4free.com/ m3u.pktelcos.com/ freem3uhd.blogspot.com/ dailym3uiptv.com/home83/ www.iptv1.org/ telechargeriptv.com/ www.5kplayer.com/video-music-player/free-iptv-playlist-m3u-links.htm github.com/monetareq/iptv1 github.com/cbn88/cbn88.github.io github.com/Free-IPTV/Countries github.com/coodertv/IPTVM3U8 github.com/Sumon2021/Sumon-IPTV github.com/mancinibig55/45125623 github.com/firojshahriyarmasud/IPTV github.com/duyminh215/iptv-list github.com/riqueenz/iptv github.com/iptv-org/iptv github.com/imDazui/Tvlist-awesome-m3u-m3u8 github.com/tvheadend/tvheadend github.com/Cigaras/IPTV.bundle github.com/lucifersun/China-Telecom-ShangHai-IPTV-list github.com/notanewbie/LegalStream github.com/Fleker/CumulusTV github.com/lylehust/Chinese-IPTV github.com/AlexanderSofronov/iptv.example github.com/chwlibre/iptv github.com/myIPTVChannels/lists github.com/free-greek-iptv/greek-iptv github.com/iptv-ch/iptv-ch.github.io github.com/iptv-restream/iptv-channels

:CONTINUEIPTV
call :SCALE 91 32
echo !cyan!
echo [23Cอออออออออออออออออออออออออออออออออออออออออออ
echo [22C// !red!Û!bgyellow!!black! INTERNET PROTOCOL TELEVISION (IPTV) !red!Û!bgblack!!cyan! \\
echo [7Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [7Cบ                                                                           บ
echo [7Cบ    !1!iptvcat.com!cyan!                ณ   !20!Sumon2021!cyan!                  บ
echo [7Cบ    !2!pro.allkaicerteam.com!cyan!      ณ   !21!mancinibig55!cyan!               บ
echo [7Cบ    !3!www.iptvm3ulist.com!cyan!        ณ   !22!firojshahriyarmasud!cyan!        บ
echo [7Cบ    !4!www.iptvm3ufree.com!cyan!        ณ   !23!duyminh215!cyan!                 บ
echo [7Cบ    !5!iptvmate.net!cyan!               ณ   !24!riqueenz!cyan!                   บ
echo [7Cบ    !6!www.links-iptv.com!cyan!         ณ   !25!iptv-org!cyan!                   บ
echo [7Cบ    !7!iptvforpcwindows.com!cyan!       ณ   !26!imDazui!cyan!                    บ
echo [7Cบ    !8!www.techtoreview.com!cyan!       ณ   !27!tvheadend!cyan!                  บ
echo [7Cบ    !9!www.iptv4free.com!cyan!          ณ   !28!Cigaras!cyan!                    บ
echo [7Cบ   !10!m3u.pktelcos.com!cyan!           ณ   !29!lucifersun!cyan!                 บ
echo [7Cบ   !11!freem3uhd.blogspot.com!cyan!     ณ   !30!notanewbie!cyan!                 บ
echo [7Cบ   !12!dailym3uiptv.com!cyan!           ณ   !31!Fleker!cyan!                     บ
echo [7Cบ   !13!www.iptv1.org!cyan!              ณ   !32!lylehust!cyan!                   บ
echo [7Cบ   !14!telechargeriptv.com!cyan!        ณ   !33!AlexanderSofronov!cyan!          บ
echo [7Cบ   !15!www.5kplayer.com!cyan!           ณ   !34!chwlibre!cyan!                   บ
echo [7Cบ   !16!monetareq!cyan!                  ณ   !35!myIPTVChannels!cyan!             บ
echo [7Cบ   !17!cbn88!cyan!                      ณ   !36!free-greek-iptv!cyan!            บ
echo [7Cบ   !18!Free-IPTV!cyan!                  ณ   !37!iptv-ch!cyan!                    บ
echo [7Cบ   !19!coodertv!cyan!                   ณ   !38!iptv-restream!cyan!              บ
echo [7Cบ                                                                           บ
echo [7Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" / "!yellow!INSTALL!grey!" / "!yellow!SEARCH!grey!" / "!yellow!HELP!grey!" !t2! !yellow!{!t3!}!grey!." 50
echo !red!
>nul 2>&1 reg query "HKCR\.m3u8" || (
if "!Language!"=="EN" echo [17CERROR: To be able to use !yellow!IPTV!red!, first you need to choose: !yellow![INSTALL]
if "!Language!"=="FR" echo [13CERREUR: Pour pouvoir utiliser !yellow!IPTV!red!, vous devez d'abord choisir: !yellow![INSTALL]
echo:
)
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEIPTV
call :CHOOSE install && (call :INSTALL_FILE VLC & goto :CONTINUEIPTV)
call :CHOOSE search && (call :IS_SEARCH a7a36a29816e9578f & goto :CONTINUEIPTV)
call :CHOOSE help && goto :IPTVTUTORIAL
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARIPTV
call :ERRORMESSAGE
goto :CONTINUEIPTV

:IPTVTUTORIAL
call :SCALE 151 37
title IPTV Tutorial
call :ROSE "Internet Protocol Television Tutorial"

:CONTINUEIPTVTUTORIAL
call :SCALE 151 37
echo !cyan!
echo [24Cอออออออออออออออออออออ
if "!Language!"=="EN" set t=TUTORIAL
if "!Language!"=="FR" set t=TUTORIEL
echo [23C// !red!Û!bgyellow!!black! IPTV !t! !red!Û!bgblack!!cyan! \\
echo [4Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [4Cบ                                                                                                                                             บ
if "!Language!"=="EN" echo [4Cบ        þÛ!bgyellow!!red!Û  What's IPTV (Wikipedia) ? Û!bgblack!!cyan!Ûþ                                                                                                  บ
if "!Language!"=="FR" echo [4Cบ        þÛ!bgyellow!!red!Û  Qu'est-ce que l'IPTV (Wikipedia) ? Û!bgblack!!cyan!Ûþ                                                                                         บ
echo [4Cบ                                                                                                                                             บ
if "!Language!"=="EN" echo [4Cบ    Internet Protocol television (IPTV) is the delivery of television content over Internet Protocol (IP) networks.                          บ
if "!Language!"=="FR" echo [4Cบ    La tlvision sur protocole Internet (IPTV) est la diffusion de contenu tlvisuel sur des rseaux IP (Internet Protocol).               บ
if "!Language!"=="EN" echo [4Cบ    This is in contrast to delivery through traditional terrestrial, satellite, and cable television formats.                                บ
if "!Language!"=="FR" echo [4Cบ    Cela contraste avec la diffusion via les formats traditionnels de tlvision terrestre, par satellite et par cble.                      บ
if "!Language!"=="EN" echo [4Cบ    Unlike downloaded media, IPTV offers the ability to stream the source media continuously.                                                บ
if "!Language!"=="FR" echo [4Cบ    Contrairement aux mdias tlchargs, IPTV offre la possibilit de diffuser en continu le mdia source.                                  บ
if "!Language!"=="EN" echo [4Cบ    As a result, a client media player can begin playing the content (such as a TV channel) almost immediately.                              บ
if "!Language!"=="FR" echo [4Cบ    En consquence, un lecteur multimdia client peut commencer … lire le contenu (comme une chane de tlvision) presque immdiatement.    บ
if "!Language!"=="EN" echo [4Cบ    This is known as streaming media.                                                                                                        บ
if "!Language!"=="FR" echo [4Cบ    C'est ce qu'on appelle le streaming multimdia.                                                                                          บ
echo [4Cบ                                                                                                                                             บ
if "!Language!"=="EN" echo [4Cบ    VLC is an open-source media player to stream and play any kind of media on all the available devices.                                    บ
if "!Language!"=="FR" echo [4Cบ    VLC est un lecteur multimdia open source pour diffuser et lire tout type de mdia sur tous les appareils disponibles.                   บ
echo [4Cบ                                                                                                                                             บ
if "!Language!"=="EN" echo [4Cบ    To access IPTV on VLC, make sure to have the following things listed below:                                                              บ
if "!Language!"=="FR" echo [4Cบ    Pour accder … l'IPTV sur VLC, assurez-vous que les lments suivants sont rpertoris ci-dessous:                                       บ
if "!Language!"=="EN" echo [4Cบ    - Internet connection                                                                                                                    บ
if "!Language!"=="FR" echo [4Cบ    - Connexion Internet                                                                                                                     บ
echo [4Cบ    - VLC Media Player                                                                                                                       บ
if "!Language!"=="EN" echo [4Cบ    - M3U or M3U8 URL (That you have downloaded in one of the previous Illegal Services IPTV links.)                                         บ
if "!Language!"=="FR" echo [4Cบ    - URL M3U ou M3U8 (que vous avez tlcharge dans l'un des liens IPTV de services illgaux prcdents.)                                  บ
echo [4Cบ                                                                                                                                             บ
echo [4Cบ                                                                                                                                             บ
if "!Language!"=="FR" echo [4Cบ        þÛ!bgyellow!!red!Û  Comment utiliser l'IPTV sur PC en utilisant VLC ? Û!bgblack!!cyan!Ûþ                                                                          บ
if "!Language!"=="EN" echo [4Cบ        þÛ!bgyellow!!red!Û  How to watch IPTV on PC using VLC ? Û!bgblack!!cyan!Ûþ                                                                                        บ
echo [4Cบ                                                                                                                                             บ
if "!Language!"=="EN" echo [4Cบ    [!yellow!1!cyan!]  ^> !white! Download and install VLC Media Player.!cyan!                                                                                           บ
if "!Language!"=="FR" echo [4Cบ    [!yellow!1!cyan!]  ^> !white! Tlchargez et installer VLC Media Player.!cyan!                                                                                       บ
if "!Language!"=="EN" echo [4Cบ    Launch VLC Media Player and choose "Media" from the menu bar.                                                                            บ
if "!Language!"=="FR" echo [4Cบ    Lancez VLC Media Player et choisissez "Media" dans la barre de menu.                                                                     บ
if "!Language!"=="EN" echo [4Cบ    Select "Open Network Stream" or press "Ctrl + N" on the keyboard to open directly.                                                       บ
if "!Language!"=="FR" echo [4Cบ    Slectionnez "Open Network Stream" ou appuyez sur "Ctrl + N" sur le clavier pour ouvrir directement.                                     บ
if "!Language!"=="EN" echo [4Cบ    Under the "Network tab", enter the M3U or M3U8 URL.                                                                                      บ
if "!Language!"=="FR" echo [4Cบ    Sous l'onglet "Rseau", entrez l'URL M3U ou M3U8.                                                                                        บ

if "!Language!"=="EN" echo [4Cบ    Click on "Play" to start to stream all the available content.                                                                            บ
if "!Language!"=="FR" echo [4Cบ    Cliquez sur "Play" pour commencer … diffuser tout le contenu disponible.                                                                 บ
if "!Language!"=="EN" echo [4Cบ    To navigate among channels, press "Ctrl + L" to view all the available content.                                                          บ
if "!Language!"=="FR" echo [4Cบ    Pour naviguer parmi les chanes, appuyez sur "Ctrl + L" pour afficher tout le contenu disponible.                                        บ
echo [4Cบ                                                                                                                                             บ
echo [4Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" !t2! !yellow!{!t3!}!grey!." 20
echo:
call :PROMPT
if "!x!"=="1" call :INSTALL_FILE VLC & goto :CONTINUEIPTVTUTORIAL
call :CHOOSE back && goto :IPTV
call :ERRORMESSAGE
goto :CONTINUEIPTVTUTORIAL

:DDL
call :ROSE "Direct Download Link"
for %%a in (EN FR) do if "!Language!"=="%%a" goto :DDL%%a

:DDLEN
call :SCALE 128 37
title Direct Download Link (DDL) [EN]

:CLEARDDLEN
call :CLEAR 1 71
set db=avxhm.is/ www.heroturko.net/ rmz.cr/ softarchive.is/ www.downduck.com/ scnlog.me/ www.creaxy.com/ downturk.net/ downarchive.org/ 0dayhome.net/ scene-rls.net/ www.freshwap.us/ www.apps4all.com/ dl4all.biz/ worldsrc.net/ movieparadise.org/ release.movieparadise.org/ hdencode.org/ katzdownload.com/ rlsbb.ru/ apps-pack.com/ oneddl.org/ `www.rlslog.net/ freshwap.cc/ dl4all.org/ warezomen.com/ www.scnsrc.me/ win7dl.org/ www.ddlvalley.me/ downtr.cc/ releasehive.com/ www.kokodown.com/ rlstop.net/ uhdmv.org/ tfpdl.to/ softddl.org/ 2ddl.it/ katzddl.net/ warezbb.net/ www.300mbfilms.ws/ snahp.it/ downloadhub.name/ filmsofts.com/ cgpersia.com/ rsload.net/ megaddl.co/ heroturko2.net/ crazy4tv.com/ x265.club/ hevcbay.com/ rarefilmm.com/ 1worldfree4u.trade/ the-eye.eu/ jpddl.com/ animeshare.cf/ anidl.org/ hi10anime.com/ animekayo.com/ animekaizoku.com/ ssanime.ga/ animetosho.org/ cdromance.com/ www.romnation.net/ vimm.net/ nxmac.com/ macdrop.net/ sheet-music.xyz/ audioz.download/ `audiobookbay.nl/ www.gfxtra31.com/ gfx-hub.cc/

:CONTINUEDDLEN
call :SCALE 128 37
echo !cyan!
echo [44Cอออออออออออออออออออออออออออออออออออออออ
echo [43C// !red!Û!bgyellow!!black! DIRECT DOWNLOAD LINK (DDL) [EN] !red!Û!bgblack!!cyan! \\
echo [6Cษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [6Cบ                                                                                                                  บ
echo [6Cบ    !1!avxhm.is!cyan!                     ณ   !25!dl4all.org!cyan!           ณ   !49!x265.club!cyan!                       บ
echo [6Cบ    !2!www.heroturko.net!cyan!            ณ   !26!warezomen.com!cyan!        ณ   !50!hevcbay.com!cyan!                     บ
echo [6Cบ    !3!rmz.cr!cyan!                       ณ   !27!www.scnsrc.me!cyan!        ณ   !51!rarefilmm.com!cyan!                   บ
echo [6Cบ    !4!softarchive.is!cyan!               ณ   !28!win7dl.org!cyan!           ณ   !52!1worldfree4u.trade!cyan!              บ
echo [6Cบ    !5!www.downduck.com!cyan!             ณ   !29!www.ddlvalley.me!cyan!     ณ   !53!the-eye.eu!cyan!                      บ
echo [6Cบ    !6!scnlog.me!cyan!                    ณ   !30!downtr.cc!cyan!            ณ   !54!jpddl.com !green!(animes)!cyan!              บ
echo [6Cบ    !7!www.creaxy.com!cyan!               ณ   !31!releasehive.co!cyan!       ณ   !55!animeshare.cf !green!(animes)!cyan!          บ
echo [6Cบ    !8!downturk.net!cyan!                 ณ   !32!www.kokodown.com!cyan!     ณ   !56!anidl.org !green!(animes)!cyan!              บ
echo [6Cบ    !9!downarchive.org!cyan!              ณ   !33!rlstop.net!cyan!           ณ   !57!hi10anime.com !green!(animes)!cyan!          บ
echo [6Cบ   !10!0dayhome.net!cyan!                 ณ   !34!uhdmv.org!cyan!            ณ   !58!animekayo.com !green!(animes)!cyan!          บ
echo [6Cบ   !11!scene-rls.net!cyan!                ณ   !35!tfpdl.to!cyan!             ณ   !59!animekaizoku.com !green!(animes)!cyan!       บ
echo [6Cบ   !12!www.freshwap.us!cyan!              ณ   !36!softddl.org!cyan!          ณ   !60!ssanime.ga !green!(animes)!cyan!             บ
echo [6Cบ   !13!www.apps4all.com!cyan!             ณ   !37!2ddl.it!cyan!              ณ   !61!animetosho.org !green!(animes)!cyan!         บ
echo [6Cบ   !14!dl4all.biz!cyan!                   ณ   !38!katzddl.net!cyan!          ณ   !62!cdromance.com !green!(roms)!cyan!            บ
echo [6Cบ   !15!worldsrc.net!cyan!                 ณ   !39!warezbb.net!cyan!          ณ   !63!www.romnation.net !green!(roms)!cyan!        บ
echo [6Cบ   !16!movieparadise.org!cyan!            ณ   !40!www.300mbfilms.ws!cyan!    ณ   !64!vimm.net !green!(roms)!cyan!                 บ
echo [6Cบ   !17!release.movieparadise.org!cyan!    ณ   !41!snahp.it!cyan!             ณ   !65!nxmac.com !green!(MAC)!cyan!                 บ
echo [6Cบ   !18!hdencode.org!cyan!                 ณ   !42!downloadhub.name!cyan!     ณ   !66!macdrop.net !green!(MAC)!cyan!               บ
echo [6Cบ   !19!katzdownload.com!cyan!             ณ   !43!filmsofts.com!cyan!        ณ   !67!sheet-music.xyz !green!(audio)!cyan!         บ
echo [6Cบ   !20!rlsbb.ru!cyan!                     ณ   !44!cgpersia.com!cyan!         ณ   !68!audioz.download !green!(audio)!cyan!         บ
echo [6Cบ   !21!apps-pack.com!cyan!                ณ   !45!rsload.net!cyan!           ณ   !69!audiobookbay.nl !green!(audiobooks)!cyan!    บ
echo [6Cบ   !22!oneddl.org!cyan!                   ณ   !46!megaddl.co!cyan!           ณ   !70!www.gfxtra31.com !green!(GFX)!cyan!          บ
echo [6Cบ   !23!www.rlslog.net!cyan!               ณ   !47!heroturko2.net!cyan!       ณ   !71!gfx-hub.cc !green!(GFX)!cyan!                บ
echo [6Cบ   !24!freshwap.cc!cyan!                  ณ   !48!crazy4tv.com!cyan!         ณ                                          บ
echo [6Cบ                                                                                                                  บ
echo [6Cศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" / "!yellow!SEARCH!grey!" / "!yellow!FR!grey!" !t2! !yellow!{!t3!}!grey!." 40
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEDDLEN
call :CHOOSE fr && goto :DDLFR
call :CHOOSE search && (call :IS_SEARCH 2bd1e5d9f5fe63b52 & goto :CONTINUEDDLEN)
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARDDLEN
call :ERRORMESSAGE
goto :CONTINUEDDLEN

:DDLFR
call :SCALE 71 24
title Direct Download Link (DDL) [FR]

:CLEARDDLFR
call :CLEAR 1 11
set db=www.tirexo.work/ free-telecharger.net/ libertyvf.bz/ www.extreme-down.live/home.html zone-telechargement.cam/ www.wawacity.one/ ww1.jeddl.com/ www.zone-mania.com/ www.zone-down.com/ nandesuka.moe/ 9docu.org/

:CONTINUEDDLFR
call :SCALE 71 24
echo !cyan!
echo [16Cอออออออออออออออออออออออออออออออออออออออ
echo [15C// !red!Û!bgyellow!!black! DIRECT DOWNLOAD LINK (DDL) [FR] !red!Û!bgblack!!cyan! \\
echo [9Cษออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [9Cบ                                                  บ
echo [9Cบ    !1!www.tirexo.work!cyan!                         บ
echo [9Cบ    !2!free-telecharger.net!cyan!                    บ
echo [9Cบ    !3!libertyvf.bz!cyan!                            บ
echo [9Cบ    !4!www.extreme-down.live!cyan!                   บ
echo [9Cบ    !5!zone-telechargement.cam!cyan!                 บ
echo [9Cบ    !6!www.wawacity.one!cyan!                        บ
echo [9Cบ    !7!ww1.jeddl.com!cyan!                           บ
echo [9Cบ    !8!www.zone-mania.com!cyan!                      บ
echo [9Cบ    !9!www.zone-down.com!cyan!                       บ
echo [9Cบ   !10!nandesuka.moe !green!(animes)!cyan!                  บ
echo [9Cบ   !11!9docu.org !green!(documentaries)!cyan!               บ
echo [9Cบ                                                  บ
echo [9Cศออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" / "!yellow!SEARCH!grey!" / "!yellow!EN!grey!" !t2! !yellow!{!t3!}!grey!." 40
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEDDLFR
call :CHOOSE en && goto :DDLEN
call :CHOOSE search && (call :IS_SEARCH 8c3502fdb5b858d5d & goto :CONTINUEDDLFR)
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARDDLFR
call :ERRORMESSAGE
goto :CONTINUEDDLFR

:STREAMING
title Streaming [!Language!]
if "!Language!"=="EN" (
call :SCALE 101 51
set t="No payment / installation / registration is required to view the videos on the sites offered by Illegal Service. All sites are free so watch out for scam advertising." "If the player is not visible, disable your ad blocker and click on the button to close the ad in the middle of the video then on the player's Play button to launch the video."
)
if "!Language!"=="FR" (
call :SCALE 101 45
set t="Aucun payment / installation / inscription n'est requis pour voir les videos sur les sites proposes par Illegal Service. Tous les sites sont gratuits donc faites attention aux publicites d'arnaques." "Si le lecteur n'est pas visible, desactiver votre bloqueur de publicites et clique sur le bouton pour fermer la pub au milieu de la video puis sur le bouton Play du lecteur pour lancer la video."
)
call :MSGBOX 2 !t!  69680 "Illegal Services Checker"
call :ROSE Streaming
for %%a in (EN FR) do if "!Language!"=="%%a" goto :STREAMING%%a

:STREAMINGEN
call :SCALE 101 51
title Streaming [EN]

:CLEARSTREAMINGEN
call :CLEAR 1 58
set db=www.primewire.li/ losmovies.app/ gomovie.co/ 123movies.jp/ www1.123movies.co/ www4.yesmovies.so/ 5movies.pw/ gomovies-online.cam/ myflixertv.to/ yesmovies.ag/ www11.123movieshub.one/ watch-serieshd.cc/ watchseriess.net/ flixtor.to/ fmovies.to/ lookmovie.io/ www2.solarmovie.to/ ww.123movies.sc/ frenzymovies.net/ supernova.to/ vumoo.to/ hulu.sc/ watchtvepisodes.me/ ww2.123movieshub.tc/ ww0.0gomovies.fm/ soap2day.to/ www1.movie4u.live/ cinehub.wtf/ openloadfreetv.me/ allmoviesforyou.co/ kisscartoon.info/ 9anime.to/ animesuge.io/ animeheaven.pro/ gogoanime.vc/ anime8.ru/ animeowl.net/ animefrenzy.org/ www1.kiss-anime.asia/ animevibe.wtf/ animixplay.to/ www2.kickassanime.ro/ animepahe.com/ ww1.animesimple.com/ zoro.to/ www1.animeultima.to/ animedao.to/ kissanimefree.to/ www1.7anime.io/ twist.moe/ runnel.ir/ time4tv.stream/ `123tv.live/ `livetv.sx/ iptv.stream2watch.sx/ sportplus.live/ sportsbay.org/live-streams thehomesport.com/

:CONTINUESTREAMINGEN
call :SCALE 101 51
echo !cyan!
echo [40Cออออออออออออออออออออออ
echo [39C// !red!Û!bgyellow!!black! STREAMING [EN] !red!Û!bgblack!!cyan! \\
echo [8Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [8CฬอออออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û FILMS Û!bgblack!!cyan!Ûþอออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                   บ
echo [8Cบ    !1!www.primewire.li!cyan!               ณ   !16!lookmovie.io!cyan!                   บ
echo [8Cบ    !2!losmovies.app!cyan!                  ณ   !17!www2.solarmovie.to!cyan!             บ
echo [8Cบ    !3!gomovie.co!cyan!                     ณ   !18!ww.123movies.sc!cyan!                บ
echo [8Cบ    !4!123movies.jp!cyan!                   ณ   !19!frenzymovies.net!cyan!               บ
echo [8Cบ    !5!www1.123movies.co!cyan!              ณ   !20!supernova.to!cyan!                   บ
echo [8Cบ    !6!www4.yesmovies.so!cyan!              ณ   !21!vumoo.to!cyan!                       บ
echo [8Cบ    !7!5movies.pw!cyan!                     ณ   !22!hulu.sc!cyan!                        บ
echo [8Cบ    !8!gomovies-online.cam!cyan!            ณ   !23!watchtvepisodes.me!cyan!             บ
echo [8Cบ    !9!myflixertv.to!cyan!                  ณ   !24!ww2.123movieshub.tc!cyan!            บ
echo [8Cบ   !10!yesmovies.ag!cyan!                   ณ   !25!ww0.0gomovies.fm!cyan!               บ
echo [8Cบ   !11!www11.123movieshub.one!cyan!         ณ   !26!soap2day.to!cyan!                    บ
echo [8Cบ   !12!watch-serieshd.cc!cyan!              ณ   !27!www1.movie4u.live!cyan!              บ
echo [8Cบ   !13!watchseriess.net!cyan!               ณ   !28!cinehub.wtf!cyan!                    บ
echo [8Cบ   !14!flixtor.to!cyan!                     ณ   !29!openloadfreetv.me!cyan!              บ
echo [8Cบ   !15!fmovies.to!cyan!                     ณ   !30!allmoviesforyou.co!cyan!             บ
echo [8Cบ                                                                                   บ
echo [8CฬอออออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û ANIMES Û!bgblack!!cyan!Ûþออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                   บ
echo [8Cบ   !31!kisscartoon.info!cyan!               ณ   !41!animixplay.to!cyan!                  บ
echo [8Cบ   !32!9anime.to!cyan!                      ณ   !42!www2.kickassanime.ro!cyan!           บ
echo [8Cบ   !33!animesuge.io!cyan!                   ณ   !43!animepahe.com!cyan!                  บ
echo [8Cบ   !34!animeheaven.pro!cyan!                ณ   !44!ww1.animesimple.com!cyan!            บ
echo [8Cบ   !35!gogoanime.vc!cyan!                   ณ   !45!zoro.to!cyan!                        บ
echo [8Cบ   !36!anime8.ru!cyan!                      ณ   !46!www1.animeultima.to!cyan!            บ
echo [8Cบ   !37!animeowl.net!cyan!                   ณ   !47!animedao.to!cyan!                    บ
echo [8Cบ   !38!animefrenzy.org!cyan!                ณ   !48!kissanimefree.to!cyan!               บ
echo [8Cบ   !39!www1.kiss-anime.asia!cyan!           ณ   !49!www1.7anime.io!cyan!                 บ
echo [8Cบ   !40!animevibe.wtf!cyan!                  ณ   !50!twist.moe!cyan!                      บ
echo [8Cบ                                                                                   บ
echo [8CฬอออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û TELEVISION Û!bgblack!!cyan!Ûþออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                   บ
echo [8Cบ   !51!runnel.ir!cyan!                      ณ   !55!iptv.stream2watch.sx !green!(sport)!cyan!   บ
echo [8Cบ   !52!time4tv.stream!cyan!                 ณ   !56!sportplus.live !green!(sport)!cyan!         บ
echo [8Cบ   !53!123tv.live!cyan!                     ณ   !57!sportsbay.org !green!(sport)!cyan!          บ
echo [8Cบ   !54!livetv.sx !green!(sport)!cyan!              ณ   !58!thehomesport.com !green!(sport)!cyan!       บ
echo [8Cบ                                                                                   บ
echo [8Cฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
call :DRAW_CENTER "!yellow!59!cyan!  >  !white!Streaming Applications!cyan!" 20
echo [8Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" / "!yellow!SEARCH!grey!" / "!yellow!FR!grey!" !t2! !yellow!{!t3!}!grey!." 40
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUESTREAMINGEN
if "!x!"=="59" (set la=EN) & goto :STREAMINGAPPS
call :CHOOSE fr && goto :STREAMINGFR
call :CHOOSE search && (call :IS_SEARCH ef3978005ffa01b49 & goto :CONTINUESTREAMINGEN)
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARSTREAMINGEN
call :ERRORMESSAGE
goto :CONTINUESTREAMINGEN

:STREAMINGFR
call :SCALE 101 46
title Streaming [FR]

:CLEARSTREAMINGFR
call :CLEAR 1 46
set db=www6.filmstreaming.to/ french-stream.re/ wvw.hds.lc/ hdss.papystreaming.net/ fcine.me/ libertyvf.bz/ www.filmstreaminglol.com/ streaming-films.net/ vfstreamiz.com/ wwv.streamfilm.cc/ www.illimitestreaming.co/ www.streaminz.me/ www.cinezzz.org/ voirseries.tv/ www.papystreaming.cc/ streamcomplet.buzz/ tratov.com/ voiranime.com/ neko-sama.fr/ french-manga.net/ www.adkami.com/ www.ianimes.org/ mavanimes.cc/ streaming-integrale.com/ gum-gum-streaming.com/ otakufr.co/ www.mavanimes.co/ vostanimes.tv/ toonanime.tv/ wvw.jetanimes.com/ vostfree.tv/ www.universanime.co/ dbanimes.com/ daijoubu.si/ animevostfr.tv/ animecomplet.me/ `www.anime-ultime.net/ v5.anime-ultime.net/ channelstream.watch/ www.myfree-tivi.com/ `livetv.sx/frx/ antennesport.tv/ fr4.sportplus.live/ sport-stream.live/ `streaming-sport.tv/

:CONTINUESTREAMINGFR
call :SCALE 101 46
echo !cyan!
echo [40Cออออออออออออออออออออออ
echo [39C// !red!Û!bgyellow!!black! STREAMING [FR] !red!Û!bgblack!!cyan! \\
echo [8Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [8CฬอออออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û FILMS Û!bgblack!!cyan!Ûþอออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                   บ
echo [8Cบ    !1!www6.filmstreaming.to!cyan!          ณ   !10!wwv.streamfilm.cc!cyan!
echo [8Cบ    !2!french-stream.re!cyan!               ณ   !11!www.illimitestreaming.co!cyan!       บ
echo [8Cบ    !3!wvw.hds.lc!cyan!                     ณ   !12!www.streaminz.me!cyan!               บ
echo [8Cบ    !4!hdss.papystreaming.net!cyan!         ณ   !13!www.cinezzz.org!cyan!                บ
echo [8Cบ    !5!fcine.me!cyan!                       ณ   !14!voirseries.tv !green!(series)!cyan!         บ
echo [8Cบ    !6!libertyvf.bz!cyan!                   ณ   !15!www.papystreaming.cc!cyan!           บ
echo [8Cบ    !7!www.filmstreaminglol.com!cyan!       ณ   !16!streamcomplet.buzz!cyan!             บ
echo [8Cบ    !8!streaming-films.net!cyan!            ณ   !17!tratov.com!cyan!                     บ
echo [8Cบ    !9!vfstreamiz.com!cyan!                 ณ                                         บ
echo [8Cบ                                                                                   บ
echo [8CฬอออออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û ANIMES Û!bgblack!!cyan!Ûþออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                   บ
echo [8Cบ   !18!voiranime.com!cyan!                  ณ   !29!toonanime.tv!cyan!                   บ
echo [8Cบ   !19!neko-sama.fr!cyan!                   ณ   !30!wvw.jetanimes.com!cyan!              บ
echo [8Cบ   !20!french-manga.net!cyan!               ณ   !31!vostfree.tv!cyan!                    บ
echo [8Cบ   !21!www.adkami.com!cyan!                 ณ   !32!www.universanime.co!cyan!            บ
echo [8Cบ   !22!www.ianimes.org!cyan!                ณ   !33!dbanimes.com!cyan!                   บ
echo [8Cบ   !23!mavanimes.cc!cyan!                   ณ   !34!daijoubu.si!cyan!                    บ
echo [8Cบ   !24!streaming-integrale.com!cyan!        ณ   !35!animevostfr.tv!cyan!                 บ
echo [8Cบ   !25!gum-gum-streaming.com!cyan!          ณ   !36!animecomplet.me!cyan!                บ
echo [8Cบ   !26!otakufr.co!cyan!                     ณ   !37!www.anime-ultime.net!cyan!           บ
echo [8Cบ   !27!www.mavanimes.co!cyan!               ณ   !38!v5.anime-ultime.net!cyan!            บ
echo [8Cบ   !28!vostanimes.tv!cyan!                  ณ                                         บ
echo [8Cบ                                                                                   บ
echo [8CฬอออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û TELEVISION Û!bgblack!!cyan!Ûþออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                   บ
echo [8Cบ   !39!channelstream.watch!cyan!            ณ   !43!fr4.sportplus.live !green!(sport)!cyan!     บ
echo [8Cบ   !40!www.myfree-tivi.com!cyan!            ณ   !44!sport-stream.live !green!(sport)!cyan!      บ
echo [8Cบ   !41!livetv.sx !green!(sport)!cyan!              ณ   !45!streaming-sport.tv !green!(sport)!cyan!     บ
echo [8Cบ   !42!antennesport.tv !green!(sport)!cyan!        ณ                                         บ
echo [8Cบ                                                                                   บ
echo [8Cฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
call :DRAW_CENTER "!yellow!46!cyan!  >  !white!Streaming Applications!cyan!" 20
echo [8Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" / "!yellow!SEARCH!grey!" / "!yellow!EN!grey!" !t2! !yellow!{!t3!}!grey!." 40
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUESTREAMINGFR
if "!x!"=="46" (set la=FR) & goto :STREAMINGAPPS
call :CHOOSE en && goto :STREAMINGEN
call :CHOOSE search && (call :IS_SEARCH e49c0bfe5fd6d7fb6 & goto :CONTINUESTREAMINGFR)
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARSTREAMINGFR
call :ERRORMESSAGE
goto :CONTINUESTREAMINGFR

:STREAMINGAPPS
call :SCALE 109 36
title Streaming Applications
call :ROSE "Streaming Applications"

:CLEARSTREAMINGAPPS
call :CLEAR 1 16
set db=popcorn-time.tw/ www.stremio.com/ cinemaapk.com/ www.cinehub.app/ teatv.net/ www.morpheustvbox.com/ mediaboxhd.net/ www.vivatv.io/ www.beetvapk.me/ filmplus.app/ www.novatvapk.com/ kisscartoon.info/kisscartoon-official-android-app/ animixplay.to/android/app animeglare.xyz/ tvmob.net/ www.livenettv.bz/

:CONTINUESTREAMINGAPPS
call :SCALE 109 36
echo !cyan!
echo [40Cออออออออออออออออออออออออออออออ
echo [39C// !red!Û!bgyellow!!black! STREAMING APPLICATIONS !red!Û!bgblack!!cyan! \\
echo [6Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [6CฬออออออออþÛ!bgyellow!!red!Û Windows Û!bgblack!!cyan!ÛþออออออออหอออออออออþÛ!bgyellow!!red!Û macOS Û!bgblack!!cyan!ÛþอออออออออหอออออออออþÛ!bgyellow!!red!Û Linux Û!bgblack!!cyan!Ûþอออออออออน
echo [6Cบ                               บ                               บ                               บ
echo [6Cบ    !1!popcorn-time.tw!cyan!      บ    !1!popcorn-time.tw!cyan!      บ    !1!popcorn-time.tw!cyan!      บ
echo [6Cบ    !2!www.stremio.com!cyan!      บ    !2!www.stremio.com!cyan!      บ    !2!www.stremio.com!cyan!      บ
echo [6Cบ                               บ                               บ                               บ
echo [6Cฬอออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออน
echo [6CฬออออออออออออออออþÛ!bgyellow!!red!Û Android Û!bgblack!!cyan!ÛþออออออออออออออออหออออออออออออออออออþÛ!bgyellow!!red!Û iOS Û!bgblack!!cyan!Ûþออออออออออออออออออน
echo [6Cบ                                               บ                                               บ
echo [6Cบ        !1!popcorn-time.tw!cyan!                  บ          !1!popcorn-time.tw!cyan!                บ
echo [6Cบ        !2!www.stremio.com!cyan!                  บ          !2!www.stremio.com!cyan!                บ
echo [6Cบ        !3!cinemaapk.com!cyan!                    บ          !7!mediaboxhd.net!cyan!                 บ
echo [6Cบ        !4!www.cinehub.app!cyan!                  บ         !11!animeglare.xyz !green!(animes)!cyan!        บ
echo [6Cบ        !5!teatv.net!cyan!                        บ                                               บ
echo [6Cบ        !6!www.morpheustvbox.com!cyan!            บ                                               บ
echo [6Cบ        !7!mediaboxhd.net!cyan!                   บ                                               บ
echo [6Cบ        !8!www.vivatv.io!cyan!                    บ                                               บ
echo [6Cบ        !9!www.beetvapk.me!cyan!                  บ                                               บ
echo [6Cบ       !10!filmplus.app!cyan!                     บ                                               บ
echo [6Cบ       !11!www.novatvapk.com!cyan!                บ                                               บ
echo [6Cบ       !12!kisscartoon.info !green!(animes)!cyan!        บ                                               บ
echo [6Cบ       !13!animixplay.to !green!(animes)!cyan!           บ                                               บ
echo [6Cบ       !14!animeglare.xyz !green!(animes)!cyan!          บ                                               บ
echo [6Cบ       !15!tvmob.net !green!(television)!cyan!           บ                                               บ
echo [6Cบ       !16!www.livenettv.bz !green!(television)!cyan!    บ                                               บ
echo [6Cบ                                               บ                                               บ
echo [6Cศอออออออออออออออออออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" !t2! !yellow!{!t3!}!grey!." 20
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUESTREAMINGAPPS
call :CHOOSE back && goto :CLEARSTREAMING!la!
call :WEBSITESTART && goto :CLEARSTREAMINGAPPS
call :ERRORMESSAGE
goto :CONTINUESTREAMINGAPPS

:TORRENTING
call :SCALE 133 53
title Torrenting
call :ROSE Torrenting

:CLEARTORRENTING
call :CLEAR 1 78
set db=bitsearch.to/ www.limetorrents.pro/ www.torrentfunk.com/ www.toros.co/ www.gtdb.to/ www.torrentdownloads.pro/ 1337x.to/ rarbg.to/index80.php www.ettvcentral.com/ torrentz2k.xyz/ thepiratebay.org/index.html prostylex.org/ torrentgalaxy.to/ yourbittorrent.com/ anidex.info/ www.demonoid.is/ angietorrents.cc/ www.torrentdownload.info/ badasstorrents.com/ concen.org/torrents nyaa.si/ www.anirena.com/ subsplease.org/ mac-torrent-download.net/ mac-torrents.io/ yts.mx/ eztv.re/ www3.yggtorrent.nz/ www.sharewood.tv/ www.montorrent.com/ www.oxtorrent.cx/ torrent9.to/ filelisting.com/ bt4g.org/ www.7torrents.cc/ bitcq.com/ knaben.eu/ torrentproject2.com/ torrent-paradise.ml/ btdig.com/ ext.to/ www.torlock.com/ ibit.to/ zooqle.com/ torrentparadise.pm/ snowfl.com/ idope.se/ isohunt.app/ extratorrents.it/ pirateiro.com/ torrentseeker.com/ otorrents.com/ vstorrent.org/ torrents-csv.ml/ search.torrends.to/ proxy-bay.net/ proxygalaxy.pw/ yifystatus.com/ eztvstatus.com/ ettvproxies.com/ siteunblocked.info/ unblockproject.monster/ unblocksource.net/ unblockit.ch/ torrentbay.to/ proxyninja.org/ knaben.info/ unblocktorrent.com/ torrends.to/ github.com/Jackett/Jackett www.qbittorrent.org/ www.torrentrover.com/ sonarr.tv/ radarr.video/ lidarr.audio/ github.com/SchizoDuckie/DuckieTV couchpota.to/

:CONTINUETORRENTING
call :SCALE 133 53
echo !cyan!
echo [57Cออออออออออออออออออ
echo [56C// !red!Û!bgyellow!!black! TORRENTING !red!Û!bgblack!!cyan! \\
echo [8Cษออออออออออออออออออออออออออออออออออออออออออออออ//ออออออออออออออออออ\\อออออออออออออออออออออออออออออออออออออออออออออออป
echo [8CฬออออออออออออออออออออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û English Û!bgblack!!cyan!Ûþออออออออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                   บ
echo [8Cบ    !1!bitsearch.to!cyan!               ณ   !10!torrentz2k.xyz!cyan!           ณ   !19!www.torrentdownload.info!cyan!       บ
echo [8Cบ    !2!www.limetorrents.pro!cyan!       ณ   !11!thepiratebay.org!cyan!         ณ   !20!concen.org!cyan!                     บ
echo [8Cบ    !3!www.torrentfunk.com!cyan!        ณ   !12!prostylex.org!cyan!            ณ   !21!nyaa.si !green!(animes)!cyan!               บ
echo [8Cบ    !4!www.toros.co!cyan!               ณ   !13!torrentgalaxy.to!cyan!         ณ   !22!www.anirena.com !green!(animes)!cyan!       บ
echo [8Cบ    !5!www.gtdb.to!cyan!                ณ   !14!yourbittorrent.com!cyan!       ณ   !23!subsplease.org !green!(animes)!cyan!        บ
echo [8Cบ    !6!www.torrentdownloads.pro!cyan!   ณ   !15!anidex.info!cyan!              ณ   !24!mac-torrent-download.net !green!(MAC)!cyan! บ
echo [8Cบ    !7!1337x.to!cyan!                   ณ   !16!www.demonoid.is!cyan!          ณ   !25!mac-torrents.io !green!(MAC)!cyan!          บ
echo [8Cบ    !8!rarbg.to!cyan!                   ณ   !17!angietorrents.cc!cyan!         ณ   !26!yts.mx !green!(movies)!cyan!                บ
echo [8Cบ    !9!www.ettvcentral.com!cyan!        ณ   !18!badasstorrents.com!cyan!       ณ   !27!eztv.re !green!(TV)!cyan!                   บ
echo [8Cบ                                                                                                                   บ
echo [8CฬออออออออออออออออออออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û French Û!bgblack!!cyan!Ûþอออออออออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                   บ
echo [8Cบ   !28!www3.yggtorrent.nz!cyan!         ณ   !30!www.montorrent.com!cyan!       ณ   !32!torrent9.to!cyan!                    บ
echo [8Cบ   !29!www.sharewood.tv!cyan!           ณ   !31!www.oxtorrent.cx!cyan!         ณ                                         บ
echo [8Cบ                                                                                                                   บ
echo [8CฬอออออออออออออออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û Torrent Searching Û!bgblack!!cyan!Ûþอออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                   บ
echo [8Cบ   !33!filelisting.com!cyan!            ณ   !41!ext.to!cyan!                   ณ   !49!extratorrents.it!cyan!               บ
echo [8Cบ   !34!bt4g.org!cyan!                   ณ   !42!www.torlock.com!cyan!          ณ   !50!pirateiro.com!cyan!                  บ
echo [8Cบ   !35!www.7torrents.cc!cyan!           ณ   !43!ibit.to!cyan!                  ณ   !51!torrentseeker.com!cyan!              บ
echo [8Cบ   !36!bitcq.com!cyan!                  ณ   !44!zooqle.com!cyan!               ณ   !52!otorrents.com!cyan!                  บ
echo [8Cบ   !37!knaben.eu!cyan!                  ณ   !45!torrentparadise.pm!cyan!       ณ   !53!vstorrent.org!cyan!                  บ
echo [8Cบ   !38!torrentproject2.com!cyan!        ณ   !46!snowfl.com!cyan!               ณ   !54!torrents-csv.ml!cyan!                บ
echo [8Cบ   !39!torrent-paradise.ml!cyan!        ณ   !47!idope.se!cyan!                 ณ   !55!search.torrends.to!cyan!             บ
echo [8Cบ   !40!btdig.com!cyan!                  ณ   !48!isohunt.app!cyan!              ณ                                         บ
echo [8Cบ                                                                                                                   บ
echo [8CฬออออออออออออออออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û Torrent Proxys Û!bgblack!!cyan!Ûþอออออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                   บ
echo [8Cบ   !56!proxy-bay.net!cyan!              ณ   !61!siteunblocked.info!cyan!       ณ   !66!proxyninja.org!cyan!                 บ
echo [8Cบ   !57!proxygalaxy.pw!cyan!             ณ   !62!unblockproject.monster!cyan!   ณ   !67!knaben.info!cyan!                    บ
echo [8Cบ   !58!yifystatus.com!cyan!             ณ   !63!unblocksource.net!cyan!        ณ   !68!unblocktorrent.com!cyan!             บ
echo [8Cบ   !59!eztvstatus.com!cyan!             ณ   !64!unblockit.ch!cyan!             ณ   !69!torrends.to!cyan!                    บ
echo [8Cบ   !60!ettvproxies.com!cyan!            ณ   !65!torrentbay.to!cyan!            ณ                                         บ
echo [8Cบ                                                                                                                   บ
echo [8CฬอออออออออออออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û Torrent Applications Û!bgblack!!cyan!Ûþออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                   บ
echo [8Cบ   !70!Jacket!cyan!                     ณ   !73!sonarr.tv!cyan!                ณ   !76!DuckieTV!cyan!                       บ
echo [8Cบ   !71!www.qbittorrent.org!cyan!        ณ   !74!radarr.video!cyan!             ณ   !77!couchpota.to!cyan!                   บ
echo [8Cบ   !72!www.torrentrover.com!cyan!       ณ   !75!lidarr.audio!cyan!             ณ                                         บ
echo [8Cบ                                                                                                                   บ
echo [8Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" / "!yellow!INSTALL!grey!" / "!yellow!SEARCH!grey!" / "!yellow!ADD!grey!" / "!yellow!HELP!grey!" !t2! !yellow!{!t3!}!grey!." 60
echo !red!
>nul 2>&1 reg query "HKCR\.torrent" || (
if "!Language!"=="EN" call :DRAW_CENTER "ERROR: To be able to use !yellow!TORRENTING!red!, first you need to choose: !yellow![INSTALL]" 15
if "!Language!"=="FR" call :DRAW_CENTER "ERREUR: Pour pouvoir utiliser !yellow!TORRENTING!red!, vous devez d'abord choisir: !yellow![INSTALL]" 15
echo:
)
call :PROMPT
call :WEBSITECHECK && goto :CONTINUETORRENTING
call :CHOOSE install && (call :INSTALL_FILE qBittorent & goto :CONTINUETORRENTING)
call :CHOOSE search && (call :IS_SEARCH 4d5e330a21ba32b26 & goto :CONTINUETORRENTING)
call :CHOOSE add && goto :ADDTORRENT
call :CHOOSE help && goto :TORRENTTUTORIAL
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARTORRENTING
call :ERRORMESSAGE
goto :CONTINUETORRENTING

:TORRENTTUTORIAL
call :SCALE 150 23
call :ROSE "Torrent Tutorial"

:CONTINUETORRENTTUTORIAL
call :SCALE 150 23
title Torrent Tutorial
echo !cyan!
echo [42Cออออออออออออออออออออออออ
if "!Language!"=="EN" set t=TUTORIAL
if "!Language!"=="FR" set t=TUTORIEL
echo [41C// !red!Û!bgyellow!!black! TORRENT !t! !red!Û!bgblack!!cyan! \\
echo [4Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [4Cบ                                                                                                                                           บ
if "!Language!"=="EN" echo [4Cบ                          þÛ!bgyellow!!red!Û  What's a torrent (Wikipedia) ? Û!bgblack!!cyan!Ûþ                                                                         บ
if "!Language!"=="FR" echo [4Cบ                          þÛ!bgyellow!!red!Û  Qu'est-ce qu'un torrent (Wikipedia) ? Û!bgblack!!cyan!Ûþ                                                                  บ
echo [4Cบ                                                                                                                                           บ
if "!Language!"=="EN" echo [4Cบ  Torrents are a method of distributing files over the internet.                                                                           บ
if "!Language!"=="FR" echo [4Cบ  Le Torrent est une mthode de distribution de fichiers sur Internet.                                                                     บ
if "!Language!"=="EN" echo [4Cบ  It operate over the BitTorrent protocol to facilitate what's called peer-to-peer (P2P) file sharing.                                     บ
if "!Language!"=="FR" echo [4Cบ  Il fonctionne sur le protocole Bittorrent pour faciliter ce que l'on appelle le partage de fichiers peer-to-peer (P2P).                  บ
if "!Language!"=="EN" echo [4Cบ  The most common way to use torrents is through a special file that uses the .torrent file extension.                                     บ
if "!Language!"=="FR" echo [4Cบ  La faont la plus courante d'utiliser des torrents consiste … utiliser un fichier spcial qui utilise l'extension de fichier .torrent    บ
echo [4Cบ                                                                                                                                           บ
if "!Language!"=="EN" echo [4Cบ                           þÛ!bgyellow!!red!Û  How to open .torrent files ? Û!bgblack!!cyan!Ûþ                                                                          บ
if "!Language!"=="FR" echo [4Cบ                          þÛ!bgyellow!!red!Û  Comment ouvrir des fichiers .torrent ? Û!bgblack!!cyan!Ûþ                                                                 บ
echo [4Cบ                                                                                                                                           บ
if "!Language!"=="EN" echo [4Cบ  !yellow!1!cyan!  ^> !white! Download and install qBittorrent.!cyan!                                                                                                  บ
if "!Language!"=="FR" echo [4Cบ  !yellow!1!cyan!  ^> !white! Tlchargez et installer qBittorrent.!cyan!                                                                                              บ
if "!Language!"=="EN" echo [4Cบ  Then you can run the .torrent that you have downloaded in one of the previous Illegal Services Torrenting links.                         บ
if "!Language!"=="FR" echo [4Cบ  Ensuite, vous pouvez excuter le .torrent que vous avez tlcharg dans l'un des liens de Torrenting depuis Illegal Services.            บ
echo [4Cบ                                                                                                                                           บ
echo [4Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" !t2! !yellow!{!t3!}!grey!." 20
echo:
call :PROMPT
if "!x!"=="1" call :INSTALL_FILE qBittorent & goto :CONTINUETORRENTTUTORIAL
call :CHOOSE back && goto :TORRENTING
call :ERRORMESSAGE
goto :CONTINUETORRENTTUTORIAL

:ADDTORRENT
echo !cyan!
if "!Language!"=="EN" (
echo This option allow you to create a magnet link with an HASH.
echo Exemple of an HASH: "c12fe1c06bba254a9dc9f519b335aa7c1367a88a"
)
if "!Language!"=="FR" (
echo Cette option vous permet de crer un lien magntique avec un HASH.
echo Exemple d'un HASH: "c12fe1c06bba254a9dc9f519b335aa7c1367a88a"
)
>nul 2>&1 reg query "HKCR\magnet\shell\open\command" || goto :ERROR_ADDTORRENT
echo !cyan!
if "!Language!"=="EN" set t=Type the torrent's HASH
if "!Language!"=="FR" set t=Entrez le HASH du torrent
%showcursor%
set x=
set /p "x=!t!: !yellow!"
%hidecursor%
call :CHOOSE back && goto :CONTINUETORRENTING
if defined x if "!x:~39!"=="!x:~-1!" start "" "magnet:?xt=urn:btih:!x!" && goto :CONTINUETORRENTING || goto :ERROR_ADDTORRENT
echo !cyan!
call :ERRORMESSAGE
goto :CONTINUETORRENTING

:ERROR_ADDTORRENT
echo !red!
if "!Language!"=="EN" (
echo ERROR: You need a working bittorrent platform in order to make magnet links working.
echo Do you want to install qBittorrent in order to make it working ? [!yellow!YES!red!] / [!yellow!NO!red!]
>nul choice /n /c YN
)
if "!Language!"=="FR" (
echo ERREUR: vous avez besoin d'une plate-forme bittorrent fonctionnelle pour que les liens magntiques fonctionnent.
echo Voulez-vous installer qBittorrent pour le faire fonctionner ? [!yellow!OUI!red!] / [!yellow!NON!red!]
>nul choice /n /c ON
)
if "!errorlevel!"=="1" call :INSTALL_FILE qBittorent
goto :CONTINUETORRENTING

:SUBTITLES
call :SCALE 72 35
title Subtitles
call :ROSE Subtitles

:CLEARSUBTITLES
call :CLEAR 1 23
set db=subscene.com/ www.opensubtitles.com/ www.opensubtitles.org/ opensubtitle.info/ ytsubtitles.com/ yifysubtitles.org/ yts-subs.com/ subs.dog/ www.subs4free.info/ www.subtitledb.org/ www.addic7ed.com/ isubtitles.org/ subdl.com/ `www.moviesubtitles.net/ www.podnapisi.net/ tvsubs.net/ www.tvsubtitles.net/ www.subdivx.com/ www.subtitlecat.com/ www.sous-titres.eu/ www.u-sub.net/ www.kitsunekko.net/ subs.nandesuka.workers.dev/

:CONTINUESUBTITLES
call :SCALE 72 35
echo !cyan!
echo [9Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [9CฬออออออออออออออออออþÛ!bgyellow!!red!Û SUBTITLES Û!bgblack!!cyan!Ûþออออออออออออออออออน
echo [9Cบ                                                     บ
echo [9Cบ    !1!subscene.com!cyan!                               บ
echo [9Cบ    !2!www.opensubtitles.com!cyan!                      บ
echo [9Cบ    !3!www.opensubtitles.org!cyan!                      บ
echo [9Cบ    !4!opensubtitle.info!cyan!                          บ
echo [9Cบ    !5!ytsubtitles.com!cyan!                            บ
echo [9Cบ    !6!yifysubtitles.org!cyan!                          บ
echo [9Cบ    !7!yts-subs.com!cyan!                               บ
echo [9Cบ    !8!subs.dog!cyan!                                   บ
echo [9Cบ    !9!www.subs4free.info!cyan!                         บ
echo [9Cบ   !10!www.subtitledb.org!cyan!                         บ
echo [9Cบ   !11!www.addic7ed.com!cyan!                           บ
echo [9Cบ   !12!isubtitles.org!cyan!                             บ
echo [9Cบ   !13!subdl.com!cyan!                                  บ
echo [9Cบ   !14!www.moviesubtitles.net!cyan!                     บ
echo [9Cบ   !15!www.podnapisi.net!cyan!                          บ
echo [9Cบ   !16!tvsubs.net!cyan!                                 บ
echo [9Cบ   !17!www.tvsubtitles.net!cyan!                        บ
echo [9Cบ   !18!www.subdivx.com!cyan!                            บ
echo [9Cบ   !19!www.subtitlecat.com!cyan!                        บ
echo [9Cบ   !20!www.sous-titres.eu!cyan!                         บ
echo [9Cบ   !21!www.u-sub.net!cyan!                              บ
echo [9Cบ   !22!www.kitsunekko.net !green!(animes)!cyan!                บ
echo [9Cบ   !23!subs.nandesuka.workers.dev !green!(animes) [FR]!cyan!   บ
echo [9Cบ                                                     บ
echo [9Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" / "!yellow!SEARCH!grey!" !t2! !yellow!{!t3!}!grey!." 30
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUESUBTITLES
call :CHOOSE search && (call :IS_SEARCH 44c549fe875e83514 & goto :CONTINUESUBTITLES)
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARSUBTITLES
call :ERRORMESSAGE
goto :CONTINUESUBTITLES

:WINDOWS
call :SCALE 136 52
title Cracked Windows apps
call :ROSE "Cracked Windows apps"

:CLEARWINDOWS
call :CLEAR 1 76
set db=getintopc.com/ crackingpatching.com/ karanpc.com/ filecr.com/ s0ft4pc.com/ www.mazterize.com/ gigapurbalingga.net/ appnee.com/ www.sadeempc.com/ shareappscrack.com/ free4pc.org/ appload.club/ izofile.com/ www.novahax.com/ haxnode.net/ lostvayne.com/ filewomen.com/ crackshash.com/ www.cybermania.ws/ cracksurl.com/ fileriver.net/ piratepc.me/ ftuapps.dev/ starcrack.net/ startcrack.net/ keygenninja.net/ fileash.com/ www.trucnet.com/ w14.monkrus.ws/ `www.intercambiosvirtuales.org/ diakov.net/ lrepacks.net/ repack.me/ portable4pc.com/ www.fcportables.com/software/ portableappz.blogspot.com/ igg-games.com/ pcgamestorrents.com/ www.skidrowcodex.net/ www.mrpcgamer.co/ www.game3rb.com/ agfy.co/ cracked-games.org/ www.ovagames.com/ steamunlocked.net/ gog-games.com/ codex-games.com/ getgamez.net/ www.elamigos-games.com/ crackhub.site/ freegameshub.co/ gogunlocked.com/ alltorrents.co/ www.myabandonware.com/ gamesnostalgia.com/ cygames.fr/ telecharger-jeuxpc.fr/ www.gamestorrents.fm/ repack-games.com/ www.game-repack.site/ elamigos.site/ fitgirl-repacks.site/ repack-mechanics.com/ gamesdrive.net/ darckrepacks.com/ dodi-repacks.site/ www.blackboxrepack.com/ masquerade.site/ scooter-repacks.site/ www.gnarly-repacks.site/ cpgrepacks.site/ www.tiny-repacks.win/ repack.info/ m4ckd0ge-repacks.me/ e13.xatab-repack.com/ qoob.name/

:CONTINUEWINDOWS
call :SCALE 136 52
echo !cyan!
echo [56Cออออออออออออออออออออออออออออ
echo [55C// !red!Û!bgyellow!!black! CRACKED WINDOWS APPS !red!Û!bgblack!!cyan! \\
echo [8Cษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [8CฬอออออออออออออออออออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û Applications Û!bgblack!!cyan!Ûþอออออออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                      บ
echo [8Cบ    !1!getintopc.com!cyan!           ณ   !11!free4pc.org!cyan!                ณ   !21!fileriver.net!cyan!                      บ
echo [8Cบ    !2!crackingpatching.com!cyan!    ณ   !12!appload.club!cyan!               ณ   !22!piratepc.me!cyan!                        บ
echo [8Cบ    !3!karanpc.com!cyan!             ณ   !13!izofile.com!cyan!                ณ   !23!ftuapps.dev!cyan!                        บ
echo [8Cบ    !4!filecr.com!cyan!              ณ   !14!www.novahax.com!cyan!            ณ   !24!starcrack.net!cyan!                      บ
echo [8Cบ    !5!s0ft4pc.com!cyan!             ณ   !15!haxnode.net!cyan!                ณ   !25!startcrack.net!cyan!                     บ
echo [8Cบ    !6!www.mazterize.com!cyan!       ณ   !16!lostvayne.com!cyan!              ณ   !26!keygenninja.net!cyan!                    บ
echo [8Cบ    !7!gigapurbalingga.net!cyan!     ณ   !17!filewomen.com!cyan!              ณ   !27!fileash.com!cyan!                        บ
echo [8Cบ    !8!appnee.com!cyan!              ณ   !18!crackshash.com!cyan!             ณ   !28!www.trucnet.com !green!(FR)!cyan!               บ
echo [8Cบ    !9!www.sadeempc.com!cyan!        ณ   !19!www.cybermania.ws!cyan!          ณ   !29!w14.monkrus.ws !green!(RU)!cyan!                บ
echo [8Cบ   !10!shareappscrack.com!cyan!      ณ   !20!cracksurl.com!cyan!              ณ   !30!www.intercambiosvirtuales.org !green!(ES)!cyan! บ
echo [8Cบ                                                                                                                      บ
echo [8CฬอออออออออออออออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û Application Repacks Û!bgblack!!cyan!Ûþออออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                      บ
echo [8Cบ   !31!diakov.net !green!(RU)!cyan!         ณ   !32!lrepacks.net !green!(RU)!cyan!          ณ   !33!repack.me !green!(RU)!cyan!                     บ
echo [8Cบ                                                                                                                      บ
echo [8CฬออออออออออออออออออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û Portable Apps Û!bgblack!!cyan!Ûþอออออออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                      บ
echo [8Cบ   !34!portable4pc.com!cyan!         ณ   !35!www.fcportables.com!cyan!        ณ   !36!portableappz.blogspot.com!cyan!          บ
echo [8Cบ                                                                                                                      บ
echo [8CฬออออออออออออออออออออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û Videogames Û!bgblack!!cyan!Ûþออออออออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                      บ
echo [8Cบ   !37!igg-games.com !red!(unsafe)!cyan!  ณ   !45!steamunlocked.net!cyan!          ณ   !53!alltorrents.co!cyan!                     บ
echo [8Cบ   !38!pcgamestorrents.com!cyan!     ณ   !46!gog-games.com!cyan!              ณ   !54!www.myabandonware.com !green!(retro)!cyan!      บ
echo [8Cบ   !39!www.skidrowcodex.net!cyan!    ณ   !47!codex-games.com!cyan!            ณ   !55!gamesnostalgia.com !green!(retro)!cyan!         บ
echo [8Cบ   !40!www.mrpcgamer.co!cyan!        ณ   !48!getgamez.net!cyan!               ณ   !56!cygames.fr !green!(FR)!cyan!                    บ
echo [8Cบ   !41!www.game3rb.com!cyan!         ณ   !49!www.elamigos-games.com!cyan!     ณ   !57!telecharger-jeuxpc.fr !green!(FR)!cyan!         บ
echo [8Cบ   !42!agfy.co!cyan!                 ณ   !50!crackhub.site!cyan!              ณ   !58!www.gamestorrents.fm !green!(ES)!cyan!          บ
echo [8Cบ   !43!cracked-games.org!cyan!       ณ   !51!freegameshub.co!cyan!            ณ                                             บ
echo [8Cบ   !44!www.ovagames.com!cyan!        ณ   !52!gogunlocked.com!cyan!            ณ                                             บ
echo [8Cบ                                                                                                                      บ
echo [8CฬออออออออออออออออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û Videogame Repacks Û!bgblack!!cyan!Ûþอออออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                      บ
echo [8Cบ   !59!repack-games.com!cyan!        ณ   !65!darckrepacks.com!cyan!           ณ   !71!cpgrepacks.site!cyan!                    บ
echo [8Cบ   !60!www.game-repack.site!cyan!    ณ   !66!dodi-repacks.site!cyan!          ณ   !72!www.tiny-repacks.win!cyan!               บ
echo [8Cบ   !61!elamigos.site!cyan!           ณ   !67!www.blackboxrepack.com!cyan!     ณ   !73!repack.info!cyan!                        บ
echo [8Cบ   !62!fitgirl-repacks.site!cyan!    ณ   !68!masquerade.site!cyan!            ณ   !74!m4ckd0ge-repacks.me!cyan!                บ
echo [8Cบ   !63!repack-mechanics.com!cyan!    ณ   !69!scooter-repacks.site!cyan!       ณ   !75!e13.xatab-repack.com !green!(RU)!cyan!          บ
echo [8Cบ   !64!gamesdrive.net!cyan!          ณ   !70!www.gnarly-repacks.site!cyan!    ณ   !76!qoob.name !green!(RU)!cyan!                     บ
echo [8Cบ                                                                                                                      บ
echo [8Cศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" / "!yellow!SEARCH!grey!" !t2! !yellow!{!t3!}!grey!." 30
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEWINDOWS
call :CHOOSE search && (call :IS_SEARCH c63a5dfcf766495b0 & goto :CONTINUEWINDOWS)
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARWINDOWS
call :ERRORMESSAGE
goto :CONTINUEWINDOWS

:ANDROID
call :SCALE 85 33
title Cracked Android APK's
call :ROSE "Cracked Android APK"

:CLEARANDROID
call :CLEAR 1 27
set db=a2zapk.com/ apkhome.net/ apkmagic.com.ar/ oceanofapk.com/ apkgod.net/ 5mod.ru/ apkmb.com/ apk4free.org/ dlandroid.com/ apk4all.com/ rexdl.com/ moddroid.co/ apkmody.io/ inewkhushi.com/ proapk.in/mod-apk/ www.apps4download.com/ ihackedit.com/ iplayplus.org/ apkhouse.com/ www.rockmods.net/ www.ytricks.net/ www.apkheist.com/ apkfolks.com/ bluesmods.com/ www.whatsappmods.net/ vancedapp.com/ github.com/xManager-v2/xManager-Spotify

:CONTINUEANDROID
call :SCALE 85 33
echo !cyan!
echo [28Cออออออออออออออออออออออออออออ
echo [27C// !red!Û!bgyellow!!black! CRACKED ANDROID APPS !red!Û!bgblack!!cyan! \\
echo [7Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [7Cบ                                                                     บ
echo [7Cบ    !1!a2zapk.com!cyan!             ณ   !13!apkmody.io!cyan!               บ
echo [7Cบ    !2!apkhome.net!cyan!            ณ   !14!inewkhushi.com!cyan!           บ
echo [7Cบ    !3!apkmagic.com.ar!cyan!        ณ   !15!proapk.in!cyan!                บ
echo [7Cบ    !4!oceanofapk.com!cyan!         ณ   !16!www.apps4download.com!cyan!    บ
echo [7Cบ    !5!apkgod.net!cyan!             ณ   !17!ihackedit.com!cyan!            บ
echo [7Cบ    !6!5mod.ru!cyan!                ณ   !18!iplayplus.org!cyan!            บ
echo [7Cบ    !7!apkmb.com!cyan!              ณ   !19!apkhouse.com!cyan!             บ
echo [7Cบ    !8!apk4free.org!cyan!           ณ   !20!www.rockmods.net!cyan!         บ
echo [7Cบ    !9!dlandroid.com!cyan!          ณ   !21!www.ytricks.net!cyan!          บ
echo [7Cบ   !10!apk4all.com!cyan!            ณ   !22!www.apkheist.com!cyan!         บ
echo [7Cบ   !11!rexdl.com!cyan!              ณ   !23!apkfolks.com!cyan!             บ
echo [7Cบ   !12!moddroid.co!cyan!            ณ                                   บ
echo [7Cบ                                                                     บ
echo [7CฬอออออþÛ!bgyellow!!red!Û Discord Modded Û!bgblack!!cyan!ÛþออออออหอออออþÛ!bgyellow!!red!Û Whats App Modded Û!bgblack!!cyan!Ûþออออออน
echo [7Cบ                                 บ                                   บ
echo [7Cบ   !24!bluesmods.com!cyan!          บ   !25!www.whatsappmods.net!cyan!     บ
echo [7Cบ                                 บ                                   บ
echo [7CฬอออออþÛ!bgyellow!!red!Û YouTube Modded Û!bgblack!!cyan!ÛþออออออฮออออออþÛ!bgyellow!!red!Û Spotify Modded Û!bgblack!!cyan!Ûþอออออออน
echo [7Cบ                                 บ                                   บ
echo [7Cบ   !26!vancedapp.com!cyan!          บ   !27!xManager-v2!cyan!              บ
echo [7Cบ                                 บ                                   บ
echo [7Cศอออออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" / !yellow!SEARCH!grey! !t2! !yellow!{!t3!}!grey!." 30
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEANDROID
call :CHOOSE search && (call :IS_SEARCH 9cf300c9ec1262a39 & goto :CONTINUEANDROID)
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARANDROID
call :ERRORMESSAGE
goto :CONTINUEANDROID

:YOUTUBEDL
call :SCALE 104 32
title YouTube Downloader
call :ROSE "YouTube Downloader"

:CLEARYOUTUBEDL
for %%a in (YOUTUBEDLP YOUTUBEDLGEOBYPASS YOUTUBEDLPRIORITY YOUTUBEDLOUTPUTDIRECTORY) do call :CHECK_%%a
if "!Language!"=="EN" (
set "YouTubeDLDirectoryInfo=Change download location!cyan!                                   บ"
if "!YouTubeDLGeoBypass!"=="0" set "YouTubeDLGeoBypassInfo=Bypass geographic restriction !cyan!(!red!OFF!!cyan!)                        บ"
if "!YouTubeDLGeoBypass!"=="1" set "YouTubeDLGeoBypassInfo=Bypass geographic restriction !cyan!(!green!ON!!cyan!)                         บ"
)
if "!Language!"=="FR" (
set "YouTubeDLDirectoryInfo=Changer l'emplacement de tlchargement!cyan!                    บ"
if "!YouTubeDLGeoBypass!"=="0" set "YouTubeDLGeoBypassInfo=Contournement de la restriction gographique !cyan!(!red!OFF!!cyan!)         บ"
if "!YouTubeDLGeoBypass!"=="1" set "YouTubeDLGeoBypassInfo=Contournement de la restriction gographique !cyan!(!green!ON!!cyan!)          บ"
)
if "!YouTubeDLP!"=="0" (
set youtube_dl=youtube-dl
set "YouTubeDLPInfo=YouTube DLP !cyan!(!red!OFF!!cyan!)                                          บ"
)
if "!YouTubeDLP!"=="1" (
set youtube_dl=yt-dlp
set "YouTubeDLPInfo=YouTube DLP !cyan!(!green!ON!!cyan!)                                           บ"
)
if not exist "Portable_Apps\YouTube-DL\" md "Portable_Apps\YouTube-DL"

:CONTINUEYOUTUBEDL
call :SCALE 104 32
echo !cyan!
echo [39Cออออออออออออออออออออออออออ
echo [38C// !red!Û!bgyellow!!black! YOUTUBE DOWNLOADER !red!Û!bgblack!!cyan! \\
echo [8Cษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
if "!Language!"=="EN" (set t1=Video Formats) & set t2=Audio Formats
if "!Language!"=="FR" (set t1=Formats vido) & set t2=Formats Audio
echo [8CฬอออออออออออþÛ!bgyellow!!red!Û !t1! Û!bgblack!!cyan!ÛþอออออออออออหออออออออออþÛ!bgyellow!!red!Û !t2! Û!bgblack!!cyan!Ûþอออออออออออน
echo [8Cบ                                           บ                                          บ
echo [8Cบ    !yellow!1!cyan!  ^> !white! BEST!cyan!                             บ     !yellow!7!cyan!  ^> !white! BEST!cyan!                           บ
echo [8Cบ    !yellow!2!cyan!  ^> !white! .mp4!cyan!                             บ     !yellow!8!cyan!  ^> !white! .mp3!cyan!                           บ
echo [8Cบ    !yellow!3!cyan!  ^> !white! .webm!cyan!                            บ     !yellow!9!cyan!  ^> !white! .m4a!cyan!                           บ
echo [8Cบ    !yellow!4!cyan!  ^> !white! .flv!cyan!                             บ    !yellow!10!cyan!  ^> !white! .flac!cyan!                          บ
echo [8Cบ    !yellow!5!cyan!  ^> !white! .mkv!cyan!                             บ    !yellow!11!cyan!  ^> !white! .aac!cyan!                           บ
echo [8Cบ    !yellow!6!cyan!  ^> !white! .avi!cyan!                             บ    !yellow!12!cyan!  ^> !white! .opus!cyan!                          บ
echo [8Cบ                                           บ    !yellow!13!cyan!  ^> !white! .ogg!cyan!                           บ
echo [8Cบ                                           บ    !yellow!14!cyan!  ^> !white! .wav!cyan!                           บ
echo [8Cฬอออออออออออออออออออออออออออออออออออออออออออสออออออออออออออออออออออออออออออออออออออออออน
if "!Language!"=="EN" echo [8CฬอออออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û Settings Û!bgblack!!cyan!Ûþอออออออออออออออออออออออออออออออออออน
if "!Language!"=="FR" echo [8CฬออออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û Paramtres Û!bgblack!!cyan!Ûþออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                      บ
echo [8Cบ                    !yellow!15!cyan!  ^> !white! !YouTubeDLPInfo!
echo [8Cบ                    !yellow!16!cyan!  ^> !white! !YouTubeDLDirectoryInfo!
echo [8Cบ                    !yellow!17!cyan!  ^> !white! !YouTubeDLGeoBypassInfo!
echo [8Cฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
if "!Language!"=="EN" (
echo [8Cบ    !brightmagenta!YouTube DL automatically download the best quality as available at the source.!cyan!    บ
echo [8Cบ         !brightmagenta!We do not convert to 320 Kbps just for saying it's the best quality.!cyan!         บ
)
if "!Language!"=="FR" (
echo [8Cบ !brightmagenta!YouTube DL tlcharge la meilleure qualit telle qu'elle est disponible … la source.!cyan! บ
echo [8Cบ !brightmagenta!Nous ne convertissons pas … 320 Kbps juste pour dire que c'est la meilleure qualit.!cyan! บ
)
echo [8Cฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
if "!Language!"=="EN" set t=Download location:
if "!Language!"=="FR" set t=Emplacement de tlchargement:
echo           !brightmagenta!!t!!white! !YouTubeDLOutputDirectory!!cyan!
echo [8Cศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" / "!yellow!OPEN!grey!" / "!yellow!PRIORITY!grey!" / "!yellow!INSTALL!grey!" !t2! !yellow!{!t3!}!grey!." 50
echo:
call :PROMPT
for /l %%a in (1,1,14) do if "!x!"=="%%a" call :CHECK_INTERNET && goto :GOYOUTUBEDL || (call :ERROR_INTERNET & goto :CONTINUEYOUTUBEDL)
if "!x!"=="15" (
if "!YouTubeDLP!"=="0" >nul reg add "!IS_Reg!" /v "YouTubeDLP" /t REG_DWORD /d 1 /f
if "!YouTubeDLP!"=="1" >nul reg add "!IS_Reg!" /v "YouTubeDLP" /t REG_DWORD /d 0 /f
goto :CLEARYOUTUBEDL
)
if "!x!"=="16" goto :YOUTUBEDLDIRECTORY
if "!x!"=="17" (
if "!YouTubeDLGeoBypass!"=="0" >nul reg add "!IS_Reg!" /v "YouTubeDLGeoBypass" /t REG_DWORD /d 1 /f
if "!YouTubeDLGeoBypass!"=="1" >nul reg add "!IS_Reg!" /v "YouTubeDLGeoBypass" /t REG_DWORD /d 0 /f
goto :CLEARYOUTUBEDL
)
call :CHOOSE open && (call :OPEN_FOLDER "!YouTubeDLOutputDirectory!" & goto :CONTINUEYOUTUBEDL)
call :CHOOSE priority && goto :YOUTUBEDL_PRIORITY
call :CHOOSE install && goto :YOUTUBEDLINSTALL
call :CHOOSE back && goto :MAINMENU
call :ERRORMESSAGE
goto :CONTINUEYOUTUBEDL

:GOYOUTUBEDL
if "!x!"=="1" (
set o1=Convert to BEST
set a=--format bestvideo[ext=best]+bestaudio[ext=best]/best
)
if "!x!"=="2" (
set o1=Convert to .mp4
set a=--merge-output-format mp4 --recode-video mp4
)
if "!x!"=="3" (
set o1=Convert to .webm
set a=--format bestvideo[ext=best]+bestaudio[ext=best]/best --recode-video webm
)
if "!x!"=="4" (
set o1=Convert to .flv
set a=--recode-video flv
)
if "!x!"=="5" (
set o1=Convert to .mkv
set a=--merge-output-format mkv --recode-video mkv
)
if "!x!"=="6" (
set o1=Convert to .avi
set a=--recode-video avi
)
if "!x!"=="7" (
set o1=Convert to BEST
set a=--extract-audio --format bestaudio[ext=best]/best --audio-quality 0
)
if "!x!"=="8" (
set o1=Convert to .mp3
set a=--extract-audio --audio-format mp3 --audio-quality 0
)
if "!x!"=="9" (
set o1=Convert to .m4a
set a=--extract-audio --audio-format m4a --audio-quality 0
)
if "!x!"=="10" (
set o1=Convert to .flac
set a=--extract-audio --audio-format flac --audio-quality 0
)
if "!x!"=="11" (
set o1=Convert to .aac
set a=--extract-audio --audio-format aac --audio-quality 0
)
if "!x!"=="12" (
set o1=Convert to .opus
set a=--extract-audio --audio-format opus --audio-quality 0
)
if "!x!"=="13" (
set o1=Convert to .ogg
set a=--merge-output-format ogg --extract-audio --audio-format vorbis --audio-quality 0
)
if "!x!"=="14" (
set o1=Convert to .wav
set a=--extract-audio --audio-format wav --audio-quality 0
)
echo !grey!
if "!Language!"=="EN" set "t=Enter "
if "!Language!"=="FR" set t=Entrer l'
%showcursor%
set x=
set /p "x=!t!URL: !yellow!"
%hidecursor%
call :CHECK_URL x URL || goto :CONTINUEYOUTUBEDL
set a=--add-metadata !a! "!x!"
echo:
if not exist "Portable_Apps\YouTube-DL\ffmpeg.exe" call :CURL "Portable_Apps\YouTube-DL\ffmpeg.7z" "`git_raw_downloads`/ffmpeg.7z" || (call :ERROR_INTERNET & goto :CONTINUEYOUTUBEDL)
if "!youtube_dl!"=="youtube-dl" if not exist "Portable_Apps\YouTube-DL\youtube-dl.exe" call :CURL "Portable_Apps\YouTube-DL\youtube-dl.exe" "https://yt-dl.org/downloads/latest/youtube-dl.exe" || (call :ERROR_INTERNET & goto :CONTINUEYOUTUBEDL)
if "!youtube_dl!"=="yt-dlp" if not exist "Portable_Apps\YouTube-DL\yt-dlp.exe" call :CURL "Portable_Apps\YouTube-DL\yt-dlp.exe" "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_x86.exe" || (call :ERROR_INTERNET & goto :CONTINUEYOUTUBEDL)
pushd "Portable_Apps\YouTube-DL"
2>nul !youtube_dl!.exe -U | findstr /vic:"!youtube_dl! is up" /c:"Current Build Hash"
:YOUTUBEDL_UPDATER
for %%a in (*.new *updater.bat *updater.cmd) do if exist "%%a" goto :YOUTUBEDL_UPDATER
popd
start "" "%~f0" YOUTUBEDL
goto :CONTINUEYOUTUBEDL

:YOUTUBEDLINSTALL
call :CURL "!TMPF!\vcredist_x86.exe" "https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x86.exe" || (call :ERROR_INTERNET & goto :CONTINUEYOUTUBEDL)
call :START_DOWNLOADED_FILE vcredist_x86.exe
goto :CONTINUEYOUTUBEDL

:YOUTUBEDLDIRECTORY
echo:
if "!Language!"=="EN" echo NOTE: Leaving blank will replace the original download location.
if "!Language!"=="FR" echo NOTE: Laisser vide remplacera l'emplacement de tlchargement originale.
echo:
if "!Language!"=="EN" set t=Enter new download location
if "!Language!"=="FR" set t=Entrer le nouvel emplacement de tlchargement
%showcursor%
set x=
set /p "x=!grey!!t!: !yellow!"
%hidecursor%
if defined x (
set "x=!x:"=!"
if "!x:~-1!"=="\" set "x=!x:~,-1!"
for %%a in ("!x!") do >nul reg add "!IS_Reg!" /v "YouTubeDLOutputDirectory" /t REG_SZ /d "%%~fa" /f
) else >nul 2>&1 reg delete "!IS_Reg!" /v "YouTubeDLOutputDirectory" /f
call :CHECK_YOUTUBEDLOUTPUTDIRECTORY
goto :CONTINUEYOUTUBEDL

:YOUTUBEDL_PRIORITY
call :PRIORITY_PROCESS YouTubeDLPriority
>nul reg add "!IS_Reg!" /v "YouTubeDLPriority" /t REG_SZ /d !YouTubeDLPriority! /f && (
if "!Language!"=="EN" set t="YouTube DL priority has been replaced to: '!YouTubeDLPriority!'"
if "!Language!"=="FR" set t="La priorit de YouTube DL a bien t remplace par: '!YouTubeDLPriority!'"
call :MSGBOX 1 !t! 69696 "Illegal Services Checker"
)
call :CHECK_YOUTUBEDLPRIORITY
goto :CONTINUEYOUTUBEDL

:USEFULWEBSITES
call :SCALE 139 44
title Useful Websites
call :ROSE "Useful Websites"

:CLEARUSEFULWEBSITES
call :CLEAR 1 52
set db=www.virustotal.com/gui/ www.hybrid-analysis.com/ metadefender.opswat.com/ antiscan.me/ virusscan.jotti.org/ urlscan.io/ www.security.org/how-secure-is-my-password/ breachalarm.com/ haveibeenpwned.com/ monitor.firefox.com/ cybernews.com/personal-data-leak-check/ leakedsource.ru/ doxbin.org/ leak.sx/ dehashed.com/ leak-lookup.com/search/ webresolver.nl/tools/leaked_database weleakinfo.to/ protonvpn.com/ courvix.com/ sshdropbear.net/ freevpn.me/ www.vpnbook.com/ cloudssh.net/ www.freeopenvpn.org/ free-proxy-list.net/ protonmail.com/ www.startmail.com/ temp-mail.org/ dropmail.me/ yopmail.com/ generator.email/blog/gmail-generator temp-sms.org/ cyber-hub.pw/ webresolver.nl/ www.vedbex.com/tools/home wannabe1337.xyz/ mostwantedhf.info/ shadowcrypt.net/tools/ xresolver.com/ fakepersongenerator.com/ www.fakeimess.com/generator/ fakeproof.xenot.pro/ www.vedbex.com/tools/fake_proof torrentfreak.com/ `nextwarez.com/ www.journaldupirate.net/ filepursuit.com/ www.aiosearch.com/ www.filechef.com/ onehack.us/ www.torproject.org/

:CONTINUEUSEFULWEBSITES
call :SCALE 139 44
echo !cyan!
echo [58Cอออออออออออออออออออออออ
echo [57C// !red!Û!bgyellow!!black! USEFUL WEBSITES !red!Û!bgblack!!cyan! \\
echo [8Cษอออออออออออออออออออออออออออออออออออออออออออออออ//อออออออออออออออออออออออ\\อออออออออออออออออออออออออออออออออออออออออออออป
echo [8CฬออออออออþÛ!bgyellow!!red!Û Virus Scanners Û!bgblack!!cyan!ÛþออออออออหอออออออออออออþÛ!bgyellow!!red!Û Security Û!bgblack!!cyan!ÛþอออออออออออออหออออออออออออþÛ!bgyellow!!red!Û Leaks Û!bgblack!!cyan!Ûþออออออออออออน
echo [8Cบ                                      บ                                          บ                                     บ
echo [8Cบ    !1!www.virustotal.com!cyan!          บ    !7!www.security.org!cyan!                บ   !12!leakedsource.ru!cyan!            บ
echo [8Cบ    !2!www.hybrid-analysis.com!cyan!     บ    !8!breachalarm.com!cyan!                 บ   !13!doxbin.org!cyan!                 บ
echo [8Cบ    !3!metadefender.opswat.com!cyan!     บ    !9!haveibeenpwned.com!cyan!              บ   !14!leak.sx!cyan!                    บ
echo [8Cบ    !4!antiscan.me!cyan!                 บ   !10!monitor.firefox.com!cyan!             บ   !15!dehashed.com!cyan!               บ
echo [8Cบ    !5!virusscan.jotti.org!cyan!         บ   !11!cybernews.com!cyan!                   บ   !16!leak-lookup.com!cyan!            บ
echo [8Cบ    !6!urlscan.io!cyan!                  บ                                          บ   !17!webresolver.nl/leaked!cyan!      บ
echo [8Cบ                                      บ                                          บ   !18!weleakinfo.to!cyan!              บ
echo [8Cบ                                      บ                                          บ                                     บ
echo [8CฬออออþÛ!bgyellow!!red!Û Free VPN's or Proxy's Û!bgblack!!cyan!ÛþอออออฮออออออออออออþÛ!bgyellow!!red!Û Mails/SMS Û!bgblack!!cyan!ÛþอออออออออออออฮออออออออþÛ!bgyellow!!red!Û Web Resolvers Û!bgblack!!cyan!Ûþออออออออน
echo [8Cบ                                      บ                                          บ                                     บ
echo [8Cบ   !19!protonvpn.com!cyan!               บ   !27!protonmail.com!cyan!                  บ    !35!webresolver.nl!cyan!              บ
echo [8Cบ   !20!courvix.com!cyan!                 บ   !28!www.startmail.com!cyan!               บ    !36!www.vedbex.com!cyan!            บ
echo [8Cบ   !21!sshdropbear.net!cyan!             บ   !29!temp-mail.org!cyan!                   บ    !37!wannabe1337.xyz!cyan!            บ
echo [8Cบ   !22!freevpn.me!cyan!                  บ   !30!dropmail.me!cyan!                     บ    !38!mostwantedhf.info!cyan!
echo [8Cบ   !23!www.vpnbook.com!cyan!             บ   !31!yopmail.com!cyan!                     บ    !39!shadowcrypt.net!cyan!           บ
echo [8Cบ   !24!cloudssh.net!cyan!                บ   !32!generator.email!cyan!                 บ    !40!xresolver.com!cyan!             บ
echo [8Cบ   !25!www.freeopenvpn.org!cyan!         บ   !33!temp-sms.org!cyan!                    บ                                     บ
echo [8Cบ   !26!free-proxy-list.net!cyan!         บ   !34!cyber-hub.pw!cyan!                    บ                                     บ
echo [8Cบ                                      บ                                          บ                                     บ
echo [8CฬอออออออออþÛ!bgyellow!!red!Û Fake Persons Û!bgblack!!cyan!ÛþอออออออออฮออออออออออออþÛ!bgyellow!!red!Û Warez News Û!bgblack!!cyan!ÛþออออออออออออฮอออออออþÛ!bgyellow!!red!Û File Searching Û!bgblack!!cyan!Ûþออออออออน
echo [8Cบ                                      บ                                          บ                                     บ
echo [8Cบ   !41!fakepersongenerator.com!cyan!     บ   !45!torrentfreak.com!cyan!                บ    !49!www.aiosearch.com!cyan!         บ
echo [8Cบ   !42!www.fakeimess.com!cyan!           บ   !46!nextwarez.com !green!(FR)!cyan!              บ    !50!www.filechef.com!cyan!          บ
echo [8Cบ   !43!fakeproof.xenot.pro!cyan!         บ   !47!www.journaldupirate.net !green!(FR)!cyan!    บ                                     บ
echo [8Cบ   !44!www.vedbex.com/fakeproof!cyan!    บ   !48!filepursuit.com!cyan!                 บ                                     บ
echo [8Cบ                                      บ                                          บ                                     บ
echo [8CฬออออออออออออออออออออออออออออออออออออออสออออออออออออออþÛ!bgyellow!!red!Û Others Û!bgblack!!cyan!Ûþออออออออออออออสอออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                       บ
echo [8Cบ                                          !51!onehack.us!cyan!                                                            บ
echo [8Cบ                                          !52!www.torproject.org!cyan!                                                    บ
echo [8Cบ                                                                                                                       บ
echo [8Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" !t2! !yellow!{!t3!}!grey!." 20
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEUSEFULWEBSITES
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARUSEFULWEBSITES
call :ERRORMESSAGE
goto :CONTINUEUSEFULWEBSITES

:DDOS
call :SCALE 82 31
title Denial Of Services (DDoS)
call :ROSE "IP Denial of Services"

:CLEARDDOS
call :CLEAR 1 18
set db=instant-stresser.com/ freestresser.to/ www.ipstresser.com/ ipstress.in/ royalstresser.com/ anonboot.com/ stresser.zone/ xtremebooter.xyz/ stresser.be/ eor-n.to/ str3ssed.co/ wannabe1337.xyz/stresser vtoxicity.net/ str3sser.io/ databooter.to/ asylumstresser.to/ deltastress.com/ ddosforhire.net/

:CONTINUEDDOS
call :SCALE 82 31
echo !cyan!
echo [23Cออออออออออออออออออออออออออออออออออออออ
echo [22C// !red!Û!bgyellow!!black! DENIAL OF SERVICES (100%% Free) !red!Û!bgblack!!cyan! \\
echo [8Cษออออออออออออออออออออออออออออออออหอออออออออออออออออออออออออออออออป
echo [8Cบ   !1!instant-stresser.com!cyan!   บ  [BEST]   [  1/Gbps] [300/s]  บ
echo [8Cบ   !2!freestresser.to!cyan!        บ           [  1/Gbps] [300/s]  บ
echo [8Cบ   !3!www.ipstresser.com!cyan!     บ           [200/Mbps] [300/s]  บ
echo [8Cบ   !4!ipstress.in!cyan!            บ           [  ?/Gbps] [250/s]  บ
echo [8Cบ   !5!royalstresser.com!cyan!      บ           [  ?/Gbps] [200/s]  บ
echo [8Cบ   !6!anonboot.com!cyan!           บ           [  ?/Gbps] [120/s]  บ
echo [8Cบ   !7!stresser.zone!cyan!          บ           [  ?/Gbps] [120/s]  บ
echo [8Cบ   !8!xtremebooter.xyz!cyan!       บ           [  ?/Gbps] [120/s]  บ
echo [8Cบ   !9!stresser.be!cyan!            บ           [  ?/Gbps] [120/s]  บ
echo [8Cบ  !10!eor-n.to!cyan!               บ           [  ?/Gbps] [120/s]  บ
echo [8Cบ  !11!str3ssed.co!cyan!            บ           [  1/Gbps] [120/s]  บ
echo [8Cบ  !12!wannabe1337.xyz!cyan!        บ           [  ?/Gbps] [120/s]  บ
echo [8Cบ  !13!vtoxicity.net!cyan!          บ           [100/Mbps] [120/s]  บ
echo [8Cบ  !14!str3sser.io!cyan!            บ           [  1/Gbps] [ 60/s]  บ
echo [8Cบ  !15!databooter.to!cyan!          บ           [  1/Gbps] [ 60/s]  บ
echo [8Cบ  !16!asylumstresser.to!cyan!      บ           [  1/Gbps] [ 60/s]  บ
echo [8Cบ  !17!deltastress.com!cyan!        บ           [  ?/Gbps] [ 30/s]  บ
echo [8Cฬออออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออน
if "!Language!"=="EN" (
echo [29C!brightmagenta!Last Updated: !white!23/08/2021
echo [15C!brightmagenta!Alternatively you can visit: !18!ddosforhire.net
)
if "!Language!"=="FR" (
echo [28C!brightmagenta!Mise … jour le: !white!23/08/2021
echo [11C!brightmagenta!Alternativement vous pouvez visiter: !18!ddosforhire.net
)
echo [8C!cyan!ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" !t2! !yellow!{!t3!}!grey!." 20
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEDDOS
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARDDOS
call :ERRORMESSAGE
goto :CONTINUEDDOS

:IPLOOKUP
call :SCALE 73 27
title IP Address Lookup
call :ROSE "IP Address Lookup"

:CLEARIPLOOKUP
call :CLEAR 1 8
set db=check-host.net/ dnschecker.org/ www.iplocation.net/ www.ip-tracker.org/ whatismyipaddress.com/
if exist "!TMPF!\IS_Log.txt" del /f /q "!TMPF!\IS_Log.txt"

:CONTINUEIPLOOKUP
call :SCALE 73 27
title IP Address Lookup
echo !cyan!
echo [28Cอออออออออออออออออ
echo [27C// !red!Û!bgyellow!!black! IP LOOKUP !red!Û!bgblack!!cyan! \\
echo [17Cษอออออออออออออออออออออออออออออออออออออป
echo [17CฬอþÛ!bgyellow!!red!Û  Illegal Services IP Lookup Û!bgblack!!cyan!Ûþอน
echo [17Cบ                                     บ
if "!Language!"=="EN" echo [17Cบ    !yellow!1!cyan!  ^> !white! View your IP!cyan!               บ
if "!Language!"=="FR" echo [17Cบ    !yellow!1!cyan!  ^> !white! Regarder mon IP!cyan!            บ
if "!Language!"=="EN" echo [17Cบ    !yellow!2!cyan!  ^> !white! Lookup an other IP!cyan!         บ
if "!Language!"=="FR" echo [17Cบ    !yellow!2!cyan!  ^> !white! Regarder une autre IP!cyan!      บ
if "!Language!"=="EN" echo [17Cบ    !yellow!3!cyan!  ^> !white! Lookup an other URL!cyan!        บ
if "!Language!"=="FR" echo [17Cบ    !yellow!3!cyan!  ^> !white! Regarder une autre URL!cyan!     บ
echo [17Cบ                                     บ
if "!Language!"=="EN" echo [17CฬอออออþÛ!bgyellow!!red!Û  IP Lookup websites Û!bgblack!!cyan!Ûþอออออน
if "!Language!"=="FR" echo [17CฬอþÛ!bgyellow!!red!Û  Sites Internet d'IP Lookup Û!bgblack!!cyan!Ûþอน
echo [17Cบ                                     บ
echo [17Cบ    !4!check-host.net!cyan!             บ
echo [17Cบ    !5!dnschecker.org!cyan!             บ
echo [17Cบ    !6!www.iplocation.net!cyan!         บ
echo [17Cบ    !7!www.ip-tracker.org!cyan!         บ
echo [17Cบ                                     บ
if "!Language!"=="EN" echo [17CฬออþÛ!bgyellow!!red!Û  IP Dynamic or Static ? Û!bgblack!!cyan!Ûþออออน
if "!Language!"=="FR" echo [17CฬอþÛ!bgyellow!!red!Û  IP Dynamique ou Satique ? Û!bgblack!!cyan!Ûþออน
echo [17Cบ                                     บ
echo [17Cบ    !8!whatismyipaddress.com!cyan!      บ
echo [17Cศอออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" / "!yellow!READ!grey!" / "!yellow!DELETE!grey!" !t2! !yellow!{!t3!}!grey!." 40
echo:
call :PROMPT
for %%a in (1 2 3) do if "%%a"=="!x!" call :CHECK_INTERNET && set "_el=!x!" || (call :ERROR_INTERNET & goto :CLEARIPLOOKUP)
if "!x!"=="1" goto :IPLOOKUP_RESPONSE
if "!x!"=="2" call :ENTER_LOOKUP IP && goto :IPLOOKUP_RESPONSE || goto :CLEARIPLOOKUP
if "!x!"=="3" call :ENTER_LOOKUP IP/URL && goto :IPLOOKUP_RESPONSE || goto :CLEARIPLOOKUP
call :WEBSITECHECK && goto :CONTINUEIPLOOKUP
call :CHOOSE back && goto :MAINMENU
call :CHOOSE read && (call :READ_IPLOOKUP & goto :CLEARIPLOOKUP)
call :CHOOSE delete && (call :DELETE_IPLOOKUP & goto :CLEARIPLOOKUP)
if not defined x for /l %%a in (!c1!,1,!c2!) do if "!%%a!"=="!yellow!%%a !checked!" call :ENTER_LOOKUP IP/URL && goto :CLEARIPLOOKUP || goto :CONTINUEIPLOOKUP
call :ERRORMESSAGE
goto :CONTINUEIPLOOKUP

:IPLOOKUP_RESPONSE
cls
if "!x!"=="1" title Looking up ^> ... & for /f %%a in ('Curl\x!arch!\curl.exe -fkLs "https://api.ipify.org"') do set x=%%a
>nul chcp 65001
for %%a in (1 2) do if "!_el!"=="%%a" (
title Looking up ^> !x!
call :IP_DETECTOR
)
if "!_el!"=="3" call :URL_DETECTOR
call :PROXY_DETECTOR
call :VPN_DETECTOR
echo !cyan!
type "!TMPF!\IS_Log.txt"
>nul chcp !CP!
echo !grey!
if "!Language!"=="EN" set t=Do you want to
if "!Language!"=="FR" set t=Voulez vous
call :DRAW_CENTER "!t! Save (!yellow!S!grey!) / Read (!yellow!R!grey!) / Delete (!yellow!D!grey!) / Back (!yellow!B!grey!) ?" 40

:CHOICE_IPLOOKUP
>nul choice /n /c SRDB
if "!errorlevel!"=="1" goto :IPLOOKUP_SAVE
if "!errorlevel!"=="2" call :READ_IPLOOKUP
if "!errorlevel!"=="3" call :DELETE_IPLOOKUP
if "!errorlevel!"=="4" goto :CLEARIPLOOKUP
goto :CHOICE_IPLOOKUP

:IPLOOKUP_SAVE
if "!Language!"=="EN" set t=Enter victim's name
if "!Language!"=="FR" set t=Entrez le nom de la victime
call :INPUTBOX "!t!: "
if not exist "!ISOutputDirectory!\IP Lookup Saved.txt" (
2>nul md "!ISOutputDirectory!"
echo =============================================>"!ISOutputDirectory!\IP Lookup Saved.txt"
)
>nul chcp 1252
echo   Name: !ID!>>"!ISOutputDirectory!\IP Lookup Saved.txt"
>nul chcp !CP!
echo =============================================>>"!ISOutputDirectory!\IP Lookup Saved.txt"
type "!TMPF!\IS_Log.txt">>"!ISOutputDirectory!\IP Lookup Saved.txt"
echo =============================================>>"!ISOutputDirectory!\IP Lookup Saved.txt"
if "!errorlevel!"=="0" (
if "!Language!"=="EN" set t="IP Lookup successfully saved at: " "'!ISOutputDirectory!\IP Lookup Saved.txt'" "Do you want to open it now ?"
if "!Language!"=="FR" set t="IP Lookup enregistr้s avec succ่s เ: " "'!ISOutputDirectory!\IP Lookup Saved.txt'" "Voulez-vous l'ouvrir maintenant ?"
call :MSGBOXLEVEL 3 !t! 69668 "Illegal Services Checker"
if "!el!"=="6" start /max explorer.exe "!ISOutputDirectory!\IP Lookup Saved.txt"
) else (
if "!Language!"=="EN" set t=An unexpected error has occurred
if "!Language!"=="FR" set t=Une erreur inattendue est survenue
call :MSGBOX 1 "!t!." 69648 "Illegal Services Checker"
)
goto :CLEARIPLOOKUP

:PORT
call :SCALE 101 33
title IP Port Scanning
call :ROSE "IP Port Scanning"

:CLEARPORT
call :CLEAR 8 11
set db=www.adminsub.net/tcp-udp-port-finder www.speedguide.net/ports.php www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml portforward.com/ports.htm

:CONTINUEPORT
call :SCALE 101 33
echo !cyan!
echo [37Cออออออออออออออออออออออออออออ
echo [36C// !red!Û!bgyellow!!black! IP TCP PORT SCANNING !red!Û!bgblack!!cyan! \\
echo [8Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
if "!Language!"=="EN" echo [8CฬออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û Scan all Ports Û!bgblack!!cyan!Ûþอออออออออออออออออออออออออออออออน
if "!Language!"=="FR" echo [8CฬออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û Scan tous les ports Û!bgblack!!cyan!Ûþออออออออออออออออออออออออออออน
echo [8Cบ                                                                                   บ
if "!Language!"=="EN" echo [8Cบ                       !yellow!1!cyan!  ^> !white! Python: Scan all 65535 ports.!cyan!                         บ
if "!Language!"=="FR" echo [8Cบ                     !yellow!1!cyan!  ^> !white! Python: Scan tous les 65535 ports.!cyan!                      บ
if "!Language!"=="EN" echo [8Cบ                       !yellow!2!cyan!  ^> !white! NMAP  : Scan all 65535 ports.!cyan!                         บ
if "!Language!"=="FR" echo [8Cบ                     !yellow!2!cyan!  ^> !white! NMAP  : Scan tous les 65535 ports.!cyan!                      บ
echo [8Cฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
if "!Language!"=="EN" echo [8CฬอออออออออออออออออออออออออออþÛ!bgyellow!!red!Û Scan Most Used Ports Û!bgblack!!cyan!Ûþออออออออออออออออออออออออออออน
if "!Language!"=="FR" echo [8CฬอออออออออออออออออออออþÛ!bgyellow!!red!Û Scan les ports les plus utiliss Û!bgblack!!cyan!Ûþออออออออออออออออออออออน
echo [8Cบ                                                                                   บ
if "!Language!"=="EN" echo [8Cบ    !yellow!3!cyan!  ^> !white! NMAP: Scan only ports listeds in the file nmap-services.!cyan!                 บ
if "!Language!"=="FR" echo [8Cบ    !yellow!3!cyan!  ^> !white! NMAP: Scan uniquement les ports lists dans le fichier nmap-services.!cyan!    บ
if "!Language!"=="EN" echo [8Cบ    !yellow!4!cyan!  ^> !white! NMAP: Scan + than 1660 ports.!cyan!                                            บ
if "!Language!"=="FR" echo [8Cบ    !yellow!4!cyan!  ^> !white! NMAP: Scan + de 1660 ports.!cyan!                                              บ
if "!Language!"=="EN" echo [8Cบ    !yellow!5!cyan!  ^> !white! NMAP: Scan top most useds ports.!cyan!                                         บ
if "!Language!"=="FR" echo [8Cบ    !yellow!5!cyan!  ^> !white! NMAP: Scan les principaux ports les plus utiliss.!cyan!                       บ
if "!Language!"=="EN" echo [8Cบ    !yellow!6!cyan!  ^> !white! NMAP: Scan with version detection.!cyan!                                       บ
if "!Language!"=="FR" echo [8Cบ    !yellow!6!cyan!  ^> !white! NMAP: Scan avec la dtection de version.!cyan!                                 บ
echo [8Cฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
if "!Language!"=="EN" echo [8CฬออออออออออออออออออออออออออþÛ!bgyellow!!red!Û Custom Port Range Scan Û!bgblack!!cyan!Ûþอออออออออออออออออออออออออออน
if "!Language!"=="FR" echo [8CฬอออออออออออออออออþÛ!bgyellow!!red!Û Scan personnalis de la plage des ports Û!bgblack!!cyan!Ûþอออออออออออออออออออน
echo [8Cบ                                                                                   บ
if "!Language!"=="EN" echo [8Cบ                   !yellow!7!cyan!  ^> !white! NMAP: Scan your range of custom ports!cyan!                     บ
if "!Language!"=="FR" echo [8Cบ               !yellow!7!cyan!  ^> !white! NMAP: Scan votre plage personnalis de ports.!cyan!                 บ
echo [8Cฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
if "!Language!"=="EN" set t=Description
if "!Language!"=="FR" set t=Dscription
echo [8CฬอออออออออออออออออออออออออออþÛ!bgyellow!!red!Û Portlist !t! Û!bgblack!!cyan!Ûþออออออออออออออออออออออออออออน
echo [8Cบ                                                                                   บ
echo [8Cบ                             !8!www.adminsub.net!cyan!                                บ
echo [8Cบ                             !9!www.speedguide.net!cyan!                              บ
echo [8Cบ                            !10!www.iana.org!cyan!                                    บ
echo [8Cบ                            !11!portforward.com!cyan!                                 บ
echo [8Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo:
>nul 2>&1 sc query npcap || (
if "!Language!"=="EN" call :DRAW_CENTER "!red!ERROR: !grey!To use NMAP, you must first choose: "!yellow!INSTALL!grey!"" 20
if "!Language!"=="FR" call :DRAW_CENTER "!red!ERREUR: !grey!Pour utiliser NMAP, vous devez d'abord choisir: "!yellow!INSTALL!grey!"" 20
echo:
)
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!grey!!t1! "!yellow!BACK!grey!" / "!yellow!INSTALL!grey!" / "!yellow!PRIORITY!grey!" !t2! !yellow!{!t3!}!grey!." 45
echo:
call :PROMPT
for /l %%a in (1,1,7) do if "!x!"=="%%a" call :CHECK_INTERNET && goto :GOPORTSCANNING || (call :ERROR_INTERNET & goto :CONTINUEPORT)
call :WEBSITECHECK && goto :CONTINUEPORT
call :CHOOSE install && goto :NMAPINSTALL
call :CHOOSE priority && goto :PORT_PRIORITY
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARPORT
call :ERRORMESSAGE
goto :CONTINUEPORT

:GOPORTSCANNING
set o1=
set o2=
set a=
if "!x!"=="2" (
if "!Language!"=="EN" set o1=all 65535 ports.
if "!Language!"=="FR" set o1=tous les 65535 ports.
set o2=minimum 1 minute.
set a=-p-
)
if "!x!"=="3" (
if "!Language!"=="EN" set o1=only ports listeds in the file nmap-services.
if "!Language!"=="FR" set o1=uniquement les ports lists dans le fichier nmap-services.
set o2=minimum 3 seconds.
set a=-F
)
if "!x!"=="4" (
if "!Language!"=="EN" set o1=+ than 1660 ports.
if "!Language!"=="FR" set o1=+ de 1660 ports.
set o2=minimum 3 seconds.
)
if "!x!"=="5" (
if "!Language!"=="EN" set o1=top most useds ports.
if "!Language!"=="FR" set o1=Scan les principaux ports les plus utiliss.
set o2=minimum 13 seconds.
set a=--top-ports 65535
)
if "!x!"=="6" (
if "!Language!"=="EN" set o1=Scan with version detection.
if "!Language!"=="FR" set o1=Scan avec la dtection de version.
set o2=minimum 19 seconds.
set a=-sV --allports
)
if "!x!"=="7" (
if "!Language!"=="EN" set t=Enter start port
if "!Language!"=="FR" set t=Entrer le port de dbut
set p1=
set /p "p1=!grey!!t!: !yellow!"
call :CHECK_PORT p1 || goto :CLEARPORT
if "!Language!"=="EN" set t=Enter end port
if "!Language!"=="FR" set t=Entrer le port de fin
set p2=
set /p "p2=!grey!!t!: !yellow!"
call :CHECK_PORT p2 || goto :CLEARPORT
set a=-p!p1!-!p2!
if "!Language!"=="EN" set o1=Scan your range of custom ports.
if "!Language!"=="FR" set o1=Scan votre plage personnalis de ports.
set o2=Unknow.
)
if "!Language!"=="EN" set "t=Enter "
if "!Language!"=="FR" set t=Entrer l'
%showcursor%
set x=
set /p "x=!grey!!t!IP/URL: !yellow!"
call :CHECK_URL x IP/URL || goto :CLEARPORT
if not defined o1 (
if not exist "TCP_Port_Scanner.exe" call :CURL "Portable_Apps\TCP_Port_Scanner.exe" "`git_raw_downloads`/TCP_Port_Scanner.exe" || (call :ERROR_INTERNET & goto :CLEARPORT)
pushd "Portable_Apps"
call :CHECK_PORTPRIORITY
start !PortPriority! TCP_Port_Scanner.exe "!x!"
popd
goto :CLEARPORT
)
set a=-T5 --open !a! "!x!"
set a=!a:  = !
if not exist "Portable_Apps\NMAP\nmap.exe" call :CURL "Portable_Apps\NMAP.7z" "`git_raw_downloads`/NMAP.7z" || (call :ERROR_INTERNET & goto :CLEARPORT)
start "" "%~f0" NMAP
goto :CLEARPORT

:NMAPINSTALL
call :CURL "!TMPF!\vcredist_x86.exe" "https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x86.exe" || (call :ERROR_INTERNET & goto :CONTINUEPORT)
call :START_DOWNLOADED_FILE vcredist_x86.exe
call :CURL "!TMPF!\npcap-1.31.exe" "https://nmap.org/npcap/dist/npcap-1.50.exe" || (call :ERROR_INTERNET & goto :CONTINUEPORT)
call :START_DOWNLOADED_FILE npcap-1.31.exe
goto :CONTINUEPORT

:PORT_PRIORITY
call :PRIORITY_PROCESS PortPriority
>nul reg add "!IS_Reg!" /v "PortPriority" /t REG_SZ /d !PortPriority! /f && (
if "!Language!"=="EN" set t="Port Scanning priority has been replaced to: '!PortPriority!'"
if "!Language!"=="FR" set t="La priorit du Port Scanning a bien t remplace par: '!PortPriority!'"
call :MSGBOX 1 !t! 69696 "Illegal Services Checker"
)
goto :CONTINUEPORT

:PINGERPORT
title IP Port Pinger
call :ROSE "IP Port Pinger"
if "!Language!"=="EN" set "t=Enter "
if "!Language!"=="FR" set t=Entrer l'
%showcursor%
set x=
set /p "x=!grey!!t!IP/URL: !yellow!"
%hidecursor%
call :CHECK_URL x IP/URL || goto :MAINMENU
if "!Language!"=="EN" set t=Enter Port
if "!Language!"=="FR" set t=Entrer le Port
%showcursor%
set p1=
set /p "p1=!grey!!t!: !yellow!"
%hidecursor%
call :CHECK_PORT p1 || goto :MAINMENU
if not exist "Portable_Apps\paping.exe" call :CURL "Portable_Apps\paping.exe" "`git_raw_downloads`/paping.exe" || (call :ERROR_INTERNET & goto :MAINMENU)
pushd "Portable_Apps"
start paping.exe !x! -p !p1!
popd
goto :MAINMENU

:IPPINGER
title IP Pinger
call :ROSE "IP Pinger"
if "!Language!"=="EN" set "t=Enter "
if "!Language!"=="FR" set t=Entrer l'
%showcursor%
set x=
set /p "x=!grey!!t!IP/URL: !yellow!"
%hidecursor%
call :CHECK_URL x IP/URL || goto :MAINMENU
start "" "%~f0" PINGER
goto :MAINMENU

:IPLOGGERS
call :SCALE 65 24
title IP Loggers
if "!Language!"=="EN" set t="INFORMATION: Url Shortners are useful for hiding the original links of your suspect IPLogger." "This solution does not work with some services that will redirect your shortened links directly to the last linked url. Example FaceBook, Instagram, Twitter..."
if "!Language!"=="FR" set t="INFORMATION: Les URL Shortners sont utiles pour cacher les liens originaux de votre IPLogger suspect." "Cette solution ne fonctionne pas avec certains services qui redirigeront directement votre lien raccourci a la derniere URL liee. Exemple Facebook, Instagram, Twitter..."
call :MSGBOX 2 !t! 69680 "Illegal Services Checker"
call :ROSE "IP Loggers"
goto :CLEARIPLOGGERS

:CLEARIPLOGGERS
call :CLEAR 1 9
set db=iplogger.org/ grabify.link/ webresolver.nl/tools/iplogger lstu.fr/ kutt.it/ www.shorturl.at/ shorturl.com/ tiny.cc/ bitly.com/

:CONTINUEIPLOGGERS
call :SCALE 65 24
echo !cyan!
echo [22Cออออออออออออออออออ
echo [21C// !red!Û!bgyellow!!black! IP LOGGERS !red!Û!bgblack!!cyan! \\
echo [16Cษอออออออออออออออออออออออออออออป
echo [16Cบ                             บ
echo [16Cบ    !1!iplogger.org!cyan!       บ
echo [16Cบ    !2!grabify.link!cyan!       บ
echo [16Cบ    !3!webresolver.nl!cyan!     บ
echo [16Cฬอออออออออออออออออออออออออออออน
echo [16CฬออออþÛ!bgyellow!!red!Û  Url Shortners Û!bgblack!!cyan!Ûþอออน
echo [16Cบ                             บ
echo [16Cบ    !4!lstu.fr!cyan!            บ
echo [16Cบ    !5!kutt.it!cyan!            บ
echo [16Cบ    !6!www.shorturl.at!cyan!    บ
echo [16Cบ    !7!shorturl.com!cyan!       บ
echo [16Cบ    !8!tiny.cc!cyan!            บ
echo [16Cบ    !9!bitly.com!cyan!          บ
echo [16Cศอออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" !t2! !yellow!{!t3!}!grey!." 20
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEIPLOGGERS
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARIPLOGGERS
call :ERRORMESSAGE
goto :CONTINUEIPLOGGERS

:DOXING
call :SCALE 104 42
title Doxing
call :ROSE Doxing

:CLEARDOXING
call :CLEAR 1 31
set db=pimeyes.com/ tineye.com/ yandex.com/images images.google.com/ www.bing.com/?scope=images image.baidu.com/ ascii2d.net/ trace.moe/ saucenao.com/ iqdb.org/ www.pic2map.com/ onlineexifviewer.com/ www.metadata2go.com/ searx.neocities.org/ www.etools.ch/ search.carrot2.org/ www.excite.co.jp/ www.infospace.com/ biznar.com/ metager.org/ www.entireweb.com/ www.delta-search.com/ www.startpage.com/do/advanced-search www.google.com/advanced_search www.google.com/advanced_image_search "Dox Tool v2" checkusernames.com/ knowem.com/ www.toolsbug.com/youtube-video-tag-extractor.php online-free-tools.com/en/youtube_video_tags_extract_url ytubetool.com/

:CONTINUEDOXING
call :SCALE 104 42
echo !cyan!
echo [45Cออออออออออออออ
echo [44C// !red!Û!bgyellow!!black! DOXING !red!Û!bgblack!!cyan! \\
echo [8Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [8CฬอออออþÛ!bgyellow!!red!Û Image Search Û!bgblack!!cyan!ÛþอออออออออออออออออหออออออออออþÛ!bgyellow!!red!Û Image Research Û!bgblack!!cyan!Ûþออออออออออน
echo [8Cบ                                          บ                                          บ
echo [8Cบ     !1!pimeyes.com!cyan!                    บ    !11!www.pic2map.com!cyan!                บ
echo [8Cบ     !2!tineye.com!cyan!                     บ    !12!onlineexifviewer.com!cyan!           บ
echo [8Cบ     !3!yandex.com!cyan!                     บ    !13!www.metadata2go.com!cyan!            บ
echo [8Cบ     !4!images.google.com!cyan!              บ                                          บ
echo [8Cบ     !5!www.bing.com!cyan!                   บ                                          บ
echo [8Cบ     !6!image.baidu.com!cyan!                บ                                          บ
echo [8Cบ     !7!ascii2d.net!cyan!                    บ                                          บ
echo [8Cบ     !8!trace.moe!cyan!                      บ                                          บ
echo [8Cบ     !9!saucenao.com!cyan!                   บ                                          บ
echo [8Cบ    !10!iqdb.org!cyan!                       บ                                          บ
echo [8Cบ                                          บ                                          บ
echo [8CฬอออออออออþÛ!bgyellow!!red!Û Metaseach Engine Û!bgblack!!cyan!ÛออออออออออฮอออออออþÛ!bgyellow!!red!Û Advanced Seach Engine Û!bgblack!!cyan!Ûþออออออน
echo [8Cบ                                          บ                                          บ
echo [8Cบ    !14!searx.neocities.org!cyan!            บ    !23!www.startpage.com!cyan!              บ
echo [8Cบ    !15!www.etools.ch!cyan!                  บ    !24!www.google.com/web!cyan!             บ
echo [8Cบ    !16!search.carrot2.org!cyan!             บ    !25!www.google.com/image!cyan!           บ
echo [8Cบ    !17!www.excite.co.jp!cyan!               บ                                          บ
echo [8Cบ    !18!www.infospace.com!cyan!              บ                                          บ
echo [8Cบ    !19!biznar.com!cyan!                     บ                                          บ
echo [8Cบ    !20!metager.org!cyan!                    บ                                          บ
echo [8Cบ    !21!www.entireweb.com!cyan!              บ                                          บ
echo [8Cบ    !22!www.delta-search.com!cyan!           บ                                          บ
echo [8Cบ                                          บ                                          บ
echo [8CฬออออออþÛ!bgyellow!!red!Û Usernames Doxing Û!bgblack!!cyan!ÛอออออออออออออฮอออออþÛ!bgyellow!!red!Û YouTube TAGS Extractors Û!bgblack!!cyan!Ûþออออออน
echo [8Cบ                                          บ                                          บ
echo [8Cบ    !26!Dox Tool v2!cyan!                    บ    !29!www.toolsbug.com!cyan!               บ
echo [8Cบ    !27!checkusernames.com!cyan!             บ    !30!online-free-tools.com!cyan!          บ
echo [8Cบ    !28!knowem.com!cyan!                     บ    !31!ytubetool.com!cyan!                  บ
echo [8Cบ                                          บ                                          บ
echo [8Cศออออออออออออออออออออออออออออออออออออออออออสออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" !t2! !yellow!{!t3!}!grey!." 20
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEDOXING
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARDOXING
call :ERRORMESSAGE
goto :CONTINUEDOXING

:PORTABLEAPPS
call :SCALE 138 43
title Portable Apps
call :ROSE "Portable Apps"

:CLEARPORTABLEAPPS
call :CLEAR 1 53
set db="Winaero Tweaker" "Ultimate Windows Tweaker" "TCP Optimizer" "DNS Jumper" Autoruns SpeedyFox "CCleaner + CCEnhancer" BleachBit Dism++ "Glary Utilities" "Revo Uninstaller" "Windows Repair AIO" "Windows Repair Toolbox" FixWin "Patch My PC" "UCheck" "Windows Update MiniTool" "WSUS Offline Update" DriversCloud "Snappy Driver Installer" "Driver Store Explorer" "Device Cleanup Tool" "Display Driver Uninstaller" "Radeon Software Slimmer" NVSlimmer "MSI Util v3" CPU-Z "OOSU10 (Win 10)" "Ashampoo AntiSpy (Win 10)" "DoNotSpy 10" "Windows Privacy Dashboard" "Windows 10 Privacy" "Windows Spy Blocker" "Destroy Windows 10 Spying" Blackbird "ADW Cleaner" "ZHP Cleaner" "Rogue Killer" "No Bot" "Kaspersky KVRT" "Kaspersky TDSSKiller" "Microsoft Safety Scanner" "Spybot - Search and Destroy" "Batch Antivirus" Everything "Process Hacker" CrystalDiskInfo "Defender Control" "Edge Blocker" "Mem Reduct" GiveMePower RegScanner ISLC
if exist "!TMPF!\IS_Log.txt" del /f /q "!TMPF!\IS_Log.txt"

:CONTINUEPORTABLEAPPS
call :SCALE 138 43
echo !cyan!
echo [59Cอออออออออออออออออออออ
echo [58C// !red!Û!bgyellow!!black! PORTABLE APPS !red!Û!bgblack!!cyan! \\
echo [8Cษออออออออออออออออออออออออออออออออออออออออออออออออ//อออออออออออออออออออออ\\อออออออออออออออออออออออออออออออออออออออออออออออป
echo [8CฬออออออออออออþÛ!bgyellow!!red!Û Tweakers Û!bgblack!!cyan!ÛþออออออออออออหออออออออออออþÛ!bgyellow!!red!Û Cleaners Û!bgblack!!cyan!ÛþอออออออออออออหอออออออþÛ!bgyellow!!red!Û Windows Repairs Û!bgblack!!cyan!Ûþอออออออน
echo [8Cบ                                        บ                                         บ                                     บ
echo [8Cบ    !1!Winaero Tweaker!cyan!               บ    !7!CCleaner + CCEnhancer!cyan!          บ   !12!Windows Repair AIO!cyan!         บ
echo [8Cบ    !2!Ultimate Windows Tweaker!cyan!      บ    !8!BleachBit!cyan!                      บ   !13!Windows Repair Toolbox!cyan!     บ
echo [8Cบ    !3!TCP Optimizer!cyan!                 บ    !9!Dism++!cyan!                         บ   !14!FixWin!cyan!                     บ
echo [8Cบ    !4!DNS Jumper!cyan!                    บ   !10!Glary Utilities!cyan!                บ                                     บ
echo [8Cบ    !5!Autoruns!cyan!                      บ   !11!Revo Uninstaller!cyan!               บ                                     บ
echo [8Cบ    !6!SpeedyFox!cyan!                     บ                                         บ                                     บ
echo [8Cบ                                        บ                                         บ                                     บ
echo [8CฬอออออออþÛ!bgyellow!!red!Û Updaters + Drivers Û!bgblack!!cyan!ÛþอออออออฮอออออออออออออþÛ!bgyellow!!red!Û Drivers Û!bgblack!!cyan!ÛþอออออออออออออฮอออออออออออþÛ!bgyellow!!red!Û Others Û!bgblack!!cyan!Ûþออออออออออออน
echo [8Cบ                                        บ                                         บ                                     บ
echo [8Cบ   !15!Patch My PC!cyan!                   บ   !21!Driver Store Explorer!cyan!          บ   !45!Everything!cyan!                 บ
echo [8Cบ   !16!UCheck!cyan!                        บ   !22!Device Cleanup Tool!cyan!            บ   !46!Process Hacker!cyan!             บ
echo [8Cบ   !17!Windows Update MiniTool!cyan!       บ   !23!Display Driver Uninstaller!cyan!     บ   !47!CrystalDiskInfo!cyan!            บ
echo [8Cบ   !18!WSUS Offline Update!cyan!           บ   !24!Radeon Software Slimmer!cyan!        บ   !48!Defender Control!cyan!           บ
echo [8Cบ   !19!DriversCloud!cyan!                  บ   !25!NVSlimmer!cyan!                      บ   !49!Edge Blocker!cyan!               บ
echo [8Cบ   !20!Snappy Driver Installer!cyan!       บ   !26!MSI Util v3!cyan!                    บ   !50!Mem Reduct!cyan!                 บ
echo [8Cบ                                        บ   !27!CPU-Z!cyan!                          บ   !51!GiveMePower!cyan!                บ
echo [8Cบ                                        บ                                         บ   !52!RegScanner!cyan!                 บ
echo [8CฬอออþÛ!bgyellow!!red!Û Windows Privacy/Telemetry Û!bgblack!!cyan!ÛþออออฮออออþÛ!bgyellow!!red!Û Anti Viruses and Malwares Û!bgblack!!cyan!Ûþออออน   !53!ISLC!cyan!                       บ
echo [8Cบ                                        บ                                         บ                                     บ
echo [8Cบ   !28!OOSU10 (Win 10)!cyan!               บ   !36!ADW Cleaner!cyan!                    บ                                     บ
echo [8Cบ   !29!Ashampoo AntiSpy (Win 10)!cyan!     บ   !37!ZHP Cleaner!cyan!                    บ                                     บ
echo [8Cบ   !30!DoNotSpy 10!cyan!                   บ   !38!Rogue Killer!cyan!                   บ                                     บ
echo [8Cบ   !31!Windows Privacy Dashboard!cyan!     บ   !39!No Bot!cyan!                         บ                                     บ
echo [8Cบ   !32!Windows 10 Privacy!cyan!            บ   !40!Kaspersky KVRT!cyan!                 บ                                     บ
echo [8Cบ   !33!Windows Spy Blocker!cyan!           บ   !41!Kaspersky TDSSKiller!cyan!           บ                                     บ
echo [8Cบ   !34!Destroy Windows 10 Spying!cyan!     บ   !42!Microsoft Safety Scanner!cyan!       บ                                     บ
echo [8Cบ   !35!Blackbird!cyan!                     บ   !43!Spybot - Search and Destroy!cyan!    บ                                     บ
echo [8Cบ                                        บ   !44!Batch Antivirus!cyan!                บ                                     บ
echo [8Cฬออออออออออออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                             !yellow!54!cyan!  ^>  !white!Windows and Office Cracks!cyan!                                           บ
echo [8Cศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!OPEN!grey!" / "!yellow!BACK!grey!" !t2! !yellow!{!t3!}!grey!." 30
echo:
call :PROMPT
for /l %%a in (!c1!,1,!c2!) do if "!x!"=="%%a" call :CHECK_INTERNET || (call :ERROR_INTERNET & goto :CONTINUEPORTABLEAPPS)
if "!x!"=="54" goto :WINDOWSANDOFFICE
call :WEBSITECHECK && goto :CONTINUEPORTABLEAPPS
call :CHOOSE open && (call :OPEN_FOLDER Portable_Apps & goto :CONTINUEPORTABLEAPPS)
call :CHOOSE back && goto :MAINMENU
for /l %%a in (!c1!,1,!c2!) do if "!%%a!"=="!yellow!%%a !checked!" goto :GOPORTABLEAPPS
call :ERRORMESSAGE
goto :CONTINUEPORTABLEAPPS

:GOPORTABLEAPPS
set IS_Log=1
set Start_Folder=
if "!1!"=="!yellow!1 !checked!" call :CURL "Portable_Apps\WinaeroTweaker.7z" "https://winaerotweaker.com/download/winaerotweaker.zip"
if "!2!"=="!yellow!2 !checked!" (
if "!windowsversion!"=="10.0" call :CURL "Portable_Apps\Ultimate Windows Tweaker 4.zip" "https://www.thewindowsclub.com/downloads/UWT4.zip"
for %%a in (6.3 6.2) do if "!windowsversion!"=="%%a" call :CURL "Portable_Apps\Ultimate Windows Tweaker 3.zip" "https://www.thewindowsclub.com/downloads/UWT3.zip"
for %%a in (6.1 6.0) do if "!windowsversion!"=="%%a" call :CURL "Portable_Apps\Ultimate Windows Tweaker.zip" "https://www.thewindowsclub.com/downloads/UWT.zip"
if not "!windowsversion:~,2!"=="10" if not "!windowsversion:~,1!"=="6" call :MSGBOX 2 "Your Windows version is not supported." "Found more informations at: https://www.thewindowsclub.com/ultimate-windows-tweaker-4-windows-10" 69648 "Illegal Services Checker"
)
if "!3!"=="!yellow!3 !checked!" call :CURL "Portable_Apps\TCPOptimizer.exe" "https://www.speedguide.net/files/TCPOptimizer.exe"
if "!4!"=="!yellow!4 !checked!" call :CURL "Portable_Apps\DnsJumper.7z" "`git_raw_downloads`/DnsJumper.7z"
if "!5!"=="!yellow!5 !checked!" call :CURL "Portable_Apps\Autoruns.zip" "https://download.sysinternals.com/files/Autoruns.zip"
if "!6!"=="!yellow!6 !checked!" call :CURL "Portable_Apps\Speedyfox.zip" "https://crystalidea.com/downloads/speedyfox.zip"
if "!7!"=="!yellow!7 !checked!" (
call :CURL "Portable_Apps\CCleaner.zip" "https://download.ccleaner.com/portable/ccsetup584.zip"
call :CURL "Portable_Apps\CCEnhancer Multilingual.zip" "https://singularlabs.com/download/10320/"
)
if "!8!"=="!yellow!8 !checked!" call :CURL "Portable_Apps\BleachBit.zip" "https://download.bleachbit.org/BleachBit-4.2.0-portable.zip"
if "!9!"=="!yellow!9 !checked!" call :CURL "Portable_Apps\Dism++.zip" "https://github.com/Chuyu-Team/Dism-Multi-language/releases/download/v10.1.1002.1/Dism++10.1.1002.1.zip"
if "!10!"=="!yellow!10 !checked!" (
if "!Language!"=="EN" set t=Do you want to
if "!Language!"=="FR" set t=Voulez vous
call :MSGBOXLEVEL 1 "!t! crack Glary Utilities ?" 69668 "Illegal Services Checker"
if "!el!"=="6" start http://www.solidfiles.com/v/kXqVAMLvWaLLL
if "!el!"=="7" call :CURL "Portable_Apps\GlaryUtilities.exe" "https://download.glarysoft.com/guportable.exe"
)
if "!11!"=="!yellow!11 !checked!" call :CURL "Portable_Apps\RevoUninstaller.zip" "https://www.revouninstaller.com/download-free-portable.php"
if "!12!"=="!yellow!12 !checked!" call :CURL "Portable_Apps\Tweaking.com - Windows Repair.7z" "`git_raw_downloads`/Tweaking.com_-_Windows_Repair.7z"
if "!13!"=="!yellow!13 !checked!" call :CURL "Portable_Apps\Windows Repair Toolbox.zip" "https://windows-repair-toolbox.com/files/Windows_Repair_Toolbox.zip"
if "!14!"=="!yellow!14 !checked!" (
if "!windowsversion!"=="10.0" call :CURL "Portable_Apps\FixWin10.zip" "https://www.thewindowsclub.com/downloads/FixWin10.zip"
for %%a in (6.3 6.2) do if "!windowsversion!"=="%%a" call :CURL "Portable_Apps\fixwin2.zip" "https://www.thewindowsclub.com/downloads/fixwin2.zip"
for %%a in (6.1 6.0) do if "!windowsversion!"=="%%a" call :CURL "Portable_Apps\FixWin.zip" "https://www.thewindowsclub.com/downloads/FixWin.zip"
if not "!windowsversion:~,2!"=="10" if not "!windowsversion:~,1!"=="6" call :MSGBOX 2 "Your Windows version is not supported." "Found more informations at: https://www.thewindowsclub.com/fixwin-for-windows-10" 69648 "Illegal Services Checker"
)
if "!15!"=="!yellow!15 !checked!" call :CURL "Portable_Apps\PatchMyPC\PatchMyPC.exe" "https://patchmypc.com/freeupdater/PatchMyPC.exe"
if "!16!"=="!yellow!16 !checked!" (
if "!arch!"=="64" call :CURL "Portable_Apps\UCheck_portable64.exe" "https://download.adlice.com/api/?action=download&app=ucheck&type=x64"
if "!arch!"=="86" call :CURL "Portable_Apps\UCheck_portable32.exe" "https://download.adlice.com/api/?action=download&app=ucheck&type=x86"
)
if "!17!"=="!yellow!17 !checked!" call :CURL "Portable_Apps\Windows Update MiniTool\wumt_x64.exe" "`git_raw_downloads`/Windows_Update_MiniTool.7z"
if "!18!"=="!yellow!18 !checked!" call :CURL "Portable_Apps\WSUS Offline Update.zip" "https://download.wsusoffline.net/wsusoffline120.zip"
if "!19!"=="!yellow!19 !checked!" (
if "!arch!"=="64" call :CURL "Portable_Apps\DriversCloud.zip" "https://www.driverscloud.com/plugins/DriversCloudx64_10_0_11_0.zip"
if "!arch!"=="86" call :CURL "Portable_Apps\DriversCloud.zip" "https://www.driverscloud.com/plugins/DriversCloud_10_0_11_0.zip"
)
if "!20!"=="!yellow!20 !checked!" call :CURL "Portable_Apps\Snappy Driver Installer.zip" "https://sdi-tool.org/releases/SDI_R2000.zip"
if "!21!"=="!yellow!21 !checked!" call :CURL "Portable_Apps\Driver Store Explorer.zip" "https://github.com/lostindark/DriverStoreExplorer/releases/download/v0.11.72/DriverStoreExplorer.v0.11.72.zip"
if "!22!"=="!yellow!22 !checked!" call :CURL "Portable_Apps\DeviceCleanup.zip" "https://www.uwe-sieber.de/files/DeviceCleanup.zip"
if "!23!"=="!yellow!23 !checked!" call :CURL "Portable_Apps\DDU.zip" "https://ftp.nluug.nl/pub/games/PC/guru3d/ddu/%%%%5BGuru3D.com%%%%5D-DDU.zip"
if "!24!"=="!yellow!24 !checked!" (
call :CURL "Portable_Apps\RadeonSoftwareSlimmer_1.2.0_net48.zip" "https://github.com/GSDragoon/RadeonSoftwareSlimmer/releases/download/1.2.0/RadeonSoftwareSlimmer_1.2.0_net48.zip"
call :CURL "Portable_Apps\RadeonSoftwareSlimmer_1.2.0_net50.zip" "https://github.com/GSDragoon/RadeonSoftwareSlimmer/releases/download/1.2.0/RadeonSoftwareSlimmer_1.2.0_net50.zip"
call :CURL "Portable_Apps\RadeonSoftwareSlimmer_1.2.0_netcoreapp31.zip" "https://github.com/GSDragoon/RadeonSoftwareSlimmer/releases/download/1.2.0/RadeonSoftwareSlimmer_1.2.0_netcoreapp31.zip"
)
if "!25!"=="!yellow!25 !checked!" call :CURL "Portable_Apps\NVSlimmer.zip" "https://ftp.nluug.nl/pub/games/PC/guru3d/nvslimmer/%%%%5BGuru3D.com%%%%5D-NVSlimmer.zip"
if "!26!"=="!yellow!26 !checked!" call :CURL "Portable_Apps\MSI_util_v3.exe" "`git_raw_downloads`/MSI_util_v3.exe"
if "!27!"=="!yellow!27 !checked!" call :CURL "Portable_Apps\CPU-Z.zip" "https://download.cpuid.com/cpu-z/cpu-z_1.95-en.zip"
if "!28!"=="!yellow!28 !checked!" call :CURL "Portable_Apps\OOSU10\OOSU10.exe" "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe"
if "!29!"=="!yellow!29 !checked!" call :CURL "Portable_Apps\Ashampoo_AntiSpy\Ashampoo_AntiSpy.exe" "https://cdn1.ashampoo.net/public/ashf/1004/Ashampoo_AntiSpy.exe"
if "!30!"=="!yellow!30 !checked!" call :CURL "Portable_Apps\DoNotSpy10.7z" "`git_raw_downloads`/DoNotSpy10.7z"
if "!31!"=="!yellow!31 !checked!" call :CURL "Portable_Apps\Windows Privacy Dashboard.zip" "https://wpd.app/get/latest.zip"
if "!32!"=="!yellow!32 !checked!" call :CURL "Portable_Apps\W10Privacy.zip" "https://www.w10privacy.de/app/download/12302828636/W10Privacy.zip?t=1603644531"
if "!33!"=="!yellow!33 !checked!" call :CURL "Portable_Apps\WindowsSpyBlocker\WindowsSpyBlocker.exe" "https://github.com/crazy-max/WindowsSpyBlocker/releases/latest/download/WindowsSpyBlocker.exe"
if "!34!"=="!yellow!34 !checked!" (
call :CURL "Portable_Apps\Destroy Windows 10 Spying.zip" "https://github.com/Wohlstand/Destroy-Windows-10-Spying/releases/download/2.2.2.2.27/DWS-build-Win7881-2.2.2.2.27.zip"
call :CURL "Portable_Apps\Destroy Windows 10 Spying RE.zip" "https://github.com/Wohlstand/Destroy-Windows-10-Spying/releases/download/RE-1.0.2.0.23.1/DWS-RE-1.0.2.0.23.zip"
)
if "!35!"=="!yellow!35 !checked!" (
if "!arch!"=="64" call :CURL "Portable_Apps\Blackbird.zip" "https://getblackbird.net/download/Blackbird_v1.0.80.2_x64.zip"
if "!arch!"=="86" call :CURL "Portable_Apps\Blackbird.zip" "https://getblackbird.net/download/Blackbird_v1.0.80.2_x32.zip"
)
if "!36!"=="!yellow!36 !checked!" call :CURL "Portable_Apps\AdwCleaner\AdwCleaner.exe" "https://download.toolslib.net/download/direct/1/latest"
if "!37!"=="!yellow!37 !checked!" call :CURL "Portable_Apps\ZHPCleaner\ZHPCleaner.exe" "https://nicolascoolman.eu/download/telechargez-zhpcleaner-gratuit/?wpdmdl=23616"
if "!38!"=="!yellow!38 !checked!" (
if "!arch!"=="64" call :CURL "Portable_Apps\RogueKiller\RogueKiller_portable64.exe" "https://download.adlice.com/api/?action=download&app=roguekiller&type=x64"
if "!arch!"=="86" call :CURL "Portable_Apps\RogueKiller\RogueKiller_portable86.exe" "https://download.adlice.com/api/?action=download&app=roguekiller&type=x86"
)
if "!39!"=="!yellow!39 !checked!" call :CURL "Portable_Apps\NoBot\NoBot.exe" "https://nobotsecurity.com/Software/NoBot.exe"
if "!40!"=="!yellow!40 !checked!" call :CURL "Portable_Apps\KVRT.exe" "https://devbuilds.s.kaspersky-labs.com/devbuilds/KVRT/latest/full/KVRT.exe"
if "!41!"=="!yellow!41 !checked!" call :CURL "Portable_Apps\tdsskiller.exe" "https://media.kaspersky.com/utilities/VirusUtilities/EN/tdsskiller.exe"
if "!42!"=="!yellow!42 !checked!" (
if "!arch!"=="64" call :CURL "Portable_Apps\MSERT.exe" "https://go.microsoft.com/fwlink/?LinkId=212732"
if "!arch!"=="86" call :CURL "Portable_Apps\MSERT.exe" "https://go.microsoft.com/fwlink/?LinkId=212733"
)
if "!43!"=="!yellow!43 !checked!" call :CURL "Portable_Apps\SpybotPortable_2.7.64-2020-02.paf.exe" "https://download3.portableapps.com/portableapps/SpybotPortable/SpybotPortable_2.8.68.paf.exe"
if "!44!"=="!yellow!44 !checked!" call :CURL "Portable_Apps\Batch Antivirus.zip" "https://github.com/anic17/Batch-Antivirus/archive/master.zip"
if "!45!"=="!yellow!45 !checked!" (
if "!arch!"=="64" call :CURL "Portable_Apps\Everything-x64.zip" "https://www.voidtools.com/Everything-1.4.1.1005.x64.zip"
if "!arch!"=="86" call :CURL "Portable_Apps\Everything-x86.zip" "https://www.voidtools.com/Everything-1.4.1.1005.x86.zip"
)
if "!46!"=="!yellow!46 !checked!" call :CURL "Portable_Apps\Process Hacker.zip" "https://ci.appveyor.com/api/buildjobs/rq7c4oi8svf0la0y/artifacts/processhacker-3.0.4330-bin.zip"
if "!47!"=="!yellow!47 !checked!" call :CURL "Portable_Apps\CrystalDiskInfo.zip" "https://crystalmark.info/redirect.php?product=CrystalDiskInfo"
if "!48!"=="!yellow!48 !checked!" call :CURL "Portable_Apps\DefenderControl.zip" "https://www.sordum.org/files/download/d-control/dControl.zip"
if "!49!"=="!yellow!49 !checked!" call :CURL "Portable_Apps\EdgeBlocker.zip" "https://www.sordum.org/files/download/edge-blocker/EdgeBlock.zip"
if "!50!"=="!yellow!50 !checked!" call :CURL "Portable_Apps\memreduct-3.3.5-bin.zip" "https://github.com/henrypp/memreduct/releases/download/v.3.3.5/memreduct-3.3.5-bin.zip"
if "!51!"=="!yellow!51 !checked!" call :CURL "Portable_Apps\GiveMePower v2.1.0.0.exe" "https://www.wagnardsoft.com/DDU/download/GiveMePower%%%%20v2.1.0.0.exe"
if "!52!"=="!yellow!52 !checked!" (
if "!arch!"=="64" call :CURL "Portable_Apps\regscanner-x64.zip" "https://www.nirsoft.net/utils/regscanner-x64.zip"
if "!arch!"=="86" call :CURL "Portable_Apps\regscanner.zip" "https://www.nirsoft.net/utils/regscanner.zip"
)
if "!53!"=="!yellow!53 !checked!" call :CURL "Portable_Apps\ISLC v1.0.2.4.exe" "https://www.wagnardsoft.com/ISLC/ISLC%%%%20v1.0.2.4.exe"
set IS_Log=
if exist "!TMPF!\IS_Log.txt" (
echo !red!
type "!TMPF!\IS_Log.txt"
del /f /q "!TMPF!\IS_Log.txt"
echo !yellow!
pause
)
if defined Start_Folder start /max explorer.exe "Portable_Apps"
goto :CLEARPORTABLEAPPS

:WINDOWSANDOFFICE
call :SCALE 90 31
title Windows and Office Cracks
call :ROSE "Windows and Office Cracks"

:CLEARWINDOWSANDOFFICE
call :CLEAR 1 19
set db=free.appnee.com/consoleact/ free.appnee.com/aact/ free.appnee.com/ra1n-act1vat0r/ free.appnee.com/re-loader-activator/ free.appnee.com/windows-loader/ free.appnee.com/hwid-gen/ free.appnee.com/w10-digital-license-c-sharp/ free.appnee.com/kmsauto-lite/ free.appnee.com/kmsauto-net/ free.appnee.com/kmsoffline/ free.appnee.com/kmsonline/ free.appnee.com/kmsauto-helper/ `www.solidfiles.com/v/QnQeqgqKa3jev `www.solidfiles.com/v/kXqVBML2mmBDA free.appnee.com/msact/ "Windows ISO Downloader" the-eye.eu/public/MSDN/Windows%%207/ tb.rg-adguard.net/public.php free.appnee.com/office-2013-2021-c2r-install/

:CONTINUEWINDOWSANDOFFICE
call :SCALE 90 31
echo !cyan!
echo [30Cอออออออออออออออออออออออออออออออออ
echo [29C// !red!Û!bgyellow!!black! WINDOWS AND OFFICE CRACKS !red!Û!bgblack!!cyan! \\
echo [10Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [10CฬออออออออþÛ!bgyellow!!red!Û Activators Û!bgblack!!cyan!ÛþออออออออหออออออออออþÛ!bgyellow!!red!Û Tools Û!bgblack!!cyan!Ûþอออออออออออน
echo [10Cบ                                  บ                                  บ
echo [10Cบ     !1!ConsoleAct!cyan!             บ    !12!KMSAuto Helper!cyan!         บ
echo [10Cบ     !2!AAct!cyan!                   บ    !13!KMSCleaner!cyan!             บ
echo [10Cบ     !3!Ra1n Act1vat0r!cyan!         บ    !14!WAT Fix!cyan!                บ
echo [10Cบ     !4!Re-Loader Activator!cyan!    บ    !15!MSAct!cyan!                  บ
echo [10Cบ     !5!Windows Loader!cyan!         บ                                  บ
echo [10Cบ     !6!HWID GEN MkVI!cyan!          บ                                  บ
echo [10Cบ     !7!W10 Digital License!cyan!    บ                                  บ
echo [10Cบ     !8!KMSAuto Lite!cyan!           บ                                  บ
echo [10Cบ     !9!KMSAuto Net!cyan!            บ                                  บ
echo [10Cบ    !10!KMSoffline!cyan!             บ                                  บ
echo [10Cบ    !11!KMSonline!cyan!              บ                                  บ
echo [10Cฬออออออออออออออออออออออออออออออออออสออออออออออออออออออออออออออออออออออน
echo [10CฬอออออออออออออออออออออออออþÛ!bgyellow!!red!Û Downloaders Û!bgblack!!cyan!Ûþอออออออออออออออออออออออออน
echo [10Cบ                                                                     บ
echo [10Cบ               !16!Windows ISO Downloader!cyan!                         บ
echo [10Cบ               !17!the-eye.eu!cyan!                                     บ
echo [10Cบ               !18!rg-adguard.net!cyan!                                 บ
echo [10Cบ               !19!Office 2013-2019 C2R Install!cyan!                   บ
echo [10Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!OPEN!grey!" / "!yellow!BACK!grey!" !t2! !yellow!{!t3!}!grey!." 30
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEWINDOWSANDOFFICE
call :CHOOSE open && (call :OPEN_FOLDER Portable_Apps & goto :CONTINUEWINDOWSANDOFFICE)
call :CHOOSE back && goto :PORTABLEAPPS
call :WEBSITESTART && goto :CLEARWINDOWSANDOFFICE
call :ERRORMESSAGE
goto :CONTINUEWINDOWSANDOFFICE

:MOREFEATURES
call :SCALE 62 20
title More Features
call :ROSE "More Features"

:CONTINUEMOREFEATURES
call :SCALE 62 20
echo !cyan!
echo [20Cอออออออออออออออออออออ
echo [19C// !red!Û!bgyellow!!black! MORE FEATURES !red!Û!bgblack!!cyan! \\
echo [11Cษอออออออออออออออออออออออออออออออออออออป
echo [11Cบ    !yellow!1 !white!Warez Content Creator!cyan!          บ
echo [11Cบ    !yellow!2 !white!Warez Wikis!cyan!                    บ
echo [11Cบ    !yellow!3 !white!Release Logs!cyan!                   บ
echo [11Cบ    !yellow!4 !white!Ebooks!cyan!                         บ
echo [11Cบ    !yellow!5 !white!Musics!cyan!                         บ
echo [11Cบ    !yellow!6 !white!Forum Websites!cyan!                 บ
echo [11Cบ    !yellow!7 !white!Windows Repair!cyan!                 บ
echo [11Cบ    !yellow!8 !white!Windows Tweaks!cyan!                 บ
echo [11Cบ    !yellow!9 !white!Windows Game Booster!cyan!           บ
echo [11Cศอออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!OPEN!grey!" / "!yellow!BACK!grey!" !t2! !yellow!{!t3!}!grey!." 30
echo:
call :PROMPT
set cn=
for %%a in (WAREZCONTENTCREATOR WAREZWIKIS RELEASELOGS EBOOKS MUSICS FORUMWEBSITES WINDOWSREPAIR WINDOWSTWEAKS) do (
set /a cn+=1
if "!x!"=="!cn!" goto :%%a
)
if "!x!"=="9" (
echo !cyan!
if "!Language!"=="EN" (
call :DRAW_CENTER "Do you want to [!yellow!E!cyan!]nable, [!yellow!D!cyan!]isable or [!yellow!B!cyan!]ack ?" 30
>nul choice /n /c EDB
)
if "!Language!"=="FR" (
call :DRAW_CENTER "Voulez-vous [!yellow!A!cyan!]ctiver, [!yellow!D!cyan!]sactiver ou [!yellow!R!cyan!]etour ?" 30
>nul choice /n /c ADR
)
if "!errorlevel!"=="1" call :GAME_BOOSTER Enabling normal disabled enabled
if "!errorlevel!"=="2" call :GAME_BOOSTER Disabling normal demand disabled
goto :MOREFEATURES
)
call :CHOOSE open && (call :OPEN_FOLDER Portable_Apps & goto :CONTINUEMOREFEATURES)
call :CHOOSE back && goto :MAINMENU
call :ERRORMESSAGE
goto :CONTINUEMOREFEATURES

:WAREZCONTENTCREATOR
call :SCALE 69 22
title Warez Content Creator
call :ROSE "Warez Content Creator"

:CLEARWAREZCONTENTCREATOR
call :CLEAR 1 9
set db="Mkv Tool Nix" FFmpeg LosslessCut HandBrake "Subtitle Editor" CCExtractor "VLC Media Player" MediaInfo "Open Broadcaster Software"

:CONTINUEWAREZCONTENTCREATOR
call :SCALE 69 22
echo !cyan!
echo [20Cอออออออออออออออออออออออออออออ
echo [19C// !red!Û!bgyellow!!black! WAREZ CONTENT CREATOR !red!Û!bgblack!!cyan! \\
echo [5Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [5Cบ                                                         บ
echo [5Cบ    !1!Mkv Tool Nix !green!(.mkv Video Editing)!cyan!              บ
echo [5Cบ    !2!FFmpeg !green!(Video/Audio Editing)!cyan!                   บ
echo [5Cบ    !3!LosslessCut !green!(Video/Audio Editing)!cyan!              บ
echo [5Cบ    !4!HandBrake !green!(Video Transcoder)!cyan!                   บ
echo [5Cบ    !5!Subtitle Editor !green!(Subtitle Editor)!cyan!              บ
echo [5Cบ    !6!CCExtractor !green!(Subtitle Extractor)!cyan!               บ
echo [5Cบ    !7!VLC Media Player !green!(Multimedia Player)!cyan!           บ
echo [5Cบ    !8!MediaInfo !green!(Digital Media Analysis)!cyan!             บ
echo [5Cบ    !9!Open Broadcaster Software !green!(Screen Recorder)!cyan!    บ
echo [5Cบ                                                         บ
echo [5Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" !t2! !yellow!{!t3!}!grey!." 20
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEWAREZCONTENTCREATOR
call :CHOOSE back && goto :MOREFEATURES
if not defined x for /l %%a in (!c1!,1,!c2!) do if "!%%a!"=="!yellow!%%a !checked!" goto :GOWAREZCONTENTCREATOR
call :ERRORMESSAGE
goto :CONTINUEWAREZCONTENTCREATOR

:GOWAREZCONTENTCREATOR
if "!1!"=="!yellow!1 !checked!" start "" "https://mkvtoolnix.download/" && cmdwiz.exe delay 1500
if "!2!"=="!yellow!2 !checked!" start "" "https://ffmpeg.org/" && cmdwiz.exe delay 1500
if "!3!"=="!yellow!3 !checked!" start "" "https://mifi.github.io/lossless-cut/" && cmdwiz.exe delay 1500
if "!4!"=="!yellow!4 !checked!" start "" "https://handbrake.fr/" && cmdwiz.exe delay 1500
if "!5!"=="!yellow!5 !checked!" start "" "https://www.nikse.dk/SubtitleEdit" && cmdwiz.exe delay 1500
if "!6!"=="!yellow!6 !checked!" start "" "https://ccextractor.org/" && cmdwiz.exe delay 1500
if "!7!"=="!yellow!7 !checked!" start "" "https://www.videolan.org/vlc/" && cmdwiz.exe delay 1500
if "!8!"=="!yellow!8 !checked!" start "" "https://mediaarea.net/en/MediaInfo" && cmdwiz.exe delay 1500
if "!9!"=="!yellow!9 !checked!" start "" "https://obsproject.com/"
goto :CLEARWAREZCONTENTCREATOR

:WAREZWIKIS
call :SCALE 76 32
title Warez Wikis
call :ROSE "Warez Wikis"

:CLEARWAREZWIKIS
call :CLEAR 1 19
set db=weboas.is/ dirtywarez.org/ link-base.org/warez p2pfr.com/ www.mega-p2p.net/ lewebde.com/ `machicoulis.over-blog.com/2019/11/les-bons-liens-pour-telecharger.html www.reddit.com/r/Piracy/wiki/megathread www.reddit.com/r/FREEMEDIAHECKYEAH/wiki/index rentry.org/pgames-mega-thread github.com/Igglybuff/awesome-piracy/blob/master/readme.md github.com/nbats/FMHY/blob/main/fmhy.md github.com/Rekulous/FMHY/blob/main/fmhy.md github.com/Rekulous/The-Piratez-List/blob/main/The%%20Safe%%20Shores/Software.md github.com/taskylizard/piratedgames-megathread/blob/main/README.md github.com/Rekulous/Pirated-Games/blob/main/README.md darknetlive.com/onions/ dark.fail/ ddosforhire.net/

:CONTINUEWAREZWIKIS
call :SCALE 76 32
echo !cyan!
echo [28Cอออออออออออออออออออ
echo [27C// !red!Û!bgyellow!!black! WAREZ WIKIS !red!Û!bgblack!!cyan! \\
echo [6Cษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [6Cบ                                                              บ
echo [6Cบ    !1!weboas.is!cyan!                                           บ
echo [6Cบ    !2!dirtywarez.org!cyan!                                      บ
echo [6Cบ    !3!link-base.org!cyan!                                       บ
echo [6Cบ    !4!p2pfr.com !green!(FR)!cyan!                                      บ
echo [6Cบ    !5!www.mega-p2p.net !green!(FR)!cyan!                               บ
echo [6Cบ    !6!lewebde.com !green!(FR)!cyan!                                    บ
echo [6Cบ    !7!machicoulis.over-blog.com !green!(FR)!cyan!                      บ
echo [6Cบ    !8!r/Piracy!cyan!                                            บ
echo [6Cบ    !9!r/FREEMEDIAHECKYEAH!cyan!                                 บ
echo [6Cบ   !10!r/pgames-mega-thread!cyan!                                บ
echo [6Cบ   !11!Igglybuff/awesome-piracy!cyan!                            บ
echo [6Cบ   !12!nbats/FMHY!cyan!                                          บ
echo [6Cบ   !13!Rekulous/FMHY!cyan!                                       บ
echo [6Cบ   !14!taskylizard/piratedgames-megathread !green!(videogames)!cyan!    บ
echo [6Cบ   !15!Rekulous/Pirated-Games !green!(videogames)!cyan!                 บ
echo [6Cบ   !16!Rekulous/The-Piratez-list !green!(softwares)!cyan!               บ
echo [6Cบ   !17!darknetlive.com !green!(darknet)!cyan!                           บ
echo [6Cบ   !18!dark.fail !green!(darknet)!cyan!                                 บ
echo [6Cบ   !19!ddosforhire.net !green!(DDoS)!cyan!                              บ
echo [6Cบ                                                              บ
echo [6Cศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" / !t2! !yellow!{!t3!}!grey!." 20
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEWAREZWIKIS
call :CHOOSE back && goto :MOREFEATURES
call :WEBSITESTART && goto :CLEARWAREZWIKIS
call :ERRORMESSAGE
goto :CONTINUEWAREZWIKIS

:RELEASELOGS
call :SCALE 71 20
title Release Logs
call :ROSE "Release Logs"

:CLEARRELEASELOGS
call :CLEAR 1 7
set db=predb.me/ corrupt-net.org/ m2v.ru/ forum.squawkr.io/ upawg.ca/ nzbindex.com/ binsearch.info/

:CONTINUERELEASELOGS
call :SCALE 66 20
echo !cyan!
echo [22Cออออออออออออออออออออ
echo [21C// !red!Û!bgyellow!!black! Release Logs !red!Û!bgblack!!cyan! \\
echo [12Cษอออออออออออออออออออออออออออออออออออออออป
echo [12Cบ                                       บ
echo [12Cบ    !1!predb.me!cyan!                     บ
echo [12Cบ    !2!corrupt-net.org!cyan!              บ
echo [12Cบ    !3!m2v.ru!cyan!                       บ
echo [12Cบ    !4!forum.squawkr.io !green!(movies)!cyan!    บ
echo [12Cบ    !5!upawg.ca !green!(audio)!cyan!             บ
echo [12Cบ    !6!nzbindex.com !green!(NZB)!cyan!           บ
echo [12Cบ    !7!binsearch.info !green!(NZB)!cyan!         บ
echo [12Cบ                                       บ
echo [12Cศอออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" / "!yellow!SEARCH!grey!" / !t2! !yellow!{!t3!}!grey!." 30
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUERELEASELOGS
call :CHOOSE back && goto :MOREFEATURES
call :CHOOSE search && (call :IS_SEARCH 25be77c4b1e53f006 & goto :CONTINUERELEASELOGS)
call :WEBSITESTART && goto :CLEARRELEASELOGS
call :ERRORMESSAGE
goto :CONTINUERELEASELOGS

:EBOOKS
call :SCALE 100 60
title Ebooks
call :ROSE Ebooks

:CLEAREBOOKS
call :CLEAR 1 77
set db=z-lib.org/ www.pdfdrive.com/ english-bookys.com/ `bookddl.com/ zone-ebook.com/ ww2.bookys-ebooks.com/ `ebook-planete.org/ planete-bd.org/ dbfree.me/ pdf.1001ebooks.com/ www.pdf-ebookys.com/ downmagaz.net/ magazinelib.com/ telecharge-magazines.com/ fr.downmagaz.net/ mangaowl.net/ mangadex.org/ manganato.com/ unionmangas.top/home mangaplus.shueisha.co.jp/updates fascans.com/ mangakatana.com/ manga4life.com/ bato.to/ mangapark.net/ www.mangahere.cc/ fanfox.net/ wuxiaworld.site/ hatigarmscanz.net/home leviatanscans.com/levi/ methodscans.com/home the-nonames.com/home lynxscans.com/home skscans.com/ zeroscans.com/home reader.deathtollscans.net/ reader.kireicake.com/ sensescans.com/ manhuaplus.com/ readm.org/ mangasee123.com/ www.asurascans.com/ naniscans.com/ merakiscans.com/ mangajar.com/ toonily.net/ www.nonstopscans.com/ guya.moe/ mangahub.io/ comick.fun/ www.japanread.cc/ catmanga.org/ mangasushi.net/ arangscans.com/ hunlight-scans.info/home tritinia.com/ readmanhua.net/manga/ flamescans.org/ immortalupdates.com/ manga347.com/ www.bilibilicomics.com/ www.mangatown.com/ www.mangahome.com/ manga47.net/ comix.top/ www.readlightnovel.org/ reaperscans.com/ reaperscans.fr/ scantrad.net/ kangaryu-team.fr/ www.japscan.ws/ www.scan-fr.cc/ lelscan-vf.co/ mangas.heoo.workers.dev/0:/ lectortmo.com/ github.com/MALSync/MALSync/blob/master/pages.md

:CONTINUEEBOOKS
call :SCALE 100 60
echo !cyan!
echo [43Cออออออออออออออ
echo [42C// !red!Û!bgyellow!!black! Ebooks !red!Û!bgblack!!cyan! \\
echo [7Cษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [7Cบ                                                                                    บ
echo [7Cบ    !1!z-lib.org!cyan!                      ณ   !7!ebook-planete.org !green!(FR)!cyan!           บ
echo [7Cบ    !2!www.pdfdrive.com!cyan!               ณ   !8!planete-bd.org !green!(FR)!cyan!              บ
echo [7Cบ    !3!english-bookys.com!cyan!             ณ   !9!dbfree.me !green!(FR)!cyan!                   บ
echo [7Cบ    !4!bookddl.com !green!(FR)!cyan!               ณ  !10!pdf.1001ebooks.com !green!(FR)!cyan!          บ
echo [7Cบ    !5!zone-ebook.com !green!(FR)!cyan!            ณ  !11!www.pdf-ebookys.com !green!(FR)!cyan!         บ
echo [7Cบ    !6!ww2.bookys-ebooks.com !green!(FR)!cyan!     ณ                                          บ
echo [7Cบ                                                                                    บ
echo [7CฬอออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û MAGAZINES Û!bgblack!!cyan!Ûþออออออออออออออออออออออออออออออออออน
echo [7Cบ                                                                                    บ
echo [7Cบ   !12!downmagaz.net!cyan!                  ณ   !14!telecharge-magazines.com !green!(FR)!cyan!   บ
echo [7Cบ   !13!magazinelib.com!cyan!                ณ   !15!fr.downmagaz.net !green!(FR)!cyan!           บ
echo [7Cบ                                                                                    บ
echo [7CฬอออออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û MANGAS Û!bgblack!!cyan!Ûþอออออออออออออออออออออออออออออออออออน
echo [7Cบ                                                                                    บ
echo [7Cบ   !16!mangaowl.net!cyan!                   ณ   !47!toonily.net!cyan!                     บ
echo [7Cบ   !17!www.mangago.me!cyan!                 ณ   !48!www.nonstopscans.com!cyan!            บ
echo [7Cบ   !18!mangadex.org!cyan!                   ณ   !49!guya.moe!cyan!                        บ
echo [7Cบ   !19!manganato.com!cyan!                  ณ   !50!mangahub.io!cyan!                     บ
echo [7Cบ   !20!unionmangas.top!cyan!                ณ   !51!comick.fun!cyan!                      บ
echo [7Cบ   !21!mangaplus.shueisha.co.jp!cyan!       ณ   !52!www.japanread.cc!cyan!                บ
echo [7Cบ   !22!fascans.com!cyan!                    ณ   !53!catmanga.org!cyan!                    บ
echo [7Cบ   !23!mangakatana.com!cyan!                ณ   !54!mangasushi.net!cyan!                  บ
echo [7Cบ   !24!manga4life.com!cyan!                 ณ   !55!arangscans.com!cyan!                  บ
echo [7Cบ   !25!bato.to!cyan!                        ณ   !56!hunlight-scans.info!cyan!             บ
echo [7Cบ   !26!mangapark.net!cyan!                  ณ   !57!tritinia.com!cyan!                    บ
echo [7Cบ   !27!www.mangahere.cc!cyan!               ณ   !58!readmanhua.net!cyan!                  บ
echo [7Cบ   !28!fanfox.net!cyan!                     ณ   !59!flamescans.org!cyan!                  บ
echo [7Cบ   !29!wuxiaworld.site!cyan!                ณ   !60!immortalupdates.com!cyan!             บ
echo [7Cบ   !30!hatigarmscanz.net!cyan!              ณ   !61!manga347.com!cyan!                    บ
echo [7Cบ   !31!leviatanscans.com!cyan!              ณ   !62!www.bilibilicomics.com!cyan!          บ
echo [7Cบ   !32!methodscans.com!cyan!                ณ   !63!www.mangatown.com!cyan!               บ
echo [7Cบ   !33!the-nonames.com!cyan!                ณ   !64!www.mangahome.com!cyan!               บ
echo [7Cบ   !34!lynxscans.com!cyan!                  ณ   !65!manga47.net!cyan!                     บ
echo [7Cบ   !35!skscans.com!cyan!                    ณ   !66!comix.top!cyan!                       บ
echo [7Cบ   !36!zeroscans.com!cyan!                  ณ   !67!www.readlightnovel.org!cyan!          บ
echo [7Cบ   !37!reader.deathtollscans.net!cyan!      ณ   !68!reaperscans.com!cyan!                 บ
echo [7Cบ   !38!reader.kireicake.com!cyan!           ณ   !69!reaperscans.fr !green!(FR)!cyan!             บ
echo [7Cบ   !39!sensescans.com!cyan!                 ณ   !70!scantrad.net !green!(FR)!cyan!               บ
echo [7Cบ   !40!manhuaplus.com!cyan!                 ณ   !71!kangaryu-team.fr !green!(FR)!cyan!           บ
echo [7Cบ   !41!readm.org!cyan!                      ณ   !72!www.japscan.ws !green!(FR)!cyan!             บ
echo [7Cบ   !42!mangasee123.com!cyan!                ณ   !73!www.scan-fr.cc !green!(FR)!cyan!             บ
echo [7Cบ   !43!www.asurascans.com!cyan!             ณ   !74!lelscan-vf.co !green!(FR)!cyan!              บ
echo [7Cบ   !44!naniscans.com!cyan!                  ณ   !75!mangas.heoo.workers.dev !green!(FR)!cyan!    บ
echo [7Cบ   !45!merakiscans.com!cyan!                ณ   !76!lectortmo.com !green!(ES)!cyan!              บ
echo [7Cบ   !46!mangajar.com!cyan!                   ณ                                          บ
echo [7Cบ                                                                                    บ
if "!Language!"=="EN" echo [7Cบ                      !brightmagenta!Alternatively you can visit: !77!MALSync!cyan!                   บ
if "!Language!"=="FR" echo [7Cบ                  !brightmagenta!Alternativement vous pouvez visiter: !77!MALSync!cyan!               บ
echo [7Cบ                                                                                    บ
echo [7Cศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" / "!yellow!SEARCH!grey!" / !t2! !yellow!{!t3!}!grey!." 30
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEEBOOKS
call :CHOOSE back && goto :MOREFEATURES
call :CHOOSE search && (call :IS_SEARCH 6777a3e064386f381 & goto :CONTINUEEBOOKS)
call :WEBSITESTART && goto :CLEAREBOOKS
call :ERRORMESSAGE
goto :CONTINUEEBOOKS

:MUSICS
call :SCALE 68 25
title Musics
call :ROSE Musics

:CLEARMUSICS
call :CLEAR 1 9
set db=flacmusic.info/ losslessma.net/ www.reddit.com/r/riprequests/ downloads.khinsider.com/ www.vgmusic.com/ freshremix.ru/ www.slsknet.org/news/ deemix.app/ freezer.life/

:CONTINUEMUSICS
call :SCALE 68 25
echo !cyan!
echo [27Cออออออออออออออ
echo [26C// !red!Û!bgyellow!!black! Musics !red!Û!bgblack!!cyan! \\
echo [8Cษออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [8Cบ                                                  บ
echo [8Cบ    !1!flacmusic.info!cyan!                          บ
echo [8Cบ    !2!losslessma.net!cyan!                          บ
echo [8Cบ    !3!r/riprequests!cyan!                           บ
echo [8Cบ    !4!downloads.khinsider.com !green!(videogames)!cyan!    บ
echo [8Cบ    !5!www.vgmusic.com !green!(videogames)!cyan!            บ
echo [8Cบ    !6!freshremix.ru !green!(remixes)!cyan!                 บ
echo [8Cบ                                                  บ
echo [8CฬออออออออออออþÛ!bgyellow!!red!Û Music Applications Û!bgblack!!cyan!Ûþออออออออออออน
echo [8Cบ                                                  บ
echo [8Cบ    !7!www.slsknet.org!cyan!                         บ
echo [8Cบ    !8!deemix.app!cyan!                              บ
echo [8Cบ    !9!freezer.life!cyan!                            บ
echo [8Cบ                                                  บ
echo [8Cศออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" / "!yellow!SEARCH!grey!" / !t2! !yellow!{!t3!}!grey!." 30
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEMUSICS
call :CHOOSE back && goto :MOREFEATURES
call :CHOOSE search && (call :IS_SEARCH 77345bf220e8f0c91 & goto :CONTINUEMUSICS)
call :WEBSITESTART && goto :CLEARMUSICS
call :ERRORMESSAGE
goto :CONTINUEMUSICS

:FORUMWEBSITES
call :SCALE 126 37
title Forum Websites
call :ROSE "Forum Websites"

:CLEARFORUMWEBSITES
call :CLEAR 1 37
set db=www.adit-hd.com/ forum.ddlvalley.me/ www.warezheaven.com/index.php forum.snahp.it/ www.mywarez.org/ ddlbase.net/ forumpoint.org/ www.wawa-rammstein.de/ starwarez-sharing.name/Fofo/ `forum.anime-ultime.net/phpBB3/index.php pirates-forum.org/ eztv.re/forum/ forums.glodls.to/ torrentgalaxy.to/forums.php www.ettvcentral.com/forums.php forums.anidex.moe/ prostylex.org/forums.php/ angietorrents.cc/forum/index.php forum.p2pfr.com/ www.tigers-dl.net/ www.forumzt.com/ www.frboard.com/ rutracker.org/forum/index.php forum.mobilism.me/ forum.release-apk.com/ platinmods.com/ forum.telecharger-jeuxpc.fr/ tapochek.net/ forum.repack.me/ planete-warez.net/ www.nulled.to/ raidforums.com/ hackforums.net/ cracked.to/ payload.sh/ teamos-hkrg.com/ forum.ru-board.com/

:CONTINUEFORUMWEBSITES
call :SCALE 126 37
echo !cyan!
echo [51Cออออออออออออออออออออออ
echo [50C// !red!Û!bgyellow!!black! FORUM WEBSITES !red!Û!bgblack!!cyan! \\
echo [7Cษอออออออออออออออออออออออออออออออออออออออออ//ออออออออออออออออออออออ\\อออออออออออออออออออออออออออออออออออออออออออป
echo [7CฬอออออออออออออออออออออออออออออออออออออออออออออออþÛ!bgyellow!!red!Û Warez Û!bgblack!!cyan!Ûþออออออออออออออออออออออออออออออออออออออออออออออออออน
echo [7Cบ                                                                                                              บ
echo [7Cบ    !1!www.adit-hd.com        !green!DDL        [EN]!cyan!    ณ   !16!forums.anidex.moe           !green!Torrenting [EN]!cyan!    บ
echo [7Cบ    !2!forum.ddlvalley.me     !green!DDL        [EN]!cyan!    ณ   !17!prostylex.org               !green!Torrenting [EN]!cyan!    บ
echo [7Cบ    !3!www.warezheaven.com    !green!DDL        [EN]!cyan!    ณ   !18!angietorrents.cc            !green!Torrenting [EN]!cyan!    บ
echo [7Cบ    !4!forum.snahp.it         !green!DDL        [EN]!cyan!    ณ   !19!forum.p2pfr.com             !green!Torrenting [FR]!cyan!    บ
echo [7Cบ    !5!www.mywarez.org        !green!DDL        [EN]!cyan!    ณ   !20!www.tigers-dl.net           !green!Torrenting [FR]!cyan!    บ
echo [7Cบ    !6!ddlbase.net            !green!DDL        [EN]!cyan!    ณ   !21!www.forumzt.com             !green!Torrenting [FR]!cyan!    บ
echo [7Cบ    !7!forumpoint.org         !green!DDL        [EN]!cyan!    ณ   !22!www.frboard.com             !green!Torrenting [FR]!cyan!    บ
echo [7Cบ    !8!www.wawa-rammstein.de  !green!DDL        [EN]!cyan!    ณ   !23!rutracker.org               !green!Torrenting [RU]!cyan!    บ
echo [7Cบ    !9!starwarez-sharing.name !green!DDL        [FR]!cyan!    ณ   !24!forum.mobilism.me           !green!Cracking   [EN]!cyan!    บ
echo [7Cบ   !10!forum.anime-ultime.net !green!Streaming  [FR]!cyan!    ณ   !25!forum.release-apk.com       !green!Cracking   [EN]!cyan!    บ
echo [7Cบ   !11!pirates-forum.org      !green!Torrenting [EN]!cyan!    ณ   !26!platinmods.com              !green!Cracking   [EN]!cyan!    บ
echo [7Cบ   !12!eztv.re                !green!Torrenting [EN]!cyan!    ณ   !27!forum.telecharger-jeuxpc.fr !green!Cracking   [FR]!cyan!    บ
echo [7Cบ   !13!forums.glodls.to       !green!Torrenting [EN]!cyan!    ณ   !28!tapochek.net                !green!Cracking   [RU]!cyan!    บ
echo [7Cบ   !14!torrentgalaxy.to       !green!Torrenting [EN]!cyan!    ณ   !29!forum.repack.me             !green!Cracking   [RU]!cyan!    บ
echo [7Cบ   !15!www.ettvcentral.com    !green!Torrenting [EN]!cyan!    ณ   !30!planete-warez.net           !green!Warez      [FR]!cyan!    บ
echo [7Cบ                                                                                                              บ
echo [7CฬออออออออออออออออออþÛ!bgyellow!!red!Û Hacking Û!bgblack!!cyan!ÛþอออออออออออออออออออหอออออออออออออออออออออþÛ!bgyellow!!red!Û Others Û!bgblack!!cyan!Ûþออออออออออออออออออออออน
echo [7Cบ                                                    บ                                                         บ
echo [7Cบ   !31!www.nulled.to  !green![EN]!cyan!                       บ   !36!teamos-hkrg.com    !green![EN]!cyan!                        บ
echo [7Cบ   !32!raidforums.com !green![EN]!cyan!                       บ   !37!forum.ru-board.com !green![RU]!cyan!                        บ
echo [7Cบ   !33!hackforums.net !green![EN]!cyan!                       บ                                                         บ
echo [7Cบ   !34!cracked.to     !green![EN]!cyan!                       บ                                                         บ
echo [7Cบ   !35!payload.sh     !green![EN]!cyan!                       บ                                                         บ
echo [7Cบ                                                    บ                                                         บ
echo [7Cศออออออออออออออออออออออออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" !t2! !yellow!{!t3!}!grey!." 20
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEFORUMWEBSITES
call :CHOOSE back && goto :MOREFEATURES
call :WEBSITESTART && goto :CLEARFORUMWEBSITES
call :ERRORMESSAGE
goto :CONTINUEFORUMWEBSITES

:WINDOWSREPAIR
call :SCALE 70 26
title Windows Repair
call :ROSE "Windows Repair"

:CONTINUEWINDOWSREPAIR
call :SCALE 70 26
title Windows Repair
echo !cyan!
echo [26Cออออออออออออออออออออออ
echo [25C// !red!Û!bgyellow!!black! WINDOWS REPAIR !red!Û!bgblack!!cyan! \\
echo [16Cษอออออออออออออออออออออออออออออออออออออออป
echo [16CฬออออออออþÛ!bgyellow!!red!Û General Repairs Û!bgblack!!cyan!Ûþออออออออน
echo [16Cบ                                       บ
echo [16Cบ      !yellow!1!white! System File Checker Utility!cyan!    บ
echo [16Cบ      !yellow!2!white! Repair Windows System Image!cyan!    บ
echo [16Cบ      !yellow!3!white! Check Disk!cyan!                     บ
echo [16Cบ      !yellow!4!white! Re-Register Store Apps!cyan!         บ
echo [16Cบ                                       บ
echo [16CฬอออออออþÛ!bgyellow!!red!Û Specified Repairs Û!bgblack!!cyan!Ûþอออออออน
echo [16Cบ                                       บ
echo [16Cบ      !yellow!5!white! Windows Store!cyan!                  บ
echo [16Cบ      !yellow!6!white! Xbox Game!cyan!                      บ
echo [16Cบ      !yellow!7!white! Push Notifications!cyan!             บ
echo [16Cบ      !yellow!8!white! Wifi Hotspot!cyan!                   บ
echo [16Cบ      !yellow!9!white! Clipboard History!cyan!              บ
echo [16Cบ     !yellow!10!white! Background Apps!cyan!                บ
echo [16Cศอออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" !t2! !yellow!{!t3!}!grey!." 20
echo:
call :PROMPT
if "!x!"=="1" start cmd /c sfc /ScanNow ^& pause ^& exit
if "!x!"=="2" start cmd /c Dism /Online /Cleanup-Image /RestoreHealth ^& pause ^& exit
if "!x!"=="3" start cmd /c chkdsk !SystemDrive! /F /R ^& pause ^& exit
if "!x!"=="4" 2>nul powershell -ExecutionPolicy Unrestricted Get-AppXPackage -AllUsers ^| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"$($_.InstallLocation)\AppXManifest.xml\"}
if "!x!"=="5" for %%a in (10.0 6.3) do if "!windowsversion!"=="%%a" (goto :REPAIR_WINDOWS_STORE) else call :ERROR_WINDOWS_VERSION
if "!x!"=="6" if "!windowsversion!"=="10.0" (goto :REPAIR_XBOX_GAME) else call :ERROR_WINDOWS_VERSION
if "!x!"=="7" goto :REPAIR_PUSH_NOTIFICATIONS
if "!x!"=="8" if "!windowsversion!"=="10.0" (goto :REPAIR_WIFI_HOTSPOT) else call :ERROR_WINDOWS_VERSION
if "!x!"=="9" if "!windowsversion!"=="10.0" (goto :REPAIR_CLIPBOARD_HISTORY) else call :ERROR_WINDOWS_VERSION
if "!x!"=="10" if "!windowsversion!"=="10.0" (goto :REPAIR_BACKGROUND_APPS) else call :ERROR_WINDOWS_VERSION
for /l %%a in (1,1,10) do if "!x!"=="%%a" goto :CONTINUEWINDOWSREPAIR
call :CHOOSE back && goto :MOREFEATURES
call :ERRORMESSAGE
goto :CONTINUEWINDOWSREPAIR

:REPAIR_WINDOWS_STORE
call :SCALE 81 20
title Repair Windows Store
echo !cyan!
echo [7C#################################################################
echo [7C#            . . . I'm repairing Windows Store . . .            #
echo [7C#################################################################
echo:
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v "RemoveWindowsStore" /f && echo reg value "RemoveWindowsStore" successfully removed. || echo reg value "RemoveWindowsStore" already removed.
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v "DisableStoreApps" /f && echo reg value "DisableStoreApps" successfully removed. || echo reg value "DisableStoreApps" already removed.
if "!windowsversion!"=="10.0" 2>nul powershell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *WindowsStore*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"
if "!windowsversion!"=="6.3" 2>nul powershell -ExecutionPolicy Unrestricted Add-AppxPackage -DisableDevelopmentMode -Register $Env:SystemRoot\WinStore\AppxManifest.xml
for %%a in (wuauserv BITS DcomLaunch InstallService wlidsvc WaaSMedicSvc UnistoreSvc StorSvc) do >nul 2>&1 net stop "%%a"
for %%a in (wuauserv BITS DcomLaunch) do >nul 2>&1 sc config "%%a" start=auto && echo service "%%a" successfully set to demand. || echo service "%%a" does not exist or an error happend.
for %%a in (InstallService wlidsvc WaaSMedicSvc UnistoreSvc StorSvc) do >nul 2>&1 sc config "%%a" start=demand && echo service "%%a" successfully set to demand. || echo service "%%a" does not exist or an error happend.
for /f "delims=" %%a in ('2^>nul where "wsreset.exe"') do start "" "%%~fa"
<nul set /p=!yellow!
timeout /t 5
goto :WINDOWSREPAIR

:REPAIR_XBOX_GAME
call :SCALE 81 20
title Repair Xbox Game
echo !cyan!
echo [7C#################################################################
echo [7C#              . . . I'm repairing Xbox Game . . .              #
echo [7C#################################################################
echo:
for %%a in (XboxApp Microsoft.XboxGamingOverlay XboxOneSmartGlass) do 2>nul powershell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *%%a*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowgameDVR" /f && echo reg value "AllowgameDVR" successfully removed. || echo reg value "AllowgameDVR" already removed.
>nul reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 1 /f && echo reg value "AppCaptureEnabled" successfully added. || echo reg value "AppCaptureEnabled" could not be added.
>nul reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnabled" /t REG_DWORD /d 1 /f && echo reg value "HistoricalCaptureEnabled" successfully added. || echo reg value "HistoricalCaptureEnabled" could not be added.
>nul reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 1 /f && echo reg value "GameDVR_Enabled" successfully added. || echo reg value "GameDVR_Enabled" could not be added.
for %%a in (BcastDVRUserService xbgm XboxNetApiSvc XboxGipSvc xboxgip XblAuthManager XblGameSave) do (
>nul 2>&1 net stop "%%a"
>nul 2>&1 sc config "%%a" start=demand && echo service "%%a" successfully set to demand. || echo service "%%a" does not exist or an error happend.
)
<nul set /p=!yellow!
timeout /t 5
goto :WINDOWSREPAIR

:REPAIR_PUSH_NOTIFICATIONS
call :SCALE 81 20
title Repair Push Notifications
echo !cyan!
echo [7C#################################################################
echo [7C#         . . . I'm repairing Push Notifications . . .          #
echo [7C#################################################################
echo:
>nul 2>&1 reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /f && echo reg value "ToastEnabled" successfully removed. || echo reg value "ToastEnabled" already removed.
>nul 2>&1 reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "LockScreenToastEnabled" /f && echo reg value "LockScreenToastEnabled" successfully removed. || echo reg value "LockScreenToastEnabled" already removed.
>nul 2>&1 reg delete "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /f && echo reg value "DisableNotificationCenter" successfully removed. || echo reg value "DisableNotificationCenter" already removed.
>nul 2>&1 reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseActionCenterExperience" /f && echo reg value "UseActionCenterExperience" successfully removed. || echo reg value "UseActionCenterExperience" already removed.
if "!windowsversion!"=="10.0" >nul 2>&1 reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableBalloonTips" /t REG_DWORD /d 1 /f && echo reg value "EnableBalloonTips" successfully added. || echo reg value "EnableBalloonTips" could not be added.
for %%a in (WpnService WpnUserService) do (
>nul 2>&1 net stop "%%a"
>nul 2>&1 sc config "%%a" start=demand && echo service "%%a" successfully set to demand. || echo service "%%a" does not exist or an error happend.
)
<nul set /p=!yellow!
timeout /t 5
goto :WINDOWSREPAIR

:REPAIR_WIFI_HOTSPOT
call :SCALE 81 20
title Repair WiFi Hotspot
echo !cyan!
echo [7C#################################################################
echo [7C#            . . . I'm repairing WiFi Hotspot . . .             #
echo [7C#################################################################
echo:
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Network Connections" /v "NC_ShowSharedAccessUI" /f && echo reg value "NC_ShowSharedAccessUI" successfully removed. || echo reg value "NC_ShowSharedAccessUI" already removed.
for %%a in (CDPSvc CDPUserSvc icssvc) do >nul 2>&1 net stop "%%a"
for %%a in (CDPSvc CDPUserSvc) do >nul 2>&1 sc config "%%a" start=auto && echo service "%%a" successfully set to auto. || echo service "%%a" does not exist or an error happend.
>nul 2>&1 sc config "icssvc" start=demand && echo service "icssvc" successfully set to demand. || echo service "icssvc" does not exist or an error happend.
<nul set /p=!yellow!
timeout /t 5
goto :WINDOWSREPAIR

:REPAIR_CLIPBOARD_HISTORY
call :SCALE 81 20
title Repair Clipboard History
echo !cyan!
echo [7C#################################################################
echo [7C#          . . . I'm repairing Clipboard History . . .          #
echo [7C#################################################################
echo:
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "AllowCrossDeviceClipboard" /f && echo reg value "AllowCrossDeviceClipboard" successfully removed. || echo reg value "AllowCrossDeviceClipboard" already removed.
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "AllowClipboardHistory" /f && echo reg value "AllowClipboardHistory" successfully removed. || echo reg value "AllowClipboardHistory" already removed.
>nul 2>&1 reg delete "HKCU\SOFTWARE\Microsoft\Clipboard" /v "EnableClipboardHistory" /f && echo reg value "EnableClipboardHistory" successfully removed. || echo reg value "EnableClipboardHistory" already removed.
>nul 2>&1 net stop "cbdhsvc"
>nul 2>&1 sc config "cbdhsvc" start=demand && echo service "cbdhsvc" successfully set to demand. || echo service "cbdhsvc" does not exist or an error happend.
<nul set /p=!yellow!
timeout /t 5
goto :WINDOWSREPAIR

:REPAIR_BACKGROUND_APPS
call :SCALE 81 20
title Repair Backgrounds Apps
echo !cyan!
echo [7C#################################################################
echo [7C#          . . . I'm repairing Backgrounds Apps . . .           #
echo [7C#################################################################
echo:
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /f && echo reg value "LetAppsRunInBackground" successfully removed. || echo reg value "LetAppsRunInBackground" already removed.
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground_UserInControlOfTheseApps" /f && echo reg value "LetAppsRunInBackground_UserInControlOfTheseApps" successfully removed. || echo reg value "LetAppsRunInBackground_UserInControlOfTheseApps" already removed.
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground_ForceAllowTheseApps" /f && echo reg value "LetAppsRunInBackground_ForceAllowTheseApps" successfully removed. || echo reg value "LetAppsRunInBackground_ForceAllowTheseApps" already removed.
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground_ForceDenyTheseApps" /f && echo reg value "LetAppsRunInBackground_ForceDenyTheseApps" successfully removed. || echo reg value "LetAppsRunInBackground_ForceDenyTheseApps" already removed.
>nul 2>&1 reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /f && echo reg value "GlobalUserDisabled" successfully removed. || echo reg value "GlobalUserDisabled" already removed.
>nul reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d 1 /f && echo reg value "BackgroundAppGlobalToggle" successfully added. || echo reg value "BackgroundAppGlobalToggle" could not be added.
<nul set /p=!yellow!
timeout /t 5
goto :WINDOWSREPAIR

:GAME_BOOSTER
call :SCALE 80 29
title %1 Game Boost ^| %1_%2_%3_%4
echo !cyan!
echo [7C#################################################################
echo [7C#              . . . I'm %1 Game Boost . . .             #
echo [7C#################################################################
echo:
>nul 2>&1 netsh interface tcp set global autotuninglevel=%2 && echo netsh interface "tcp global autotuninglevel" successfully set to %3. || echo netsh interface "tcp global autotuninglevel" does not exist or an error happend.
>nul 2>&1 netsh interface tcp set heuristics %3 && echo netsh interface "tcp heuristics" successfully set to %3. || echo netsh interface "tcp heuristics" does not exist or an error happend.
if "%1"=="Enabling" >nul 2>&1 ipconfig /flushdns && echo ipconfig "flushdns" succeeded. || echo ipconfig "flushdns" does not exist or an error happend.
for %%a in (PeerDistSvc MSiSCSI SNMPTRAP napagent CertPropSvc AxInstSV AppMgmt RemoteRegistry SCPolicySvc WebClient WinRM CscService WerSvc PNRPsvc p2psvc p2pimsvc) do (
>nul 2>&1 net stop "%%a"
>nul 2>&1 sc config "%%a" start=%3 && echo service "%%a" successfully set to %3. || echo service "%%a" does not exist or an error happend.
)
echo:
echo [7CDone, now GameBoost is %4. :')
<nul set /p=!yellow!
timeout /t 5
exit /b

:WINDOWSTWEAKS
call :SCALE 74 23
title Windows Tweaks
call :ROSE "Windows Tweaks"

:CONTINUEWINDOWSTWEAKS
call :SCALE 74 23
title Windows Tweaks
echo !cyan!
echo [26Cออออออออออออออออออออออ
echo [25C// !red!Û!bgyellow!!black! WINDOWS TWEAKS !red!Û!bgblack!!cyan! \\
echo [6Cษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [6Cบ                                                            บ
echo [6Cบ    !yellow!1!white! Disable desktop F1 keyboard "Help" shortcut.!cyan!          บ
echo [6Cบ    !yellow!2!white! Disable context menu "Share with" and "Share".!cyan!        บ
echo [6Cบ    !yellow!3!white! Disable context menu "Troubleshoot compatibility".!cyan!    บ
echo [6Cบ    !yellow!4!white! Disable context menu "Include in library".!cyan!            บ
echo [6Cบ    !yellow!5!white! Disable context menu "Send to".!cyan!                       บ
echo [6Cบ    !yellow!6!white! Disable context menu "Restore previous versions".!cyan!     บ
echo [6Cบ    !yellow!7!white! Disable Properties Tab "Previous Versions".!cyan!           บ
echo [6Cบ    !yellow!8!white! Enable "Ultimate Performance" power scheme.!cyan!           บ
echo [6Cบ    !yellow!9!white! Disk Cleanup.!cyan!                                         บ
echo [6Cบ   !yellow!10!cyan!  ^>  !white!More Windows Tweaks !green!(Portable Apps)!cyan!               บ
echo [6Cบ                                                            บ
echo [6Cศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !grey!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!yellow!BACK!grey!" !t2! !yellow!{!t3!}!grey!." 20
echo:
call :PROMPT
for /l %%a in (1,1,7) do if "!x!"=="%%a" (
if "!Language!"=="EN" set "t=Do you want to Enable (Yes) or Disable (No) this"
if "!Language!"=="FR" set "t=Voulez-vous Activer (Oui) ou D้sactiver (Non) ce"
call :MSGBOXLEVEL 1 "!t! tweak ?" 69668 "Illegal Services Checker"
)
if "!x!"=="1" (
if "!el!"=="6" (
>nul reg add "HKCU\SOFTWARE\Classes\Typelib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}\1.0\0\win32" /f
>nul reg add "HKCU\SOFTWARE\Classes\Typelib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}\1.0\0\win64" /f
)
if "!el!"=="7" >nul 2>&1 reg delete "HKCU\SOFTWARE\Classes\Typelib\{8cec5860-07a1-11d9-b15e-000d56bfe6ee}\1.0\0" /f
)
if "!x!"=="2" (
if "!el!"=="6" (
for %%a in ("HKCR\*\shellex\ContextMenuHandlers\Sharing" "HKCR\Directory\Background\shellex\ContextMenuHandlers\Sharing" "HKCR\Directory\shellex\ContextMenuHandlers\Sharing" "HKCR\Directory\shellex\CopyHookHandlers\Sharing" "HKCR\Directory\shellex\PropertySheetHandlers\Sharing" "HKCR\Drive\shellex\ContextMenuHandlers\Sharing" "HKCR\Drive\shellex\PropertySheetHandlers\Sharing" "HKCR\LibraryFolder\background\shellex\ContextMenuHandlers\Sharing" "HKCR\UserLibraryFolder\shellex\ContextMenuHandlers\Sharing") do >nul 2>&1 reg delete "%%~a" /f
if "!windowsversion!"=="10.0" >nul 2>&1 reg delete "HKCR\*\shellex\ContextMenuHandlers\ModernSharing" /f
)
if "!el!"=="7" (
>nul 2>&1 reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f
>nul reg add "HKCR\*\shellex\ContextMenuHandlers\Sharing" /t REG_SZ /d "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f
>nul reg add "HKCR\Directory\Background\shellex\ContextMenuHandlers\Sharing" /t REG_SZ /d "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f
>nul reg add "HKCR\Directory\shellex\ContextMenuHandlers\Sharing" /t REG_SZ /d "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f
>nul reg add "HKCR\Directory\shellex\CopyHookHandlers\Sharing" /t REG_SZ /d "{40dd6e20-7c17-11ce-a804-00aa003ca9f6}" /f
>nul reg add "HKCR\Directory\shellex\PropertySheetHandlers\Sharing" /t REG_SZ /d "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f
>nul reg add "HKCR\Drive\shellex\ContextMenuHandlers\Sharing" /t REG_SZ /d "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f
>nul reg add "HKCR\Drive\shellex\PropertySheetHandlers\Sharing" /t REG_SZ /d "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f
>nul reg add "HKCR\LibraryFolder\background\shellex\ContextMenuHandlers\Sharing" /t REG_SZ /d "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f
>nul reg add "HKCR\UserLibraryFolder\shellex\ContextMenuHandlers\Sharing" /t REG_SZ /d "{f81e9010-6ea4-11ce-a7ff-00aa003ca9f6}" /f
>nul reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInplaceSharing" /t REG_DWORD /d 1 /f
>nul reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "forceguest" /t REG_DWORD /d 0 /f
if "!windowsversion!"=="10.0" >nul reg add "HKCR\*\shellex\ContextMenuHandlers\ModernSharing" /t REG_SZ /d "{e2bf9676-5f8f-435c-97eb-11607a5bedf7}" /f
)
)
if "!x!"=="3" (
if "!el!"=="6" (
for %%a in ("HKCR\batfile\shellEx\ContextMenuHandlers\Compatibility" "HKCR\cmdfile\shellEx\ContextMenuHandlers\Compatibility" "HKCR\exefile\shellex\ContextMenuHandlers\Compatibility" "HKCR\Msi.Package\shellex\ContextMenuHandlers\Compatibility" "HKCR\MSILink\shellex\ContextMenuHandlers\{1d27f844-3a1f-4410-85ac-14651078412d}") do >nul 2>&1 reg delete "%%~a" /f
>nul reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{1d27f844-3a1f-4410-85ac-14651078412d}" /f
)
if "!el!"=="7" (
>nul reg add "HKCR\batfile\shellEx\ContextMenuHandlers\Compatibility" /t REG_SZ /d "{1d27f844-3a1f-4410-85ac-14651078412d}" /f
>nul reg add "HKCR\cmdfile\shellEx\ContextMenuHandlers\Compatibility" /t REG_SZ /d "{1d27f844-3a1f-4410-85ac-14651078412d}" /f
>nul reg add "HKCR\exefile\shellex\ContextMenuHandlers\Compatibility" /t REG_SZ /d "{1d27f844-3a1f-4410-85ac-14651078412d}" /f
>nul reg add "HKCR\Msi.Package\shellex\ContextMenuHandlers\Compatibility" /t REG_SZ /d "{1d27f844-3a1f-4410-85ac-14651078412d}" /f
>nul reg add "HKCR\MSILink\shellex\ContextMenuHandlers" /t REG_SZ /d "{1d27f844-3a1f-4410-85ac-14651078412d}" /f
>nul reg add "HKCR\MSILink\shellex\ContextMenuHandlers\{1d27f844-3a1f-4410-85ac-14651078412d}" /t REG_SZ /d "Compatibility Context Menu" /f
>nul 2>&1 reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{1d27f844-3a1f-4410-85ac-14651078412d}" /f
)
)
if "!x!"=="4" (
if "!el!"=="6" (
>nul 2>&1 reg delete "HKCR\Folder\ShellEx\ContextMenuHandlers\Library Location" /f
>nul 2>&1 reg delete "HKLM\SOFTWARE\Classes\Folder\shellex\ContextMenuHandlers\Library Location" /f
)
if "!el!"=="7" (
>nul reg add "HKCR\Folder\shellex\ContextMenuHandlers\Library Location" /t REG_SZ /d "{3dad6c5d-2167-4cae-9914-f99e41c12cfa}" /f
>nul reg add "HKLM\SOFTWARE\Classes\Folder\shellex\ContextMenuHandlers\Library Location" /t REG_SZ /d "{3dad6c5d-2167-4cae-9914-f99e41c12cfa}" /f
)
)
if "!x!"=="5" (
if "!el!"=="6" (
>nul 2>&1 reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\SendTo" /f
>nul 2>&1 reg delete "HKCR\UserLibraryFolder\shellex\ContextMenuHandlers\SendTo" /f
)
if "!el!"=="7" (
>nul reg add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\SendTo" /t REG_SZ /d "{7BA4C740-9E81-11CF-99D3-00AA004AE837}" /f
>nul reg add "HKCR\UserLibraryFolder\shellex\ContextMenuHandlers\SendTo" /t REG_SZ /d "{7BA4C740-9E81-11CF-99D3-00AA004AE837}" /f
)
)
if "!x!"=="6" (
if "!el!"=="6" (
>nul 2>&1 reg delete "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
>nul 2>&1 reg delete "HKCR\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
>nul 2>&1 reg delete "HKCR\Directory\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
>nul 2>&1 reg delete "HKCR\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
)
if "!el!"=="7" (
>nul reg add "HKCR\AllFilesystemObjects\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
>nul reg add "HKCR\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
>nul reg add "HKCR\Directory\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
>nul reg add "HKCR\Drive\shellex\ContextMenuHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
)
)
if "!x!"=="7" (
if "!el!"=="6" (
>nul 2>&1 reg delete "HKCR\AllFilesystemObjects\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
>nul 2>&1 reg delete "HKCR\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
>nul 2>&1 reg delete "HKCR\Directory\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
>nul 2>&1 reg delete "HKCR\Drive\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
)
if "!el!"=="7" (
>nul reg add "HKCR\AllFilesystemObjects\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
>nul reg add "HKCR\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
>nul reg add "HKCR\Directory\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
>nul reg add "HKCR\Drive\shellex\PropertySheetHandlers\{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
>nul 2>&1 reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "NoPreviousVersionsPage" /f
>nul 2>&1 reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "NoPreviousVersionsPage" /f
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\PreviousVersions" /v "DisableLocalPage" /f
>nul 2>&1 reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "NoPreviousVersionsPage" /f
>nul 2>&1 reg delete "HKCU\Software\Policies\Microsoft\PreviousVersions" /v "DisableLocalPage" /f
>nul 2>&1 reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell Extensions\Blocked" /v "{596AB062-B4D2-4215-9F74-E9109B0A8153}" /f
)
)
if "!x!"=="8" (
if "!windowsversion!"=="10.0" (
>nul 2>&1 reg query "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\e9a42b02-d5df-448d-aa00-03f14749eb61
if errorlevel 0 (
set cn=0
for /f "delims=" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes /f "Ultimate Performance" /s /c ^| findstr /c:"Ultimate Performance"') do set /a cn+=1
if !cn! equ 1 (
for /f "tokens=2delims=:" %%a in ('powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61') do for /f "delims= " %%b in ("%%a") do call :ENABLE_ULTIMATE_PERFORMANCES_POWER_SCHEME %%b
) else (
for /f "delims=" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes /f "Ultimate Performance" /s /c ^| findstr /c:"PowerSchemes"') do for /f "tokens=8delims=\" %%b in ("%%a") do if not "%%b"=="e9a42b02-d5df-448d-aa00-03f14749eb61" call :ENABLE_ULTIMATE_PERFORMANCES_POWER_SCHEME %%b
)
) else (
if "!Language!"=="EN" set t=ERROR: Power scheme 'Ultimate Performance' doesn't exist in your computer. You cannot use this script
if "!Language!"=="FR" set t=ERREUR: Le schma d'alimentation 'Ultimate Performance' n'existe pas sur votre ordinateur. Vous ne pouvez pas utiliser ce script
call :MSGBOX 1 "!t!." 69680 "Illegal Services Checker"
)
) else call :ERROR_WINDOWS_VERSION
goto :CONTINUEWINDOWSTWEAKS
)
if "!x!"=="9" start cleanmgr.exe & goto :CONTINUEWINDOWSTWEAKS
if "!x!"=="10" goto :PORTABLEAPPS
for /l %%a in (1,1,7) do if "!x!"=="%%a" call :DONE_REGVALUE & goto :CONTINUEWINDOWSTWEAKS
call :CHOOSE back && goto :MOREFEATURES
call :ERRORMESSAGE
goto :CONTINUEWINDOWSTWEAKS

:CHECKER_SETUP_FOUND
call :MSGBOXLEVEL UPDATER
if "!el!"=="7" exit /b
call :CURL "!TMPF!\IS.Setup.exe" "`git_release`" UPDATER || (call :ERROR_INTERNET & exit /b)
>nul reg add "!IS_Reg!" /v "FirstLaunch" /t REG_DWORD /d 1 /f
pushd "!TMPF!"
start /max IS.Setup.exe
popd
exit

:CHECKER_BUILD_FOUND
call :CURL "Illegal Services.exe" "`git_build`" UPDATER || (call :ERROR_INTERNET & exit /b)
call :CURL "ChangeLog.txt" "`git_changelog`" UPDATER || (call :ERROR_INTERNET & exit /b)
start "" "Illegal Services.exe"
exit

:PROCESS_FAQ
if "!Language!"=="EN" call :SCALE 105 33
if "!Language!"=="FR" call :SCALE 110 33
title Frequently Asked Questions
call :ROSE FAQ
echo !cyan!
if "!Language!"=="EN" set "t=Here is a list of frequently asked questions about "
if "!Language!"=="FR" set "t=Voici une liste questions de questions frquemment poses … propos d'"
call :DRAW_CENTER "þÛ!bgyellow!!red!Û !black!!t!Illegal Services:!red! Û!bgblack!!cyan!Ûþ" 30
echo:
echo !cyan!
if "!Language!"=="EN" set t=Is Illegal Services illegal
if "!Language!"=="FR" set t=Illegal Services est-il illgal
echo    þÛ!bgwhite!!red!Û  !t! ? Û!bgblack!!cyan!Ûþ
if "!Language!"=="EN" (
set t1=Illegal Services is legal, but services provided inside are mostly illegal
set t2=Illegal Services does not store any copyrighted files locally or on its server
set t3=All contents are provided by non-affiliated third parties
set t4=You are solely responsible for their use at your own risk
)
if "!Language!"=="FR" (
set t1=Illegal Services est lgal, mais les services fournis … l'intrieur sont principalement illgaux
set t2=Illegal Services ne stocke aucun fichier sous copyright localement ou sur son serveur
set t3=Tous les contenus sont fournis par des tiers non affilis
set t4=Vous tes tenu comme seul responsable de leur utilisation … vos propres risques
)
for %%a in (1 2 3 4) do echo [6C!green!!t%%a!.
echo !cyan!
if "!Language!"=="EN" set t=Why Illegal Services is detected by many antiviruses
if "!Language!"=="FR" set t=Pourquoi Illegal Services est detect par beaucoup d'antivirus
echo    þÛ!bgwhite!!red!Û  !t! ? Û!bgblack!!cyan!Ûþ
if "!Language!"=="EN" (
set t1=The source code is converted from batch to executable using
set t2=This conversion process leads to believe that it is a
)
if "!Language!"=="FR" (
set t1=Le code source est convertie de batch en executable en utilisant
set t2=Ce processus de conversion fait laisser croire qu'il en est un
)
echo [6C!green!!t1! !underline!https://www.abyssmedia.com/quickbfc/!underlineoff!
echo [6C!green!!t2! virus.
echo !cyan!
if "!Language!"=="EN" set t=Is Illegal Services open source
if "!Language!"=="FR" set t=Est-ce qu'Illegal Services est Open Source
echo    þÛ!bgwhite!!red!Û  !t! ? Û!bgblack!!cyan!Ûþ
if "!Language!"=="EN" set t=Yes, under the General Public License v3.0 (GNU GPLv3)
if "!Language!"=="FR" set t=Oui, sous la General Public License v3.0 (GNU GPLv3)
echo [6C!green!!t!.
echo [6C!green!!underline!!git_source!!underlineoff!
echo !cyan!
if "!Language!"=="EN" set t=With which operating systems is Illegal Services compatible
if "!Language!"=="FR" set t=Avec qu'elle systme d'exploitation Illegal Services est-t'il compatible
echo    þÛ!bgwhite!!red!Û  !t! ? Û!bgblack!!cyan!Ûþ
echo [6C!green!Windows 7, 8, 8.1, 10 (x86/x64).
echo !cyan!
if "!Language!"=="EN" set t=Can you make Illegal Services compatible with more operating system
if "!Language!"=="FR" set t=Pouvez-vous rendre Illegal Services compatible pour d'autre systme d'exploitation
echo    þÛ!bgwhite!!red!Û  !t! ? Û!bgblack!!cyan!Ûþ
if "!Language!"=="EN" set t=No. But IS Bookmarks and IS search engines are
if "!Language!"=="FR" set t=Non. Mais IS.Bookmarks et IS search engines le sont
echo [6C!green!!t!.
echo !cyan!
if "!Language!"=="EN" set t=In which languages is Illegal Services developed
if "!Language!"=="FR" set t=En quels langages est dvelopp Illegal Services
echo    þÛ!bgwhite!!red!Û  !t! ? Û!bgblack!!cyan!Ûþ
echo [6C!green!93%% Batch, 3%% PowerShell, 2%% VBScript, 2%% CSharp.
echo !cyan!
if "!Language!"=="EN" set t=When did you started Illegal Services project
if "!Language!"=="FR" set t=Quand est-ce que le projet d'Illegal Services … commenc
echo    þÛ!bgwhite!!red!Û  !t! ? Û!bgblack!!cyan!Ûþ
echo [6C!green!v1.0.0.0 - 22/05/2020
echo:
echo !cyan!
if "!Language!"=="EN" set "t=Press !yellow!{ANY KEY}!cyan! to exit"
if "!Language!"=="FR" set "t=Appuyez sur !yellow!{UNE TOUCHE}!cyan! pour quitter"
call :DRAW_CENTER "!t!..." 10 1
%showcursor%
>nul pause
exit

:PROCESS_SCANWEBSITES
if "!Language!"=="EN" set t=Establishing connection to websites database
if "!Language!"=="FR" set t=Etablissement de la connexion … la base de donne des sites internet
set url=!git_raw_downloads!/Websites.txt
title !t!: '!url!'.
>nul Curl\x!arch!\curl.exe -fIkLs "!url!" || (call :ERROR_INTERNET & exit)
for %%a in (index cn result el) do set %%a=0
set s=
if "!Language!"=="EN" (
set o1=Website Down
set o2=Website Changed Domain
)
if "!Language!"=="FR" (
set o1=Site Internet Mort
set o2=Site Internet Chang de Domaine
)
for /f %%a in ('Curl\x!arch!\curl.exe -fkLs "!url!"') do (
set /a index+=1
title [0 result found from !index! websites indexed]  ^|  [0/100%%]  ^|
)
echo !cyan!
if "!Language!"=="EN" echo Scan of the !index! indexed websites has started. You will be notified if any of them are down or have changed domain.
if "!Language!"=="FR" echo Le scan des !index! sites web indexs a commenc. Vous serez notifi si l'un d'entre eux est mort ou a chang de domaine.
echo:
for /f "tokens=1-4delims=:.," %%a in ("!time: =0!") do set /a "t1=(((1%%a*60)+1%%b)*60+1%%c)*100+1%%d-36610100"
for /f %%a in ('Curl\x!arch!\curl.exe -fkLs "!url!"') do (
set /a "cn+=1, el=cn*100/index"
if defined result set s=s
title [!result! result!s! found from !index! websites indexed]  ^|  [!el!/100%%]  ^|  %%a
>nul ping -w 1000 -n 1 "%%a" || >nul Curl\x!arch!\curl.exe -IkLs "https://%%a/" || >nul Curl\x!arch!\curl.exe -IkLs "http://%%a/" || (
set /a result+=1
echo !red!!o1!: !yellow!%%a !red!seems to be down for you ^^!
Curl\x!arch!\curl.exe -fkLs "https://isitup.org/%%a" | >nul findstr /ic:"Oh no %%a" && (
set /a result+=1
echo !red!!o1!: !yellow!%%a !red!seems to be down for everyone ^^!
)
)
for /f "tokens=1,*delims=-" %%b in ('Curl\x!arch!\curl.exe -Iksw "%%{response_code}-%%{redirect_url}" "https://%%a/"') do if "%%b"=="301" for /f "tokens=2delims=/" %%d in ("%%c") do if not "%%d"=="%%a" if not "%%d"=="github.com" if not "%%d"=="www.microsoft.com" if not "%%d"=="discord.com" if not "%%d"=="danse-musique.org" (
set /a result+=1
for /f "delims=//" %%e in ("%%c") do echo !red!!o2!: !yellow!https://%%a/ !green!^> !yellow!%%e//%%d/
)
)
echo !cyan!
for /f "tokens=1-4delims=:.," %%a in ("!time: =0!") do set /a "t2=(((1%%a*60)+1%%b)*60+1%%c)*100+1%%d-36610100, tDiff=t2-t1, tDiff+=((~(tDiff&(1<<31))>>31)+1)*8640000, seconds=tDiff/100"
title [!result! result!s! found from !index! websites indexed]  ^|  Scan finished in !seconds! seconds.
if "!Language!"=="EN" echo Scan ended with !result! result!s! found from !index! websites indexed in !seconds! seconds.
if "!Language!"=="FR" echo L'analyse s'est termine avec !result! rsultats trouvs … partir de !index! sites web indexs en !seconds! secondes.
echo:
pause
exit

:PROCESS_YOUTUBEDL
call :CHECK_YOUTUBEDLPRIORITY
title YouTube DL    ^|!youtube_dl!.exe !a!^|    ^|!o1!^|    ^|Priority: !YouTubeDLPriority:~1!^|
echo !grey!
echo [7C##############################################
if "!Language!"=="EN" echo [7C#       !brightred!   !cyan!Welcome in YouTube DL   !brightred!!grey!        #
if "!Language!"=="FR" echo [7C#      !brightred!   !cyan!Bievenue dans YouTube DL   !brightred!!grey!      #
echo [7C##############################################
echo:
if "!Language!"=="EN" (
set t1=Choice
set t2=Please wait while downloading
)
if "!Language!"=="FR" (
set t1=Choix
set t2=Veuillez patienter pendant le tlchargement de
)
echo [7C !cyan!!t1!: !yellow!!o1!!grey!
echo [7C !cyan!!t2!: !yellow!!x!!cyan! . . .
echo !grey!
echo =========================================================================================================
echo !red!
>nul chcp 65001
start /b /w !YouTubeDLPriority! Portable_Apps\YouTube-DL\!youtube_dl!.exe --ffmpeg-location "Portable_Apps\YouTube-DL" --output "!YouTubeDLOutputDirectory!\%%(title)s.%%(ext)s" !a!
set el=!errorlevel!
>nul chcp !CP!
echo !grey!
echo =========================================================================================================
echo !cyan!
if "!Language!"=="EN" if "!el!"=="0" (
echo [7C Download finished.
<nul set /p=[7C Press !yellow!{ANY KEY}!cyan! to open download location and exit...
) else (
echo [7C Something went wrong and couldn't download the file.
<nul set /p=[7C Press !yellow!{ANY KEY}!cyan! to exit...
)
if "!Language!"=="FR" if "!el!"=="0" (
echo [7C Tchargement terminer.
<nul set /p=[7C Appuyez sur !yellow!{UNE TOUCHE}!cyan! pour ouvrir l'emplacement de tchargement et quitter...
) else (
echo [7C Une erreur s'est produite et n'a pas pu tcharger le fichier.
<nul set /p=[7C Appuyez sur !yellow!{UNE TOUCHE}!cyan! pour quitter...
)
%showcursor%
>nul pause
if "!el!"=="0" start /max explorer.exe "!YouTubeDLOutputDirectory!"
exit

:PROCESS_NMAP
call :CHECK_PORTPRIORITY
title NMAP    ^|nmap.exe !a!^|    ^|!o1!^|    ^|!o2!^|    ^|Priority: !PortPriority:~1!^|
>nul 2>&1 net start npcap
>nul 2>&1 reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d 64534 /f
>nul 2>&1 reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d 30 /f
>nul 2>&1 reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "StrictTimeWaitSeqCheck" /t REG_DWORD /d 1 /f
echo !grey!
echo [7C#################################################################
if "!Language!"=="EN" echo [7C#       !brightred!   !cyan!Welcome in the best Port Scanner by NMAP   !brightred!!grey!        #
if "!Language!"=="FR" echo [7C#    !brightred!   !cyan!Bienvenue dans le meilleur Port Scanner par NMAP   !brightred!!grey!   #
echo [7C#################################################################
echo:
if "!Language!"=="EN" (
set t1=Time
set t2=Please wait while scanning
)
if "!Language!"=="FR" (
set t1=Temps
set t2=Veuillez patienter pendant le scan de
)
echo [7C !cyan!Scan: !yellow!!o1!!grey!
echo [7C !cyan!!t1!: !yellow!!o2!!grey!
echo [7C !cyan!!t2!: !yellow!!x!!cyan! . . .
echo !grey!
echo =========================================================================================================
echo !red!
>nul chcp 65000
start /b /w !PortPriority! Portable_Apps\NMAP\nmap.exe !a!
set el=!errorlevel!
>nul chcp !CP!
echo !grey!
echo =========================================================================================================
echo !cyan!
if "!Language!"=="EN" if "!el!"=="0" (
echo [7C Scan finished.
<nul set /p=[7C Press !yellow!{ANY KEY}!cyan! to exit...
) else (
echo [7C Something went wrong and couldn't scan.
<nul set /p=[7C Press !yellow!{ANY KEY}!cyan! to exit...
)
if "!Language!"=="FR" if "!el!"=="0" (
echo [7C Scan terminer.
<nul set /p=[7C Appuyez sur !yellow!{UNE TOUCHE}!cyan! pour quitter...
) else (
echo [7C Une erreur s'est produite et n'a pas pu scanner.
<nul set /p=[7C Appuyez sur !yellow!{UNE TOUCHE}!cyan! pour quitter...
)
%showcursor%
>nul pause
exit

:PROCESS_PINGER
title IP Pinger  ^|Pinging !x!^|
:_PING
cls
echo !cyan!
echo          ____________________________________________
echo         /                                            \
echo        /       -------------/###\-------------        \
echo       /                     \###/                      \      !red!*THIS TOOL WILL ALLOW YOU TO SEE IF YOUR!cyan!
echo      /                     /     \                      \       !red!TARGET IS REACHED BY YOUR DDoS OR NOT.!cyan!
echo     /                     /       \                      \
echo    /                     :   ###   :                      \
echo   /                [O-O-]:    #    :[-O-O]                 \
echo   \                      /\___#___/\                       /
echo    \                    /     0     \                     /   !red!*!underline!WARNING!underlineoff!!red!: SOME ROUTERS DO NOT ALLOW THE PING.!cyan!
echo     \                  /             \                   /        !red!FOR THIS REASON IT IS NORMAL IF SOME!cyan!
echo      \                                                  /            !red!IP ADDRESSES DO NOT RESPOND!cyan!
echo       \________________________________________________/                 !red!WHILE PINGING THEM.!cyan!
echo        \                                              /
echo         \          Made By IB_U_Z_Z_A_R_Dl           /
echo          \__________________________________________/
echo !grey!
if "!Language!"=="EN" echo                       ** PRESS !yellow![CTRL + C]!grey! ^> !yellow![N]!grey! ^> !yellow![ENTER]!grey! to view result and restart. **
if "!Language!"=="FR" echo               ** Presser !yellow![CTRL + C]!grey! ^> !yellow![N]!grey! ^> !yellow![ENTRER]!grey! pour afficher le rsultat et recommencer. **
echo !white!
ping -t -l 0 !x!
goto :_PING

:DONE_REGVALUE
if "!Language!"=="EN" set t=Reg value successfully added/removed
if "!Language!"=="FR" set t=Valeur du registre ajoute/supprime avec succs
call :MSGBOX 1 "!t!." 69696 "Illegal Services Checker"
exit /b

:ENABLE_ULTIMATE_PERFORMANCES_POWER_SCHEME
echo:
for /f "tokens=2delims=:" %%a in ('powercfg /getactivescheme') do for /f "delims= " %%b in ("%%a") do if "%%b"=="%1" (
if "!Language!"=="EN" set t=The 'Ultimate Performance' power scheme is already enabled
if "!Language!"=="FR" set t=Le schma d'alimentation 'Ultimate Performance' est dj… activ
call :MSGBOX 1 "!t!." 69696 "Illegal Services Checker"
exit /b
)
powercfg /setactive %1 && (
if "!Language!"=="EN" set t=The 'Ultimate Performance' power scheme successfully enabled
if "!Language!"=="FR" set t=Le schma d'alimentation 'Ultimate Performance' a t activ avec succs
call :MSGBOX 1 "!t!." 69696 "Illegal Services Checker"
) || (
if "!Language!"=="EN" set t=ERROR: The 'Ultimate Performance' power scheme couldn't enable
if "!Language!"=="FR" set t=ERREUR: Le schma d'alimentation 'Ultimate Performance' n'a pas pu ๊tre activ
call :MSGBOX 1 "!t!." 69680 "Illegal Services Checker"
)
exit /b

:CHECK_INTERNET
for %%a in (https http) do >nul Curl\x!arch!\curl.exe -IkLs "%%a://www.google.com/" && exit /b 0
exit /b 1

:INSTALL_ANSICON
if defined ANSICON_VER exit /b
for %%a in (ansicon.exe ANSI32.dll) do if not exist "Ansicon\x!arch!\%%a" call :CURL "Ansicon\x!arch!\%%a" "`git_raw_main`/Ansicon/x!arch!/%%a" || (call :ERROR_INTERNET & exit)
if "!arch!"=="64" if not exist "Ansicon\x64\ANSI64.dll" call :CURL "Ansicon\x!arch!\ANSI64.dll" "`git_raw_main`/Ansicon/x!arch!/ANSI64.dll" || (call :ERROR_INTERNET & exit)
pushd "Ansicon\x!arch!"
ansicon.exe -i
popd
start "" "%~f1"
exit

:MSGBOX
if "%1"=="UPDATER" mshta vbscript:Execute("msgbox ""%~2"" & Chr(10) & Chr(10) & ""%~3"" & Chr(10) & ""%~4"",%5,""%~6"":close")
if "%1"=="1" mshta vbscript:Execute("msgbox ""%~2"",%3,""%~4"":close")
if "%1"=="2" mshta vbscript:Execute("msgbox ""%~2"" & Chr(10) & Chr(10) & ""%~3"",%4,""%~5"":close")
if "%1"=="3" mshta vbscript:Execute("msgbox ""%~2"" & Chr(10) & Chr(10) & ""%~3"" & Chr(10) & Chr(10) & ""%~4"",%5,""%~6"":close")
if "%1"=="4" mshta vbscript:Execute("msgbox ""%~2"" & Chr(10) & Chr(10) & ""%~3"" & Chr(10) & Chr(10) & ""%~4"" & Chr(10) & Chr(10) & ""%~5"",%6,""%~7"":close")
exit /b

:MSGBOXLEVEL
set el=
if "%1"=="UPDATER" (
echo Dim Msg,Style,Title,Response
if "!Language!"=="EN" echo Msg="New version found. Do you want to update ?"^&vbCrLf^&vbCrLf^&"Current version: !version!"^&vbCrLf^&"Latest version   : !lastversion!"
if "!Language!"=="FR" echo Msg="Nouvelle version trouv้e. Voulez-vous mettre เ jour ?"^&vbCrLf^&vbCrLf^&"Version actuelle  : !version!"^&vbCrLf^&"Derni่re version : !lastversion!"
echo Style=69668
echo Title="Illegal Services Updater"
echo Response=MsgBox^(Msg,Style,Title^)
echo If Response=vbYes then
echo wscript.quit ^(6^)
echo End If
echo If Response=vbNo then
echo wscript.quit ^(7^)
echo End If
)>"!TMPF!\msgbox.vbs" && cscript //nologo "!TMPF!\msgbox.vbs" (
if "!errorlevel!"=="6" set el=6
if "!errorlevel!"=="7" set el=7
)
if "%1"=="1" (
echo Dim Msg,Style,Title,Response
echo Msg="%~2"
echo Style=%3
echo Title="%~4"
echo Response=MsgBox^(Msg,Style,Title^)
echo If Response=vbYes then
echo wscript.quit ^(6^)
echo End If
echo If Response=vbNo then
echo wscript.quit ^(7^)
echo End If
)>"!TMPF!\msgbox.vbs" && cscript //nologo "!TMPF!\msgbox.vbs" (
if "!errorlevel!"=="6" set el=6
if "!errorlevel!"=="7" set el=7
)
if "%1"=="2" (
echo Dim Msg,Style,Title,Response
echo Msg="%~2"^&vbCrLf^&vbCrLf^&"%~3"
echo Style=%4
echo Title="%~5"
echo Response=MsgBox^(Msg,Style,Title^)
echo If Response=vbYes then
echo wscript.quit ^(6^)
echo End If
echo If Response=vbNo then
echo wscript.quit ^(7^)
echo End If
)>"!TMPF!\msgbox.vbs" && cscript //nologo "!TMPF!\msgbox.vbs" (
if "!errorlevel!"=="6" set el=6
if "!errorlevel!"=="7" set el=7
)
if "%1"=="3" (
echo Dim Msg,Style,Title,Response
echo Msg="%~2"^&vbCrLf^&vbCrLf^&"%~3"^&vbCrLf^&vbCrLf^&"%~4"
echo Style=%5
echo Title="%~6"
echo Response=MsgBox^(Msg,Style,Title^)
echo If Response=vbYes then
echo wscript.quit ^(6^)
echo End If
echo If Response=vbNo then
echo wscript.quit ^(7^)
echo End If
)>"!TMPF!\msgbox.vbs" && cscript //nologo "!TMPF!\msgbox.vbs" (
if "!errorlevel!"=="6" set el=6
if "!errorlevel!"=="7" set el=7
)
del /f /q "!TMPF!\msgbox.vbs"
exit /b

:INPUTBOX
echo WScript.Echo InputBox^("%~1"^)>"%TMPF%\msgbox.vbs"
set ID=
for /f "delims=" %%a in ('cscript //nologo "%TMPF%\msgbox.vbs"') do set "ID=%%a"
del /f /q "%TMPF%\msgbox.vbs"
exit /b

:ROSE_SETUP
>nul chcp 1252
for /f "tokens=1*delims==" %%a in ('findstr /bc:"[First Launch]=" "Speak\!Language!.lang"') do if defined SPEECH_FR (Speak\speak-x!arch!.exe -t "%%~b") else (
set extd=Speak\extd.exe /speak "%%~b"
!extd!
)
>nul chcp !CP!
if "!Language!"=="EN" set t=Do you want to disable Rose voice assistant
if "!Language!"=="FR" set t=Voulez-vous d้sactiver l'assistante vocale Rose
call :MSGBOXLEVEL 1 "!t! ?" 69668 "Illegal Services Checker"
if "!el!"=="6" >nul reg add "!IS_Reg!" /v "VoiceAssistant" /t REG_DWORD /d 0 /f
if "!el!"=="7" >nul reg add "!IS_Reg!" /v "VoiceAssistant" /t REG_DWORD /d 1 /f
>nul reg add "!IS_Reg!" /v "VoiceAssistantChoice" /t REG_DWORD /d 0 /f
exit /b

:ROSE
if "!VoiceAssistant!"=="0" exit /b
if "%~1"=="" exit /b
for %%a in (extd speak-x!arch!) do >nul 2>&1 taskkill /f /im "%%a.exe" /t
>nul chcp 1252
for /f "tokens=1*delims==" %%a in ('findstr /bc:"[%~1]=" "Speak\!Language!.lang"') do if defined SPEECH_FR (start /b Speak\speak-x!arch!.exe -t "%%~b") else (
set extd=start /b Speak\extd.exe /speak "%%~b"
!extd!
)
>nul chcp !CP!
exit /b

:CURL
call :CHECK_INTERNET || exit /b 1
set "url=%~2"
if not "!url:`=!"=="!url!" (
if "!git!"=="404 Git proxy not found" call :PROXY || if "!git!"=="404 Git proxy not found" exit /b 2
for /f "tokens=1-3delims=`" %%a in ("[!url!]") do set "url=%%a!%%b!%%c"
set "url=!url:~1,-1!"
)
if defined git_backup if not "!url:%git%=!"=="!url!" if not "%3"=="UPDATER" exit /b 3
if "!Language!"=="EN" set t=Downloading
if "!Language!"=="FR" set t=Tlchargement
<nul set /p="!cyan!!t!: !yellow!!url!!cyan!"
echo:
Curl\x!arch!\curl.exe --create-dirs -f#kLo "%~1" "!url!" || if not "!url:%git%=!"=="!url!" call :CURL_PROXYS "%~1" "!url!" || (call :ERROR_CURL "%~f1" "!url!" & exit /b 4)
if exist "%~f1" for %%a in (7z zip) do if "%~x1"==".%%a" if "%~nx1"=="ffmpeg.7z" (7za\x!arch!\7za.exe x -aoa -bso0 -o"%~dp1" -spe -y "%~f1" || (call :ERROR_CURL "%~f1" "!url!" & exit /b 4) & del /f /q "%~f1") else (7za\x!arch!\7za.exe x -aoa -bso0 -o"%~dpn1" -spe -y "%~f1" || (call :ERROR_CURL "%~f1" "!url!" & exit /b 4) & del /f /q "%~f1")
set Start_Folder=1
exit /b 0

:CURL_PROXYS
set el=
set cn=
for %%a in (main downloads source) do if not "!url:/%%a/=!"=="!url!" set cn=/%%a/
for %%b in (!git_list!) do if not "%%b"=="!git:*://=!" (
if "%%b"=="bitbucket.org/IllegalServices/illegal_services" set el=%%b/raw
if "%%b"=="git.teknik.io/Illegal-Services/Illegal_Services" set el=%%b/raw/branch
if "%%b"=="github.com/Illegal-Services/Illegal_Services" set el=%%b/raw
if "%%b"=="gitee.com/Illegal-Services/illegal_services" set el=%%b/raw
if "!Language!"=="EN" set t=Downloading
if "!Language!"=="FR" set t=Tlchargement
cmd /c rem
<nul set /p="!cyan!!t!: !yellow!https://!el!!cn!%~nx2!cyan!"
echo:
Curl\x!arch!\curl.exe --create-dirs -f#kLo "%~1" "https://!el!!cn!%~nx2" && exit /b 0
)
exit /b 1

:ERROR_CURL
if defined IS_Log (
if "!Language!"=="EN" >>"!TMPF!\IS_Log.txt" echo ERROR WHILE DOWNLOADING: "%~2"
if "!Language!"=="FR" >>"!TMPF!\IS_Log.txt" echo ERREURE PENDANT LE TELECHARGEMENT DE: "%~2"
)
if "!Language!"=="EN" set t=ERROR WHILE DOWNLOADING
if "!Language!"=="FR" set t=ERREURE PENDANT LE TELECHARGEMENT DE
echo !red!!t!: !yellow!"%~2"
if exist "%~f1" del /f /q "%~f1"
exit /b

:ENTER_LOOKUP
if "!Language!"=="EN" set t=Enter the %1 to track
if "!Language!"=="FR" set t=Entrer l'%1 … tracker
%showcursor%
set x=
set /p "x=!grey!!t!: !yellow!"
%hidecursor%
if "%1"=="IP" (call :CHECK_IP x || exit /b 1) else call :CHECK_URL x IP/URL || exit /b 1
if "!4!"=="!yellow!4 !checked!" start "" "https://check-host.net/ip-info?host=!x!" && cmdwiz.exe delay 1500
if "!5!"=="!yellow!5 !checked!" start "" "https://dnschecker.org/ip-location.php?ip=!x!" && cmdwiz.exe delay 1500
if "!6!"=="!yellow!6 !checked!" start "" "https://www.iplocation.net/ip-lookup" && cmdwiz.exe delay 1500
if "!7!"=="!yellow!7 !checked!" start "" "https://www.ip-tracker.org/locator/ip-lookup.php?ip=!x!" && cmdwiz.exe delay 1500
if "!8!"=="!yellow!8 !checked!" start "" "https://whatismyipaddress.com/ip/!x!"
exit /b 0

:IP_DETECTOR
set height=4
for /f "delims=" %%a in ('Curl\x!arch!\curl.exe -fkLs "https://ipinfo.io/!x!/json" ^| findstr /vc:"{" /c:"}" /c:"ipinfo.io/missingauth"') do (
set /a height+=1
mode 68,!height!
set "data=%%a"
set "data=!data:"=!"
set "data=!data:ip:=IPv4     :!"
set "data=!data:hostname:=Hostname :!"
set "data=!data:anycast:=Anycast  :!"
set "data=!data:city:=City     :!"
set "data=!data:region:=Region   :!"
set "data=!data:country:=Country  :!"
set "data=!data:loc:=Location :!"
set "data=!data:org:=ORG      :!"
set "data=!data:postal:=Postal   :!"
set "data=!data:timezone:=Timezone :!"
set "data=!data:bogon:=Bogon    :!"
set "data=!data:true=True!"
set "data=!data:false=False!"
if "!data:~-1!"=="," set "data=!data:~,-1!"
echo   !data!
)>>"!TMPF!\IS_Log.txt"
exit /b

:URL_DETECTOR
for /f "delims=/" %%a in ("!x:*://=!") do set "x=%%a"
title Looking up ^> !x!
set height=4
for /f "tokens=2delims=</" %%a in ('Curl\x!arch!\curl.exe -fkLs "http://ip-api.com/xml/!x!?fields=8192" ^| findstr /vc:"<?xml version="') do (
set /a height+=1
mode 68,!height!
set "data=%%a"
set "data=!data:query>=IP v4/v6  : !"
echo     !data!
)>>"!TMPF!\IS_Log.txt"
for /f "delims=" %%a in ('Curl\x!arch!\curl.exe -fkLs "http://ip-api.com/xml/!x!?fields=5775161" ^| findstr /vc:"<?xml version=" /c:"query>"') do (
set /a height+=1
mode 68,!height!
set "data=%%a"
set "data=!data:<continent>=Continent : !"
set "data=!data:<country>=Country   : !"
set "data=!data:<regionName>=Region    : !"
set "data=!data:<city>=City      : !"
set "data=!data:<district>=District  : !"
set "data=!data:<zip>=Zip       : !"
set "data=!data:<timezone>=Timezone  : !"
set "data=!data:<isp>=ISP       : !"
set "data=!data:<org>=ORG       : !"
set "data=!data:<as>=AS        : !"
set "data=!data:<asname>=ASName    : !"
set "data=!data:<reverse>=Reverse   : !"
for /f "delims=</" %%a in ("!data!") do echo   %%a
)>>"!TMPF!\IS_Log.txt"
exit /b

:PROXY_DETECTOR
for /f "delims=" %%a in ('Curl\x!arch!\curl.exe -fkLs "https://proxycheck.io/v2/!x!?vpn=1&port=1" ^| findstr /ic:"proxy" /c:"type"') do (
set /a height+=1
mode 68,!height!
set "data=%%a"
set "data=!data:   = !"
set "data=!data:"=!"
set "data=!data:,=!"
set "data=!data:type:=Type     :!"
set "data=!data:proxy:=Proxy    :!"
set "data=!data:no=False!"
set "data=!data:yes=True!"
set "data=!data:message:=Message  :!"
echo !data!
)>>"!TMPF!\IS_Log.txt"
exit /b

:VPN_DETECTOR
for /f "tokens=2delims=</" %%a in ('Curl\x!arch!\curl.exe -fkLs "http://ip-api.com/xml/!x!?fields=16973824" ^| findstr /vc:"<?xml version="') do (
set /a height+=1
mode 68,!height!
set "data=%%a"
set "data=!data:mobile>=Mobile (cellular) connection      : !"
set "data=!data:proxy>=Proxy, VPN or Tor exit address    : !"
set "data=!data:hosting>=Hosting, colocated or data center : !"
set "data=!data:true=True!"
set "data=!data:false=False!"
echo     !data!
)>>"!TMPF!\IS_Log.txt"
exit /b

:IS_SEARCH
echo !cyan!
if "!Language!"=="EN" set t=What do you want to search for
if "!Language!"=="FR" set t=Que voulez-vous rechercher
%showcursor%
set x=
set /p "x=!t! ? !yellow!"
%hidecursor%
call :CHOOSE back && exit /b
if defined x start "" "https://cse.google.com/cse?q=!x!&cx=%1" && exit /b
echo !cyan!
call :ERRORMESSAGE
exit /b

:INSTALL_FILE
if "%1"=="VLC" if "!arch!"=="64" (set url=https://get.videolan.org/vlc/3.0.16/win64/vlc-3.0.16-win64.exe) else set url=https://get.videolan.org/vlc/3.0.16/win32/vlc-3.0.16-win32.exe
if "%1"=="qBittorent" if "!arch!"=="64" (set url=https://downloads.sourceforge.net/project/qbittorrent/qbittorrent-win32/qbittorrent-4.3.8/qbittorrent_4.3.8_x64_setup.exe) else set url=https://downloads.sourceforge.net/project/qbittorrent/qbittorrent-win32/qbittorrent-4.3.8/qbittorrent_4.3.8_setup.exe
for %%a in (!url!) do set filename=%%~nxa
call :CURL "!TMPF!\!filename!" "!url!" || (call :ERROR_INTERNET & exit /b)
call :START_DOWNLOADED_FILE !filename!
exit /b


:CHECK_PORT
if defined %1 if "!%1!"=="!%1:..=!" if !%1! geq 0 if !%1! leq 65535 exit /b 0
call :ERRORMESSAGE %1 "un port" port
exit /b 1

:CHECK_URL
for /f "tokens=1-4delims=." %%a in ("!%1!") do call :CHECKBETWEEN0AND255 %%a && call :CHECKBETWEEN0AND255 %%b && call :CHECKBETWEEN0AND255 %%c && call :CHECKBETWEEN0AND255 %%d && call :CHECK_IP %1
call :_CHECK_URL %1 || (call :ERRORMESSAGE %1 "une URL" URL & exit /b 1)
exit /b 0

:_CHECK_URL
<nul set /p="!%1!" | >nul findstr [A-Z0-9] || exit /b 1
if defined %1 if not "!%1:~,1!"=="." if not "!%1:~-1!"=="." if not "!%1!"=="!%1:~,3!" if not "!%1!"=="!%1:.=!" if "!%1!"=="!%1:..=!" exit /b 0
exit /b 1

:CHECK_IP
call :_CHECK_IP %1 || (call :ERRORMESSAGE %1 "une IP" IP & exit /b 1)
exit /b 0

:_CHECK_IP
if not defined %1 exit /b 1
if "!%1!"=="!%1:~,6!" exit /b 1
if not "!%1!"=="!%1:..=!" exit /b 1
for /f "tokens=1-5delims=." %%a in ("!%1!") do (
if not "%%e"=="" exit /b 1
call :CHECKBETWEEN0AND255 %%a || exit /b 1
call :CHECKBETWEEN0AND255 %%b || exit /b 1
call :CHECKBETWEEN0AND255 %%c || exit /b 1
call :CHECKBETWEEN0AND255 %%d || exit /b 1
)
exit /b 0

:CHECKBETWEEN0AND255
if "%~1"=="" exit /b 1
for /f "delims=1234567890" %%a in ("%~1") do exit /b 1
if %~1 lss 0 exit /b 1
if %~1 gtr 255 exit /b 1
exit /b 0

:CHECK_SETTINGS
for %%a in (LANGUAGE USERNAME YOUTUBEDLPRIORITY PORTPRIORITY BACKGROUNDBORDERTRANSPARENCY BACKGROUNDDISABLED BACKGROUNDTRANSPARENCY BACKGROUNDWALLPAPER FIRSTLAUNCH VOICEASSISTANT VOICEASSISTANTCHOICE YOUTUBEDLP YOUTUBEDLOUTPUTDIRECTORY YOUTUBEDLGEOBYPASS DEVELOPERMODE) do call :CHECK_%%a
exit /b

:APPLY_SETTINGS
for %%a in (BACKGROUNDBORDERTRANSPARENCY BACKGROUNDDISABLED BACKGROUNDTRANSPARENCY BACKGROUNDWALLPAPER) do call :CHECK_%%a
if "!BackgroundDisabled!"=="0" if defined BackgroundWallpaper cmdbkg.exe Backgrounds\background-!BackgroundWallpaper!.jpg!BackgroundBorderTransparency!
if "!BackgroundDisabled!"=="1" cmdbkg.exe
cmdwiz.exe delay 500
if defined BackgroundTransparency cmdwiz.exe setwindowtransparency !BackgroundTransparency!
exit /b

:CHECK_LANGUAGE
set Language=
for /f "tokens=3" %%a in ('2^>nul reg query "!IS_Reg!" /v "Language"') do set "Language=%%~a"
if not "!Language!"=="FR" if not "!Language!"=="EN" (
call :ERROR_REGEDIT Language !Language!
for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Nls\Language" /v "InstallLanguage"') do if "%%a"=="040C" (>nul reg add "!IS_Reg!" /v "Language" /t REG_SZ /d FR /f) else >nul reg add "!IS_Reg!" /v "Language" /t REG_SZ /d EN /f
goto :CHECK_LANGUAGE
)
set SPEECH_FR=
if "!Language!"=="FR" if exist "!windir!\Speech_OneCore\Engines\TTS\fr-FR" 2>nul reg query "HKCU\SOFTWARE\Microsoft\Speech\Voices" /v "DefaultTokenId" | >nul findstr /ic:"FR-FR" /c:"frFR" /c:"ZIRA" && (set SPEECH_FR=1) || set SPEECH_FR=
::2>nul reg query "HKLM\SOFTWARE\Microsoft\Speech_OneCore\Voices\Tokens" | >nul findstr /ic:"FR-FR" /c:"frFR"
::2>nul reg query "HKCU\SOFTWARE\Microsoft\Speech_OneCore\Settings\TextToSpeech" /v "Voice" | >nul findstr /ic:"FR-FR" /c:"frFR"
exit /b

:CHECK_USERNAME
set IS_USERNAME=
for /f "tokens=2*" %%a in ('2^>nul reg query "!IS_Reg!" /v "Username"') do set "IS_USERNAME=%%~b"
if "!IS_USERNAME:~20!"=="" exit /b
call :ERROR_REGEDIT Username "!IS_USERNAME!"
>nul reg add "!IS_Reg!" /v "Username" /t REG_SZ /d "!USERNAME:~,20!" /f
goto :CHECK_USERNAME

:CHECK_PROXY
set Proxy=
for /f "tokens=2*" %%a in ('2^>nul reg query "!IS_Reg!" /v "Proxy"') do set "Proxy=%%~b"
if defined Proxy (
for %%a in (!git_list!) do if "!Proxy:*://=!"=="%%a" exit /b
call :ERROR_REGEDIT Proxy !Proxy!
)
>nul 2>&1 reg delete "!IS_Reg!" /v "Proxy" /f
exit /b

:CHECK_YOUTUBEDLPRIORITY
set YouTubeDLPriority=
for /f "tokens=3" %%a in ('2^>nul reg query "!IS_Reg!" /v "YouTubeDLPriority"') do set "YouTubeDLPriority=%%~a"
if not "!YouTubeDLPriority!"=="REALTIME" if not "!YouTubeDLPriority!"=="HIGH" if not "!YouTubeDLPriority!"=="ABOVENORMAL" if not "!YouTubeDLPriority!"=="NORMAL" if not "!YouTubeDLPriority!"=="BELOWNORMAL" if not "!YouTubeDLPriority!"=="LOW" (
call :ERROR_REGEDIT YouTubeDLPriority !YouTubeDLPriority!
>nul reg add "!IS_Reg!" /v "YouTubeDLPriority" /t REG_SZ /d NORMAL /f
goto :CHECK_YOUTUBEDLPRIORITY
)
set YouTubeDLPriority=/!YouTubeDLPriority!
exit /b

:CHECK_PORTPRIORITY
set PortPriority=
for /f "tokens=3" %%a in ('2^>nul reg query "!IS_Reg!" /v "PortPriority"') do set "PortPriority=%%~a"
if not "!PortPriority!"=="REALTIME" if not "!PortPriority!"=="HIGH" if not "!PortPriority!"=="ABOVENORMAL" if not "!PortPriority!"=="NORMAL" if not "!PortPriority!"=="BELOWNORMAL" if not "!PortPriority!"=="LOW" (
call :ERROR_REGEDIT PortPriority !PortPriority!
>nul reg add "!IS_Reg!" /v "PortPriority" /t REG_SZ /d NORMAL /f
goto :CHECK_PORTPRIORITY
)
set PortPriority=/!PortPriority!
exit /b

:CHECK_BACKGROUNDBORDERTRANSPARENCY
set BackgroundBorderTransparencyValue=
for /f "tokens=3" %%a in ('2^>nul reg query "!IS_Reg!" /v "BackgroundBorderTransparency"') do set /a BackgroundBorderTransparencyValue=%%a
if "!BackgroundBorderTransparencyValue!"=="1" set "BackgroundBorderTransparency=" & exit /b
if "!BackgroundBorderTransparencyValue!"=="0" set "BackgroundBorderTransparency= /b" & exit /b
call :ERROR_REGEDIT BackgroundBorderTransparency !BackgroundBorderTransparencyValue!
>nul reg add "!IS_Reg!" /v "BackgroundBorderTransparency" /t REG_DWORD /d 1 /f
goto :CHECK_BACKGROUNDBORDERTRANSPARENCY

:CHECK_BACKGROUNDDISABLED
set BackgroundDisabled=
for /f "tokens=3" %%a in ('2^>nul reg query "!IS_Reg!" /v "BackgroundDisabled"') do set /a BackgroundDisabled=%%a
for %%a in (0 1) do if "!BackgroundDisabled!"=="%%a" exit /b
call :ERROR_REGEDIT BackgroundDisabled !BackgroundDisabled!
>nul reg add "!IS_Reg!" /v "BackgroundDisabled" /t REG_DWORD /d 0 /f
goto :CHECK_BACKGROUNDDISABLED

:CHECK_BACKGROUNDTRANSPARENCY
set BackgroundTransparency=
for /f "tokens=3" %%a in ('2^>nul reg query "!IS_Reg!" /v "BackgroundTransparency"') do set /a BackgroundTransparency=%%a
if !BackgroundTransparency! geq 1 if !BackgroundTransparency! leq 100 exit /b
call :ERROR_REGEDIT BackgroundTransparency !BackgroundTransparency!
>nul reg add "!IS_Reg!" /v "BackgroundTransparency" /t REG_DWORD /d 10 /f
goto :CHECK_BACKGROUNDTRANSPARENCY

:CHECK_BACKGROUNDWALLPAPER
set BackgroundWallpaper=
for /f "tokens=3" %%a in ('2^>nul reg query "!IS_Reg!" /v "BackgroundWallpaper"') do set /a BackgroundWallpaper=%%a
if !BackgroundWallpaper! geq 1 if !BackgroundWallpaper! leq 12 exit /b
call :ERROR_REGEDIT BackgroundWallpaper !BackgroundWallpaper!
>nul reg add "!IS_Reg!" /v "BackgroundWallpaper" /t REG_DWORD /d 6 /f
goto :CHECK_BACKGROUNDWALLPAPER

:CHECK_FIRSTLAUNCH
set FirstLaunch=
for /f "tokens=3" %%a in ('2^>nul reg query "!IS_Reg!" /v "FirstLaunch"') do set /a FirstLaunch=%%a
for %%a in (0 1) do if "!FirstLaunch!"=="%%a" exit /b
call :ERROR_REGEDIT FirstLaunch !FirstLaunch!
>nul reg add "!IS_Reg!" /v "FirstLaunch" /t REG_DWORD /d 1 /f
goto :CHECK_FIRSTLAUNCH

:CHECK_VOICEASSISTANT
set VoiceAssistant=
for /f "tokens=3" %%a in ('2^>nul reg query "!IS_Reg!" /v "VoiceAssistant"') do set /a VoiceAssistant=%%a
for %%a in (0 1) do if "!VoiceAssistant!"=="%%a" exit /b
call :ERROR_REGEDIT VoiceAssistant !VoiceAssistant!
>nul reg add "!IS_Reg!" /v "VoiceAssistant" /t REG_DWORD /d 0 /f
goto :CHECK_VOICEASSISTANT

:CHECK_VOICEASSISTANTCHOICE
set VoiceAssistantChoice=
for /f "tokens=3" %%a in ('2^>nul reg query "!IS_Reg!" /v "VoiceAssistantChoice"') do set /a VoiceAssistantChoice=%%a
for %%a in (0 1) do if "!VoiceAssistantChoice!"=="%%a" exit /b
call :ERROR_REGEDIT VoiceAssistantChoice !VoiceAssistantChoice!
>nul reg add "!IS_Reg!" /v "VoiceAssistantChoice" /t REG_DWORD /d 1 /f
goto :CHECK_VOICEASSISTANTCHOICE

:CHECK_YOUTUBEDLP
set YouTubeDLP=
for /f "tokens=3" %%a in ('2^>nul reg query "!IS_Reg!" /v "YouTubeDLP"') do set /a YouTubeDLP=%%a
for %%a in (0 1) do if "!YouTubeDLP!"=="%%a" exit /b
call :ERROR_REGEDIT YouTubeDLP !YouTubeDLP!
>nul reg add "!IS_Reg!" /v "YouTubeDLP" /t REG_DWORD /d 0 /f
goto :CHECK_YOUTUBEDLP

:CHECK_YOUTUBEDLOUTPUTDIRECTORY
set YouTubeDLOutputDirectory=
for /f "tokens=2*" %%a in ('2^>nul reg query "!IS_Reg!" /v "YouTubeDLOutputDirectory"') do set "YouTubeDLOutputDirectory=%%~fb"
if defined YouTubeDLOutputDirectory exit /b
call :ERROR_REGEDIT YouTubeDLOutputDirectory "!YouTubeDLOutputDirectory!"
for /f "tokens=3*" %%a in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Music"') do >nul reg add "!IS_Reg!" /v "YouTubeDLOutputDirectory" /t REG_SZ /d "%%b\YouTube Downloader" /f
goto :CHECK_YOUTUBEDLOUTPUTDIRECTORY

:CHECK_YOUTUBEDLGEOBYPASS
set YouTubeDLGeoBypass=
for /f "tokens=3" %%a in ('2^>nul reg query "!IS_Reg!" /v "YouTubeDLGeoBypass"') do set /a YouTubeDLGeoBypass=%%a
for %%a in (0 1) do if "!YouTubeDLGeoBypass!"=="%%a" exit /b
call :ERROR_REGEDIT YouTubeDLGeoBypass !YouTubeDLGeoBypass!
>nul reg add "!IS_Reg!" /v "YouTubeDLGeoBypass" /t REG_DWORD /d 0 /f
goto :CHECK_YOUTUBEDLGEOBYPASS

:CHECK_DEVELOPERMODE
set DeveloperKey=
for /f "tokens=3" %%a in ('2^>nul reg query "!IS_Reg!" /v "DeveloperMode"') do set /a DeveloperKey=%%a
set /a c1=DeveloperKey%%12312
if "!c1!"=="826" (
set /a c2=DeveloperKey%%17
if "!c2!"=="6" set DeveloperMode=1
)
if not "!DeveloperMode!"=="1" (
>nul reg add "!IS_Reg!" /v "DeveloperMode" /t REG_DWORD /d 0 /f
set DeveloperMode=0
)
for %%a in (DeveloperKey c1 c2) do set %%a=
if not "!DeveloperMode!"=="0" if not "!DeveloperMode!"=="1" (
call :ERROR_REGEDIT DeveloperMode !DeveloperMode!
>nul reg add "!IS_Reg!" /v "DeveloperMode" /t REG_DWORD /d 0 /f
goto :CHECK_DEVELOPERMODE
)
exit /b

:ERROR_REGEDIT
>nul 2>&1 reg query "!IS_Reg!" /v "%1" && (
if "!Language!"=="FR" set t="Une erreur inattendue est survenue." "Debug: '!IS_Reg!\%1=%~2'" "Rinitialisation du paramtre '%1' … la valeur par dfaut."
if "!Language!"=="EN" set t="An unexpected error has occurred." "Debug: '!IS_Reg!\%1=%~2'" "Resetting '%1' setting to default value."
call :MSGBOX 3 !t! 69680 "Illegal Services Checker"
)
exit /b

:SCALE
cls
mode %1,%2
set /a width=%1, height=%2
exit /b

:CLEAR
set /a c1=%1, c2=%2
for /l %%a in (!c1!,1,!c2!) do set "%%a=!yellow!%%a !unchecked!"
exit /b

:PROMPT
%showcursor%
set /a "_sp=width/2"
set x=
set /p "x=!yellow![!_sp!C"
%hidecursor%
exit /b

:CHOOSE
if not defined x exit /b 1
set "c=%1"
if /i "!c:~,1!"=="!x!" exit /b 0
if /i "!c:~,2!"=="!x:~,2!" exit /b 0
exit /b 1

:WEBSITECHECK
if not defined x exit /b 1
for /l %%a in (!c1!,1,!c2!) do if "!x!"=="%%a" if "!%%a!"=="!yellow!%%a !unchecked!" (set "%%a=!yellow!%%a !checked!" & exit /b 0) else set "%%a=!yellow!%%a !unchecked!" & exit /b 0
exit /b 1

:WEBSITESTART
if defined x exit /b 1
set _el=1
set el=
set cn=
for /l %%a in (!c1!,1,!c2!) do if "!%%a!"=="!yellow!%%a !checked!" (
set s=s
set /a cn=c1-1
for %%b in (!db!) do (
set /a cn+=1
if "!cn!"=="%%a" (
if "%%~b"=="Dox Tool v2" (set el=1) else if "%%~b"=="Windows ISO Downloader" (set el=2) else (
set "url=%%b"
if "!url:~,1!"=="`" set s=
start "" "http!s!://!url:*`=!" && cmdwiz.exe delay 1500
)
set _el=0
)
)
)
if "!el!"=="1" call :START_DOXTOOLV2
if "!el!"=="2" call :START_WINDOWSISODOWNLOADER
exit /b !_el!

:ERRORMESSAGE
call :ROSE "Error Choice"
if "%~1"=="" (
if "!Language!"=="EN" set "t=ERROR: !grey!"!yellow!!x!!grey!" is not a valid choice"
if "!Language!"=="FR" set "t=ERREUR: !grey!"!yellow!!x!!grey!" n'est pas un choix valide"
) else (
if "!Language!"=="EN" set "t=ERROR: !grey!"!yellow!!%1!!grey!" is not a valid %~3"
if "!Language!"=="FR" set "t=ERREUR: !grey!"!yellow!!%1!!grey!" n'est pas %~2 valide"
)
set t=!red!!t!...
call :DRAW_CENTER_ERROR t 20
>nul timeout /t 3
exit /b

:START_DOXTOOLV2
for %%a in (Newtonsoft.Json.dll "Dox Tool V2.exe") do if not exist "Portable_Apps\DoxToolV2\%%~a" call :CURL "Portable_Apps\DoxToolV2.7z" "`git_raw_downloads`/DoxToolV2.7z" || (call :ERROR_INTERNET & exit /b)
pushd "Portable_Apps\DoxToolV2"
start "" "Dox Tool V2.exe" && (
if "!Language!"=="EN" set t="Only 'Username Search' & 'Extra Tools' are working." "The tool has not been updated since 05-02-2016."
if "!Language!"=="FR" set t="Seules 'Username Search' & 'Extra Tools' fonctionnent." "L'outil n'a pas t mis … jour depuis le 05-02-2016."
call :MSGBOX 2 !t! 69696 "Illegal Services Checker"
)
popd
exit /b

:START_WINDOWSISODOWNLOADER
call :CURL "Portable_Apps\Windows-ISO-Downloader.exe" "https://heidoc.net/php/Windows-ISO-Downloader.exe" || (call :ERROR_INTERNET & exit /b)
pushd "Portable_Apps"
start Windows-ISO-Downloader.exe
popd
exit /b

:PRIORITY_PROCESS
echo:
echo !yellow![R]!cyan! ^> Use REALTIME priority class.
echo !yellow![H]!cyan! ^> Use HIGH priority class.
echo !yellow![A]!cyan! ^> Use ABOVENORMAL priority class.
echo !yellow![N]!cyan! ^> Use NORMAL priority class.
echo !yellow![B]!cyan! ^> Use BELOWNORMAL priority class.
echo !yellow![L]!cyan! ^> Use LOW priority class.
echo:
%showcursor%
>nul choice /n /c RHANBL
if "!errorlevel!"=="1" set %1=REALTIME
if "!errorlevel!"=="2" set %1=HIGH
if "!errorlevel!"=="3" set %1=ABOVENORMAL
if "!errorlevel!"=="4" set %1=NORMAL
if "!errorlevel!"=="5" set %1=BELOWNORMAL
if "!errorlevel!"=="6" set %1=LOW
exit /b

:GET_VERSION
call :CURL_RAW JB0xvJRG lastversion
if defined lastversion (
if "!version:~1,7!" geq "!lastversion:~1,7!" exit /b 0
if "!version:~1,3!" lss "!lastversion:~1,3!" exit /b 1
if "!version:~1,7!" lss "!lastversion:~1,7!" exit /b 2
) else (
call :ROSE "Error Internet"
if "!Language!"=="EN" set t="Checking the latest version has failed." "Can't check the latest version." "Check your current Internet settings and try again."
if "!Language!"=="FR" set t="La vrification de la dernire version a chou." "Impossible de vrifier la dernire version." "Vrifiez vos paramtres Internet actuels et ressayez."
call :MSGBOX 3 !t! 69680 "Illegal Services Checker"
)
exit /b 3

:DRAW_LOGO
echo     ÛÛปÛÛป     ÛÛป     ÛÛÛÛÛÛÛป ÛÛÛÛÛÛป  ÛÛÛÛÛป ÛÛป         ÛÛÛÛÛÛÛปÛÛÛÛÛÛÛปÛÛÛÛÛÛป ÛÛป   ÛÛปÛÛป ÛÛÛÛÛÛปÛÛÛÛÛÛÛปÛÛÛÛÛÛÛป
echo     ÛÛบÛÛบ     ÛÛบ     ÛÛษออออผÛÛษออออผ ÛÛษออÛÛปÛÛบ         ÛÛษออออผÛÛษออออผÛÛษออÛÛปÛÛบ   ÛÛบÛÛบÛÛษออออผÛÛษออออผÛÛษออออผ
echo     ÛÛบÛÛบ     ÛÛบ     ÛÛÛÛÛป  ÛÛบ  ÛÛÛปÛÛÛÛÛÛÛบÛÛบ         ÛÛÛÛÛÛÛปÛÛÛÛÛป  ÛÛÛÛÛÛษผÛÛบ   ÛÛบÛÛบÛÛบ     ÛÛÛÛÛป  ÛÛÛÛÛÛÛป
echo     ÛÛบÛÛบ     ÛÛบ     ÛÛษออผ  ÛÛบ   ÛÛบÛÛษออÛÛบÛÛบ         ศออออÛÛบÛÛษออผ  ÛÛษออÛÛปศÛÛป ÛÛษผÛÛบÛÛบ     ÛÛษออผ  ศออออÛÛบ
echo     ÛÛบÛÛÛÛÛÛÛปÛÛÛÛÛÛÛปÛÛÛÛÛÛÛปศÛÛÛÛÛÛษผÛÛบ  ÛÛบÛÛÛÛÛÛÛป    ÛÛÛÛÛÛÛบÛÛÛÛÛÛÛปÛÛบ  ÛÛบ ศÛÛÛÛษผ ÛÛบศÛÛÛÛÛÛปÛÛÛÛÛÛÛปÛÛÛÛÛÛÛบ
echo     ศอผศออออออผศออออออผศออออออผ ศอออออผ ศอผ  ศอผศออออออผ    ศออออออผศออออออผศอผ  ศอผ  ศอออผ  ศอผ ศอออออผศออออออผศออออออผ
exit /b

:DRAW_CENTER_ERROR
call :STRLEN "!%1!"
if not "%2"=="" set /a "len-=%2"
if !len! lss !width! (set /a "_sp=(width-len)/2") else set _sp=
<nul set /p="[!_sp!C!%1!"
if not "%3"=="1" echo:
exit /b

:DRAW_CENTER
call :STRLEN "%~1"
if not "%2"=="" set /a "len-=%2"
if !len! lss !width! (set /a "_sp=(width-len)/2") else set _sp=
<nul set /p="[!_sp!C%~1"
if not "%3"=="1" echo:
exit /b

:DRAW_CUSTOM_CENTER
call :STRLEN "%~2"
if not "%3"=="" set /a "len-=%3"
set /a "_sp=(%1-len)/2"
<nul set /p="[!_sp!C%~2"
echo:
exit /b

:STRLEN
::https://www.dostips.com/DtTipsStringOperations.php#Function.strLen
set "str=a%~1"
set len=0
for /l %%a in (12,-1,0) do (
set /a "len|=1<<%%a"
for %%b in (!len!) do if "!str:~%%b,1!"=="" set /a "len&=~1<<%%a"
)
exit /b

:READ_IPLOOKUP
if exist "!ISOutputDirectory!\IP Lookup Saved.txt" (start "" "!ISOutputDirectory!\IP Lookup Saved.txt") else (
if "!Language!"=="EN" set t="IP Lookup list not found." "You must first save a Lookup to be able to read it."
if "!Language!"=="FR" set t="Liste d'IP Lookup non trouve." "Vous devez d'abord enregistrer une Lookup pour pouvoir la lire."
call :MSGBOX 2 !t! 69680 "Illegal Services Checker"
)
exit /b

:DELETE_IPLOOKUP
if exist "!ISOutputDirectory!\IP Lookup Saved.txt" (
del /f /q "!ISOutputDirectory!\IP Lookup Saved.txt" && (
if "!Language!"=="EN" set t="IP Lookup list successfully deleted."
if "!Language!"=="FR" set t="La liste d'IP Lookup a bien t supprime."
call :MSGBOX 1 !t! 69696 "Illegal Services Checker"
)
) else (
if "!Language!"=="EN" set t="IP Lookup list not found." "You must first save a Lookup to be able to delete it."
if "!Language!"=="FR" set t="Liste d'IP Lookup non trouve." "Vous devez d'abord enregistrer une Lookup pour pouvoir la supprimer."
call :MSGBOX 2 !t! 69680 "Illegal Services Checker"
)
exit /b

:ERROR_INTERNET
if "!errorlevel!"=="1" (
call :ROSE "Error Internet"
if "!Language!"=="EN" set t="Your Internet access appears to be offline." "You must activate Internet and try again."
if "!Language!"=="FR" set t="Votre accs Internet semble tre hors ligne." "Veuillez activer Internet et ressayer."
)
if "!errorlevel!"=="2" (
call :ROSE "Error Remote Host"
if "!Language!"=="EN" set t="The remote host appears to be offline." "Downloading '!url!' impossible."
if "!Language!"=="FR" set t="L'h“te distant semble tre hors ligne." "Tlchargement de '!url!' impossible."
)
if "!errorlevel!"=="3" (
call :ROSE "Error Git Proxy Backup"
if "!Language!"=="EN" set t="The Git proxy backup server is running. You cannot download external files from it." "Downloading '!url!' impossible."
if "!Language!"=="FR" set t="Le serveur proxy Git de secours est en marche. Vous ne pouvez pas tlcharger de fichiers externes … partir de celui-ci." "Tlchargement de '!url!' impossible."
)
if "!errorlevel!"=="4" (
call :ROSE "Error Git Proxy"
if "!Language!"=="EN" set t="IS Git proxy: '!git!' appears to be offline." "Downloading '!url!' impossible." "Try to restart Illegal Services or join our Telegram groups for more updates."
if "!Language!"=="FR" set t="IS Git proxy: '!git!' semble tre hors ligne." "Tlchargement de '!url!' impossible." "Essayez de redmarrer Illegal Services ou rejoignez nos groupes Telegram pour plus de mises … jour."
call :MSGBOX 3 !t! 69680 "Illegal Services Checker"
exit /b
)
call :MSGBOX 2 !t! 69680 "Illegal Services Checker"
exit /b

:PROXY
call :CHECK_INTERNET || (call :PROXY_DOWN & exit /b 1)
call :CHECK_PROXY
if defined Proxy for /f %%a in ("!Proxy:*://=!") do call :_PROXY %%a && exit /b 0
for %%a in (!git_list!) do call :_PROXY %%a && exit /b 0
if defined git_backup (exit /b 3) else set "git_backup=backup "
call :PROXY_DOWN
call :CURL_RAW 1ARL0img git
call :CURL_RAW urudZjdg git_build
call :CURL_RAW c5nbugAf git_changelog
call :CURL_RAW ThrdeC97 git_release
if "!Language!"=="EN" set t="Illegal Services cannot connect to its Git proxy server." "The Git proxy backup server is running and only updates for Illegal Services can be performed."
if "!Language!"=="FR" set t="Illegal Services ne peut pas se connecter … son serveur proxy Git." "Le serveur proxy Git de secours est en marche et seules les mises … jour d'Illegal Services peuvent tre effectues."
call :MSGBOX 2 !t! 69648 "Illegal Services Checker"
exit /b 2

:_PROXY
for /f %%a in ('Curl\x!arch!\curl.exe -fIksw "%%{response_code}" -o NUL "https://%1"') do if "%%a"=="200" (
if "%1"=="bitbucket.org/IllegalServices/illegal_services" call :__PROXY %1 raw src/source/ & exit /b 0
if "%1"=="git.teknik.io/Illegal-Services/Illegal_Services" call :__PROXY %1 raw/branch src/branch/source & exit /b 0
if "%1"=="github.com/Illegal-Services/Illegal_Services" call :__PROXY %1 raw tree/source & exit /b 0
if "%1"=="gitee.com/Illegal-Services/illegal_services" call :__PROXY %1 raw tree/source/ & exit /b 0
)
exit /b 1

:__PROXY
set git=https://%1
set git_raw_main=!git!/%2/main
set git_raw_downloads=!git!/%2/downloads
set git_raw_source=!git!/%2/source
set git_build=!git_raw_main!/Illegal_Services.exe
set git_changelog=!git_raw_main!/ChangeLog.txt
set git_release=!git_raw_downloads!/IS.Setup.exe
set git_source=!git!/%3
>nul reg add "!IS_Reg!" /v "Proxy" /t REG_SZ /d "!git!" /f
exit /b

:PROXY_DOWN
for %%a in (
git
git_raw_main
git_raw_downloads
git_raw_source
git_build
git_changelog
git_release
git_source
) do set %%a=404 Git proxy not found
exit /b

:ERROR_WINDOWS_VERSION
if "!Language!"=="EN" set t=Your Windows version is not compatible with that feature
if "!Language!"=="FR" set t=Votre version de Windows n'est pas compatible avec cette fonctionnalit
call :MSGBOX 1 "!t!." 69648 "Illegal Services Checker"
exit /b

:CURL_RAW
for /f "delims=" %%a in ('Curl\x!arch!\curl.exe -fkLs "https://pastebin.com/raw/%1"') do set %2=%%a
exit /b

:OPEN_FOLDER
if exist "%~1" (start "" "%~1") else (
if "!Language!"=="EN" set t="Folder '%~1' not found." "You must first download to be able to open it."
if "!Language!"=="FR" set t="Dossier '%~1' non trouve." "Vous devez d'abord tlcharger pour pouvoir ouvrir le dossier."
call :MSGBOX 2 !t! 69680 "Illegal Services Checker"
)
exit /b

:START_DOWNLOADED_FILE
pushd "!TMPF!"
if "!Language!"=="EN" echo Please complete "!yellow!%1!cyan!" installation in the window that appeared...
if "!Language!"=="FR" echo Veuillez terminer l'installation de "!yellow!%1!cyan!" dans la fentre qui est apparue...
echo:
start /w %1
>nul timeout /t 0 /nobreak
del /f /q %1
popd
exit /b

:SHOW_WINDOW
for /f "tokens=2delims=," %%a in ('tasklist /v /fo csv /fi "imagename eq !IS_Process!" ^| findstr /ic:"%~1"') do (
set el=%%a
set el=!el:"=!
cmdwiz.exe showwindow value:1 /p:!el:"=!
cmdwiz.exe showwindow top /p:!el:"=!
exit /b 0
)
exit /b 1

:MISSING_FILE
if "!Language!"=="EN" set t=The file "!IS_Dir!%1" is missing, trying to download it
if "!Language!"=="FR" set t=Le fichier "!IS_Dir!%1" est manquant, tentative de tlchargement
echo !red!!t!...!grey!
exit /b

:ERROR_FATAL
if "!Language!"=="EN" set t="Illegal Services can't start because '!IS_Dir!%1' is missing."
if "!Language!"=="FR" set t="Illegal Services ne peut pas dmarrer car '!IS_Dir!%1' est manquant."
if "!errorlevel!"=="1" (
if "!Language!"=="EN" set t=!t! "You must activate Internet and try again."
if "!Language!"=="FR" set t=!t! "You must activate Internet and try again."
)
if "!errorlevel!"=="2" (
if "!Language!"=="EN" set t=!t! "IS Git proxy: '!git!' appears to be offline. For more updates visit our Telegram."
if "!Language!"=="FR" set t=!t! "IS Git proxy: '!git!' semble tre hors ligne. Pour plus de mises … jour, visitez notre Telegram."
set el=1
)
call :MSGBOX 2 !t! 69648 "Illegal Services Checker"
if "!el!"=="1" start https://t.me/illegal_services_forum
exit