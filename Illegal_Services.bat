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
REM  Productversion:  5. 9. 2. 6
REM  Fileversion:  5. 9. 2. 6
REM  Internalname: Illegal_Services.exe
REM  Appicon: Ressources\Icons\icon.ico
REM  AdministratorManifest: Yes
REM  QBFC Project Options End
@ECHO ON
@echo off
cls
>nul chcp 65001
setlocal DisableDelayedExpansion
set "x1=%~nx0"
setlocal EnableDelayedExpansion
set "x2=%~nx0"
set IS_REG=HKCU\SOFTWARE\IB_U_Z_Z_A_R_Dl\Illegal Services
(set \N=^
%=leave unchanged=%
)
if not "!x1!"=="!x2!" (
call :CHECK_LANGUAGE
if "!Language!"=="EN" set t="Invalid characters detected in your executable name.!\N!!\N!Illegal Services should be named 'Illegal_Services.exe'.!\N!!\N!Please rename Illegal Services and try again."
if "!Language!"=="FR" set t="Caractères invalides détectés dans votre nom d'exécutable.!\N!!\N!Illegal Services devrais être nommés 'Illegal_Services.exe'.!\N!!\N!Veuillez renommer Illegal Services et réessayer."
call :MSGBOX 69648 "Illegal Services Checker"
exit
)
setlocal DisableDelayedExpansion
pushd "%~dp0"
for /f %%A in ('forfiles /m "%~nx0" /c "cmd /c echo:0x1B"') do set "\E=%%A"
setlocal EnableDelayedExpansion
set "HIDECURSOR=<nul set /p=!\E![?25l"
set "SHOWCURSOR=<nul set /p=!\E![?25h"
%HIDECURSOR%
for /f "delims==" %%A in ('set') do if not "%%A"=="x1" if not "%%A"=="x2" if not "%%A"=="IS_REG" if not "%%A"=="\N" if not "%%A"=="\E" if not "%%A"=="SHOWCURSOR" if not "%%A"=="HIDECURSOR" set "DUMP_IS=!DUMP_IS!`%%A"
if defined DUMP_IS set "DUMP_IS=!DUMP_IS!`"
for %%A in (%*) do if "%%~A"=="--debug" set "DEBUG=[Debug] "
if not "%~1"=="" if defined Language for %%A in (FAQ SCANWEBSITES NMAP YOUTUBEDL PINGER) do if "%~1"=="%%A" (
call :APPLY_SETTINGS
for /f "tokens=6" %%A in ('cmdwiz.exe getconsoledim') do if %%A lss 120 call :SCALE 120 30
goto :PROCESS_%%A
)
call :SCALE 125 19
if exist "cmdwiz.exe" cmdwiz.exe setquickedit 0
call :CHECK_LANGUAGE
call :CHECK_USERNAME
set TITLE=!DEBUG!` - Illegal Services
title !TITLE:`=Launcher!
if defined TEMP (set "TMPF=!TEMP!") else if defined TMP (set "TMPF=!TMP!") else (
if "!Language!"=="EN" (
set "t1=Your 'TEMP' and 'TMP' environment variables do not exist."
set "t2=Please fix one of them and try again."
)
if "!Language!"=="FR" (
set "t1=Vos variables d'environnement 'TEMP' et 'TMP' n'existent pas."
set "t2=Veuillez réparer l'une d'entre elles et réessayer."
)
mshta vbscript:Execute^("msgbox ""!t1!"" & Chr(10) & Chr(10) & ""!t2!"",69648,""Illegal Services Checker"":close"^)
start https://t.me/illegal_services_forum
exit
)
if not exist "Curl" <nul set /p="%~dp0" | >nul findstr /c:"!TEMP!" /c:"!TMP!" && (
if "!Language!"=="EN" set t="Illegal Services cannot start because you are running it from an archive. Reopen it once the archive is extracted."
if "!Language!"=="FR" set t="Illegal Services ne peut pas démarrer car vous l'exécutez à partir d'une archive. Rouvrez-le une fois l'archive extraite."
call :MSGBOX 69680 "Illegal Services Checker"
exit
)
set cn=
if /i "%~x0"==".exe" (
set "IS_PROCESS=%~nx0"
set BAT_USED=
if "%~n0"=="Illegal Services" (
>nul 2>&1 taskkill /f /im "Illegal_Services.exe" /t
>nul move /y "%~nx0" "Illegal_Services.exe" && (start Illegal_Services.exe !DEBUG!) && exit
)
for /f %%A in ('tasklist /fo csv /fi "imagename eq !IS_PROCESS!" ^| findstr /c:"!IS_PROCESS!"') do set /a cn+=1
) else (
set IS_PROCESS=cmd.exe
set "BAT_USED=%~nx0"
)
pushd "!TMPF!"
for /f %%A in ('2^>nul dir "????????.bat" /a:-d /o:-d /b ^| findstr /rc:"........\.bat"') do (
if not defined BAT_USED if /i "%~x0"==".exe" (
set "BAT_USED=%%A"
attrib -s -h "!BAT_USED!"
attrib +s +h +i "!BAT_USED!"
)
if !cn! gtr 1 popd & goto :LAUNCHER
if not "%%A"=="!BAT_USED!" del /f /q /a "%%A"
)
popd

:LAUNCHER
for %%A in (VERSION LastVersion) do if defined %%A set old_%%A=!%%A!
set VERSION=v5.9.2.6 - 22/11/2021
set "el=UNDERLINE=!\E![04m,UNDERLINEOFF=!\E![24m,BLACK=!\E![30m,RED=!\E![31m,GREEN=!\E![32m,YELLOW=!\E![33m,BLUE=!\E![34m,MAGENTA=!\E![35m,CYAN=!\E![36m,WHITE=!\E![37m,BGBLACK=!\E![40m,BGYELLOW=!\E![43m,BGWHITE=!\E![47m,BRIGHTBLACK=!\E![90m,BRIGHTRED=!\E![91m,BRIGHTBLUE=!\E![94m,BRIGHTMAGENTA=!\E![95m"
set "%el:,=" && set "%"
echo !BGBLACK!!BRIGHTBLUE!
call :DRAW_LOGO
echo:
echo !\E![28C!CYAN!{!RED!+!CYAN!}---------------------------------------------------------------{!RED!+!CYAN!}!RED!
if "!Language!"=="EN" call :DRAW_CENTER "♥   !YELLOW!Welcome [!RED!!IS_Username!!YELLOW!] to Illegal Services !VERSION:~,8!   !RED!♥"
if "!Language!"=="FR" call :DRAW_CENTER "♥   !YELLOW!Bienvenue [!RED!!IS_Username!!YELLOW!] dans Illegal Services !VERSION:~,8!   !RED!♥"
echo !\E![28C!CYAN!{!RED!+!CYAN!}---------------------------------------------------------------{!RED!+!CYAN!}
for /f %%A in ('2^>nul dir "!TMPF!\URL????.url" /a:-d /b ^| findstr /rc:"URL....\.url"') do del /f /q "!TMPF!\%%A"
for %%A in (README.md "Illegal Services.exe" "!TMPF!\msgbox.vbs" "!TMPF!\IS.Setup.exe") do if exist "%%~A" del /f /q "%%~A"
for %%A in ("!CD:~,2!\AI_RecycleBin" "!SystemDrive!\AI_RecycleBin" "!TMPF!\IB_U_Z_Z_A_R_Dl") do if exist "%%~A" 2>nul rd /s /q "%%~A"
set "sp=!\E![28C!YELLOW!{$} !BRIGHTBLACK!"
echo !BRIGHTBLACK!
set "IS_DIR=%~dp0Illegal Services\"
set "IS_DIR=!IS_DIR:Illegal Services\Illegal Services\=Illegal Services\!"
if defined ProgramFiles(x86) (set ARCH=64) else set ARCH=86
if not "!PATH:~-9!"==";Curl\x!ARCH!" set "PATH=!PATH!;Curl\x!ARCH!"
>nul 2>&1 where curl.exe || call :ERROR_FATAL !PATH:~-8!\curl.exe CURL

:LAUNCHER_PROXY
if "!Language!"=="EN" <nul set /p="!sp!Searching a proxy > "
if "!Language!"=="FR" <nul set /p="!sp!Recherche d'un proxy > "
set GIT_LIST=github.com/Illegal-Services/Illegal_Services bitbucket.org/IllegalServices/illegal_services git.teknik.io/Illegal-Services/Illegal_Services gitee.com/Illegal-Services/illegal_services
call :PROXY

:LAUNCHER_VERSION
if defined git for /f "delims=/" %%A in ("!git:*://=!") do if defined git_backup (echo !GREEN![!RED!Git backup server: !GREEN!%%A] . . .) else if "!git!"=="404 Git proxy not found" (
if "!Language!"=="EN" echo !RED![FAILED] . . .
if "!Language!"=="FR" echo !RED![ECHEC] . . .
) else echo !GREEN![%%A] . . .
if "!Language!"=="EN" <nul set /p="!sp!Searching for a new update > "
if "!Language!"=="FR" <nul set /p="!sp!Recherche d'une nouvelle mise à jour > "
call :CHECK_VOICEASSISTANT
call :GET_VERSION
if defined OLD_VERSION if defined OLD_LASTVERSION if "!OLD_VERSION!"=="!VERSION!" if "!OLD_LASTVERSION!"=="!LastVersion!" (
if "!Language!"=="EN" echo !RED![FAILED: Wait for the next build update.] . . .
if "!Language!"=="FR" echo !RED![ECHEC: Attendez la prochaine mise à jour de la build.] . . .
goto :CHECKERINTEGRITY
)
if defined LastVersion (echo !GREEN![!LastVersion!] . . .) else (
if "!Language!"=="EN" echo !RED![FAILED] . . .
if "!Language!"=="FR" echo !RED![ECHEC] . . .
)
if "!errorlevel!"=="1" call :CHECKER_SETUP_FOUND
if "!errorlevel!"=="2" call :CHECKER_BUILD_FOUND

:CHECKERINTEGRITY
if "!Language!"=="EN" <nul set /p="!sp!Checking files integrity > "
if "!Language!"=="FR" <nul set /p="!sp!Vérification de l'intégrite des fichiers > "
set _el=
for %%A in (7za\x64\7za.dll 7za\x64\7za.exe 7za\x64\7zxa.dll 7za\x86\7za.dll 7za\x86\7za.exe 7za\x86\7zxa.dll Ansicon\x64\ANSI32.dll Ansicon\x64\ANSI64.dll Ansicon\x64\ansicon.exe Ansicon\x86\ANSI32.dll Ansicon\x86\ansicon.exe Backgrounds\background-1.jpg Backgrounds\background-2.jpg Backgrounds\background-3.jpg Backgrounds\background-4.jpg Backgrounds\background-5.jpg Backgrounds\background-6.jpg Backgrounds\background-7.jpg Backgrounds\background-8.jpg Backgrounds\background-9.jpg Backgrounds\background-10.jpg Backgrounds\background-11.jpg Backgrounds\background-12.jpg ChangeLog.txt cmdbkg.exe cmdwiz.exe COPYING Curl\x64\curl.exe Curl\x86\curl.exe EULA.rtf Illegal_Services.exe OpenFileBox.exe SaveFileBox.exe Speak\EN.lang Speak\extd.exe Speak\FR.lang Speak\speak-x64.exe Speak\speak-x86.exe Tutorial.html) do if not exist %%A (
set el=%%A
set el=!el:\=/!
call :MISSING_FILE %%A
call :CURL "%%A" "`git_raw_main`/!el!" || call :ERROR_FATAL %%A
)
if not defined _el (
if "!Language!"=="EN" echo  !GREEN![PASSED] . . .
if "!Language!"=="FR" echo  !GREEN![PASSER] . . .
)

:CHECKERWINDOWS
if "!Language!"=="EN" <nul set /p="!sp!Checking Windows version > "
if "!Language!"=="FR" <nul set /p="!sp!Vérification de votre version de Windows > "
for /f "tokens=4-7delims=[.] " %%A in ('ver') do if /i "%%A"=="Version" (set "WINDOWS_VERSION=%%B.%%C") else set "WINDOWS_VERSION=%%A.%%B"
for /f "tokens=2delims=:." %%A in ('chcp') do set /a "CP=%%A"
for %%A in (WINDOWS_VERSION ARCH CP) do if not defined %%A set %%A=?
if "!WINDOWS_VERSION!"=="?" (<nul set /p="!RED![!WINDOWS_VERSION!], ") else <nul set /p="!GREEN![!WINDOWS_VERSION!], "
if "!ARCH!"=="?" (<nul set /p="!RED![!ARCH!], ") else <nul set /p="!GREEN![x!ARCH!], "
if "!CP!"=="?" (<nul set /p="!RED![!CP!] . . .") else <nul set /p="!GREEN![CHCP:!CP!] . . ."
echo:
if not "!WINDOWS_VERSION!"=="10.0" if not "!WINDOWS_VERSION!"=="6.3" if not "!WINDOWS_VERSION!"=="6.2" if not "!WINDOWS_VERSION!"=="6.1" (
if "!Language!"=="EN" set t="ERROR: Your computer does not reach the minimum Windows version compatible with Illegal Services.!\N!!\N!You need Windows 7 or higher."
if "!Language!"=="FR" set t="ERREUR: Votre ordinateur n'atteint pas la version minimale de Windows compatible avec Illegal Services.!\N!!\N!Vous avez besoin de Windows 7 ou supérieur."
call :MSGBOX 69648 "Illegal Services Checker"
exit
)
if not "!CP!"=="65001" (
if "!CP!"=="?" (
if "!Language!"=="EN" set t="Illegal Services could not determine your CHCP number.!\N!!\N!Please report this bug on the Illegal Services Telegram forum in order to correct this bug in a future release."
if "!Language!"=="FR" set t="Illegal Services n'a pas pu déterminer votre numéro CHCP.!\N!!\N!Veuillez signaler ce bug sur le forum Telegram d'Illegal Services afin de corriger ce bug dans une future version."
) else (
if "!Language!"=="EN" set t="Illegal Services could not set your CHCP number to 65001.!\N!!\N!Please report this bug on the Illegal Services Telegram forum in order to correct this bug in a future release."
if "!Language!"=="FR" set t="Illegal Services n'a pas pu définir votre numéro CHCP sur 65001.!\N!!\N!Veuillez signaler ce bug sur le forum Telegram d'Illegal Services afin de corriger ce bug dans une future version."
)
call :MSGBOX 69648 "Illegal Services Checker"
start https://t.me/illegal_services_forum
exit
)
if not "!WINDOWS_VERSION!"=="10.0" if not defined ANSICON_VER (
pushd "Ansicon\x!ARCH!"
ansicon.exe -i
popd
endlocal
start "" "%~f0"
exit
)

:LAUNCHER_APPLY_SETTINGS
if "!Language!"=="EN" <nul set /p="!sp!Applying your settings > "
if "!Language!"=="FR" <nul set /p="!sp!Applique vos paramètres > "
call :APPLY_SETTINGS
call :CHECK_UNTRUSTEDWEBSITESWARNING
if "!Language!"=="EN" echo !GREEN![PASSED] . . .
if "!Language!"=="FR" echo !GREEN![PASSER] . . .

:LAUNCHER_START
call :ROSE "Welcome Back"
if "!Language!"=="EN" <nul set /p="!sp!Starting Illegal Services > "
if "!Language!"=="FR" <nul set /p="!sp!Démarrage d'Illegal Services > "
for /f "tokens=2*" %%A in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal"') do set "IS_OUTPUTDIRECTORY=%%B\Illegal Services"
set "CHECKED=!CYAN![!YELLOW!x!CYAN!]!WHITE! "
set "UNCHECKED=!CYAN![ ]!WHITE! "
set /a c1=0, c2=0
call :CHECK_VOICEASSISTANTCHOICE
if "!VoiceAssistantChoice!"=="1" call :ROSE_SETUP
if "!Language!"=="EN" echo !GREEN![PASSED] . . .
if "!Language!"=="FR" echo !GREEN![PASSER] . . .
:L1
for %%A in (extd speak-x!ARCH!) do tasklist /fo csv /fi "imagename eq %%A.exe" | >nul findstr /c:"%%A.exe" && goto :L1
if "!VoiceAssistant!"=="0" >nul timeout /t 1 /nobreak
call :SCALE 125 29
set el=!DEBUG!Main Menu ^|Git !git_backup!proxy: !git!^| - Illegal Services
for /l %%A in (1,1,18) do (
title !DEBUG!!el:~,%%A!
cmdwiz.exe delay 5
)

:MAINMENU
title !TITLE:`=Main Menu ^|Git %git_backup%proxy: %git%^|!
if defined MAINMENU (call :ROSE) else (call :ROSE "Main Menu" & set MAINMENU=1)
call :SCALE 125 29
echo !BRIGHTBLACK!
call :DRAW_LOGO
echo !CYAN!
echo !\E![19C╔═════════════════════════════════════════════════════════════════════════════════════╗
<nul set /p=!BRIGHTRED!                                  !UNDERLINE!!VERSION:~,8!!UNDERLINEOFF!             !RED!█!BGYELLOW! MAIN MENU !BGBLACK!!RED!█!BGBLACK!!BRIGHTRED!
if "!Language!"=="EN" (set t=Welcome) else set t=Bienvenue
call :DRAW_CUSTOM_CENTER 37 "!UNDERLINE!!t! !IS_Username!!UNDERLINEOFF!!CYAN!"
echo !\E![19C╠═════════════════════════════════════════════════════════════════════════════════════╣
echo !\E![19C║    !YELLOW!1!CYAN!  ^>  !WHITE!Internet Protocol TV (IPTV)!CYAN!    █    !YELLOW!10!CYAN!  ^>  !WHITE!IP Denial of Services (DDoS)!CYAN!    ║
echo !\E![19C║    !YELLOW!2!CYAN!  ^>  !WHITE!Direct Download Link (DDL)!CYAN!     █    !YELLOW!11!CYAN!  ^>  !WHITE!IP Address Lookup!CYAN!               ║
echo !\E![19C║    !YELLOW!3!CYAN!  ^>  !WHITE!Streaming!CYAN!                      █    !YELLOW!12!CYAN!  ^>  !WHITE!IP Port Scanning!CYAN!                ║
echo !\E![19C║    !YELLOW!4!CYAN!  ^>  !WHITE!Torrenting!CYAN!                     █    !YELLOW!13!CYAN!  ^>  !WHITE!IP Port Pinger!CYAN!                  ║
echo !\E![19C║    !YELLOW!5!CYAN!  ^>  !WHITE!Subtitles!CYAN!                      █    !YELLOW!14!CYAN!  ^>  !WHITE!IP Pinger!CYAN!                       ║
echo !\E![19C║    !YELLOW!6!CYAN!  ^>  !WHITE!Cracked Windows apps!CYAN!           █    !YELLOW!15!CYAN!  ^>  !WHITE!IP Loggers!CYAN!                      ║
echo !\E![19C║    !YELLOW!7!CYAN!  ^>  !WHITE!Cracked Android APK's!CYAN!          █    !YELLOW!16!CYAN!  ^>  !WHITE!Doxing!CYAN!                          ║
echo !\E![19C║    !YELLOW!8!CYAN!  ^>  !WHITE!YouTube Downloader!CYAN!             █    !YELLOW!17!CYAN!  ^>  !WHITE!Portable Apps!CYAN!                   ║
echo !\E![19C║    !YELLOW!9!CYAN!  ^>  !WHITE!Useful Websites!CYAN!                █    !YELLOW!18!CYAN!  ^>  !WHITE!More Features!CYAN!                   ║
echo !\E![19C╠═════════════════════════════════════════════════════════════════════════════════════╣
if "!Language!"=="EN" echo !\E![19C║    !YELLOW!C!CYAN!  ^>  !WHITE!Credits!CYAN!!UNDERLINEOFF!     ║    !YELLOW!N!CYAN!  ^>  !BRIGHTRED!Our Social Networks!CYAN!    ║      !YELLOW!S!CYAN!  ^>  !WHITE!Settings!CYAN!!UNDERLINEOFF!        ║
if "!Language!"=="FR" echo !\E![19C║    !YELLOW!C!CYAN!  ^>  !WHITE!Crédits!CYAN!!UNDERLINEOFF!     ║    !YELLOW!R!CYAN!  ^>  !BRIGHTRED!Nos Réseaux Sociaux!CYAN!    ║      !YELLOW!P!CYAN!  ^>  !WHITE!Paramètres!CYAN!!UNDERLINEOFF!      ║
echo !\E![19C╚═════════════════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!HELP!BRIGHTBLACK!" / "!YELLOW!FAQ!BRIGHTBLACK!" / "!YELLOW!CHANGELOG!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :CHECK_FIRSTLAUNCH
if "!VERSION:~5,3!"=="0.0" if "!FirstLaunch!"=="1" (
if "!Language!"=="EN" (
set t="News in !VERSION:~,8!:"!\N!!\N!"Updated:"!\N!!\N!"Settings"!\N!"Internet Protocol Television"!\N!"Direct Download Link"!\N!"Streaming"!\N!"Streaming Applications"!\N!"Torrenting"!\N!"Subtitles"!\N!"Cracked Windows apps"!\N!"Cracked Android APK's"!\N!"Useful Websites"!\N!"IP Denial of Services"!\N!"IP Loggers"!\N!"Doxing"!\N!"Portable Apps"!\N!"More Features Warez Wikis"!\N!"More Features Release Logs"!\N!"More Features Ebooks"!\N!"More Features Musics"!\N!"More Features Forum Websites."
call :MSGBOX 69696 "News - Illegal Services"
set t="Developer Note:"!\N!!\N!"In this update, I added:"!\N!!\N!"Settings: Untrusted Websites Warning"!\N!"Torrenting: Torrent Applications"!\N!"Useful Websites: Combo Lists"!\N!"More Features: Release Logs"!\N!"More Features: Musics"!\N!!\N!"Updated many categories and fixed various bugs."!\N!!\N!"For a full version of the ChangeLog: !git_changelog:404 Git proxy not found=https://github.com/Illegal-Services/Illegal_Services/blob/main/ChangeLog.txt!"
call :MSGBOX 69696 "News - Illegal Services"
)
if "!Language!"=="FR" (
set t="Nouveautés dans la !VERSION:~,8!:"!\N!!\N!"Mise à jour de:"!\N!!\N!"Credits"!\N!"Settings"!\N!"Internet Protocol Television"!\N!"Direct Download Link"!\N!"Streaming"!\N!"Streaming Applications"!\N!"Torrenting"!\N!"Subtitles"!\N!"Cracked Windows apps"!\N!"Cracked Android APK's"!\N!"Useful Websites"!\N!"IP Denial of Services"!\N!"IP Loggers"!\N!"Doxing"!\N!"Portable Apps"!\N!"More Features Warez Wikis"!\N!"More Features Release Logs"!\N!"More Features Ebooks"!\N!"More Features Musics"!\N!"More Features Forum Websites."
call :MSGBOX 69696 "Nouveautés - Illegal Services"
set t="Note du développeur:"!\N!!\N!"Dans cette mise à jour, jai ajouté les menus:"!\N!!\N!"Paramètres: Untrusted Websites Warning"!\N!"Torrenting: Torrent Applications"!\N!"Useful Websites: Combo Lists"!\N!"More Features: Release Logs"!\N!"More Features: Musics"!\N!!\N!"Mise à jour de nombreuses catégories et corrigé divers bugs."!\N!!\N!"Pour une version complète du ChangeLog: !git_changelog:404 Git proxy not found=https://github.com/Illegal-Services/Illegal_Services/blob/main/ChangeLog.txt!"
call :MSGBOX 69696 "Nouveautés - Illegal Services"
)
>nul reg add "!IS_REG!" /v "FirstLaunch" /t REG_DWORD /d 0 /f
)
call :PROMPT
for %%A in (3 4) do if "!x!"=="1%%A" call :CHECK_INTERNET || (call :ERROR_INTERNET & goto :MAINMENU)
set cn=
for %%A in (IPTV DDL STREAMING TORRENTING SUBTITLES WINDOWS ANDROID YOUTUBEDL USEFULWEBSITES DDOS IPLOOKUP PORT PINGERPORT IPPINGER IPLOGGERS DOXING PORTABLEAPPS MOREFEATURES) do (
set /a cn+=1
if "!x!"=="!cn!" goto :%%A
)
call :CHOOSE credit && goto :CREDITS
if "!Language!"=="EN" set t=networks
if "!Language!"=="FR" set t=reseaux
call :CHOOSE !t! && (
start https://illegal-services.github.io/Illegal_Services/ && cmdwiz.exe delay 1500
start https://github.com/Illegal-Services/Illegal_Services && cmdwiz.exe delay 1500
start https://t.me/illegal_services_forum && cmdwiz.exe delay 1500
start https://t.me/illegal_services && cmdwiz.exe delay 1500
start https://discord.gg/rU2w2E83KF && cmdwiz.exe delay 1500
start https://twitter.com/illegalservices && cmdwiz.exe delay 1500
start https://chrome.google.com/webstore/detail/illegal-services-bookmark/dkddkjnnbeohinbbcfdklcehcmgpdofi && cmdwiz.exe delay 1500
start https://addons.mozilla.org/addon/illegal-services
goto :MAINMENU
)
if "!Language!"=="EN" set t=settings
if "!Language!"=="FR" set t=parametres
call :CHOOSE !t! && goto :SETTINGS
call :CHOOSE help && (start /max tutorial.html & goto :MAINMENU)
call :CHOOSE changelog && (start /max changeLog.txt & goto :MAINMENU)
call :CHOOSE faq && (call :SHOW_WINDOW "!IS_PROCESS!" "Frequently Asked Questions" || (start "" "%~0" FAQ) & goto :MAINMENU)
if /i "!x!"=="--dump" (
>LOG_DUMP.txt set
start LOG_DUMP.txt
goto :MAINMENU
)
if /i "!x!"=="--dump-IS" (
if exist LOG_DUMP.txt del /f /q LOG_DUMP.txt
for /f "tokens=1,*delims==" %%A in ('set') do if "!DUMP_IS:`%%A`=!"=="!DUMP_IS!" >>LOG_DUMP.txt echo %%A=%%B
start LOG_DUMP.txt
goto :MAINMENU
)
call :ERRORMESSAGE
goto :MAINMENU

:CREDITS
call :SCALE 99 34
title !TITLE:`=Credits!
call :ROSE Credits

:CONTINUECREDITS
call :SCALE 94 34
echo !CYAN!
echo !\E![39C═══════════════
echo !\E![38C// !RED!█!BGYELLOW!!BLACK! CREDITS !RED!█!BGBLACK!!CYAN! \\
echo !\E![9C╔══════════════════════════════════════════════════════════════════════════╗
echo !\E![9C╠═══════════════════════════■█!BGYELLOW!!RED!█ DEPENDENCIES █!BGBLACK!!CYAN!█■═══════════════════════════╣
echo !\E![9C║                                                                          ║
echo !\E![9C║      !YELLOW!1!CYAN!  ^>  !WHITE!Open/SaveFileBox     : 'Open/Save file box dialog'!CYAN!            ║
echo !\E![9C║      !YELLOW!2!CYAN!  ^>  !WHITE!Speak by soyalk 2019 : 'Rose voice assistant'!CYAN!                 ║
echo !\E![9C║      !YELLOW!3!CYAN!  ^>  !WHITE!Speak by Fatih Kodak : 'Rose voice assistant'!CYAN!                 ║
echo !\E![9C║      !YELLOW!4!CYAN!  ^>  !WHITE!Advanced Installer   : 'Setup Installer'!CYAN!                      ║
echo !\E![9C║      !YELLOW!5!CYAN!  ^>  !WHITE!ANSICON: 'Support for Windows 2000, Vista, 7, 8 and 8.1'!CYAN!      ║
echo !\E![9C║      !YELLOW!6!CYAN!  ^>  !WHITE!CmdWiz : 'Background Transparency, Hide Cursor, ...'!CYAN!          ║
echo !\E![9C║      !YELLOW!7!CYAN!  ^>  !WHITE!CmdBkg : 'Background Image'!CYAN!                                   ║
echo !\E![9C║      !YELLOW!8!CYAN!  ^>  !WHITE!7-Zip  : 'Decompressing Tool'!CYAN!                                 ║
echo !\E![9C║      !YELLOW!9!CYAN!  ^>  !WHITE!curl   : 'Web Requests'!CYAN!                                       ║
echo !\E![9C║                                                                          ║
echo !\E![9C╠══════════════════════■█!BGYELLOW!!RED!█ DEVELOPERS and HELPERS █!BGBLACK!!CYAN!█■══════════════════════╣
echo !\E![9C║                                                                          ║
echo !\E![9C║                   !YELLOW!10!CYAN!  ^>  !WHITE!Program Dream Discord Server!CYAN!                    ║
echo !\E![9C║                   !YELLOW!11!CYAN!  ^>  !WHITE!server.bat Discord Server!CYAN!                       ║
echo !\E![9C║                   !YELLOW!12!CYAN!  ^>  !WHITE!@anic17!CYAN!                                         ║
echo !\E![9C║                   !YELLOW!13!CYAN!  ^>  !WHITE!@^<Tim^>!CYAN!                                          ║
echo !\E![9C║                   !YELLOW!14!CYAN!  ^>  !WHITE!@sintrode!CYAN!                                       ║
echo !\E![9C║                   !YELLOW!15!CYAN!  ^>  !WHITE!@Grub4K!CYAN!                                         ║
echo !\E![9C║                   !YELLOW!16!CYAN!  ^>  !WHITE!@Rosalyn!CYAN!                                        ║
echo !\E![9C║                   !YELLOW!17!CYAN!  ^>  !WHITE!@Ms.CatFire!CYAN!                                     ║
echo !\E![9C║                   !YELLOW!18!CYAN!  ^>  !WHITE!All other contributors!CYAN!                          ║
echo !\E![9C╚══════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
if "!x!"=="1" start https://www.robvanderwoude.com/dialogboxes.php
if "!x!"=="2" start https://github.com/soyalk/speak-text-windows
if "!x!"=="3" start https://f2ko.de/programme/cmd-tools/
if "!x!"=="4" start https://www.advancedinstaller.com/
if "!x!"=="5" start https://github.com/adoxa/ansicon
if "!x!"=="6" start https://www.dostips.com/forum/viewtopic.php?t=7402
if "!x!"=="7" start https://www.dostips.com/forum/viewtopic.php?t=7407
if "!x!"=="8" start https://www.7-zip.org/
if "!x!"=="9" start https://curl.se/
if "!x!"=="10" start https://discord.com/invite/eCMBHUB
if "!x!"=="11" start https://discord.com/invite/eXjp7PQ
if "!x!"=="12" (
if "!Language!"=="EN" set t="Helped improving and reducing code.!\N!!\N!Helped fixing a bug that where creating temporary files without deleting them.!\N!!\N!Helped improving IP Lookup API's.!\N!!\N!Helped adding launcher updater.Helping to find existing bugs and vulnerabilities.!\N!!\N!Helped to fix bugs related to user input in Regedit."
if "!Language!"=="FR" set t="A aidé à améliorer et à réduire le code.!\N!!\N!A aidé à la correction d'un bug qui entraînait la création de fichiers temporaires sans les supprimer.!\N!!\N!A aidé à améliorer l'API de l'IP Lookup.!\N!!\N!A aidé à l'ajout des mises à jour du launcher.A aidé à trouver les bugs et vulnérabilitées existantes.!\N!!\N!A aidé à la correction de bugs liés à la saisie de l'utilisateur dans le Regedit."
call :MSGBOX 69696 "anic17 'Task failed successfully'"
start https://github.com/anic17
)
if "!x!"=="13" (
if "!Language!"=="EN" set t="Helped improving and reducing code.!\N!!\N!Helped adding launcher updater.!\N!!\N!Helped creating windows repair.!\N!!\N!Helped adding Rose voice assistant."
if "!Language!"=="FR" set t="A aidé à améliorer et à réduire le code.!\N!!\N!A aidé à l'ajout des mises à jour du launcher.!\N!!\N!A aidé à la création de windows repair.!\N!!\N!A aidé à l'ajout de l'assistante vocal Rose."
call :MSGBOX 69696 "<Tim>"
start https://tim-greller.de/home/
)
if "!x!"=="14" (
if "!Language!"=="EN" set t="Helped improving and reducing code.!\N!!\N!Helped using curl for IS source.!\N!!\N!Helped adding Rose voice assistant.!\N!!\N!Helped adding choice verification.!\N!!\N!Helped adding Automatic proxy switcher.!\N!!\N!Helped to fix bugs related to user input in Regedit."
if "!Language!"=="FR" set t="A aidé à améliorer et à réduire le code.!\N!!\N!A aidé à l'utilisation de curl pour la source d'IS.!\N!!\N!A aidé à l'ajout de l'assistante vocale Rose.!\N!!\N!A aidé à l'ajout de la vérification des choix.!\N!!\N!A aidé à ajouter le proxy switcher automatique.!\N!!\N!A aidé à la correction de bugs liés à la saisie de l'utilisateur dans le Regedit."
call :MSGBOX 69696 "sintrode"
start https://github.com/sintrode
)
if "!x!"=="15" (
if "!Language!"=="EN" set t="Helped improving and reducing code.!\N!!\N!Created IS Bookmarks web extension.!\N!!\N!Created the timer in seconds to scan indexed websites.!\N!!\N!Fixed a bug with the stack memory overflow causing IS to crash.!\N!!\N!Created the code to center the text on the UI.!\N!!\N!Helped reducing Curl PATH algorithm.!\N!!\N!Helped converting Illegal Services VBScript messages to UTF-8 encoding."
if "!Language!"=="FR" set t="A aidé à améliorer et à réduire le code.!\N!!\N!Création de l'extension web IS Bookmarks.!\N!!\N!Création de la minuterie en secondes du scan des sites internet indexés.!\N!!\N!Correction d'un bug avec le débordement de la mémoire de la pile provoquant le plantage d'IS.!\N!!\N!A créé le code pour centrer le texte sur l'UI.!\N!!\N!A aidé à convertir les messages VBScript d'Illegal Services en encodage UTF-8."
call :MSGBOX 69696 "Grub4K"
start https://github.com/Grub4K
)
if "!x!"=="16" (
if "!Language!"=="EN" set t="Helping testing alpha versions.!\N!!\N!Helping to find existing bugs.!\N!!\N!Advised me in updating the CLI.!\N!!\N!Gave me a lot of motivation and encouragement.!\N!!\N!                                            *Notice you the shine ?"
if "!Language!"=="FR" set t="A aidé à tester les versions alpha.!\N!!\N!A aidé à trouver les bugs existants.!\N!!\N!M'a conseillé dans la mise à jour de la CLI.!\N!!\N!M'a donné beaucoup de motivation et d'encouragement.!\N!!\N!                                                           *Notice you the shine ?"
call :MSGBOX 69696 "Rosalyn 'Shine brightest'"
)
if "!x!"=="17" (
if "!Language!"=="EN" set t="Logo designer for v4.0"
if "!Language!"=="FR" set t="Conceptrice du logo de la v4.0"
call :MSGBOX 69696 "Ms.CatFire"
)
if "!x!"=="18" (
if "!Language!"=="EN" (
set t="@Agam - Added ON/OFF switches."!\N!"@Vincent - Helped finding a bug with wrong choices."!\N!"@cocorisss - Updated Python Port Scanner."!\N!"@Chonkus - Added Internet Protocol TV (IPTV)."!\N!"@KiritoLeFakePK - Helped finding existing bugs."!\N!"@Simi - Helped with some English translation."!\N!"@Saltyy - Helped improving UI choices."!\N!"@AMIT - Fixed 'ControlSet001' to 'CurrentControlSet'."!\N!"@0x00 - Updated Glary Utilities crack."!\N!"@0x00 - Helped finding a bug with Windows Update MiniTool."!\N!"@0x00 - Added More Features Spoofing."
call :MSGBOX 69696 "All other contributors:"
set t="@blacktario - Added 14 websites."!\N!"@0x00 - Added 8 websites."!\N!"@LeSaintFisti - Added 6 websites."!\N!"@Trident Security - Added 2 websites."!\N!"@Bastien - Added 1 website."!\N!"@RaaFii1 - Added 1 website."!\N!"@snipercat - Added 1 website."!\N!"@PistachePoilue - Added 1 website."!\N!"@FZ_PARRAIN_ZF - Added 1 website."!\N!"@Eiralys - Added 1 website."!\N!"@ayo - Added 1 website."!\N!"@Zyker - Added 1 website."
call :MSGBOX 69696 "All other contributors:"
)
if "!Language!"=="FR" (
set t="@Agam - A ajouté les interrupteurs ON/OFF."!\N!"@Vincent - A aidé à trouver un bug avec les mauvais choix."!\N!"@cocorisss - Mise à jour du Port Scanner Python."!\N!"@Chonkus - A ajouté Internet Protocol TV (IPTV)."!\N!"@KiritoLeFakePK - A aidé à trouver les bugs existants."!\N!"@Simi - A aidé pour certaines traductions Anglaise."!\N!"@Saltyy - A aidé à améliorer les choix d'interface utilisateur."!\N!"@AMIT - A corrigé 'ControlSet001' vers 'CurrentControlSet'."!\N!"@0x00 - Mise à jour du crack de Glary Utilities."!\N!"@0x00 - A aidé à trouver un bug avec Windows Update MiniTool."!\N!"@0x00 - A ajouté More Features Spoofing."
call :MSGBOX 69696 "Tous les autres contributeurs:"
set t="@blacktario - A ajouté 14 sites internet."!\N!"@0x00 - A ajouté 8 sites internet."!\N!"@LeSaintFisti - A ajouté 6 sites internet."!\N!"@Trident Security - A ajouté 2 sites internet."!\N!"@Bastien - A ajouté 1 site internet."!\N!"@RaaFii1 - A ajouté 1 site internet."!\N!"@snipercat - A ajouté 1 site internet."!\N!"@PistachePoilue - A ajouté 1 site internet."!\N!"@FZ_PARRAIN_ZF - A ajouté 1 site internet."!\N!"@Eiralys - A ajouté 1 site internet."!\N!"@ayo - A ajouté 1 site internet."!\N!"@Zyker - A ajouté 1 site internet."
call :MSGBOX 69696 "Tous les autres contributeurs:"
)
)
for /l %%A in (1,1,18) do if "!x!"=="%%A" goto :CONTINUECREDITS
call :CHOOSE back && goto :MAINMENU
call :ERRORMESSAGE
goto :CONTINUECREDITS

:SETTINGS
call :SCALE 113 26
title !TITLE:`=Settings!
call :ROSE Settings

:CLEARSETTINGS
call :CHECK_SETTINGS
if !BackgroundTransparency! lss 10 (set "el= ") else set el=
if "!Language!"=="EN" (
set "BackgroundTransparencyInfo=Change background transparency !CYAN!(!YELLOW!!BackgroundTransparency!!CYAN!)      !el!║"
if "!BackgroundBorderTransparencyValue!"=="1" set "BackgroundBorderTransparencyInfo=Borders transparency !CYAN!(!GREEN!ON!!CYAN!)                ║"
if "!BackgroundBorderTransparencyValue!"=="0" set "BackgroundBorderTransparencyInfo=Borders transparency !CYAN!(!RED!OFF!!CYAN!)               ║"
if "!BackgroundDisabled!"=="0" set "BackgroundDisabledInfo=Wallpaper background !CYAN!(!GREEN!ON!!CYAN!)                ║"
if "!BackgroundDisabled!"=="1" set "BackgroundDisabledInfo=Wallpaper background !CYAN!(!RED!OFF!!CYAN!)               ║"
if "!UntrustedWebsitesWarning!"=="1" set "UntrustedWebsitesWarningInfo=Untrusted Websites Warning !CYAN!(!GREEN!ON!!CYAN!)          ║"
if "!UntrustedWebsitesWarning!"=="0" set "UntrustedWebsitesWarningInfo=Untrusted Websites Warning !CYAN!(!RED!OFF!!CYAN!)         ║"
if "!VoiceAssistant!"=="1" set "VoiceAssistantInfo=Rose voice assistant !CYAN!(!GREEN!ON!!CYAN!)                ║"
if "!VoiceAssistant!"=="0" set "VoiceAssistantInfo=Rose voice assistant !CYAN!(!RED!OFF!!CYAN!)               ║"
if "!DeveloperMode!"=="1" (
set "DeveloperModeInfo=Developer mode !CYAN!(!GREEN!ON!!CYAN!)                      ║"
set "ExtractSourceInfo=!YELLOW!24!CYAN!  ^> !WHITE! Extract IS source code.!CYAN!                  ║"
)
if "!DeveloperMode!"=="0" (
set "DeveloperModeInfo=Developer mode !CYAN!(!RED!OFF!!CYAN!)                     ║"
set "ExtractSourceInfo=                                                ║"
)
set "ScanWebsitesInfo=Scan down or changed domain websites.!CYAN!    ║"
)
if "!Language!"=="FR" (
set "BackgroundTransparencyInfo=Changer background transparence !CYAN!(!YELLOW!!BackgroundTransparency!!CYAN!)!CYAN!     !el!║"
if "!BackgroundBorderTransparencyValue!"=="1" set "BackgroundBorderTransparencyInfo=Transparence des bords !CYAN!(!GREEN!ON!!CYAN!)              ║"
if "!BackgroundBorderTransparencyValue!"=="0" set "BackgroundBorderTransparencyInfo=Transparence des bords !CYAN!(!RED!OFF!!CYAN!)             ║"
if "!BackgroundDisabled!"=="0" set "BackgroundDisabledInfo=Fond d'écran !CYAN!(!GREEN!ON!!CYAN!)                        ║"
if "!BackgroundDisabled!"=="1" set "BackgroundDisabledInfo=Fond d'écran !CYAN!(!RED!OFF!!CYAN!)                       ║"
if "!UntrustedWebsitesWarning!"=="1" set "UntrustedWebsitesWarningInfo=Pop-up des sites web non fiables !CYAN!(!GREEN!ON!!CYAN!)    ║"
if "!UntrustedWebsitesWarning!"=="0" set "UntrustedWebsitesWarningInfo=Pop-up des sites web non fiables !CYAN!(!RED!OFF!!CYAN!)   ║"
if "!VoiceAssistant!"=="1" set "VoiceAssistantInfo=Assistance vocal Rose !CYAN!(!GREEN!ON!!CYAN!)               ║"
if "!VoiceAssistant!"=="0" set "VoiceAssistantInfo=Assistance vocal Rose !CYAN!(!RED!OFF!!CYAN!)              ║"
if "!DeveloperMode!"=="1" (
set "DeveloperModeInfo=Mode développeur !CYAN!(!GREEN!ON!!CYAN!)                    ║"
set "ExtractSourceInfo=!YELLOW!24!CYAN!  ^>  !WHITE!Extraire le code source d'IS.!CYAN!            ║"
)
if "!DeveloperMode!"=="0" (
set "DeveloperModeInfo=Mode développeur !CYAN!(!RED!OFF!!CYAN!)                   ║"
set "ExtractSourceInfo=                                                ║"
)
set "ScanWebsitesInfo=Scan les sites internet indexés.!CYAN!         ║"
)

:CONTINUESETTINGS
call :SCALE 113 26
title !TITLE:`=Settings!
echo !CYAN!
if "!Language!"=="EN" (
echo !\E![47C════════════════
echo !\E![46C// !RED!█!BGYELLOW!!BLACK! SETTINGS !RED!█!BGBLACK!!CYAN! \\
)
if "!Language!"=="FR" (
echo !\E![46C══════════════════
echo !\E![45C// !RED!█!BGYELLOW!!BLACK! PARAMETRES !RED!█!BGBLACK!!CYAN! \\
)
echo !\E![7C╔═════════════════════════════════════════════╦═══════════════════════════════════════════════════╗
if "!Language!"=="EN" echo !\E![7C╠═════════════■█!BGYELLOW!!RED!█ WALLPAPERS █!BGBLACK!!CYAN!█■══════════════╬═════════════════■█!BGYELLOW!!RED!█ SETTINGS █!BGBLACK!!CYAN!█■══════════════════╣
if "!Language!"=="FR" echo !\E![7C╠════════════■█!BGYELLOW!!RED!█ FOND D'ECRANS █!BGBLACK!!CYAN!█■════════════╬════════════════■█!BGYELLOW!!RED!█ PARAMETRES █!BGBLACK!!CYAN!█■═════════════════╣
echo !\E![7C║                                             ║                                                   ║
echo !\E![7C║    !YELLOW!1!CYAN!  ^>  !WHITE!Kirito 1 (IS v1.4 icon)!CYAN!            ║   !YELLOW!13!CYAN!  ^>  !WHITE!!BackgroundTransparencyInfo!
echo !\E![7C║    !YELLOW!2!CYAN!  ^>  !WHITE!Kirito 2!CYAN!                           ║   !YELLOW!14!CYAN!  ^>  !WHITE!!BackgroundBorderTransparencyInfo!
echo !\E![7C║    !YELLOW!3!CYAN!  ^>  !WHITE!Kirito 3!CYAN!                           ║   !YELLOW!15!CYAN!  ^>  !WHITE!!BackgroundDisabledInfo!
echo !\E![7C║    !YELLOW!4!CYAN!  ^>  !WHITE!Kirito 4!CYAN!                           ║   !YELLOW!16!CYAN!  ^>  !WHITE!!UntrustedWebsitesWarningInfo!
echo !\E![7C║    !YELLOW!5!CYAN!  ^>  !WHITE!49206C6F766520796F75204C697361!CYAN!     ║   !YELLOW!17!CYAN!  ^>  !WHITE!!VoiceAssistantInfo!
echo !\E![7C║    !YELLOW!6!CYAN!  ^>  !WHITE!Even Roses are colorless !CYAN!          ║   !YELLOW!18!CYAN!  ^>  !WHITE!!DeveloperModeInfo!
if "!Language!"=="EN" echo !\E![7C║    !YELLOW!7!CYAN!  ^>  !WHITE!Tree!CYAN!                               ║   !YELLOW!19!CYAN!  ^>  !WHITE!!ScanWebsitesInfo!
if "!Language!"=="FR" echo !\E![7C║    !YELLOW!7!CYAN!  ^>  !WHITE!Arbre!CYAN!                              ║   !YELLOW!19!CYAN!  ^>  !WHITE!!ScanWebsitesInfo!
if "!Language!"=="EN" echo !\E![7C║    !YELLOW!8!CYAN!  ^>  !WHITE!Dark Guy!CYAN!                           ║   !YELLOW!20!CYAN!  ^>  !WHITE!Check for updates.!CYAN!                       ║
if "!Language!"=="FR" echo !\E![7C║    !YELLOW!8!CYAN!  ^>  !WHITE!Homme sombre!CYAN!                       ║   !YELLOW!20!CYAN!  ^>  !WHITE!Vérifiez les mises à jour.!CYAN!               ║
if "!Language!"=="EN" echo !\E![7C║    !YELLOW!9!CYAN!  ^>  !WHITE!Girl eyes!CYAN!                          ║   !YELLOW!21!CYAN!  ^>  !WHITE!Change username.!CYAN!                         ║
if "!Language!"=="FR" echo !\E![7C║    !YELLOW!9!CYAN!  ^>  !WHITE!Yeux fille!CYAN!                         ║   !YELLOW!21!CYAN!  ^>  !WHITE!Changer le nom d'utilisateur.!CYAN!            ║
if "!Language!"=="EN" echo !\E![7C║   !YELLOW!10!CYAN!  ^>  !WHITE!World map (bytes)!CYAN!                  ║   !YELLOW!22!CYAN!  ^>  !WHITE!Change language to French.!CYAN!               ║
if "!Language!"=="FR" echo !\E![7C║   !YELLOW!10!CYAN!  ^>  !WHITE!Carte du monde (bytes)!CYAN!             ║   !YELLOW!22!CYAN!  ^>  !WHITE!Changer la langue en Anglais.!CYAN!            ║
if "!Language!"=="EN" echo !\E![7C║   !YELLOW!11!CYAN!  ^>  !WHITE!World map (Corona Virus)!CYAN!           ║   !YELLOW!23!CYAN!  ^>  !WHITE!Export/Import settings.!CYAN!                  ║
if "!Language!"=="FR" echo !\E![7C║   !YELLOW!11!CYAN!  ^>  !WHITE!Carte du monde (Corona Virus)!CYAN!      ║   !YELLOW!23!CYAN!  ^>  !WHITE!Exporter/Importer les paramètres.!CYAN!        ║
if "!Language!"=="EN" echo !\E![7C║   !YELLOW!12!CYAN!  ^>  !WHITE!World map (cool)!CYAN!                   ║   !ExtractSourceInfo!
if "!Language!"=="FR" echo !\E![7C║   !YELLOW!12!CYAN!  ^>  !WHITE!Carte du monde (cool)!CYAN!              ║   !ExtractSourceInfo!
echo !\E![7C║                                             ║                                                   ║
echo !\E![7C╚═════════════════════════════════════════════╩═══════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!OPEN!BRIGHTBLACK!" / "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
for %%A in (8,9) do if "!x!"=="1%%A" call :CHECK_INTERNET || (call :ERROR_INTERNET & goto :CONTINUESETTINGS)
for /l %%A in (1,1,12) do if "!x!"=="%%A" goto :SETTING_BACKGROUND_WALLPAPER
if "!x!"=="13" goto :SETTING_BACKGROUND_TRANSPARENCY
if "!x!"=="14" goto :SETTING_BACKGROUND_BORDER_TRANSPARENCY
if "!x!"=="15" goto :SETTING_BACKGROUND
if "!x!"=="16" goto :SETTING_UNTRUSTEDWEBSITES
if "!x!"=="17" goto :SETTING_ROSE
if "!x!"=="18" goto :SETTING_DEVELOPERMODE
if "!x!"=="19" call :SHOW_WINDOW "!IS_PROCESS!" "websites indexed" || (start "" "%~f0" SCANWEBSITES) & goto :CONTINUESETTINGS
if "!x!"=="20" goto :SETTING_VERSION
if "!x!"=="21" goto :SETTING_USERNAME
if "!x!"=="22" goto :SETTING_LANGUAGE
if "!x!"=="23" goto :SETTING_EXPORTIMPORT
if "!x!"=="24" if "!DeveloperMode!"=="1" goto :SETTING_EXTRACT_SOURCE
call :CHOOSE open && (call :OPEN_FOLDER "!IS_OUTPUTDIRECTORY!" & goto :CONTINUESETTINGS)
call :CHOOSE back && goto :MAINMENU
call :ERRORMESSAGE
goto :CONTINUESETTINGS

:SETTING_BACKGROUND_WALLPAPER
>nul reg add "!IS_REG!" /v "BackgroundWallpaper" /t REG_DWORD /d !x! /f
>nul reg add "!IS_REG!" /v "BackgroundDisabled" /t REG_DWORD /d 0 /f
call :APPLY_SETTINGS
goto :CLEARSETTINGS

:SETTING_BACKGROUND_TRANSPARENCY
echo:
if "!Language!"=="EN" echo     Choose the transparency level from 1 to 100. We recommend a value beetwen 5 and 30 for a good looking.
if "!Language!"=="FR" echo     Choisissez la transparence de 1 à 100. Nous recommandons une valeur entre 5 et 30 pour un bon rendu.
call :PROMPT
for /l %%A in (1,1,100) do if "!x!"=="%%A" (
>nul reg add "!IS_REG!" /v "BackgroundTransparency" /t REG_DWORD /d !x! /f
call :APPLY_SETTINGS
goto :CLEARSETTINGS
)
call :ERRORMESSAGE x "une valeur" value
goto :CLEARSETTINGS

:SETTING_BACKGROUND_BORDER_TRANSPARENCY
if "!BackgroundBorderTransparencyValue!"=="0" >nul reg add "!IS_REG!" /v "BackgroundBorderTransparency" /t REG_DWORD /d 1 /f
if "!BackgroundBorderTransparencyValue!"=="1" if "!BackgroundDisabled!"=="0" >nul 2>&1 reg add "!IS_REG!" /v "BackgroundBorderTransparency" /t REG_DWORD /d 0 /f
call :APPLY_SETTINGS
goto :CLEARSETTINGS

:SETTING_BACKGROUND
if "!BackgroundDisabled!"=="0" (
>nul reg add "!IS_REG!" /v "BackgroundDisabled" /t REG_DWORD /d 1 /f
>nul reg add "!IS_REG!" /v "BackgroundBorderTransparency" /t REG_DWORD /d 1 /f
)
if "!BackgroundDisabled!"=="1" >nul reg add "!IS_REG!" /v "BackgroundDisabled" /t REG_DWORD /d 0 /f
call :APPLY_SETTINGS
goto :CLEARSETTINGS

:SETTING_UNTRUSTEDWEBSITES
if "!UntrustedWebsitesWarning!"=="1" >nul reg add "!IS_REG!" /v "UntrustedWebsitesWarning" /t REG_DWORD /d 0 /f
if "!UntrustedWebsitesWarning!"=="0" >nul reg add "!IS_REG!" /v "UntrustedWebsitesWarning" /t REG_DWORD /d 1 /f
goto :CLEARSETTINGS

:SETTING_ROSE
for %%A in (extd speak-x!ARCH!) do >nul 2>&1 taskkill /f /im "%%A.exe" /t
if "!VoiceAssistant!"=="1" >nul reg add "!IS_REG!" /v "VoiceAssistant" /t REG_DWORD /d 0 /f
if "!VoiceAssistant!"=="0" >nul reg add "!IS_REG!" /v "VoiceAssistant" /t REG_DWORD /d 1 /f
goto :CLEARSETTINGS

:SETTING_DEVELOPERMODE
if "!DeveloperMode!"=="1" (
set DeveloperMode=
>nul reg add "!IS_REG!" /v "DeveloperMode" /t REG_DWORD /d 0 /f
goto :CLEARSETTINGS
)
echo !BRIGHTRED!
echo =================================================================================================================
if "!Language!"=="EN" echo !\E![15C^^!^^! You need to be part of the Illegal Services developers to enable that option ^^!^^!
if "!Language!"=="FR" echo !\E![11C^^!^^! Vous devez faire partie des développeurs d'Illegal Services pour activer cette option ^^!^^!
echo =================================================================================================================
echo !CYAN!
if "!Language!"=="EN" set t=Enter your developer license key
if "!Language!"=="FR" set t=Entrez votre clé de licence développeur
%SHOWCURSOR%
set _el=
set /p "_el=!t!: !YELLOW!"
%HIDECURSOR%
echo:
if defined _el >nul 2>&1 reg add "!IS_REG!" /v "DeveloperMode" /t REG_DWORD /d !_el! /f
call :CHECK_DEVELOPERMODE
if "!DeveloperMode!"=="1" (
if "!Language!"=="EN" set t="Developer mode has been activated successfully. You can now extract the source code."
if "!Language!"=="FR" set t="Le mode développeur a été activé avec succès. Vous pouvez maintenant extraire le code source."
call :MSGBOX 69696 "Illegal Services Checker"
goto :CLEARSETTINGS
)
if "!DeveloperMode!"=="0" call :ERRORMESSAGE _el "une clé de license" "licence key"
goto :CLEARSETTINGS

:SETTING_VERSION
call :GET_VERSION
if "!errorlevel!"=="0" (
if "!Language!"=="EN" set t="Illegal Services is up to date.!\N!!\N!Current version: !VERSION!!\N!Latest version   : !LastVersion!"
if "!Language!"=="FR" set t="Illegal Services est à jour.!\N!!\N!Version actuelle : !VERSION!!\N!Dernière version: !LastVersion!"
call :MSGBOX 69696 "Illegal Services Checker"
)
if "!errorlevel!"=="1" call :CHECKER_SETUP_FOUND
if "!errorlevel!"=="2" call :CHECKER_BUILD_FOUND
goto :CONTINUESETTINGS

:SETTING_USERNAME
echo !CYAN!
if "!Language!"=="EN" (
echo NOTE: 1. Leaving blank will replace the original username.
echo       2. Username cannot exceed 20 characters.
echo       3. Do not use the following characters: "^! %% ^^".
)
if "!Language!"=="FR" (
echo NOTE: 1. Laisser vide remplacera le nom d'utilisateur d'origine.
echo       2. Le nom d'utilisateur ne peut pas dépasser 20 caractères.
echo       3. N'utiliser les caractères suivants: "^! %% ^^".
)
:L4
if "!Language!"=="EN" set t="Enter your new username: "
if "!Language!"=="FR" set t="Entrez votre nouveau nom d'utilisateur: "
setlocal DisableDelayedExpansion
call :INPUTBOX
setlocal EnableDelayedExpansion
if defined ID (
set "ID=!ID:%%=%%%%!"
if defined %ID:~1,-1% goto :ERROR_USERNAME
if not "!ID:~20!"=="" goto :ERROR_USERNAME
>nul reg add "!IS_REG!" /v "Username" /t REG_SZ /d "!ID:~,20!" /f
) else >nul reg add "!IS_REG!" /v "Username" /t REG_SZ /d "!Username:~,20!" /f
call :CHECK_USERNAME
if "!Language!"=="EN" set t="Your new username has been changed to: '!IS_Username!'"
if "!Language!"=="FR" set t="Votre nouveau nom d'utilisateur a été remplacé par: '!IS_Username!'"
call :MSGBOX 69696 "Illegal Services Checker"
)
goto :CONTINUESETTINGS

:ERROR_USERNAME
echo:
call :ERRORMESSAGE ID "un nom d'utilisateur" username
goto :L4

:SETTING_LANGUAGE
if "!Language!"=="EN" set t=FR
if "!Language!"=="FR" set t=EN
>nul reg add "!IS_REG!" /v "Language" /t REG_SZ /d !t! /f
for %%A in (extd speak-x!ARCH!) do >nul 2>&1 taskkill /f /im "%%A.exe" /t
goto :CLEARSETTINGS

:SETTING_EXPORTIMPORT
if not exist "!IS_OUTPUTDIRECTORY!\" md "!IS_OUTPUTDIRECTORY!"
echo !CYAN!
if "!Language!"=="EN" echo Do you want to [!YELLOW!E!CYAN!]xport or [!YELLOW!I!CYAN!]mport your current settings ?
if "!Language!"=="FR" echo Voulez-vous [!YELLOW!E!CYAN!]xporter ou [!YELLOW!I!CYAN!]mporter vos paramètres actuels ?
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
for /f "delims=" %%A in ('SaveFileBox.exe IS_Settings.reg "!t1! (*.reg)|*.reg" "!IS_OUTPUTDIRECTORY!" "!t2!" /f') do set "el=%%A"
>nul 2>&1 reg export "!IS_REG!" "!el!" /y && (
if "!Language!"=="EN" set t="Settings exported successfully.!\N!You can now import them using the generated file at:!\N!!\N!'!el!'"
if "!Language!"=="FR" set t="Paramètres exportés avec succès.!\N!Vous pouvez maintenant les importer à l'aide du fichier généré à:!\N!!\N!'!el!'"
call :MSGBOX 69696 "Illegal Services Checker"
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
for /f "delims=" %%A in ('OpenFileBox.exe "!t1! (*.reg)|*.reg" "!IS_OUTPUTDIRECTORY!" "!t2!"') do set "_el=%%A"
for %%A in (!_el!) do if /i "%%~xA"==".reg" >nul 2>&1 find /i "[HKEY_CURRENT_USER\SOFTWARE\IB_U_Z_Z_A_R_Dl\Illegal Services]" "!_el!" && >nul 2>&1 reg import "!_el!" && (
for %%A in (LANGUAGE USERNAME YOUTUBEDLPRIORITY PORTPRIORITY FIRSTLAUNCH VOICEASSISTANT VOICEASSISTANTCHOICE YOUTUBEDLP YOUTUBEDLOUTPUTDIRECTORY YOUTUBEDLGEOBYPASS DEVELOPERMODE) do call :CHECK_%%A
call :APPLY_SETTINGS
if "!Language!"=="EN" set t="Settings imported successfully from:!\N!!\N!'!_el!'"
if "!Language!"=="FR" set t="Paramètres importés avec succès à partir de:!\N!!\N!'!_el!'"
call :MSGBOX 69696 "Illegal Services Checker"
)
if not "!errorlevel!"=="0" (
if "!Language!"=="EN" set t="File '!_el!' invalid.!\N!!\N!You need to import a '*.reg' file."
if "!Language!"=="FR" set t="Le fichier '!_el!' est invalide.!\N!!\N!Vous devez importer un fichier '*.reg'."
call :MSGBOX 69680 "Illegal Services Checker"
)
goto :CLEARSETTINGS

:SETTING_EXTRACT_SOURCE
if /i "!IS_PROCESS!"=="cmd.exe" (
echo:
if "!Language!"=="EN" set t=ERROR: Impossible to extract the source code if you are running the batch file
if "!Language!"=="FR" set t=ERREUR: Impossible d'extraire le code source si vous exécutez le fichier batch
echo !RED!!t! ^(!BAT_USED!^).!YELLOW!
timeout /t 5
) else if defined BAT_USED (
attrib -s -h -i "!TMP!\!BAT_USED!"
>nul copy /y "!TMPF!\!BAT_USED!" "Illegal_Services.bat"
attrib +s +h +i "!TMP!\!BAT_USED!"
2>nul powershell Get-childitem $Illegal_Services.bat ^| ForEach-Object -process {if ^(^($_.attributes -band 0x100^) -eq 0x100^) {$_.attributes = ^($_.attributes -band 0xFEFF^)}}
start /max "" "%~dp0"
)
goto :CONTINUESETTINGS

:IPTV
call :SCALE 91 32
title !TITLE:`=Internet Protocol Television (IPTV)!
call :ROSE "Internet Protocol Television"

:CLEARIPTV
set db=iptvcat.com/home_11 `pro.allkaicerteam.com/ www.iptvm3ulist.com/ip-tv-free/ www.iptvm3ufree.com/ iptvmate.net/m3u_iptv/ www.links-iptv.com/ iptvforpcwindows.com/ www.techtoreview.com/top-picks/m3u-playlist-url.html www.iptv4free.com/ m3u.pktelcos.com/ freem3uhd.blogspot.com/ dailym3uiptv.com/links-m3u/ www.iptv1.org/ telechargeriptv.com/ www.5kplayer.com/video-music-player/free-iptv-playlist-m3u-links.htm github.com/iptv-org/iptv github.com/monetareq/iptv1 github.com/cbn88/cbn88.github.io github.com/Free-IPTV/Countries github.com/coodertv/IPTVM3U8 github.com/Sumon2021/Sumon-IPTV github.com/mancinibig55/45125623 github.com/firojshahriyarmasud/IPTV github.com/duyminh215/iptv-list github.com/riqueenz/iptv github.com/imDazui/Tvlist-awesome-m3u-m3u8 github.com/tvheadend/tvheadend github.com/Cigaras/IPTV.bundle github.com/lucifersun/China-Telecom-ShangHai-IPTV-list github.com/notanewbie/LegalStream github.com/Fleker/CumulusTV github.com/lylehust/Chinese-IPTV github.com/AlexanderSofronov/iptv.example github.com/chwlibre/iptv github.com/myIPTVChannels/lists github.com/free-greek-iptv/greek-iptv github.com/iptv-ch/iptv-ch.github.io github.com/iptv-restream/iptv-channels
call :CLEAR 1

:CONTINUEIPTV
call :SCALE 108 32
echo !CYAN!
echo !\E![32C═══════════════════════════════════════════
echo !\E![31C// !RED!█!BGYELLOW!!BLACK! INTERNET PROTOCOL TELEVISION (IPTV) !RED!█!BGBLACK!!CYAN! \\
echo !\E![6C╔══════════════════════════════════════════════════════════════════════════════════════════════╗
echo !\E![6C║                                                                                              ║
echo !\E![6C║    !1!iptvcat.com!CYAN!               │   !20!coodertv/IPTVM3U8!CYAN!                              ║
echo !\E![6C║    !2!pro.allkaicerteam.com!CYAN!     │   !21!Sumon2021/Sumon-IPTV!CYAN!                           ║
echo !\E![6C║    !3!www.iptvm3ulist.com!CYAN!       │   !22!mancinibig55/45125623!CYAN!                          ║
echo !\E![6C║    !4!www.iptvm3ufree.com!CYAN!       │   !23!firojshahriyarmasud/IPTV!CYAN!                       ║
echo !\E![6C║    !5!iptvmate.net!CYAN!              │   !24!duyminh215/iptv-list!CYAN!                           ║
echo !\E![6C║    !6!www.links-iptv.com!CYAN!        │   !25!riqueenz/iptv!CYAN!                                  ║
echo !\E![6C║    !7!iptvforpcwindows.com!CYAN!      │   !26!imDazui/Tvlist-awesome-m3u-m3u8!CYAN!                ║
echo !\E![6C║    !8!www.techtoreview.com!CYAN!      │   !27!tvheadend/tvheadend!CYAN!                            ║
echo !\E![6C║    !9!www.iptv4free.com!CYAN!         │   !28!Cigaras/IPTV.bundle!CYAN!                            ║
echo !\E![6C║   !10!m3u.pktelcos.com!CYAN!          │   !29!lucifersun/China-Telecom-ShangHai-IPTV-list!CYAN!    ║
echo !\E![6C║   !11!freem3uhd.blogspot.com!CYAN!    │   !30!notanewbie/LegalStream!CYAN!                         ║
echo !\E![6C║   !12!dailym3uiptv.com!CYAN!          │   !31!Fleker/CumulusTV!CYAN!                               ║
echo !\E![6C║   !13!www.iptv1.org!CYAN!             │   !32!lylehust/Chinese-IPTV!CYAN!                          ║
echo !\E![6C║   !14!telechargeriptv.com!CYAN!       │   !33!AlexanderSofronov/iptv.example!CYAN!                 ║
echo !\E![6C║   !15!www.5kplayer.com!CYAN!          │   !34!chwlibre/iptv!CYAN!                                  ║
echo !\E![6C║   !16!iptv-org/iptv!CYAN!             │   !35!myIPTVChannels/lists!CYAN!                           ║
echo !\E![6C║   !17!monetareq/iptv1!CYAN!           │   !36!free-greek-iptv/greek-iptv!CYAN!                     ║
echo !\E![6C║   !18!cbn88/cbn88.github.io!CYAN!     │   !37!iptv-ch/iptv-ch.github.io!CYAN!                      ║
echo !\E![6C║   !19!Free-IPTV/Countries!CYAN!       │   !38!iptv-restream/iptv-channels!CYAN!                    ║
echo !\E![6C║                                                                                              ║
echo !\E![6C╚══════════════════════════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!INSTALL!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" / "!YELLOW!HELP!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo !RED!
>nul 2>&1 reg query "HKCR\.m3u8" || (
if "!Language!"=="EN" echo !\E![17CERROR: To be able to use !YELLOW!IPTV!RED!, first you need to choose: !YELLOW![INSTALL]
if "!Language!"=="FR" echo !\E![13CERREUR: Pour pouvoir utiliser !YELLOW!IPTV!RED!, vous devez d'abord choisir: !YELLOW![INSTALL]
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
title !TITLE:`=Internet Protocol Television Tutorial!
call :ROSE "Internet Protocol Television Tutorial"

:CONTINUEIPTVTUTORIAL
call :SCALE 151 37
echo !CYAN!
echo !\E![24C═════════════════════
if "!Language!"=="EN" set t=TUTORIAL
if "!Language!"=="FR" set t=TUTORIEL
echo !\E![23C// !RED!█!BGYELLOW!!BLACK! IPTV !t! !RED!█!BGBLACK!!CYAN! \\
echo !\E![4C╔═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
echo !\E![4C║                                                                                                                                             ║
if "!Language!"=="EN" echo !\E![4C║        ■█!BGYELLOW!!RED!█ ♦ What's IPTV (Wikipedia) ? █!BGBLACK!!CYAN!█■                                                                                                  ║
if "!Language!"=="FR" echo !\E![4C║        ■█!BGYELLOW!!RED!█ ♦ Qu'est-ce que l'IPTV (Wikipedia) ? █!BGBLACK!!CYAN!█■                                                                                         ║
echo !\E![4C║                                                                                                                                             ║
if "!Language!"=="EN" echo !\E![4C║    Internet Protocol television (IPTV) is the delivery of television content over Internet Protocol (IP) networks.                          ║
if "!Language!"=="FR" echo !\E![4C║    La télévision sur protocole Internet (IPTV) est la diffusion de contenu télévisuel sur des réseaux IP (Internet Protocol).               ║
if "!Language!"=="EN" echo !\E![4C║    This is in contrast to delivery through traditional terrestrial, satellite, and cable television formats.                                ║
if "!Language!"=="FR" echo !\E![4C║    Cela contraste avec la diffusion via les formats traditionnels de télévision terrestre, par satellite et par câble.                      ║
if "!Language!"=="EN" echo !\E![4C║    Unlike downloaded media, IPTV offers the ability to stream the source media continuously.                                                ║
if "!Language!"=="FR" echo !\E![4C║    Contrairement aux médias téléchargés, IPTV offre la possibilité de diffuser en continu le média source.                                  ║
if "!Language!"=="EN" echo !\E![4C║    As a result, a client media player can begin playing the content (such as a TV channel) almost immediately.                              ║
if "!Language!"=="FR" echo !\E![4C║    En conséquence, un lecteur multimédia client peut commencer à lire le contenu (comme une chaîne de télévision) presque immédiatement.    ║
if "!Language!"=="EN" echo !\E![4C║    This is known as streaming media.                                                                                                        ║
if "!Language!"=="FR" echo !\E![4C║    C'est ce qu'on appelle le streaming multimédia.                                                                                          ║
echo !\E![4C║                                                                                                                                             ║
if "!Language!"=="EN" echo !\E![4C║    VLC is an open-source media player to stream and play any kind of media on all the available devices.                                    ║
if "!Language!"=="FR" echo !\E![4C║    VLC est un lecteur multimédia open source pour diffuser et lire tout type de média sur tous les appareils disponibles.                   ║
echo !\E![4C║                                                                                                                                             ║
if "!Language!"=="EN" echo !\E![4C║    To access IPTV on VLC, make sure to have the following things listed below:                                                              ║
if "!Language!"=="FR" echo !\E![4C║    Pour accéder à l'IPTV sur VLC, assurez-vous que les éléments suivants sont répertoriés ci-dessous:                                       ║
if "!Language!"=="EN" echo !\E![4C║    - Internet connection                                                                                                                    ║
if "!Language!"=="FR" echo !\E![4C║    - Connexion Internet                                                                                                                     ║
echo !\E![4C║    - VLC Media Player                                                                                                                       ║
if "!Language!"=="EN" echo !\E![4C║    - M3U or M3U8 URL (That you have downloaded in one of the previous Illegal Services IPTV links.)                                         ║
if "!Language!"=="FR" echo !\E![4C║    - URL M3U ou M3U8 (que vous avez téléchargée dans l'un des liens IPTV de services illégaux précédents.)                                  ║
echo !\E![4C║                                                                                                                                             ║
echo !\E![4C║                                                                                                                                             ║
if "!Language!"=="FR" echo !\E![4C║        ■█!BGYELLOW!!RED!█ ♦ Comment utiliser l'IPTV sur PC en utilisant VLC ? █!BGBLACK!!CYAN!█■                                                                          ║
if "!Language!"=="EN" echo !\E![4C║        ■█!BGYELLOW!!RED!█ ♦ How to watch IPTV on PC using VLC ? █!BGBLACK!!CYAN!█■                                                                                        ║
echo !\E![4C║                                                                                                                                             ║
if "!Language!"=="EN" echo !\E![4C║    [!YELLOW!1!CYAN!]  ^> !WHITE! Download and install VLC Media Player.!CYAN!                                                                                           ║
if "!Language!"=="FR" echo !\E![4C║    [!YELLOW!1!CYAN!]  ^> !WHITE! Téléchargez et installer VLC Media Player.!CYAN!                                                                                       ║
if "!Language!"=="EN" echo !\E![4C║    Launch VLC Media Player and choose "Media" from the menu bar.                                                                            ║
if "!Language!"=="FR" echo !\E![4C║    Lancez VLC Media Player et choisissez "Media" dans la barre de menu.                                                                     ║
if "!Language!"=="EN" echo !\E![4C║    Select "Open Network Stream" or press "Ctrl + N" on the keyboard to open directly.                                                       ║
if "!Language!"=="FR" echo !\E![4C║    Sélectionnez "Open Network Stream" ou appuyez sur "Ctrl + N" sur le clavier pour ouvrir directement.                                     ║
if "!Language!"=="EN" echo !\E![4C║    Under the "Network tab", enter the M3U or M3U8 URL.                                                                                      ║
if "!Language!"=="FR" echo !\E![4C║    Sous l'onglet "Réseau", entrez l'URL M3U ou M3U8.                                                                                        ║

if "!Language!"=="EN" echo !\E![4C║    Click on "Play" to start to stream all the available content.                                                                            ║
if "!Language!"=="FR" echo !\E![4C║    Cliquez sur "Play" pour commencer à diffuser tout le contenu disponible.                                                                 ║
if "!Language!"=="EN" echo !\E![4C║    To navigate among channels, press "Ctrl + L" to view all the available content.                                                          ║
if "!Language!"=="FR" echo !\E![4C║    Pour naviguer parmi les chaînes, appuyez sur "Ctrl + L" pour afficher tout le contenu disponible.                                        ║
echo !\E![4C║                                                                                                                                             ║
echo !\E![4C╚═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
if "!x!"=="1" call :INSTALL_FILE VLC & goto :CONTINUEIPTVTUTORIAL
call :CHOOSE back && goto :IPTV
call :ERRORMESSAGE
goto :CONTINUEIPTVTUTORIAL

:DDL
call :ROSE "Direct Download Link"
for %%A in (EN FR) do if "!Language!"=="%%A" goto :DDL%%A

:DDLEN
call :SCALE 128 37
title !TITLE:`=Direct Download Link (DDL) [EN]!

:CLEARDDLEN
set db=avxhm.is/ www.heroturko.net/ rmz.cr/ softarchive.is/ www.downduck.com/ scnlog.me/ www.creaxy.com/ downturk.net/ downarchive.org/ 0dayhome.net/ scene-rls.net/ www.freshwap.us/ www.apps4all.com/ dl4all.biz/ worldsrc.net/ movieparadise.org/ release.movieparadise.org/ hdencode.org/ `rlsbb.ru/ apps-pack.com/ oneddl.org/ `www.rlslog.net/ freshwap.cc/ dl4all.org/ warezomen.com/ www.scnsrc.me/ win7dl.org/ www.ddlvalley.me/ downtr.cc/ releasehive.com/ rlstop.net/ uhdmv.org/ tfpdl.to/ softddl.org/ 2ddl.it/ katzddl.net/ warezbb.net/ www.300mbfilms.cx/ downloadhub.cfd/ filmsofts.com/ cgpersia.com/ rsload.net/ megaddl.co/ heroturko2.net/ crazy4tv.com/ psarips.top/ themoviesflix.com.co/ themovieflix.co.in/ hevcbay.com/ rarefilmm.com/ 1worldfree4u.trade/ the-eye.eu/ jpddl.com/ animeshare.cf/ anidl.org/ hi10anime.com/ animekayo.com/ animekaizoku.com/ www.ssanime.ga/ animetosho.org/ cdromance.com/ www.romnation.net/ vimm.net/ nxmac.com/ macdrop.net/ sheet-music.xyz/ audioz.download/ `audiobookbay.nl/ www.gfxtra31.com/ gfx-hub.cc/
call :CLEAR 1

:CONTINUEDDLEN
call :SCALE 128 37
echo !CYAN!
echo !\E![44C═══════════════════════════════════════
echo !\E![43C// !RED!█!BGYELLOW!!BLACK! DIRECT DOWNLOAD LINK (DDL) [EN] !RED!█!BGBLACK!!CYAN! \\
echo !\E![6C╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
echo !\E![6C║                                                                                                                  ║
echo !\E![6C║    !1!avxhm.is!CYAN!                     │  !25!warezomen.com!CYAN!         │   !49!hevcbay.com!CYAN!                     ║
echo !\E![6C║    !2!www.heroturko.net!CYAN!            │  !26!www.scnsrc.me!CYAN!         │   !50!rarefilmm.com!CYAN!                   ║
echo !\E![6C║    !3!rmz.cr!CYAN!                       │  !27!win7dl.org!CYAN!            │   !51!1worldfree4u.trade!CYAN!              ║
echo !\E![6C║    !4!softarchive.is!CYAN!               │  !28!www.ddlvalley.me!CYAN!      │   !52!the-eye.eu!CYAN!                      ║
echo !\E![6C║    !5!www.downduck.com!CYAN!             │  !29!downtr.cc!CYAN!             │   !53!jpddl.com !GREEN!(animes)!CYAN!              ║
echo !\E![6C║    !6!scnlog.me!CYAN!                    │  !30!releasehive.com!CYAN!       │   !54!animeshare.cf !GREEN!(animes)!CYAN!          ║
echo !\E![6C║    !7!www.creaxy.com!CYAN!               │  !31!rlstop.net!CYAN!            │   !55!anidl.org !GREEN!(animes)!CYAN!              ║
echo !\E![6C║    !8!downturk.net!CYAN!                 │  !32!uhdmv.org!CYAN!             │   !56!hi10anime.com !GREEN!(animes)!CYAN!          ║
echo !\E![6C║    !9!downarchive.org!CYAN!              │  !33!tfpdl.to!CYAN!              │   !57!animekayo.com !GREEN!(animes)!CYAN!          ║
echo !\E![6C║   !10!0dayhome.net!CYAN!                 │  !34!softddl.org!CYAN!           │   !58!animekaizoku.com !GREEN!(animes)!CYAN!       ║
echo !\E![6C║   !11!scene-rls.net!CYAN!                │  !35!2ddl.it!CYAN!               │   !59!www.ssanime.ga !GREEN!(animes)!CYAN!         ║
echo !\E![6C║   !12!www.freshwap.us!CYAN!              │  !36!katzddl.net!CYAN!           │   !60!animetosho.org !GREEN!(animes)!CYAN!         ║
echo !\E![6C║   !13!www.apps4all.com!CYAN!             │  !37!warezbb.net!CYAN!           │   !61!cdromance.com !GREEN!(roms)!CYAN!            ║
echo !\E![6C║   !14!dl4all.biz!CYAN!                   │  !38!www.300mbfilms.cx!CYAN!     │   !62!www.romnation.net !GREEN!(roms)!CYAN!        ║
echo !\E![6C║   !15!worldsrc.net!CYAN!                 │  !39!downloadhub.cfd!CYAN!       │   !63!vimm.net !GREEN!(roms)!CYAN!                 ║
echo !\E![6C║   !16!movieparadise.org!CYAN!            │  !40!filmsofts.com!CYAN!         │   !64!nxmac.com !GREEN!(MAC)!CYAN!                 ║
echo !\E![6C║   !17!release.movieparadise.org!CYAN!    │  !41!cgpersia.com!CYAN!          │   !65!macdrop.net !GREEN!(MAC)!CYAN!               ║
echo !\E![6C║   !18!hdencode.org!CYAN!                 │  !42!rsload.net!CYAN!            │   !66!sheet-music.xyz !GREEN!(audio)!CYAN!         ║
echo !\E![6C║   !19!rlsbb.ru!CYAN!                     │  !43!megaddl.co!CYAN!            │   !67!audioz.download !GREEN!(audio)!CYAN!         ║
echo !\E![6C║   !20!oneddl.org!CYAN!                   │  !44!heroturko2.net!CYAN!        │   !68!audiobookbay.nl !GREEN!(audiobooks)!CYAN!    ║
echo !\E![6C║   !21!apps-pack.com!CYAN!                │  !45!crazy4tv.com!CYAN!          │   !69!www.gfxtra31.com !GREEN!(GFX)!CYAN!          ║
echo !\E![6C║   !22!www.rlslog.net!CYAN!               │  !46!psarips.top!CYAN!           │   !70!gfx-hub.cc !GREEN!(GFX)!CYAN!                ║
echo !\E![6C║   !23!freshwap.cc!CYAN!                  │  !47!themoviesflix.com.co!CYAN!  │                                          ║
echo !\E![6C║   !24!dl4all.org!CYAN!                   │  !48!themovieflix.co.in!CYAN!    │                                          ║
echo !\E![6C║                                                                                                                  ║
echo !\E![6C╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" / "!YELLOW!FR!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
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
title !TITLE:`=Direct Download Link (DDL) [FR]!

:CLEARDDLFR
set db=www.tirexo.work/ free-telecharger.net/ libertyvf.bz/ www.extreme-down.plus/home.html zone-telechargement.cam/ www.wawacity.work/ ww2.jeddl.com/ www.zone-mania.com/ www.zone-down.com/ nandesuka.moe/ 9docu.org/
call :CLEAR 1

:CONTINUEDDLFR
call :SCALE 71 24
echo !CYAN!
echo !\E![16C═══════════════════════════════════════
echo !\E![15C// !RED!█!BGYELLOW!!BLACK! DIRECT DOWNLOAD LINK (DDL) [FR] !RED!█!BGBLACK!!CYAN! \\
echo !\E![9C╔══════════════════════════════════════════════════╗
echo !\E![9C║                                                  ║
echo !\E![9C║    !1!www.tirexo.work!CYAN!                         ║
echo !\E![9C║    !2!free-telecharger.net!CYAN!                    ║
echo !\E![9C║    !3!libertyvf.bz!CYAN!                            ║
echo !\E![9C║    !4!www.extreme-down.plus!CYAN!                   ║
echo !\E![9C║    !5!zone-telechargement.cam!CYAN!                 ║
echo !\E![9C║    !6!www.wawacity.work!CYAN!                       ║
echo !\E![9C║    !7!ww2.jeddl.com!CYAN!                           ║
echo !\E![9C║    !8!www.zone-mania.com!CYAN!                      ║
echo !\E![9C║    !9!www.zone-down.com!CYAN!                       ║
echo !\E![9C║   !10!nandesuka.moe !GREEN!(animes)!CYAN!                  ║
echo !\E![9C║   !11!9docu.org !GREEN!(documentaries)!CYAN!               ║
echo !\E![9C║                                                  ║
echo !\E![9C╚══════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" / "!YELLOW!EN!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
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
title !TITLE:`=Streaming [%Language%]!
if "!UntrustedWebsitesWarning!"=="1" (
if "!Language!"=="EN" (
call :SCALE 101 52
set t="No payment / installation / registration is required to view the videos on the sites offered by Illegal Services. All sites are free so watch out for scam advertising.!\N!!\N!If the player is not visible, disable your ad blocker and click on the button to close the ad in the middle of the video then on the player's Play button to launch the video."
)
if "!Language!"=="FR" (
call :SCALE 101 45
set t="Aucun payment / installation / inscription n'est requis pour voir les videos sur les sites proposes par Illegal Services. Tous les sites sont gratuits donc faites attention aux publicites d'arnaques.!\N!!\N!Si le lecteur n'est pas visible, desactiver votre bloqueur de publicites et clique sur le bouton pour fermer la pub au milieu de la video puis sur le bouton Play du lecteur pour lancer la video."
)
call :MSGBOX 69680 "Illegal Services Checker"
)
call :ROSE Streaming
for %%A in (EN FR) do if "!Language!"=="%%A" goto :STREAMING%%A

:STREAMINGEN
call :SCALE 101 52
title !TITLE:`=Streaming [EN]!

:CLEARSTREAMINGEN
set db=www.primewire.li/ losmovies.top/ m4ufree.to/ gomovie.co/ gomovies-online.cam/ www1.123movies.co/ myflixertv.to/ www4.yesmovies.so/ 5movies.pw/ www11.123movieshub.one/ hollymoviehd.cc/home/ watch-serieshd.cc/ watchseriess.net/ flixtor.to/ fmovies.to/ lookmovie.io/ www2.solarmovie.to/ ww.123movies.sc/ frenzymovies.net/ supernova.to/ vumoo.to/ hulu.sc/ watchtvepisodes.me/ ww2.123movieshub.tc/ 0gomovies.so/ soap2day.to/ www1.movie4u.live/ cinehub.wtf/browse openloadfreetv.me/ allmoviesforyou.net/ kisscartoon.info/ 9anime.to/ animesuge.io/ animeheaven.pro/ animeowl.net/ animeow.me/ arrayanime.com/ gogoanime.vc/ animefrenzy.org/ anime8.ru/ animevibe.se/ animixplay.to/ www2.kickassanime.ro/ www.animerush.tv/ animepahe.com/ ww1.animesimple.com/ zoro.to/ animedao.to/ kissanimefree.to/ www1.7anime.io/ twist.moe/ allanime.site/anime runnel.ir/ time4tv.stream/ `live94today.com/ `livetv.sx/ apps.stream2watch.sx/ sportplus.live/ thehomesport.com/
call :CLEAR 1 1

:CONTINUESTREAMINGEN
call :SCALE 101 52
echo !CYAN!
echo !\E![40C══════════════════════
echo !\E![39C// !RED!█!BGYELLOW!!BLACK! STREAMING [EN] !RED!█!BGBLACK!!CYAN! \\
echo !\E![8C╔═══════════════════════════════════════════════════════════════════════════════════╗
echo !\E![8C╠═══════════════════════════════════■█!BGYELLOW!!RED!█ FILMS █!BGBLACK!!CYAN!█■═══════════════════════════════════╣
echo !\E![8C║                                                                                   ║
echo !\E![8C║    !1!www.primewire.li!CYAN!               │   !16!lookmovie.io!CYAN!                   ║
echo !\E![8C║    !2!losmovies.top!CYAN!                  │   !17!www2.solarmovie.to!CYAN!             ║
echo !\E![8C║    !3!m4ufree.to!CYAN!                     │   !18!ww.123movies.sc!CYAN!                ║
echo !\E![8C║    !4!gomovie.co!CYAN!                     │   !19!frenzymovies.net!CYAN!               ║
echo !\E![8C║    !5!gomovies-online.cam!CYAN!            │   !20!supernova.to!CYAN!                   ║
echo !\E![8C║    !6!www1.123movies.co!CYAN!              │   !21!vumoo.to!CYAN!                       ║
echo !\E![8C║    !7!myflixertv.to!CYAN!                  │   !22!hulu.sc!CYAN!                        ║
echo !\E![8C║    !8!www4.yesmovies.so!CYAN!              │   !23!watchtvepisodes.me!CYAN!             ║
echo !\E![8C║    !9!5movies.pw!CYAN!                     │   !24!ww2.123movieshub.tc!CYAN!            ║
echo !\E![8C║   !10!www11.123movieshub.one!CYAN!         │   !25!0gomovies.so!CYAN!                   ║
echo !\E![8C║   !11!hollymoviehd.cc!CYAN!                │   !26!soap2day.to!CYAN!                    ║
echo !\E![8C║   !12!watch-serieshd.cc!CYAN!              │   !27!www1.movie4u.live!CYAN!              ║
echo !\E![8C║   !13!watchseriess.net!CYAN!               │   !28!cinehub.wtf!CYAN!                    ║
echo !\E![8C║   !14!flixtor.to!CYAN!                     │   !29!openloadfreetv.me!CYAN!              ║
echo !\E![8C║   !15!fmovies.to!CYAN!                     │   !30!allmoviesforyou.net!CYAN!            ║
echo !\E![8C║                                                                                   ║
echo !\E![8C╠═══════════════════════════════════■█!BGYELLOW!!RED!█ ANIMES █!BGBLACK!!CYAN!█■══════════════════════════════════╣
echo !\E![8C║                                                                                   ║
echo !\E![8C║   !31!kisscartoon.info!CYAN!               │   !42!animixplay.to!CYAN!                  ║
echo !\E![8C║   !32!9anime.to!CYAN!                      │   !43!www2.kickassanime.ro!CYAN!           ║
echo !\E![8C║   !33!animesuge.io!CYAN!                   │   !44!www.animerush.tv!CYAN!               ║
echo !\E![8C║   !34!animeheaven.pro!CYAN!                │   !45!animepahe.com!CYAN!                  ║
echo !\E![8C║   !35!animeowl.net!CYAN!                   │   !46!ww1.animesimple.com!CYAN!            ║
echo !\E![8C║   !36!animeow.me!CYAN!                     │   !47!zoro.to!CYAN!                        ║
echo !\E![8C║   !37!arrayanime.com!CYAN!                 │   !48!animedao.to!CYAN!                    ║
echo !\E![8C║   !38!gogoanime.vc!CYAN!                   │   !49!kissanimefree.to!CYAN!               ║
echo !\E![8C║   !39!animefrenzy.org!CYAN!                │   !50!www1.7anime.io!CYAN!                 ║
echo !\E![8C║   !40!anime8.ru!CYAN!                      │   !51!twist.moe!CYAN!                      ║
echo !\E![8C║   !41!animevibe.se!CYAN!                   │   !52!allanime.site!CYAN!                  ║
echo !\E![8C║                                                                                   ║
echo !\E![8C╠═════════════════════════════════■█!BGYELLOW!!RED!█ TELEVISION █!BGBLACK!!CYAN!█■════════════════════════════════╣
echo !\E![8C║                                                                                   ║
echo !\E![8C║   !53!runnel.ir!CYAN!                      │   !57!apps.stream2watch.sx !GREEN!(sport)!CYAN!   ║
echo !\E![8C║   !54!time4tv.stream!CYAN!                 │   !58!sportplus.live !GREEN!(sport)!CYAN!         ║
echo !\E![8C║   !55!live94today.com!CYAN!                │   !59!thehomesport.com !GREEN!(sport)!CYAN!       ║
echo !\E![8C║   !56!livetv.sx !GREEN!(sport)!CYAN!              │                                         ║
echo !\E![8C║                                                                                   ║
echo !\E![8C╠═══════════════════════════════════════════════════════════════════════════════════╣
call :DRAW_CENTER "!YELLOW!!c3!!CYAN!  >  !WHITE!Streaming Applications!CYAN!"
echo !\E![8C╚═══════════════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" / "!YELLOW!FR!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUESTREAMINGEN
if "!x!"=="!c3!" (set la=EN) & goto :CLEARSTREAMINGAPPS
call :CHOOSE fr && goto :STREAMINGFR
call :CHOOSE search && (call :IS_SEARCH ef3978005ffa01b49 & goto :CONTINUESTREAMINGEN)
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARSTREAMINGEN
call :ERRORMESSAGE
goto :CONTINUESTREAMINGEN

:STREAMINGFR
call :SCALE 101 45
title !TITLE:`=Streaming [FR]!

:CLEARSTREAMINGFR
set db=www.filmstoon.one/streaming10/ www6.filmstreaming.to/ french-stream.re/ wvw.hds.lc/ papystreaming-vf.com/accueil/ fcine.me/ wwv.films-streams.com/ libertyvf.bz/ streaming-films.net/ vfstreamiz.com/ wwv.streamfilm.cc/ vvw.streampourvous.ws/ streaminz.me/ filmstreamingvf.org/ www.illimitestreaming.co/ www.cinezzz.org/ voirseries.tv/ streamcomplet.buzz/ comustream.fr/ voststream.com/ voiranime.com/ neko-sama.fr/ french-manga.net/ www.adkami.com/ www.ianimes.org/ streaming-integrale.com/ gum-gum-streaming.com/ otakufr.co/ www.mavanimes.co/ vostanimez.com/ toonanime.cc/ wvw.jetanimes.com/ vostfree.tv/ www.universanime.co/ daijoubu.si/ animepourvous.com/ animevostfr.tv/ animecomplet.me/ `www.anime-ultime.net/ v5.anime-ultime.net/ channelstream.watch/ www.myfree-tivi.com/ `livetv.sx/frx/ fr4.sportplus.live/ `streaming-sport.tv/
call :CLEAR 1 1

:CONTINUESTREAMINGFR
call :SCALE 101 45
echo !CYAN!
echo !\E![40C══════════════════════
echo !\E![39C// !RED!█!BGYELLOW!!BLACK! STREAMING [FR] !RED!█!BGBLACK!!CYAN! \\
echo !\E![8C╔═══════════════════════════════════════════════════════════════════════════════════╗
echo !\E![8C╠═══════════════════════════════════■█!BGYELLOW!!RED!█ FILMS █!BGBLACK!!CYAN!█■═══════════════════════════════════╣
echo !\E![8C║                                                                                   ║
echo !\E![8C║    !1!www.filmstoon.one!CYAN!              │   !11!wwv.streamfilm.cc!CYAN!              ║
echo !\E![8C║    !2!www6.filmstreaming.to!CYAN!          │   !12!vvw.streampourvous.ws!CYAN!          ║
echo !\E![8C║    !3!french-stream.re!CYAN!               │   !13!streaminz.me!CYAN!                   ║
echo !\E![8C║    !4!wvw.hds.lc!CYAN!                     │   !14!filmstreamingvf.org!CYAN!            ║
echo !\E![8C║    !5!papystreaming-vf.com!CYAN!           │   !15!www.illimitestreaming.co!CYAN!       ║
echo !\E![8C║    !6!fcine.me!CYAN!                       │   !16!www.cinezzz.org!CYAN!                ║
echo !\E![8C║    !7!wwv.films-streams.com!CYAN!          │   !17!voirseries.tv !GREEN!(series)!CYAN!         ║
echo !\E![8C║    !8!libertyvf.bz!CYAN!                   │   !18!streamcomplet.buzz!CYAN!             ║
echo !\E![8C║    !9!streaming-films.net!CYAN!            │   !19!comustream.fr!CYAN!                  ║
echo !\E![8C║   !10!vfstreamiz.com!CYAN!                 │   !20!voststream.com!CYAN!                 ║
echo !\E![8C║                                                                                   ║
echo !\E![8C╠═══════════════════════════════════■█!BGYELLOW!!RED!█ ANIMES █!BGBLACK!!CYAN!█■══════════════════════════════════╣
echo !\E![8C║                                                                                   ║
echo !\E![8C║   !21!voiranime.com!CYAN!                  │   !31!toonanime.cc!CYAN!                   ║
echo !\E![8C║   !22!neko-sama.fr!CYAN!                   │   !32!wvw.jetanimes.com!CYAN!              ║
echo !\E![8C║   !23!french-manga.net!CYAN!               │   !33!vostfree.tv!CYAN!                    ║
echo !\E![8C║   !24!www.adkami.com!CYAN!                 │   !34!www.universanime.co!CYAN!            ║
echo !\E![8C║   !25!www.ianimes.org!CYAN!                │   !35!daijoubu.si!CYAN!                    ║
echo !\E![8C║   !26!streaming-integrale.com!CYAN!        │   !36!animepourvous.com!CYAN!              ║
echo !\E![8C║   !27!gum-gum-streaming.com!CYAN!          │   !37!animevostfr.tv!CYAN!                 ║
echo !\E![8C║   !28!otakufr.co!CYAN!                     │   !38!animecomplet.me!CYAN!                ║
echo !\E![8C║   !29!www.mavanimes.co!CYAN!               │   !39!www.anime-ultime.net!CYAN!           ║
echo !\E![8C║   !30!vostanimez.com!CYAN!                 │   !40!v5.anime-ultime.net!CYAN!            ║
echo !\E![8C║                                                                                   ║
echo !\E![8C╠═════════════════════════════════■█!BGYELLOW!!RED!█ TELEVISION █!BGBLACK!!CYAN!█■════════════════════════════════╣
echo !\E![8C║                                                                                   ║
echo !\E![8C║   !41!channelstream.watch!CYAN!            │   !44!fr4.sportplus.live !GREEN!(sport)!CYAN!     ║
echo !\E![8C║   !42!www.myfree-tivi.com!CYAN!            │   !45!streaming-sport.tv !GREEN!(sport)!CYAN!     ║
echo !\E![8C║   !43!livetv.sx !GREEN!(sport)!CYAN!              │                                         ║
echo !\E![8C║                                                                                   ║
echo !\E![8C╠═══════════════════════════════════════════════════════════════════════════════════╣
call :DRAW_CENTER "!YELLOW!!c3!!CYAN!  >  !WHITE!Streaming Applications!CYAN!"
echo !\E![8C╚═══════════════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" / "!YELLOW!EN!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUESTREAMINGFR
if "!x!"=="!c3!" (set la=FR) & goto :CLEARSTREAMINGAPPS
call :CHOOSE en && goto :STREAMINGEN
call :CHOOSE search && (call :IS_SEARCH e49c0bfe5fd6d7fb6 & goto :CONTINUESTREAMINGFR)
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARSTREAMINGFR
call :ERRORMESSAGE
goto :CONTINUESTREAMINGFR

:STREAMINGAPPS
call :SCALE 109 32
title !TITLE:`=Streaming Applications!
call :ROSE "Streaming Applications"

:CLEARSTREAMINGAPPS
set db=popcorn-time.tw/ www.stremio.com/ teatv.net/ www.morpheustvbox.com/ mediaboxhd.net/ www.vivatv.io/ beetvapk.me/ filmplus.app/ www.novatvapk.com/ animixplay.to/android/app tvmob.net/ www.livenettv.bz/
call :CLEAR 1

:CONTINUESTREAMINGAPPS
call :SCALE 109 32
echo !CYAN!
echo !\E![40C══════════════════════════════
echo !\E![39C// !RED!█!BGYELLOW!!BLACK! STREAMING APPLICATIONS !RED!█!BGBLACK!!CYAN! \\
echo !\E![6C╔═══════════════════════════════════════════════════════════════════════════════════════════════╗
echo !\E![6C╠════════■█!BGYELLOW!!RED!█ Windows █!BGBLACK!!CYAN!█■════════╦═════════■█!BGYELLOW!!RED!█ macOS █!BGBLACK!!CYAN!█■═════════╦═════════■█!BGYELLOW!!RED!█ Linux █!BGBLACK!!CYAN!█■═════════╣
echo !\E![6C║                               ║                               ║                               ║
echo !\E![6C║    !1!popcorn-time.tw!CYAN!      ║    !1!popcorn-time.tw!CYAN!      ║    !1!popcorn-time.tw!CYAN!      ║
echo !\E![6C║    !2!www.stremio.com!CYAN!      ║    !2!www.stremio.com!CYAN!      ║    !2!www.stremio.com!CYAN!      ║
echo !\E![6C║                               ║                               ║                               ║
echo !\E![6C╠═══════════════════════════════╩═══════════════════════════════╩═══════════════════════════════╣
echo !\E![6C╠════════════════■█!BGYELLOW!!RED!█ Android █!BGBLACK!!CYAN!█■════════════════╦══════════════════■█!BGYELLOW!!RED!█ iOS █!BGBLACK!!CYAN!█■══════════════════╣
echo !\E![6C║                                               ║                                               ║
echo !\E![6C║        !1!popcorn-time.tw!CYAN!                  ║          !1!popcorn-time.tw!CYAN!                ║
echo !\E![6C║        !2!www.stremio.com!CYAN!                  ║          !2!www.stremio.com!CYAN!                ║
echo !\E![6C║        !3!teatv.net!CYAN!                        ║          !5!mediaboxhd.net!CYAN!                 ║
echo !\E![6C║        !4!www.morpheustvbox.com!CYAN!            ║                                               ║
echo !\E![6C║        !5!mediaboxhd.net!CYAN!                   ║                                               ║
echo !\E![6C║        !6!www.vivatv.io!CYAN!                    ║                                               ║
echo !\E![6C║        !7!beetvapk.me!CYAN!                      ║                                               ║
echo !\E![6C║        !8!filmplus.app!CYAN!                     ║                                               ║
echo !\E![6C║        !9!www.novatvapk.com!CYAN!                ║                                               ║
echo !\E![6C║       !10!animixplay.to !GREEN!(animes)!CYAN!           ║                                               ║
echo !\E![6C║       !11!tvmob.net !GREEN!(television)!CYAN!           ║                                               ║
echo !\E![6C║       !12!www.livenettv.bz !GREEN!(television)!CYAN!    ║                                               ║
echo !\E![6C║                                               ║                                               ║
echo !\E![6C╚═══════════════════════════════════════════════╩═══════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUESTREAMINGAPPS
call :CHOOSE back && goto :CLEARSTREAMING!la!
call :WEBSITESTART && goto :CLEARSTREAMINGAPPS
call :ERRORMESSAGE
goto :CONTINUESTREAMINGAPPS

:TORRENTING
call :SCALE 133 56
title !TITLE:`=Torrenting!
call :ROSE Torrenting

:CLEARTORRENTING
set db=solidtorrents.net/ www.limetorrents.pro/ www.torrentfunk.com/ www.toros.co/ www.gtdb.to/ www.torrentdownloads.pro/ 1337x.to/ rarbg.to/index80.php www.ettvcentral.com/ torrentz2k.xyz/ thepiratebay.org/index.html prostylex.org/ torrentgalaxy.to/ yourbittorrent.com/ anidex.info/ www.demonoid.is/ angietorrents.cc/ www.torrentdownload.info/ badasstorrents.com/ concen.org/torrents nyaa.si/ www.anirena.com/ subsplease.org/ mac-torrent-download.net/ mac-torrents.io/ yts.mx/ eztv.re/ www3.yggtorrent.nz/ www.sharewood.tv/ www.oxtorrent.sh/homec.html torrent9.to/ filelisting.com/ bt4g.org/ xbit.pw/ bitsearch.to/ www.7torrents.cc/ bitcq.com/ knaben.eu/ torrentproject2.com/ torrent-paradise.ml/ btdig.com/ ext.to/ www.torlock.com/ ibit.to/ zooqle.com/ snowfl.com/ idope.se/ isohunt.app/ extratorrents.it/ pirateiro.com/ torrentseeker.com/ otorrents.com/ vstorrent.org/ torrents-csv.ml/ torrentz2eu.me/ w41.torlook.info/ www.magnetdl.com/ search.torrends.to/ proxy-bay.me/ proxygalaxy.pw/ yifystatus.com/ eztvstatus.com/ ettvproxies.com/ siteunblocked.info/ unblockproject.top/ unblocksource.net/ unblockit.kim/ torrentbay.to/ proxyninja.org/ knaben.info/ unblocktorrent.com/ torrends.to/ github.com/Jackett/Jackett www.qbittorrent.org/ www.torrentrover.com/ sonarr.tv/ radarr.video/ lidarr.audio/ github.com/SchizoDuckie/DuckieTV couchpota.to/
call :CLEAR 1 1

:CONTINUETORRENTING
call :SCALE 133 56
echo !CYAN!
echo !\E![57C══════════════════
echo !\E![56C// !RED!█!BGYELLOW!!BLACK! TORRENTING !RED!█!BGBLACK!!CYAN! \\
echo !\E![8C╔══════════════════════════════════════════════//══════════════════\\═══════════════════════════════════════════════╗
echo !\E![8C╠══════════════════════════════════════════════════■█!BGYELLOW!!RED!█ English █!BGBLACK!!CYAN!█■══════════════════════════════════════════════════╣
echo !\E![8C║                                                                                                                   ║
echo !\E![8C║    !1!solidtorrents.net!CYAN!          │   !10!torrentz2k.xyz!CYAN!           │   !19!www.torrentdownload.info!CYAN!       ║
echo !\E![8C║    !2!www.limetorrents.pro!CYAN!       │   !11!!RED!thepiratebay.org!CYAN!         │   !20!concen.org!CYAN!                     ║
echo !\E![8C║    !3!www.torrentfunk.com!CYAN!        │   !12!prostylex.org!CYAN!            │   !21!nyaa.si !GREEN!(animes)!CYAN!               ║
echo !\E![8C║    !4!www.toros.co!CYAN!               │   !13!torrentgalaxy.to!CYAN!         │   !22!www.anirena.com !GREEN!(animes)!CYAN!       ║
echo !\E![8C║    !5!www.gtdb.to!CYAN!                │   !14!yourbittorrent.com!CYAN!       │   !23!subsplease.org !GREEN!(animes)!CYAN!        ║
echo !\E![8C║    !6!www.torrentdownloads.pro!CYAN!   │   !15!anidex.info!CYAN!              │   !24!mac-torrent-download.net !GREEN!(MAC)!CYAN! ║
echo !\E![8C║    !7!1337x.to!CYAN!                   │   !16!www.demonoid.is!CYAN!          │   !25!mac-torrents.io !GREEN!(MAC)!CYAN!          ║
echo !\E![8C║    !8!rarbg.to!CYAN!                   │   !17!angietorrents.cc!CYAN!         │   !26!yts.mx !GREEN!(movies)!CYAN!                ║
echo !\E![8C║    !9!www.ettvcentral.com!CYAN!        │   !18!badasstorrents.com!CYAN!       │   !27!eztv.re !GREEN!(TV)!CYAN!                   ║
echo !\E![8C║                                                                                                                   ║
echo !\E![8C╠══════════════════════════════════════════════════■█!BGYELLOW!!RED!█ French █!BGBLACK!!CYAN!█■═══════════════════════════════════════════════════╣
echo !\E![8C║                                                                                                                   ║
echo !\E![8C║   !28!www3.yggtorrent.nz!CYAN!         │   !30!www.oxtorrent.sh!CYAN!         │                                         ║
echo !\E![8C║   !29!www.sharewood.tv!CYAN!           │   !31!torrent9.to!CYAN!              │                                         ║
echo !\E![8C║                                                                                                                   ║
echo !\E![8C╠═════════════════════════════════════════════■█!BGYELLOW!!RED!█ Torrent Searching █!BGBLACK!!CYAN!█■═════════════════════════════════════════════╣
echo !\E![8C║                                                                                                                   ║
echo !\E![8C║   !32!filelisting.com!CYAN!            │   !41!btdig.com!CYAN!                │   !50!pirateiro.com!CYAN!                  ║
echo !\E![8C║   !33!bt4g.org!CYAN!                   │   !42!ext.to!CYAN!                   │   !51!torrentseeker.com!CYAN!              ║
echo !\E![8C║   !34!xbit.pw!CYAN!                    │   !43!www.torlock.com!CYAN!          │   !52!otorrents.com!CYAN!                  ║
echo !\E![8C║   !35!bitsearch.to!CYAN!               │   !44!ibit.to!CYAN!                  │   !53!vstorrent.org!CYAN!                  ║
echo !\E![8C║   !36!www.7torrents.cc!CYAN!           │   !45!zooqle.com!CYAN!               │   !54!torrents-csv.ml!CYAN!                ║
echo !\E![8C║   !37!bitcq.com!CYAN!                  │   !46!snowfl.com!CYAN!               │   !55!torrentz2eu.me!CYAN!                 ║
echo !\E![8C║   !38!knaben.eu!CYAN!                  │   !47!idope.se!CYAN!                 │   !56!w41.torlook.info!CYAN!               ║
echo !\E![8C║   !39!torrentproject2.com!CYAN!        │   !48!isohunt.app!CYAN!              │   !57!www.magnetdl.com!CYAN!               ║
echo !\E![8C║   !40!torrent-paradise.ml!CYAN!        │   !49!extratorrents.it!CYAN!         │   !58!search.torrends.to!CYAN!             ║
echo !\E![8C║                                                                                                                   ║
echo !\E![8C╠══════════════════════════════════════════════■█!BGYELLOW!!RED!█ Torrent Proxys █!BGBLACK!!CYAN!█■═══════════════════════════════════════════════╣
echo !\E![8C║                                                                                                                   ║
echo !\E![8C║   !59!proxy-bay.me!CYAN!               │   !64!siteunblocked.info!CYAN!       │   !69!proxyninja.org!CYAN!                 ║
echo !\E![8C║   !60!proxygalaxy.pw!CYAN!             │   !65!unblockproject.top!CYAN!       │   !70!knaben.info!CYAN!                    ║
echo !\E![8C║   !61!yifystatus.com!CYAN!             │   !66!unblocksource.net!CYAN!        │   !71!unblocktorrent.com!CYAN!             ║
echo !\E![8C║   !62!eztvstatus.com!CYAN!             │   !67!unblockit.kim!CYAN!            │   !72!torrends.to!CYAN!                    ║
echo !\E![8C║   !63!ettvproxies.com!CYAN!            │   !68!torrentbay.to!CYAN!            │                                         ║
echo !\E![8C║                                                                                                                   ║
echo !\E![8C╠═══════════════════════════════════════════■█!BGYELLOW!!RED!█ Torrent Applications █!BGBLACK!!CYAN!█■════════════════════════════════════════════╣
echo !\E![8C║                                                                                                                   ║
echo !\E![8C║   !73!Jackett!CYAN!                    │   !76!sonarr.tv!CYAN!                │   !79!DuckieTV!CYAN!                       ║
echo !\E![8C║   !74!www.qbittorrent.org!CYAN!        │   !77!radarr.video!CYAN!             │   !80!couchpota.to!CYAN!                   ║
echo !\E![8C║   !75!www.torrentrover.com!CYAN!       │   !78!lidarr.audio!CYAN!             │                                         ║
echo !\E![8C║                                                                                                                   ║
echo !\E![8C╠═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╣
call :DRAW_CENTER "!YELLOW!!c3!!CYAN!  >  !WHITE!Web Torrenting!CYAN!"
echo !\E![8C╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!INSTALL!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" / "!YELLOW!ADD!BRIGHTBLACK!" / "!YELLOW!HELP!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo !RED!
>nul 2>&1 reg query "HKCR\.torrent" || (
if "!Language!"=="EN" call :DRAW_CENTER "ERROR: To be able to use !YELLOW!TORRENTING!RED!, first you need to choose: !YELLOW![INSTALL]"
if "!Language!"=="FR" call :DRAW_CENTER "ERREUR: Pour pouvoir utiliser !YELLOW!TORRENTING!RED!, vous devez d'abord choisir: !YELLOW![INSTALL]"
echo:
)
call :PROMPT
if "!x!"=="!c3!" goto :CLEARWEBTORRENTING
call :WEBSITECHECK "11`thepiratebay.org" && goto :CONTINUETORRENTING
call :CHOOSE install && (call :INSTALL_FILE qBittorent & goto :CONTINUETORRENTING)
call :CHOOSE search && (call :IS_SEARCH 4d5e330a21ba32b26 & goto :CONTINUETORRENTING)
call :CHOOSE add && goto :ADDTORRENT
call :CHOOSE help && goto :TORRENTTUTORIAL
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARTORRENTING
call :ERRORMESSAGE
goto :CONTINUETORRENTING

:WEBTORRENTING
call :SCALE 53 19
title !TITLE:`=Web Torrenting!
call :ROSE "Web Torrenting"

:CLEARWEBTORRENTING
set db=webtorrent.io/ webtor.io/#/ instant.io/ btorrent.xyz/ www.torrentsafe.com/ zbigz.com/
call :CLEAR 1

:CONTINUEWEBTORRENTING
call :SCALE 53 19
echo !CYAN!
echo !\E![16C══════════════════════
echo !\E![15C// !RED!█!BGYELLOW!!BLACK! WEB TORRENTING !RED!█!BGBLACK!!CYAN! \\
echo !\E![9C╔═════════════════════════════════╗
echo !\E![9C║                                 ║
echo !\E![9C║    !1!webtorrent.io!CYAN!          ║
echo !\E![9C║    !2!webtor.io!CYAN!              ║
echo !\E![9C║    !3!instant.io!CYAN!             ║
echo !\E![9C║    !4!btorrent.xyz!CYAN!           ║
echo !\E![9C║    !5!www.torrentsafe.com!CYAN!    ║
echo !\E![9C║    !6!zbigz.com!CYAN!              ║
echo !\E![9C║                                 ║
echo !\E![9C╚═════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEWEBTORRENTING
call :CHOOSE back && goto :TORRENTING
call :WEBSITESTART && goto :CLEARWEBTORRENTING
call :ERRORMESSAGE
goto :CONTINUEWEBTORRENTING

:TORRENTTUTORIAL
call :SCALE 150 23
call :ROSE "Torrent Tutorial"

:CONTINUETORRENTTUTORIAL
call :SCALE 150 23
title !TITLE:`=Torrent Tutorial!
echo !CYAN!
echo !\E![42C════════════════════════
if "!Language!"=="EN" set t=TUTORIAL
if "!Language!"=="FR" set t=TUTORIEL
echo !\E![41C// !RED!█!BGYELLOW!!BLACK! TORRENT !t! !RED!█!BGBLACK!!CYAN! \\
echo !\E![4C╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
echo !\E![4C║                                                                                                                                           ║
if "!Language!"=="EN" echo !\E![4C║                          ■█!BGYELLOW!!RED!█ ♦ What's a torrent (Wikipedia) ? █!BGBLACK!!CYAN!█■                                                                         ║
if "!Language!"=="FR" echo !\E![4C║                          ■█!BGYELLOW!!RED!█ ♦ Qu'est-ce qu'un torrent (Wikipedia) ? █!BGBLACK!!CYAN!█■                                                                  ║
echo !\E![4C║                                                                                                                                           ║
if "!Language!"=="EN" echo !\E![4C║  Torrents are a method of distributing files over the internet.                                                                           ║
if "!Language!"=="FR" echo !\E![4C║  Le Torrent est une méthode de distribution de fichiers sur Internet.                                                                     ║
if "!Language!"=="EN" echo !\E![4C║  It operate over the BitTorrent protocol to facilitate what's called peer-to-peer (P2P) file sharing.                                     ║
if "!Language!"=="FR" echo !\E![4C║  Il fonctionne sur le protocole Bittorrent pour faciliter ce que l'on appelle le partage de fichiers peer-to-peer (P2P).                  ║
if "!Language!"=="EN" echo !\E![4C║  The most common way to use torrents is through a special file that uses the .torrent file extension.                                     ║
if "!Language!"=="FR" echo !\E![4C║  La façont la plus courante d'utiliser des torrents consiste à utiliser un fichier spécial qui utilise l'extension de fichier .torrent    ║
echo !\E![4C║                                                                                                                                           ║
if "!Language!"=="EN" echo !\E![4C║                           ■█!BGYELLOW!!RED!█ ♦ How to open .torrent files ? █!BGBLACK!!CYAN!█■                                                                          ║
if "!Language!"=="FR" echo !\E![4C║                          ■█!BGYELLOW!!RED!█ ♦ Comment ouvrir des fichiers .torrent ? █!BGBLACK!!CYAN!█■                                                                 ║
echo !\E![4C║                                                                                                                                           ║
if "!Language!"=="EN" echo !\E![4C║  !YELLOW!1!CYAN!  ^> !WHITE! Download and install qBittorrent.!CYAN!                                                                                                  ║
if "!Language!"=="FR" echo !\E![4C║  !YELLOW!1!CYAN!  ^> !WHITE! Téléchargez et installer qBittorrent.!CYAN!                                                                                              ║
if "!Language!"=="EN" echo !\E![4C║  Then you can run the .torrent that you have downloaded in one of the previous Illegal Services Torrenting links.                         ║
if "!Language!"=="FR" echo !\E![4C║  Ensuite, vous pouvez exécuter le .torrent que vous avez téléchargé dans l'un des liens de Torrenting depuis Illegal Services.            ║
echo !\E![4C║                                                                                                                                           ║
echo !\E![4C╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
if "!x!"=="1" call :INSTALL_FILE qBittorent & goto :CONTINUETORRENTTUTORIAL
call :CHOOSE back && goto :TORRENTING
call :ERRORMESSAGE
goto :CONTINUETORRENTTUTORIAL

:ADDTORRENT
echo !CYAN!
if "!Language!"=="EN" (
echo This option allow you to create a magnet link with an HASH.
echo Exemple of an HASH: "c12fe1c06bba254a9dc9f519b335aa7c1367a88a"
)
if "!Language!"=="FR" (
echo Cette option vous permet de créer un lien magnétique avec un HASH.
echo Exemple d'un HASH: "c12fe1c06bba254a9dc9f519b335aa7c1367a88a"
)
>nul 2>&1 reg query "HKCR\magnet\shell\open\command" || goto :ERROR_ADDTORRENT
echo !CYAN!
if "!Language!"=="EN" set t=Type the torrent's HASH
if "!Language!"=="FR" set t=Entrez le HASH du torrent
%SHOWCURSOR%
set el=
set /p "el=!t!: !YELLOW!"
%HIDECURSOR%
call :CHOOSE back && goto :CONTINUETORRENTING
if defined el if "!el:~39!"=="!el:~-1!" start "" "magnet:?xt=urn:btih:!el!" && goto :CONTINUETORRENTING || goto :ERROR_ADDTORRENT
echo:
call :ERRORMESSAGE el "un HASH" HASH
goto :CONTINUETORRENTING

:ERROR_ADDTORRENT
echo !RED!
if "!Language!"=="EN" (
echo ERROR: You need a working bittorrent platform in order to make magnet links working.
echo Do you want to install qBittorrent in order to make it working ? [!YELLOW!YES!RED!] / [!YELLOW!NO!RED!]
>nul choice /n /c YN
)
if "!Language!"=="FR" (
echo ERREUR: vous avez besoin d'une plate-forme bittorrent fonctionnelle pour que les liens magnétiques fonctionnent.
echo Voulez-vous installer qBittorrent pour le faire fonctionner ? [!YELLOW!OUI!RED!] / [!YELLOW!NON!RED!]
>nul choice /n /c ON
)
if "!errorlevel!"=="1" call :INSTALL_FILE qBittorent
goto :CONTINUETORRENTING

:SUBTITLES
call :SCALE 72 35
title !TITLE:`=Subtitles!
call :ROSE Subtitles

:CLEARSUBTITLES
set db=subscene.com/ www.opensubtitles.com/ www.opensubtitles.org/ opensubtitle.info/ ytsubtitles.com/ yifysubtitles.org/ yts-subs.com/ subs.dog/ www.subs4free.info/ www.subtitledb.org/ www.addic7ed.com/ isubtitles.org/ subdl.com/ `www.moviesubtitles.net/ www.podnapisi.net/ tvsubs.net/ www.tvsubtitles.net/ www.subdivx.com/ www.subtitlecat.com/ www.sous-titres.eu/ www.u-sub.net/ www.kitsunekko.net/ subs.nandesuka.workers.dev/
call :CLEAR 1

:CONTINUESUBTITLES
call :SCALE 72 35
echo !CYAN!
echo !\E![9C╔═════════════════════════════════════════════════════╗
echo !\E![9C╠══════════════════■█!BGYELLOW!!RED!█ SUBTITLES █!BGBLACK!!CYAN!█■══════════════════╣
echo !\E![9C║                                                     ║
echo !\E![9C║    !1!subscene.com!CYAN!                               ║
echo !\E![9C║    !2!www.opensubtitles.com!CYAN!                      ║
echo !\E![9C║    !3!www.opensubtitles.org!CYAN!                      ║
echo !\E![9C║    !4!opensubtitle.info!CYAN!                          ║
echo !\E![9C║    !5!ytsubtitles.com!CYAN!                            ║
echo !\E![9C║    !6!yifysubtitles.org!CYAN!                          ║
echo !\E![9C║    !7!yts-subs.com!CYAN!                               ║
echo !\E![9C║    !8!subs.dog!CYAN!                                   ║
echo !\E![9C║    !9!www.subs4free.info!CYAN!                         ║
echo !\E![9C║   !10!www.subtitledb.org!CYAN!                         ║
echo !\E![9C║   !11!www.addic7ed.com!CYAN!                           ║
echo !\E![9C║   !12!isubtitles.org!CYAN!                             ║
echo !\E![9C║   !13!subdl.com!CYAN!                                  ║
echo !\E![9C║   !14!www.moviesubtitles.net!CYAN!                     ║
echo !\E![9C║   !15!www.podnapisi.net!CYAN!                          ║
echo !\E![9C║   !16!tvsubs.net!CYAN!                                 ║
echo !\E![9C║   !17!www.tvsubtitles.net!CYAN!                        ║
echo !\E![9C║   !18!www.subdivx.com!CYAN!                            ║
echo !\E![9C║   !19!www.subtitlecat.com!CYAN!                        ║
echo !\E![9C║   !20!www.sous-titres.eu!CYAN!                         ║
echo !\E![9C║   !21!www.u-sub.net!CYAN!                              ║
echo !\E![9C║   !22!www.kitsunekko.net !GREEN!(animes)!CYAN!                ║
echo !\E![9C║   !23!subs.nandesuka.workers.dev !GREEN!(animes) [FR]!CYAN!   ║
echo !\E![9C║                                                     ║
echo !\E![9C╚═════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUESUBTITLES
call :CHOOSE search && (call :IS_SEARCH 44c549fe875e83514 & goto :CONTINUESUBTITLES)
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARSUBTITLES
call :ERRORMESSAGE
goto :CONTINUESUBTITLES

:WINDOWS
call :SCALE 136 54
title !TITLE:`=Cracked Windows apps!
call :ROSE "Cracked Windows apps"

:CLEARWINDOWS
set db=getintopc.com/ crackingpatching.com/ karanpc.com/ filecr.com/en/ s0ft4pc.com/ kolompc.com/ www.mazterize.com/ gigapurbalingga.net/ appnee.com/ www.sadeempc.com/ shareappscrack.com/ free4pc.org/ appload.club/ www.4download.net/ haxnode.net/ www.novahax.com/ lostvayne.com/ filewomen.com/ izofile.com/ crackshash.com/ www.cybermania.ws/ cracksurl.com/ fileriver.net/ piratepc.me/ ftuapps.dev/ starcrack.net/ startcrack.net/ keygenninja.net/ fileash.com/ www.trucnet.com/ w14.monkrus.ws/ `www.intercambiosvirtuales.org/ diakov.net/ lrepacks.net/ repack.me/ portable4pc.com/ www.fcportables.com/ portableappz.blogspot.com/ igg-games.com/ pcgamestorrents.com/ www.skidrowcodex.net/ www.mrpcgamer.co/ www.game3rb.com/ agfy.co/ cracked-games.org/ www.ovagames.com/ steamunlocked.net/ gog-games.com/ codex-games.com/ getgamez.net/ crackhub.site/ freegameshub.co/ gogunlocked.com/ alltorrents.co/ www.myabandonware.com/ gamesnostalgia.com/ cygames.fr/ telecharger-jeuxpc.fr/ www.gamestorrents.fm/ repack-games.com/ www.game-repack.site/ elamigos.site/ skidrowrepacks.com/ fitgirl-repacks.site/ repack-mechanics.com/ gamesdrive.net/ dodi-repacks.site/ www.blackboxrepack.com/ masquerade.site/ scooter-repacks.site/ www.gnarly-repacks.site/ cpgrepacks.site/ www.tiny-repacks.win/ repack.info/ m4ckd0ge-repacks.me/ patricktech-repacks.xyz/ e13.xatab-repack.com/ qoob.name/
call :CLEAR 1

:CONTINUEWINDOWS
call :SCALE 136 54
echo !CYAN!
echo !\E![54C════════════════════════════
echo !\E![53C// !RED!█!BGYELLOW!!BLACK! CRACKED WINDOWS APPS !RED!█!BGBLACK!!CYAN! \\
echo !\E![8C╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
echo !\E![8C╠═════════════════════════════════════════════════■█!BGYELLOW!!RED!█ Applications █!BGBLACK!!CYAN!█■═════════════════════════════════════════════════╣
echo !\E![8C║                                                                                                                      ║
echo !\E![8C║    !1!!RED!getintopc.com!CYAN!           │   !12!free4pc.org!CYAN!                │   !23!fileriver.net!CYAN!                      ║
echo !\E![8C║    !2!!RED!crackingpatching.com!CYAN!    │   !13!appload.club!CYAN!               │   !24!piratepc.me!CYAN!                        ║
echo !\E![8C║    !3!!RED!karanpc.com!CYAN!             │   !14!www.4download.net!CYAN!          │   !25!ftuapps.dev!CYAN!                        ║
echo !\E![8C║    !4!filecr.com!CYAN!              │   !15!!RED!haxnode.net!CYAN!                │   !26!starcrack.net!CYAN!                      ║
echo !\E![8C║    !5!!RED!s0ft4pc.com!CYAN!             │   !16!www.novahax.com!CYAN!            │   !27!startcrack.net!CYAN!                     ║
echo !\E![8C║    !6!!RED!kolompc.com!CYAN!             │   !17!lostvayne.com!CYAN!              │   !28!keygenninja.net!CYAN!                    ║
echo !\E![8C║    !7!www.mazterize.com!CYAN!       │   !18!filewomen.com!CYAN!              │   !29!fileash.com!CYAN!                        ║
echo !\E![8C║    !8!gigapurbalingga.net!CYAN!     │   !19!!RED!izofile.com!CYAN!                │   !30!www.trucnet.com !GREEN![FR]!CYAN!               ║
echo !\E![8C║    !9!appnee.com!CYAN!              │   !20!!RED!crackshash.com!CYAN!             │   !31!w14.monkrus.ws !GREEN![RU]!CYAN!                ║
echo !\E![8C║   !10!!RED!www.sadeempc.com!CYAN!        │   !21!!RED!www.cybermania.ws!CYAN!          │   !32!www.intercambiosvirtuales.org !GREEN![ES]!CYAN! ║
echo !\E![8C║   !11!shareappscrack.com!CYAN!      │   !22!cracksurl.com!CYAN!              │                                             ║
echo !\E![8C║                                                                                                                      ║
echo !\E![8C╠═════════════════════════════════════════════■█!BGYELLOW!!RED!█ Application Repacks █!BGBLACK!!CYAN!█■══════════════════════════════════════════════╣
echo !\E![8C║                                                                                                                      ║
echo !\E![8C║   !33!diakov.net !GREEN![RU]!CYAN!         │   !34!lrepacks.net !GREEN![RU]!CYAN!          │   !35!repack.me !GREEN![RU]!CYAN!                     ║
echo !\E![8C║                                                                                                                      ║
echo !\E![8C╠════════════════════════════════════════════════■█!BGYELLOW!!RED!█ Portable Apps █!BGBLACK!!CYAN!█■═════════════════════════════════════════════════╣
echo !\E![8C║                                                                                                                      ║
echo !\E![8C║   !36!!RED!portable4pc.com!CYAN!         │   !37!www.fcportables.com!CYAN!        │   !38!portableappz.blogspot.com!CYAN!          ║
echo !\E![8C║                                                                                                                      ║
echo !\E![8C╠══════════════════════════════════════════════════■█!BGYELLOW!!RED!█ Videogames █!BGBLACK!!CYAN!█■══════════════════════════════════════════════════╣
echo !\E![8C║                                                                                                                      ║
echo !\E![8C║   !39!!RED!igg-games.com!CYAN!           │   !47!steamunlocked.net!CYAN!          │   !55!www.myabandonware.com !GREEN!(retro)!CYAN!      ║
echo !\E![8C║   !40!!RED!pcgamestorrents.com!CYAN!     │   !48!gog-games.com!CYAN!              │   !56!gamesnostalgia.com !GREEN!(retro)!CYAN!         ║
echo !\E![8C║   !41!!RED!www.skidrowcodex.net!CYAN!    │   !49!!RED!codex-games.com!CYAN!            │   !57!cygames.fr !GREEN![FR]!CYAN!                    ║
echo !\E![8C║   !42!www.mrpcgamer.co!CYAN!        │   !50!getgamez.net!CYAN!               │   !58!telecharger-jeuxpc.fr !GREEN![FR]!CYAN!         ║
echo !\E![8C║   !43!www.game3rb.com!CYAN!         │   !51!crackhub.site!CYAN!              │   !59!www.gamestorrents.fm !GREEN![ES]!CYAN!          ║
echo !\E![8C║   !44!agfy.co!CYAN!                 │   !52!freegameshub.co!CYAN!            │                                             ║
echo !\E![8C║   !45!!RED!cracked-games.org!CYAN!       │   !53!gogunlocked.com!CYAN!            │                                             ║
echo !\E![8C║   !46!www.ovagames.com!CYAN!        │   !54!alltorrents.co!CYAN!             │                                             ║
echo !\E![8C║                                                                                                                      ║
echo !\E![8C╠══════════════════════════════════════════════■█!BGYELLOW!!RED!█ Videogame Repacks █!BGBLACK!!CYAN!█■═══════════════════════════════════════════════╣
echo !\E![8C║                                                                                                                      ║
echo !\E![8C║   !60!repack-games.com!CYAN!        │   !67!dodi-repacks.site!CYAN!          │   !74!repack.info!CYAN!                        ║
echo !\E![8C║   !61!www.game-repack.site!CYAN!    │   !68!www.blackboxrepack.com!CYAN!     │   !75!m4ckd0ge-repacks.me!CYAN!                ║
echo !\E![8C║   !62!elamigos.site!CYAN!           │   !69!masquerade.site!CYAN!            │   !76!patricktech-repacks.xyz!CYAN!            ║
echo !\E![8C║   !63!skidrowrepacks.com!CYAN!      │   !70!scooter-repacks.site!CYAN!       │   !77!e13.xatab-repack.com !GREEN![RU]!CYAN!          ║
echo !\E![8C║   !64!fitgirl-repacks.site!CYAN!    │   !71!www.gnarly-repacks.site!CYAN!    │   !78!qoob.name !GREEN![RU]!CYAN!                     ║
echo !\E![8C║   !65!repack-mechanics.com!CYAN!    │   !72!cpgrepacks.site!CYAN!            │                                             ║
echo !\E![8C║   !66!gamesdrive.net!CYAN!          │   !73!www.tiny-repacks.win!CYAN!       │                                             ║
echo !\E![8C║                                                                                                                      ║
echo !\E![8C╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
call :WEBSITECHECK "1`getintopc.com 2`crackingpatching.com 3`karanpc.com 5`s0ft4pc.com 6`kolompc.com 10`www.sadeempc.com 15`haxnode.net 19`izofile.com 20`crackshash.com 21`www.cybermania.ws 36`portable4pc.com 39`igg-games.com 40`pcgamestorrents.com 41`www.skidrowcodex.net 45`cracked-games.org 49`codex-games.com" && goto :CONTINUEWINDOWS
call :CHOOSE search && (call :IS_SEARCH c63a5dfcf766495b0 & goto :CONTINUEWINDOWS)
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARWINDOWS
call :ERRORMESSAGE
goto :CONTINUEWINDOWS

:ANDROID
call :SCALE 85 39
title !TITLE:`=Cracked Android APK's!
call :ROSE "Cracked Android APK"

:CLEARANDROID
set db=a2zapk.com/ android-zone.ws/ apkhome.net/ apkmagic.com.ar/ oceanofapk.com/ apkgod.net/ www.revdl.com/ 5mod.ru/ apkmb.com/ apk4free.org/ dlandroid.com/ apk4all.com/ rexdl.com/ moddroid.co/ apkmody.io/ inewkhushi.com/ proapk.in/mod-apk/ www.apps4download.com/ ihackedit.com/ iplayplus.org/ apk-house.com/ www.rockmods.net/ www.ytricks.net/ www.apkheist.com/ apkfolks.com/ vancedapp.com/ newpipe.net/ www.instamod.net/ thedise.me/instander/ www.whatsappmods.net/ bluesmods.com/ github.com/xManager-v2/xManager-Spotify
call :CLEAR 1

:CONTINUEANDROID
call :SCALE 85 39
echo !CYAN!
echo !\E![28C════════════════════════════
echo !\E![27C// !RED!█!BGYELLOW!!BLACK! CRACKED ANDROID APPS !RED!█!BGBLACK!!CYAN! \\
echo !\E![7C╔═════════════════════════════════════════════════════════════════════╗
echo !\E![7C║                                                                     ║
echo !\E![7C║    !1!a2zapk.com!CYAN!             │   !14!moddroid.co!CYAN!              ║
echo !\E![7C║    !2!android-zone.ws!CYAN!        │   !15!apkmody.io!CYAN!               ║
echo !\E![7C║    !3!apkhome.net!CYAN!            │   !16!inewkhushi.com!CYAN!           ║
echo !\E![7C║    !4!apkmagic.com.ar!CYAN!        │   !17!proapk.in!CYAN!                ║
echo !\E![7C║    !5!oceanofapk.com!CYAN!         │   !18!www.apps4download.com!CYAN!    ║
echo !\E![7C║    !6!apkgod.net!CYAN!             │   !19!ihackedit.com!CYAN!            ║
echo !\E![7C║    !7!www.revdl.com!CYAN!          │   !20!iplayplus.org!CYAN!            ║
echo !\E![7C║    !8!5mod.ru !GREEN![RU]!CYAN!           │   !21!apk-house.com!CYAN!            ║
echo !\E![7C║    !9!apkmb.com!CYAN!              │   !22!www.rockmods.net!CYAN!         ║
echo !\E![7C║   !10!apk4free.org!CYAN!           │   !23!www.ytricks.net!CYAN!          ║
echo !\E![7C║   !11!dlandroid.com!CYAN!          │   !24!www.apkheist.com!CYAN!         ║
echo !\E![7C║   !12!apk4all.com!CYAN!            │   !25!apkfolks.com!CYAN!             ║
echo !\E![7C║   !13!rexdl.com!CYAN!              │                                   ║
echo !\E![7C║                                                                     ║
echo !\E![7C╠═════■█!BGYELLOW!!RED!█ YouTube Modded █!BGBLACK!!CYAN!█■══════╦═════■█!BGYELLOW!!RED!█ Instagram Modded █!BGBLACK!!CYAN!█■══════╣
echo !\E![7C║                                 ║                                   ║
echo !\E![7C║   !26!vancedapp.com!CYAN!          ║   !28!www.instamod.net!CYAN!         ║
echo !\E![7C║   !27!newpipe.net!CYAN!            ║   !29!thedise.me!CYAN!               ║
echo !\E![7C║                                 ║                                   ║
echo !\E![7C╠════■█!BGYELLOW!!RED!█ Whats App Modded █!BGBLACK!!CYAN!█■═════╬══════■█!BGYELLOW!!RED!█ Discord Modded █!BGBLACK!!CYAN!█■═══════╣
echo !\E![7C║                                 ║                                   ║
echo !\E![7C║   !30!www.whatsappmods.net!CYAN!   ║   !31!bluesmods.com!CYAN!            ║
echo !\E![7C║                                                                     ║
echo !\E![7C╠═══════════════════════■█!BGYELLOW!!RED!█ Spotify Modded █!BGBLACK!!CYAN!█■════════════════════════╣
echo !\E![7C║                                                                     ║
echo !\E![7C║                        !32!xManager-v2!CYAN!                           ║
echo !\E![7C║                                                                     ║
echo !\E![7C╚═════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / !YELLOW!SEARCH!BRIGHTBLACK! !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
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
title !TITLE:`=YouTube Downloader!
call :ROSE "YouTube Downloader"

:CLEARYOUTUBEDL
for %%A in (YOUTUBEDLP YOUTUBEDLGEOBYPASS YOUTUBEDLPRIORITY YOUTUBEDLOUTPUTDIRECTORY) do call :CHECK_%%A
if "!Language!"=="EN" (
set "YouTubeDLDirectoryInfo=Change download location!CYAN!                                   ║"
if "!YouTubeDLGeoBypass!"=="0" set "YouTubeDLGeoBypassInfo=Bypass geographic restriction !CYAN!(!RED!OFF!!CYAN!)                        ║"
if "!YouTubeDLGeoBypass!"=="1" set "YouTubeDLGeoBypassInfo=Bypass geographic restriction !CYAN!(!GREEN!ON!!CYAN!)                         ║"
)
if "!Language!"=="FR" (
set "YouTubeDLDirectoryInfo=Changer l'emplacement de téléchargement!CYAN!                    ║"
if "!YouTubeDLGeoBypass!"=="0" set "YouTubeDLGeoBypassInfo=Contournement de la restriction géographique !CYAN!(!RED!OFF!!CYAN!)         ║"
if "!YouTubeDLGeoBypass!"=="1" set "YouTubeDLGeoBypassInfo=Contournement de la restriction géographique !CYAN!(!GREEN!ON!!CYAN!)          ║"
)
if "!YouTubeDLP!"=="0" (
set youtube_dl=youtube-dl
set "YouTubeDLPInfo=YouTube DLP !CYAN!(!RED!OFF!!CYAN!)                                          ║"
)
if "!YouTubeDLP!"=="1" (
set youtube_dl=yt-dlp
set "YouTubeDLPInfo=YouTube DLP !CYAN!(!GREEN!ON!!CYAN!)                                           ║"
)
if not exist "Portable_Apps\YouTube-DL\" md "Portable_Apps\YouTube-DL"

:CONTINUEYOUTUBEDL
call :SCALE 104 32
echo !CYAN!
echo !\E![39C══════════════════════════
echo !\E![38C// !RED!█!BGYELLOW!!BLACK! YOUTUBE DOWNLOADER !RED!█!BGBLACK!!CYAN! \\
echo !\E![8C╔══════════════════════════════════════════════════════════════════════════════════════╗
if "!Language!"=="EN" (set t1=Video Formats) & set t2=Audio Formats
if "!Language!"=="FR" (set t1=Formats vidéo) & set t2=Formats Audio
echo !\E![8C╠═══════════■█!BGYELLOW!!RED!█ !t1! █!BGBLACK!!CYAN!█■═══════════╦══════════■█!BGYELLOW!!RED!█ !t2! █!BGBLACK!!CYAN!█■═══════════╣
echo !\E![8C║                                           ║                                          ║
echo !\E![8C║    !YELLOW!1!CYAN!  ^> !WHITE! BEST!CYAN!                             ║     !YELLOW!7!CYAN!  ^> !WHITE! BEST!CYAN!                           ║
echo !\E![8C║    !YELLOW!2!CYAN!  ^> !WHITE! .mp4!CYAN!                             ║     !YELLOW!8!CYAN!  ^> !WHITE! .mp3!CYAN!                           ║
echo !\E![8C║    !YELLOW!3!CYAN!  ^> !WHITE! .webm!CYAN!                            ║     !YELLOW!9!CYAN!  ^> !WHITE! .m4a!CYAN!                           ║
echo !\E![8C║    !YELLOW!4!CYAN!  ^> !WHITE! .flv!CYAN!                             ║    !YELLOW!10!CYAN!  ^> !WHITE! .flac!CYAN!                          ║
echo !\E![8C║    !YELLOW!5!CYAN!  ^> !WHITE! .mkv!CYAN!                             ║    !YELLOW!11!CYAN!  ^> !WHITE! .aac!CYAN!                           ║
echo !\E![8C║    !YELLOW!6!CYAN!  ^> !WHITE! .avi!CYAN!                             ║    !YELLOW!12!CYAN!  ^> !WHITE! .opus!CYAN!                          ║
echo !\E![8C║                                           ║    !YELLOW!13!CYAN!  ^> !WHITE! .ogg!CYAN!                           ║
echo !\E![8C║                                           ║    !YELLOW!14!CYAN!  ^> !WHITE! .wav!CYAN!                           ║
echo !\E![8C╠═══════════════════════════════════════════╩══════════════════════════════════════════╣
if "!Language!"=="EN" echo !\E![8C╠═══════════════════════════════════■█!BGYELLOW!!RED!█ Settings █!BGBLACK!!CYAN!█■═══════════════════════════════════╣
if "!Language!"=="FR" echo !\E![8C╠══════════════════════════════════■█!BGYELLOW!!RED!█ Paramètres █!BGBLACK!!CYAN!█■══════════════════════════════════╣
echo !\E![8C║                                                                                      ║
echo !\E![8C║                    !YELLOW!15!CYAN!  ^> !WHITE! !YouTubeDLPInfo!
echo !\E![8C║                    !YELLOW!16!CYAN!  ^> !WHITE! !YouTubeDLDirectoryInfo!
echo !\E![8C║                    !YELLOW!17!CYAN!  ^> !WHITE! !YouTubeDLGeoBypassInfo!
echo !\E![8C╠══════════════════════════════════════════════════════════════════════════════════════╣
if "!Language!"=="EN" (
echo !\E![8C║    !BRIGHTMAGENTA!YouTube DL automatically download the best quality as available at the source.!CYAN!    ║
echo !\E![8C║         !BRIGHTMAGENTA!We do not convert to 320 Kbps just for saying it's the best quality.!CYAN!         ║
)
if "!Language!"=="FR" (
echo !\E![8C║ !BRIGHTMAGENTA!YouTube DL télécharge la meilleure qualité telle qu'elle est disponible à la source.!CYAN! ║
echo !\E![8C║ !BRIGHTMAGENTA!Nous ne convertissons pas à 320 Kbps juste pour dire que c'est la meilleure qualité.!CYAN! ║
)
echo !\E![8C╠══════════════════════════════════════════════════════════════════════════════════════╣
if "!Language!"=="EN" set t=Download location:
if "!Language!"=="FR" set t=Emplacement de téléchargement:
echo           !BRIGHTMAGENTA!!t!!WHITE! !YouTubeDLOutputDirectory!!CYAN!
echo !\E![8C╚══════════════════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!OPEN!BRIGHTBLACK!" / "!YELLOW!PRIORITY!BRIGHTBLACK!" / "!YELLOW!INSTALL!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
for /l %%A in (1,1,14) do if "!x!"=="%%A" call :CHECK_INTERNET && goto :GOYOUTUBEDL || (call :ERROR_INTERNET & goto :CONTINUEYOUTUBEDL)
if "!x!"=="15" (
if "!YouTubeDLP!"=="0" >nul reg add "!IS_REG!" /v "YouTubeDLP" /t REG_DWORD /d 1 /f
if "!YouTubeDLP!"=="1" >nul reg add "!IS_REG!" /v "YouTubeDLP" /t REG_DWORD /d 0 /f
goto :CLEARYOUTUBEDL
)
if "!x!"=="16" goto :YOUTUBEDLDIRECTORY
if "!x!"=="17" (
if "!YouTubeDLGeoBypass!"=="0" >nul reg add "!IS_REG!" /v "YouTubeDLGeoBypass" /t REG_DWORD /d 1 /f
if "!YouTubeDLGeoBypass!"=="1" >nul reg add "!IS_REG!" /v "YouTubeDLGeoBypass" /t REG_DWORD /d 0 /f
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
echo !BRIGHTBLACK!
if "!Language!"=="EN" set "t=Enter "
if "!Language!"=="FR" set t=Entrer l'
%SHOWCURSOR%
set url=
set /p "url=!t!URL: !YELLOW!"
%HIDECURSOR%
call :CHECK_URL url URL || goto :CONTINUEYOUTUBEDL
set a=--add-metadata !a! "!url!"
echo:
if not exist "Portable_Apps\YouTube-DL\ffmpeg.exe" call :CURL "Portable_Apps\YouTube-DL\ffmpeg.7z" "`git_raw_downloads`/ffmpeg.7z" || (call :ERROR_INTERNET & goto :CONTINUEYOUTUBEDL)
if "!youtube_dl!"=="youtube-dl" if not exist "Portable_Apps\YouTube-DL\youtube-dl.exe" call :CURL "Portable_Apps\YouTube-DL\youtube-dl.exe" "https://yt-dl.org/downloads/latest/youtube-dl.exe" || (call :ERROR_INTERNET & goto :CONTINUEYOUTUBEDL)
if "!youtube_dl!"=="yt-dlp" if not exist "Portable_Apps\YouTube-DL\yt-dlp.exe" call :CURL "Portable_Apps\YouTube-DL\yt-dlp.exe" "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_x86.exe" || (call :ERROR_INTERNET & goto :CONTINUEYOUTUBEDL)
pushd "Portable_Apps\YouTube-DL"
2>nul !youtube_dl!.exe -U --no-check-certificate | findstr /vic:"!youtube_dl! is up" /c:"Current Build Hash"
:YOUTUBEDL_UPDATER
for %%A in (*.new *updater.bat *updater.cmd) do if exist "%%A" goto :YOUTUBEDL_UPDATER
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
if "!Language!"=="FR" echo NOTE: Laisser vide remplacera l'emplacement de téléchargement originale.
echo:
if "!Language!"=="EN" set t=Enter new download location
if "!Language!"=="FR" set t=Entrer le nouvel emplacement de téléchargement
%SHOWCURSOR%
set el=
set /p "el=!BRIGHTBLACK!!t!: !YELLOW!"
%HIDECURSOR%
if defined x (
set "el=!el:"=!"
if "!el:~-1!"=="\" set "el=!el:~,-1!"
for %%A in ("!el!") do >nul reg add "!IS_REG!" /v "YouTubeDLOutputDirectory" /t REG_SZ /d "%%~fA" /f
) else >nul 2>&1 reg delete "!IS_REG!" /v "YouTubeDLOutputDirectory" /f
call :CHECK_YOUTUBEDLOUTPUTDIRECTORY
goto :CONTINUEYOUTUBEDL

:YOUTUBEDL_PRIORITY
call :PRIORITY_PROCESS YouTubeDLPriority
>nul reg add "!IS_REG!" /v "YouTubeDLPriority" /t REG_SZ /d !YouTubeDLPriority! /f && (
if "!Language!"=="EN" set t="YouTube DL priority has been replaced to: '!YouTubeDLPriority!'"
if "!Language!"=="FR" set t="La priorité de YouTube DL a bien été remplacée par: '!YouTubeDLPriority!'"
call :MSGBOX 69696 "Illegal Services Checker"
)
call :CHECK_YOUTUBEDLPRIORITY
goto :CONTINUEYOUTUBEDL

:USEFULWEBSITES
call :SCALE 139 48
title !TITLE:`=Useful Websites!
call :ROSE "Useful Websites"

:CLEARUSEFULWEBSITES
set db=www.virustotal.com/gui/ www.hybrid-analysis.com/ metadefender.opswat.com/ antiscan.me/ virusscan.jotti.org/ urlscan.io/ www.security.org/how-secure-is-my-password/ breachalarm.com/ haveibeenpwned.com/ monitor.firefox.com/ cybernews.com/personal-data-leak-check/ leakedsource.ru/ dehashed.com/ leak-lookup.com/search webresolver.nl/tools/leaked_database weleakinfo.to/ protonvpn.com/ www.urban-vpn.com/ courvix.com/ www.freeopenvpn.org/ www.vpnbook.com/ www.proxyscan.io/ free-proxy-list.net/ proxy-daily.com/ smallseotools.com/free-proxy-list/ cloudssh.net/ sshdropbear.net/ protonmail.com/ www.startmail.com/ temp-mail.org/ dropmail.me/ yopmail.com/ generator.email/blog/gmail-generator temp-sms.org/ cyber-hub.pw/ webresolver.nl/ www.vedbex.com/tools/home wannabe1337.xyz/ mostwantedhf.info/ shadowcrypt.net/tools/ xresolver.com/ www.skypeipresolver.net/ fakepersongenerator.com/ www.fakeimess.com/generator/ fakeproof.xenot.pro/ www.vedbex.com/tools/fake_proof torrentfreak.com/ `nextwarez.com/ filepursuit.com/ www.aiosearch.com/ www.filechef.com/ leak.sx/combolist.php combo-list.com/ www.frecombo.com/search/label/Combo-List combolist.top/ sinister.ly/Forum-Combo-Lists mailaccess.top/forums/combolists.13/ t.me/s/dailycombolist github.com/gibbed/SteamAchievementManager onehack.us/ www.revshells.com/ www.torproject.org/
call :CLEAR 1

:CONTINUEUSEFULWEBSITES
call :SCALE 139 48
echo !CYAN!
echo !\E![58C═══════════════════════
echo !\E![57C// !RED!█!BGYELLOW!!BLACK! USEFUL WEBSITES !RED!█!BGBLACK!!CYAN! \\
echo !\E![8C╔═══════════════════════════════════════════════//═══════════════════════\\═════════════════════════════════════════════╗
echo !\E![8C╠════════■█!BGYELLOW!!RED!█ Virus Scanners █!BGBLACK!!CYAN!█■════════╦═════════════■█!BGYELLOW!!RED!█ Security █!BGBLACK!!CYAN!█■═════════════╦════════════■█!BGYELLOW!!RED!█ Leaks █!BGBLACK!!CYAN!█■════════════╣
echo !\E![8C║                                      ║                                          ║                                     ║
echo !\E![8C║    !1!www.virustotal.com!CYAN!          ║    !7!www.security.org!CYAN!                ║   !12!leakedsource.ru!CYAN!            ║
echo !\E![8C║    !2!www.hybrid-analysis.com!CYAN!     ║    !8!breachalarm.com!CYAN!                 ║   !13!dehashed.com!CYAN!               ║
echo !\E![8C║    !3!metadefender.opswat.com!CYAN!     ║    !9!haveibeenpwned.com!CYAN!              ║   !14!leak-lookup.com!CYAN!            ║
echo !\E![8C║    !4!antiscan.me!CYAN!                 ║   !10!monitor.firefox.com!CYAN!             ║   !15!webresolver.nl!CYAN!             ║
echo !\E![8C║    !5!virusscan.jotti.org!CYAN!         ║   !11!cybernews.com!CYAN!                   ║   !16!weleakinfo.to!CYAN!              ║
echo !\E![8C║    !6!urlscan.io!CYAN!                  ║                                          ║                                     ║
echo !\E![8C║                                      ║                                          ║                                     ║
echo !\E![8C╠═════■█!BGYELLOW!!RED!█ Free VPNs and Proxys █!BGBLACK!!CYAN!█■═════╬══════════■█!BGYELLOW!!RED!█ Mails and SMS █!BGBLACK!!CYAN!█■═══════════╬════════■█!BGYELLOW!!RED!█ Web Resolvers █!BGBLACK!!CYAN!█■════════╣
echo !\E![8C║                                      ║                                          ║                                     ║
echo !\E![8C║   !17!protonvpn.com!CYAN!               ║   !28!protonmail.com!CYAN!                  ║    !36!webresolver.nl!CYAN!            ║
echo !\E![8C║   !18!www.urban-vpn.com!CYAN!           ║   !29!www.startmail.com!CYAN!               ║    !37!www.vedbex.com!CYAN!            ║
echo !\E![8C║   !19!courvix.com!CYAN!                 ║   !30!temp-mail.org!CYAN!                   ║    !38!wannabe1337.xyz!CYAN!           ║
echo !\E![8C║   !20!www.freeopenvpn.org!CYAN!         ║   !31!dropmail.me!CYAN!                     ║    !39!mostwantedhf.info!CYAN!         ║
echo !\E![8C║   !21!www.vpnbook.com!CYAN!             ║   !32!yopmail.com!CYAN!                     ║    !40!shadowcrypt.net!CYAN!           ║
echo !\E![8C║   !22!www.proxyscan.io!CYAN!            ║   !33!generator.email!CYAN!                 ║    !41!xresolver.com!CYAN!             ║
echo !\E![8C║   !23!free-proxy-list.net!CYAN!         ║   !34!temp-sms.org!CYAN!                    ║    !42!www.skypeipresolver.net!CYAN!   ║
echo !\E![8C║   !24!proxy-daily.com!CYAN!             ║   !35!cyber-hub.pw!CYAN!                    ║                                     ║
echo !\E![8C║   !25!smallseotools.com!CYAN!           ║                                          ║                                     ║
echo !\E![8C║   !26!cloudssh.net!CYAN!                ║                                          ║                                     ║
echo !\E![8C║   !27!sshdropbear.net!CYAN!             ║                                          ║                                     ║
echo !\E![8C║                                      ║                                          ║                                     ║
echo !\E![8C╠═══════■█!BGYELLOW!!RED!█ Fake Generators █!BGBLACK!!CYAN!█■════════╬════════════■█!BGYELLOW!!RED!█ Warez News █!BGBLACK!!CYAN!█■════════════╬═══════■█!BGYELLOW!!RED!█ File Searching █!BGBLACK!!CYAN!█■════════╣
echo !\E![8C║                                      ║                                          ║                                     ║
echo !\E![8C║   !43!fakepersongenerator.com!CYAN!     ║   !47!torrentfreak.com!CYAN!                ║    !50!www.aiosearch.com!CYAN!         ║
echo !\E![8C║   !44!www.fakeimess.com!CYAN!           ║   !48!nextwarez.com !GREEN![FR]!CYAN!              ║    !51!www.filechef.com!CYAN!          ║
echo !\E![8C║   !45!fakeproof.xenot.pro!CYAN!         ║   !49!filepursuit.com!CYAN!                 ║                                     ║
echo !\E![8C║   !46!www.vedbex.com!CYAN!              ║                                          ║                                     ║
echo !\E![8C║                                                                                 ║                                     ║
echo !\E![8C╠═════════════════════════════■█!BGYELLOW!!RED!█ Combo Lists █!BGBLACK!!CYAN!█■═════════════════════════════════╬═══════════■█!BGYELLOW!!RED!█ Others █!BGBLACK!!CYAN!█■════════════╣
echo !\E![8C║                                                                                 ║                                     ║
echo !\E![8C║   !52!leak.sx!CYAN!                     │   !56!sinister.ly!CYAN!                     ║   !59!SteamAchievementManager!CYAN!    ║
echo !\E![8C║   !53!combo-list.com!CYAN!              │   !57!mailaccess.top!CYAN!                  ║   !60!onehack.us!CYAN!                 ║
echo !\E![8C║   !54!www.frecombo.com!CYAN!            │   !58!dailycombolist!CYAN!                  ║   !61!www.revshells.com!CYAN!          ║
echo !\E![8C║   !55!combolist.top!CYAN!               │                                          ║   !62!www.torproject.org!CYAN!         ║
echo !\E![8C║                                                                                 ║                                     ║
echo !\E![8C╚═════════════════════════════════════════════════════════════════════════════════╩═════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEUSEFULWEBSITES
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARUSEFULWEBSITES
call :ERRORMESSAGE
goto :CONTINUEUSEFULWEBSITES

:DDOS
call :SCALE 82 31
title !TITLE:`=Denial Of Services (DDoS)!
call :ROSE "IP Denial of Services"

:CLEARDDOS
set db=redstresser.cc/welcome/index quez.in/ instant-stresser.com/ freestresser.to/ anonboot.com/ str3ssed.co/ www.ipstresser.com/ ipstress.in/ royalstresser.com/ stresser.zone/ wannabe1337.xyz/stresser vtoxicity.net/ deltastress.com/ str3sser.io/ databooter.to/ asylumstresser.to/ ddosforhire.net/
call :CLEAR 1

:CONTINUEDDOS
call :SCALE 82 31
echo !CYAN!
echo !\E![23C══════════════════════════════════════
echo !\E![22C// !RED!█!BGYELLOW!!BLACK! DENIAL OF SERVICES (100%% Free) !RED!█!BGBLACK!!CYAN! \\
echo !\E![8C╔════════════════════════════════╦═══════════════════════════════╗
echo !\E![8C║   !1!redstresser.cc!CYAN!         ║  [BEST]  [  10/Gbps] [350/s]  ║
echo !\E![8C║   !2!quez.in!CYAN!                ║  [BEST]  [   5/Gbps] [300/s]  ║
echo !\E![8C║   !3!instant-stresser.com!CYAN!   ║  [BEST]  [   1/Gbps] [300/s]  ║
echo !\E![8C║   !4!freestresser.to!CYAN!        ║  [BEST]  [   1/Gbps] [300/s]  ║
echo !\E![8C║   !5!anonboot.com!CYAN!           ║  [BEST]  [   ?/Gbps] [300/s]  ║
echo !\E![8C║   !6!str3ssed.co!CYAN!            ║  [BEST]  [7-13/Gbps] [300/s]  ║
echo !\E![8C║   !7!www.ipstresser.com!CYAN!     ║          [ 200/Mbps] [300/s]  ║
echo !\E![8C║   !8!ipstress.in!CYAN!            ║          [   ?/Gbps] [250/s]  ║
echo !\E![8C║   !9!royalstresser.com!CYAN!      ║          [   ?/Gbps] [200/s]  ║
echo !\E![8C║  !10!stresser.zone!CYAN!          ║          [5-15/Gbps] [120/s]  ║
echo !\E![8C║  !11!wannabe1337.xyz!CYAN!        ║          [   ?/Gbps] [120/s]  ║
echo !\E![8C║  !12!vtoxicity.net!CYAN!          ║          [ 100/Mbps] [120/s]  ║
echo !\E![8C║  !13!deltastress.com!CYAN!        ║          [   ?/Gbps] [ 60/s]  ║
echo !\E![8C║  !14!str3sser.io!CYAN!            ║          [   1/Gbps] [ 60/s]  ║
echo !\E![8C║  !15!databooter.to!CYAN!          ║          [   1/Gbps] [ 60/s]  ║
echo !\E![8C║  !16!asylumstresser.to!CYAN!      ║          [   1/Gbps] [ 60/s]  ║
echo !\E![8C╠════════════════════════════════╩═══════════════════════════════╣
if "!Language!"=="EN" (
call :DRAW_CENTER "!BRIGHTMAGENTA!Illegal Services index only stressers in layer 4."
call :DRAW_CENTER "!BRIGHTMAGENTA!Last Updated: !WHITE!16/11/2021"
call :DRAW_CENTER "!BRIGHTMAGENTA!Alternatively you can visit: !17!ddosforhire.net"
)
if "!Language!"=="FR" (
call :DRAW_CENTER "!BRIGHTMAGENTA!Illegal Services index seulement les stresseurs en layer 4."
call :DRAW_CENTER "!BRIGHTMAGENTA!Mise à jour le: !WHITE!16/11/2021"
call :DRAW_CENTER "!BRIGHTMAGENTA!Alternativement vous pouvez visiter: !17!ddosforhire.net"
)
echo !\E![8C!CYAN!╚════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEDDOS
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARDDOS
call :ERRORMESSAGE
goto :CONTINUEDDOS

:IPLOOKUP
call :SCALE 73 27
title !TITLE:`=IP Address Lookup!
call :ROSE "IP Address Lookup"

:CLEARIPLOOKUP
set db=check-host.net/ dnschecker.org/ www.iplocation.net/ www.ip-tracker.org/ whatismyipaddress.com/
call :CLEAR 4
if exist "!TMPF!\IS_Log.txt" del /f /q "!TMPF!\IS_Log.txt"

:CONTINUEIPLOOKUP
call :SCALE 73 27
title !TITLE:`=IP Address Lookup!
echo !CYAN!
echo !\E![28C═════════════════
echo !\E![27C// !RED!█!BGYELLOW!!BLACK! IP LOOKUP !RED!█!BGBLACK!!CYAN! \\
echo !\E![17C╔═════════════════════════════════════╗
echo !\E![17C╠═■█!BGYELLOW!!RED!█  Illegal Services IP Lookup █!BGBLACK!!CYAN!█■═╣
echo !\E![17C║                                     ║
if "!Language!"=="EN" echo !\E![17C║    !YELLOW!1!CYAN!  ^> !WHITE! View your IP!CYAN!               ║
if "!Language!"=="FR" echo !\E![17C║    !YELLOW!1!CYAN!  ^> !WHITE! Regarder mon IP!CYAN!            ║
if "!Language!"=="EN" echo !\E![17C║    !YELLOW!2!CYAN!  ^> !WHITE! Lookup an other IP!CYAN!         ║
if "!Language!"=="FR" echo !\E![17C║    !YELLOW!2!CYAN!  ^> !WHITE! Regarder une autre IP!CYAN!      ║
if "!Language!"=="EN" echo !\E![17C║    !YELLOW!3!CYAN!  ^> !WHITE! Lookup an other URL!CYAN!        ║
if "!Language!"=="FR" echo !\E![17C║    !YELLOW!3!CYAN!  ^> !WHITE! Regarder une autre URL!CYAN!     ║
echo !\E![17C║                                     ║
if "!Language!"=="EN" echo !\E![17C╠═════■█!BGYELLOW!!RED!█  IP Lookup websites █!BGBLACK!!CYAN!█■═════╣
if "!Language!"=="FR" echo !\E![17C╠═■█!BGYELLOW!!RED!█  Sites Internet d'IP Lookup █!BGBLACK!!CYAN!█■═╣
echo !\E![17C║                                     ║
echo !\E![17C║    !4!check-host.net!CYAN!             ║
echo !\E![17C║    !5!dnschecker.org!CYAN!             ║
echo !\E![17C║    !6!www.iplocation.net!CYAN!         ║
echo !\E![17C║    !7!www.ip-tracker.org!CYAN!         ║
echo !\E![17C║                                     ║
if "!Language!"=="EN" echo !\E![17C╠═══■█!BGYELLOW!!RED!█  IP Dynamic or Static ? █!BGBLACK!!CYAN!█■═══╣
if "!Language!"=="FR" echo !\E![17C╠═■█!BGYELLOW!!RED!█  IP Dynamique ou Satique ? █!BGBLACK!!CYAN!█■══╣
echo !\E![17C║                                     ║
echo !\E![17C║    !8!whatismyipaddress.com!CYAN!      ║
echo !\E![17C╚═════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!READ!BRIGHTBLACK!" / "!YELLOW!DELETE!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
for %%A in (1 2 3) do if "!x!"=="%%A" call :CHECK_INTERNET || (
call :ERROR_INTERNET
goto :CLEARIPLOOKUP
)
if "!x!"=="1" (
title !TITLE:`=Looking up ^> ...!
for /f %%A in ('curl.exe -fkLs "https://api.ipify.org"') do set "url=%%A"
call :CHECK_IP url && goto :IPLOOKUP_RESPONSE || goto :CLEARIPLOOKUP
)
if "!x!"=="2" call :IPLOOKUP_ENTER IP && goto :IPLOOKUP_RESPONSE || goto :CLEARIPLOOKUP
if "!x!"=="3" call :IPLOOKUP_ENTER IP/URL && goto :IPLOOKUP_RESPONSE || goto :CLEARIPLOOKUP
call :WEBSITECHECK && goto :CONTINUEIPLOOKUP
call :CHOOSE back && goto :MAINMENU
call :CHOOSE read && (call :READ_IPLOOKUP & goto :CLEARIPLOOKUP)
call :CHOOSE delete && (call :DELETE_IPLOOKUP & goto :CLEARIPLOOKUP)
if not defined x for /l %%A in (!c1!,1,!c2!) do if "!%%A!"=="!YELLOW!%%A !CHECKED!" call :IPLOOKUP_ENTER IP/URL && goto :CLEARIPLOOKUP || goto :CONTINUEIPLOOKUP
call :ERRORMESSAGE
goto :CONTINUEIPLOOKUP

:IPLOOKUP_RESPONSE
set /a width=68, height=4
if not "!x!"=="3" set "fixed_url=!url!"
title !TITLE:`=Looking up ^> %fixed_url%!
cls
for %%A in (1 2) do if "!x!"=="%%A" (
for /f "tokens=1,2delims=: " %%A in ('curl.exe -fkLs "https://ipinfo.io/!fixed_url!/json" ^| findstr /vc:"{" /c:"}" /c:"ipinfo.io/missingauth"') do (
set "el=%%A:%%B"
set "el=!el:"=!"
set "el=!el:ip:=IPv4      : !"
set "el=!el:hostname:=Hostname  : !"
set "el=!el:anycast:=Anycast   : !"
set "el=!el:city:=City      : !"
set "el=!el:region:=Region    : !"
set "el=!el:country:=Country   : !"
set "el=!el:loc:=Location  : !"
set "el=!el:org:=ORG       : !"
set "el=!el:postal:=Postal    : !"
set "el=!el:timezone:=Timezone  : !"
set "el=!el:bogon:=Bogon     : !"
set "el=!el:true=True!"
set "el=!el:false=False!"
if "!el:~-1!"=="," set "el=!el:~,-1!"
for /f "tokens=2delims=:" %%B in ("!el!") do if not "%%B"==" " (
set /a height+=1
mode !width!,!height!
>>"!TMPF!\IS_Log.txt" echo !el!
)
)
)
if "!x!"=="3" (
for /f "tokens=2delims=</" %%A in ('curl.exe -fkLs "http://ip-api.com/xml/!fixed_url!?fields=8192"') do if not "%%~A"=="" (
set "el=%%A"
set "el=!el:query>=IP v4/v6  : !"
for /f "tokens=2delims=:" %%B in ("!el!") do if not "%%B"==" " (
set /a height+=1
mode !width!,!height!
>>"!TMPF!\IS_Log.txt" echo !el!
)
)
for /f "tokens=2delims=</" %%A in ('curl.exe -fkLs "http://ip-api.com/xml/!fixed_url!?fields=5775161"') do if not "%%~A"=="" (
set "el=%%A"
set "el=!el:"=!"
set "el=!el:continent>=Continent : !"
set "el=!el:country>=Country   : !"
set "el=!el:regionName>=Region    : !"
set "el=!el:city>=City      : !"
set "el=!el:district>=District  : !"
set "el=!el:zip>=Zip       : !"
set "el=!el:timezone>=Timezone  : !"
set "el=!el:isp>=ISP       : !"
set "el=!el:org>=ORG       : !"
set "el=!el:as>=AS        : !"
set "el=!el:asname>=ASName    : !"
set "el=!el:reverse>=Reverse   : !"
for /f "tokens=2delims=:" %%B in ("!el!") do if not "%%B"==" " (
set /a height+=1
mode !width!,!height!
>>"!TMPF!\IS_Log.txt" echo !el!
)
)
)
for /f "tokens=1,*delims=: " %%A in ('curl.exe -fkLs "https://proxycheck.io/v2/!fixed_url!?vpn=1&port=1" ^| findstr /ic:"type" /c:"proxy"') do (
set "el=%%A:%%B"
set "el=!el:"=!"
set "el=!el:type:=Type      : !"
set "el=!el:proxy:=Proxy     : !"
set "el=!el:no=False!"
set "el=!el:yes=True!"
if "!el:~-1!"=="," set "el=!el:~,-1!"
for /f "tokens=2delims=:" %%B in ("!el!") do if not "%%B"==" " (
set /a height+=1
mode !width!,!height!
>>"!TMPF!\IS_Log.txt" echo !el!
)
)
for /f "tokens=2delims=</" %%A in ('curl.exe -fkLs "http://ip-api.com/xml/!fixed_url!?fields=16973824"') do (
set "el=%%A"
set "el=!el:mobile>=Mobile (cellular) connection      : !"
set "el=!el:proxy>=Proxy, VPN or Tor exit address    : !"
set "el=!el:hosting>=Hosting, colocated or data center : !"
set "el=!el:true=True!"
set "el=!el:false=False!"
for /f "tokens=2delims=:" %%B in ("!el!") do if not "%%B"==" " (
set /a height+=1
mode !width!,!height!
>>"!TMPF!\IS_Log.txt" echo !el!
)
)
echo:
for /f "usebackqtokens=1,*delims=:" %%A in ("!TMPF!\IS_Log.txt") do echo     !BRIGHTRED!%%A:!CYAN!%%B
set _el=
for /f "delims=" %%A in ('curl.exe -fkLs -H "Accept: application/json" "https://check-host.net/check-ping?host=!fixed_url!"') do (
set "_el=%%A"
if defined _el (
set "_el=!_el:*"request_id":=!"
set "_el=!_el:"=!"
set "_el=!_el:}=!"
)
)
:_IPLOOKUP_RESPONSE
if defined _el for /f "delims=" %%A in ('curl.exe -fkLs -H "Accept: application/json" "https://check-host.net/check-result/!_el!"') do (
set "el=%%A"
if defined el (
if not "!el:["OK",=!"=="!el!" (
set /a height+=1
mode !width!,!height!
>>"!TMPF!\IS_Log.txt" echo Pinging   : True
goto :__IPLOOKUP_RESPONSE
)
if not "!el::null=!"=="!el!" goto :_IPLOOKUP_RESPONSE
set /a height+=1
mode !width!,!height!
>>"!TMPF!\IS_Log.txt" echo Pinging   : False
)
)
:__IPLOOKUP_RESPONSE
set /a height+=1
mode !width!,!height!
cls
set el=
echo:
for /f "usebackqtokens=1,*delims=:" %%A in ("!TMPF!\IS_Log.txt") do echo     !BRIGHTRED!%%A:!CYAN!%%B
if exist "!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt" >nul find /i "!fixed_url!" "!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt" && (
set el=True
)
if not defined el set el=False
echo     !BRIGHTRED!Saved     : !CYAN!!el!
echo:
if "!Language!"=="EN" set t=Do you want to
if "!Language!"=="FR" set t=Voulez-vous
call :DRAW_CENTER "!BRIGHTBLACK!!t! Save (!YELLOW!S!BRIGHTBLACK!) / Ping (!YELLOW!P!BRIGHTBLACK!) / Back (!YELLOW!B!BRIGHTBLACK!) ?"

:IPLOOKUP_CHOICE
>nul choice /n /c SPB
if "!errorlevel!"=="1" goto :IPLOOKUP_SAVE
if "!errorlevel!"=="2" start "" "%~f0" PINGER
if "!errorlevel!"=="3" goto :CLEARIPLOOKUP
goto :IPLOOKUP_CHOICE

:IPLOOKUP_SAVE
if "!Language!"=="EN" set t="Enter victim's name: "
if "!Language!"=="FR" set t="Entrez le nom de la victime: "
call :INPUTBOX
if not exist "!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt" (
if not exist "!IS_OUTPUTDIRECTORY!\" md "!IS_OUTPUTDIRECTORY!"
>"!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt" echo =============================================
)
>>"!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt" (
echo   Name: !ID! [!url!]
echo =============================================
type "!TMPF!\IS_Log.txt"
echo =============================================
)
if "!Language!"=="EN" set t="IP Lookup successfully saved at:!\N!!\N!'!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt'!\N!!\N!Do you want to open it now ?"
if "!Language!"=="FR" set t="IP Lookup enregistrés avec succès à:!\N!!\N!'!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt'!\N!!\N!Voulez-vous l'ouvrir maintenant ?"
call :MSGBOX_LEVEL 69668 "Illegal Services Checker"
if "!el!"=="6" start /max "" "!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt"
goto :CLEARIPLOOKUP

:PORT
call :SCALE 101 33
title !TITLE:`=IP Port Scanning!
call :ROSE "IP Port Scanning"

:CLEARPORT
set db=www.adminsub.net/tcp-udp-port-finder www.speedguide.net/ports.php www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml portforward.com/ports.htm
call :CLEAR 8

:CONTINUEPORT
call :SCALE 101 33
echo !CYAN!
echo !\E![37C════════════════════════════
echo !\E![36C// !RED!█!BGYELLOW!!BLACK! IP TCP PORT SCANNING !RED!█!BGBLACK!!CYAN! \\
echo !\E![8C╔═══════════════════════════════════════════════════════════════════════════════════╗
if "!Language!"=="EN" echo !\E![8C╠══════════════════════════════■█!BGYELLOW!!RED!█ Scan all Ports █!BGBLACK!!CYAN!█■═══════════════════════════════╣
if "!Language!"=="FR" echo !\E![8C╠════════════════════════════■█!BGYELLOW!!RED!█ Scan tous les ports █!BGBLACK!!CYAN!█■════════════════════════════╣
echo !\E![8C║                                                                                   ║
if "!Language!"=="EN" echo !\E![8C║                       !YELLOW!1!CYAN!  ^> !WHITE! Python: Scan all 65535 ports.!CYAN!                         ║
if "!Language!"=="FR" echo !\E![8C║                     !YELLOW!1!CYAN!  ^> !WHITE! Python: Scan tous les 65535 ports.!CYAN!                      ║
if "!Language!"=="EN" echo !\E![8C║                       !YELLOW!2!CYAN!  ^> !WHITE! NMAP  : Scan all 65535 ports.!CYAN!                         ║
if "!Language!"=="FR" echo !\E![8C║                     !YELLOW!2!CYAN!  ^> !WHITE! NMAP  : Scan tous les 65535 ports.!CYAN!                      ║
echo !\E![8C╠═══════════════════════════════════════════════════════════════════════════════════╣
if "!Language!"=="EN" echo !\E![8C╠═══════════════════════════■█!BGYELLOW!!RED!█ Scan Most Used Ports █!BGBLACK!!CYAN!█■════════════════════════════╣
if "!Language!"=="FR" echo !\E![8C╠═════════════════════■█!BGYELLOW!!RED!█ Scan les ports les plus utilisés █!BGBLACK!!CYAN!█■══════════════════════╣
echo !\E![8C║                                                                                   ║
if "!Language!"=="EN" echo !\E![8C║    !YELLOW!3!CYAN!  ^> !WHITE! NMAP: Scan only ports listeds in the file nmap-services.!CYAN!                 ║
if "!Language!"=="FR" echo !\E![8C║    !YELLOW!3!CYAN!  ^> !WHITE! NMAP: Scan uniquement les ports listés dans le fichier nmap-services.!CYAN!    ║
if "!Language!"=="EN" echo !\E![8C║    !YELLOW!4!CYAN!  ^> !WHITE! NMAP: Scan + than 1660 ports.!CYAN!                                            ║
if "!Language!"=="FR" echo !\E![8C║    !YELLOW!4!CYAN!  ^> !WHITE! NMAP: Scan + de 1660 ports.!CYAN!                                              ║
if "!Language!"=="EN" echo !\E![8C║    !YELLOW!5!CYAN!  ^> !WHITE! NMAP: Scan top most useds ports.!CYAN!                                         ║
if "!Language!"=="FR" echo !\E![8C║    !YELLOW!5!CYAN!  ^> !WHITE! NMAP: Scan les principaux ports les plus utilisés.!CYAN!                       ║
if "!Language!"=="EN" echo !\E![8C║    !YELLOW!6!CYAN!  ^> !WHITE! NMAP: Scan with version detection.!CYAN!                                       ║
if "!Language!"=="FR" echo !\E![8C║    !YELLOW!6!CYAN!  ^> !WHITE! NMAP: Scan avec la détection de version.!CYAN!                                 ║
echo !\E![8C╠═══════════════════════════════════════════════════════════════════════════════════╣
if "!Language!"=="EN" echo !\E![8C╠══════════════════════════■█!BGYELLOW!!RED!█ Custom Port Range Scan █!BGBLACK!!CYAN!█■═══════════════════════════╣
if "!Language!"=="FR" echo !\E![8C╠═════════════════■█!BGYELLOW!!RED!█ Scan personnalisé de la plage des ports █!BGBLACK!!CYAN!█■═══════════════════╣
echo !\E![8C║                                                                                   ║
if "!Language!"=="EN" echo !\E![8C║                   !YELLOW!7!CYAN!  ^> !WHITE! NMAP: Scan your range of custom ports!CYAN!                     ║
if "!Language!"=="FR" echo !\E![8C║               !YELLOW!7!CYAN!  ^> !WHITE! NMAP: Scan votre plage personnalisé de ports.!CYAN!                 ║
echo !\E![8C╠═══════════════════════════════════════════════════════════════════════════════════╣
if "!Language!"=="EN" set t=Description
if "!Language!"=="FR" set t=Déscription
echo !\E![8C╠═══════════════════════════■█!BGYELLOW!!RED!█ Portlist !t! █!BGBLACK!!CYAN!█■════════════════════════════╣
echo !\E![8C║                                                                                   ║
echo !\E![8C║                             !8!www.adminsub.net!CYAN!                                ║
echo !\E![8C║                             !9!www.speedguide.net!CYAN!                              ║
echo !\E![8C║                            !10!www.iana.org!CYAN!                                    ║
echo !\E![8C║                            !11!portforward.com!CYAN!                                 ║
echo !\E![8C╚═══════════════════════════════════════════════════════════════════════════════════╝
echo:
>nul 2>&1 sc query npcap || (
if "!Language!"=="EN" call :DRAW_CENTER "!RED!ERROR: !BRIGHTBLACK!To use NMAP, you must first choose: "!YELLOW!INSTALL!BRIGHTBLACK!""
if "!Language!"=="FR" call :DRAW_CENTER "!RED!ERREUR: !BRIGHTBLACK!Pour utiliser NMAP, vous devez d'abord choisir: "!YELLOW!INSTALL!BRIGHTBLACK!""
echo:
)
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!BRIGHTBLACK!!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!INSTALL!BRIGHTBLACK!" / "!YELLOW!PRIORITY!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
for /l %%A in (1,1,7) do if "!x!"=="%%A" call :CHECK_INTERNET && goto :GOPORTSCANNING || (call :ERROR_INTERNET & goto :CONTINUEPORT)
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
if "!Language!"=="FR" set o1=uniquement les ports listés dans le fichier nmap-services.
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
if "!Language!"=="FR" set o1=Scan les principaux ports les plus utilisés.
set o2=minimum 13 seconds.
set a=--top-ports 65535
)
if "!x!"=="6" (
if "!Language!"=="EN" set o1=Scan with version detection.
if "!Language!"=="FR" set o1=Scan avec la détection de version.
set o2=minimum 19 seconds.
set a=-sV --allports
)
if "!x!"=="7" (
if "!Language!"=="EN" set t=Enter start port
if "!Language!"=="FR" set t=Entrer le port de début
set p1=
set /p "p1=!BRIGHTBLACK!!t!: !YELLOW!"
call :CHECK_PORT p1 || goto :CLEARPORT
if "!Language!"=="EN" set t=Enter end port
if "!Language!"=="FR" set t=Entrer le port de fin
set p2=
set /p "p2=!BRIGHTBLACK!!t!: !YELLOW!"
call :CHECK_PORT p2 || goto :CLEARPORT
set a=-p!p1!-!p2!
if "!Language!"=="EN" set o1=Scan your range of custom ports.
if "!Language!"=="FR" set o1=Scan votre plage personnalisé de ports.
set o2=Unknow.
)
if "!Language!"=="EN" set "t=Enter "
if "!Language!"=="FR" set t=Entrer l'
%SHOWCURSOR%
set url=
set /p "url=!BRIGHTBLACK!!t!IP/URL: !YELLOW!"
call :CHECK_URL url IP/URL || goto :CLEARPORT
if not defined o1 (
if not exist "Portable_Apps\TCP_Port_Scanner.exe" call :CURL "Portable_Apps\TCP_Port_Scanner.exe" "`git_raw_downloads`/TCP_Port_Scanner.exe" || (call :ERROR_INTERNET & goto :CLEARPORT)
pushd "Portable_Apps"
call :CHECK_PORTPRIORITY
start !PortPriority! TCP_Port_Scanner.exe "!fixed_url!"
popd
goto :CLEARPORT
)
set a=-T5 --open !a! "!fixed_url!"
set a=!a:  = !
if not exist "Portable_Apps\NMAP\nmap.exe" call :CURL "Portable_Apps\NMAP.7z" "`git_raw_downloads`/NMAP.7z" || (call :ERROR_INTERNET & goto :CLEARPORT)
start "" "%~f0" NMAP
goto :CLEARPORT

:NMAPINSTALL
call :CURL "!TMPF!\vcredist_x86.exe" "https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x86.exe" || (call :ERROR_INTERNET & goto :CONTINUEPORT)
call :START_DOWNLOADED_FILE vcredist_x86.exe
call :CURL "!TMPF!\npcap-1.31.exe" "https://nmap.org/npcap/dist/npcap-1.55.exe" || (call :ERROR_INTERNET & goto :CONTINUEPORT)
call :START_DOWNLOADED_FILE npcap-1.31.exe
goto :CONTINUEPORT

:PORT_PRIORITY
call :PRIORITY_PROCESS PortPriority
>nul reg add "!IS_REG!" /v "PortPriority" /t REG_SZ /d !PortPriority! /f && (
if "!Language!"=="EN" set t="Port Scanning priority has been replaced to: '!PortPriority!'"
if "!Language!"=="FR" set t="La priorité du Port Scanning a bien été remplacée par: '!PortPriority!'"
call :MSGBOX 69696 "Illegal Services Checker"
)
goto :CONTINUEPORT

:PINGERPORT
title !TITLE:`=IP Port Pinger!
call :ROSE "IP Port Pinger"
if "!Language!"=="EN" set "t=Enter "
if "!Language!"=="FR" set t=Entrer l'
%SHOWCURSOR%
set url=
set /p "url=!BRIGHTBLACK!!t!IP/URL: !YELLOW!"
%HIDECURSOR%
call :CHECK_URL url IP/URL || goto :MAINMENU
if "!Language!"=="EN" set t=Enter Port
if "!Language!"=="FR" set t=Entrer le Port
%SHOWCURSOR%
set p1=
set /p "p1=!BRIGHTBLACK!!t!: !YELLOW!"
%HIDECURSOR%
call :CHECK_PORT p1 || goto :MAINMENU
if not exist "Portable_Apps\paping.exe" call :CURL "Portable_Apps\paping.exe" "`git_raw_downloads`/paping.exe" || (call :ERROR_INTERNET & goto :MAINMENU)
pushd "Portable_Apps"
start paping.exe !fixed_url! -p !p1!
popd
goto :MAINMENU

:IPPINGER
title !TITLE:`=IP Pinger!
call :ROSE "IP Pinger"
if "!Language!"=="EN" set "t=Enter "
if "!Language!"=="FR" set t=Entrer l'
%SHOWCURSOR%
set url=
set /p "url=!BRIGHTBLACK!!t!IP/URL: !YELLOW!"
%HIDECURSOR%
call :CHECK_URL url IP/URL || goto :MAINMENU
start "" "%~f0" PINGER
goto :MAINMENU

:IPLOGGERS
call :SCALE 65 26
title !TITLE:`=IP Loggers!
if "!Language!"=="EN" set t="INFORMATION: Url Shortners are useful for hiding the original links of your suspect IPLogger.!\N!!\N!This solution does not work with some services that will redirect your shortened links directly to the last linked url. Example FaceBook, Instagram, Twitter..."
if "!Language!"=="FR" set t="INFORMATION: Les URL Shortners sont utiles pour cacher les liens originaux de votre IPLogger suspect.!\N!!\N!Cette solution ne fonctionne pas avec certains services qui redirigeront directement votre lien raccourci a la derniere URL liee. Exemple Facebook, Instagram, Twitter..."
call :MSGBOX 69680 "Illegal Services Checker"
call :ROSE "IP Loggers"
goto :CLEARIPLOGGERS

:CLEARIPLOGGERS
set db=iplogger.org/ grabify.link/ blasze.com/ webresolver.nl/tools/iplogger lstu.fr/ kutt.it/ www.shorturl.at/ shorturl.com/ tiny.cc/ bitly.com/
call :CLEAR 1

:CONTINUEIPLOGGERS
call :SCALE 65 26
echo !CYAN!
echo !\E![22C══════════════════
echo !\E![21C// !RED!█!BGYELLOW!!BLACK! IP LOGGERS !RED!█!BGBLACK!!CYAN! \\
echo !\E![16C╔═════════════════════════════╗
echo !\E![16C║                             ║
echo !\E![16C║    !1!iplogger.org!CYAN!       ║
echo !\E![16C║    !2!grabify.link!CYAN!       ║
echo !\E![16C║    !3!blasze.com!CYAN!         ║
echo !\E![16C║    !4!webresolver.nl!CYAN!     ║
echo !\E![16C╠═════════════════════════════╣
echo !\E![16C╠════■█!BGYELLOW!!RED!█  Url Shortners █!BGBLACK!!CYAN!█■═══╣
echo !\E![16C║                             ║
echo !\E![16C║    !5!lstu.fr!CYAN!            ║
echo !\E![16C║    !6!kutt.it!CYAN!            ║
echo !\E![16C║    !7!www.shorturl.at!CYAN!    ║
echo !\E![16C║    !8!shorturl.com!CYAN!       ║
echo !\E![16C║    !9!tiny.cc!CYAN!            ║
echo !\E![16C║   !10!bitly.com!CYAN!          ║
echo !\E![16C║                             ║
echo !\E![16C╚═════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEIPLOGGERS
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARIPLOGGERS
call :ERRORMESSAGE
goto :CONTINUEIPLOGGERS

:DOXING
call :SCALE 104 53
title !TITLE:`=Doxing!
call :ROSE Doxing

:CLEARDOXING
set db=pimeyes.com/ tineye.com/ yandex.com/images images.google.com/ www.bing.com/?scope=images image.baidu.com/ pic.sogou.com/ ascii2d.net/ trace.moe/ saucenao.com/ iqdb.org/ www.pic2map.com/ onlineexifviewer.com/ www.metadata2go.com/ searx.neocities.org/ www.etools.ch/ search.carrot2.org/ www.excite.co.jp/ www.infospace.com/ biznar.com/ metager.org/ www.entireweb.com/ www.delta-search.com/ www.startpage.com/do/advanced-search www.google.com/advanced_search www.google.com/advanced_image_search "Dox Tool v2" knowem.com/ checkusernames.com/ instantusername.com/#/ analyzeid.com/username/ namechk.com/ www.namecheckr.com/ usersearch.org/index.php www.toolsbug.com/youtube-video-tag-extractor.php online-free-tools.com/en/youtube_video_tags_extract_url ytubetool.com/ doxbin.org/
call :CLEAR 1

:CONTINUEDOXING
call :SCALE 104 53
echo !CYAN!
echo !\E![45C══════════════
echo !\E![44C// !RED!█!BGYELLOW!!BLACK! DOXING !RED!█!BGBLACK!!CYAN! \\
echo !\E![8C╔═════════════════════════════════════════════════════════════════════════════════════╗
echo !\E![8C╠═════■█!BGYELLOW!!RED!█ Image Search █!BGBLACK!!CYAN!█■═════════════════╦══════════■█!BGYELLOW!!RED!█ Image Research █!BGBLACK!!CYAN!█■══════════╣
echo !\E![8C║                                          ║                                          ║
echo !\E![8C║     !1!pimeyes.com!CYAN!                    ║    !12!www.pic2map.com!CYAN!                ║
echo !\E![8C║     !2!tineye.com!CYAN!                     ║    !13!onlineexifviewer.com!CYAN!           ║
echo !\E![8C║     !3!yandex.com!CYAN!                     ║    !14!www.metadata2go.com!CYAN!            ║
echo !\E![8C║     !4!images.google.com!CYAN!              ║                                          ║
echo !\E![8C║     !5!www.bing.com!CYAN!                   ║                                          ║
echo !\E![8C║     !6!image.baidu.com!CYAN!                ║                                          ║
echo !\E![8C║     !7!pic.sogou.com!CYAN!                  ║                                          ║
echo !\E![8C║     !8!ascii2d.net!CYAN!                    ║                                          ║
echo !\E![8C║     !9!trace.moe!CYAN!                      ║                                          ║
echo !\E![8C║    !10!saucenao.com!CYAN!                   ║                                          ║
echo !\E![8C║    !11!iqdb.org!CYAN!                       ║                                          ║
echo !\E![8C║                                          ║                                          ║
echo !\E![8C╠═════════■█!BGYELLOW!!RED!█ Metasearch Engine █!BGBLACK!!CYAN!█═════════╬═══════■█!BGYELLOW!!RED!█ Advanced Seach Engine █!BGBLACK!!CYAN!█■══════╣
echo !\E![8C║                                          ║                                          ║
echo !\E![8C║    !15!searx.neocities.org!CYAN!            ║    !24!www.startpage.com!CYAN!              ║
echo !\E![8C║    !16!www.etools.ch!CYAN!                  ║    !25!www.google.com/web!CYAN!             ║
echo !\E![8C║    !17!search.carrot2.org!CYAN!             ║    !26!www.google.com/image!CYAN!           ║
echo !\E![8C║    !18!www.excite.co.jp!CYAN!               ║                                          ║
echo !\E![8C║    !19!www.infospace.com!CYAN!              ║                                          ║
echo !\E![8C║    !20!biznar.com!CYAN!                     ║                                          ║
echo !\E![8C║    !21!metager.org!CYAN!                    ║                                          ║
echo !\E![8C║    !22!www.entireweb.com!CYAN!              ║                                          ║
echo !\E![8C║    !23!www.delta-search.com!CYAN!           ║                                          ║
echo !\E![8C║                                          ║                                          ║
echo !\E![8C╠══════════■█!BGYELLOW!!RED!█ Username Search █!BGBLACK!!CYAN!█══════════╬═════■█!BGYELLOW!!RED!█ YouTube TAGS Extractors █!BGBLACK!!CYAN!█■══════╣
echo !\E![8C║                                          ║                                          ║
echo !\E![8C║    !27!Dox Tool v2!CYAN!                    ║    !35!www.toolsbug.com!CYAN!               ║
echo !\E![8C║    !28!knowem.com!CYAN!                     ║    !36!online-free-tools.com!CYAN!          ║
echo !\E![8C║    !29!checkusernames.com!CYAN!             ║    !37!ytubetool.com!CYAN!                  ║
echo !\E![8C║    !30!instantusername.com!CYAN!            ║                                          ║
echo !\E![8C║    !31!analyzeid.com!CYAN!                  ║                                          ║
echo !\E![8C║    !32!namechk.com!CYAN!                    ║                                          ║
echo !\E![8C║    !33!www.namecheckr.com!CYAN!             ║                                          ║
echo !\E![8C║    !34!usersearch.org!CYAN!                 ║                                          ║
echo !\E![8C║                                          ║                                          ║
echo !\E![8C║                                                                                     ║
echo !\E![8C╠══════════════════════════════════■█!BGYELLOW!!RED!█ Dox Logs █!BGBLACK!!CYAN!█■═══════════════════════════════════╣
echo !\E![8C║                                                                                     ║
echo !\E![8C║                                !38!doxbin.org!CYAN!                                    ║
echo !\E![8C║                                                                                     ║
echo !\E![8C╚═════════════════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEDOXING
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARDOXING
call :ERRORMESSAGE
goto :CONTINUEDOXING

:PORTABLEAPPS
call :SCALE 138 47
title !TITLE:`=Portable Apps!
call :ROSE "Portable Apps"

:CLEARPORTABLEAPPS
set db="Winaero Tweaker" "Ultimate Windows Tweaker" SophiApp "Sophia Script" "TCP Optimizer" "DNS Jumper" Autoruns SpeedyFox "CCleaner + CCEnhancer" BleachBit Dism++ "Glary Utilities" "Revo Uninstaller" "Windows Repair AIO" "Windows Repair Toolbox" FixWin "Patch My PC" "UCheck" "Windows Update MiniTool" "WSUS Offline Update" DriversCloud "Snappy Driver Installer" "Driver Store Explorer" "Device Cleanup Tool" "Display Driver Uninstaller" "Radeon Software Slimmer" NVSlimmer NVCleanstall "MSI Util v3" CPU-Z "OOSU10 (Win 10)" "Ashampoo AntiSpy (Win 10)" "DoNotSpy 10" "Windows Privacy Dashboard" "Windows 10 Privacy" "Windows Spy Blocker" "Destroy Windows 10 Spying" Blackbird "ADW Cleaner" "ZHP Cleaner" "Rogue Killer" "No Bot" "Kaspersky KVRT" "Kaspersky TDSSKiller" "Microsoft Safety Scanner" "Spybot - Search and Destroy" "Batch Antivirus" Everything "Process Hacker" CrystalDiskInfo "Defender Control" "Edge Blocker" "Mem Reduct" GiveMePower RegScanner ISLC
call :CLEAR 1 1
if exist "!TMPF!\IS_Log.txt" del /f /q "!TMPF!\IS_Log.txt"

:CONTINUEPORTABLEAPPS
call :SCALE 138 47
echo !CYAN!
echo !\E![59C═════════════════════
echo !\E![58C// !RED!█!BGYELLOW!!BLACK! PORTABLE APPS !RED!█!BGBLACK!!CYAN! \\
echo !\E![8C╔════════════════════════════════════════════════//═════════════════════\\═══════════════════════════════════════════════╗
echo !\E![8C╠════════════■█!BGYELLOW!!RED!█ Tweakers █!BGBLACK!!CYAN!█■════════════╦════════════■█!BGYELLOW!!RED!█ Cleaners █!BGBLACK!!CYAN!█■═════════════╦═══════■█!BGYELLOW!!RED!█ Windows Repairs █!BGBLACK!!CYAN!█■═══════╣
echo !\E![8C║                                        ║                                         ║                                     ║
echo !\E![8C║    !1!Winaero Tweaker!CYAN!               ║    !9!CCleaner + CCEnhancer!CYAN!          ║   !14!Windows Repair AIO!CYAN!         ║
echo !\E![8C║    !2!Ultimate Windows Tweaker!CYAN!      ║   !10!BleachBit!CYAN!                      ║   !15!Windows Repair Toolbox!CYAN!     ║
echo !\E![8C║    !3!SophiApp!CYAN!                      ║   !11!Dism++!CYAN!                         ║   !16!FixWin!CYAN!                     ║
echo !\E![8C║    !4!Sophia Script!CYAN!                 ║   !12!Glary Utilities!CYAN!                ║                                     ║
echo !\E![8C║    !5!TCP Optimizer!CYAN!                 ║   !13!Revo Uninstaller!CYAN!               ║                                     ║
echo !\E![8C║    !6!DNS Jumper!CYAN!                    ║                                         ║                                     ║
echo !\E![8C║    !7!SpeedyFox!CYAN!                     ║                                         ║                                     ║
echo !\E![8C║    !8!Autoruns!CYAN!                      ║                                         ║                                     ║
echo !\E![8C║                                        ║                                         ║                                     ║
echo !\E![8C╠═══════■█!BGYELLOW!!RED!█ Updaters + Drivers █!BGBLACK!!CYAN!█■═══════╬═════════════■█!BGYELLOW!!RED!█ Drivers █!BGBLACK!!CYAN!█■═════════════╬═══════════■█!BGYELLOW!!RED!█ Others █!BGBLACK!!CYAN!█■════════════╣
echo !\E![8C║                                        ║                                         ║                                     ║
echo !\E![8C║   !17!Patch My PC!CYAN!                   ║   !23!Driver Store Explorer!CYAN!          ║   !48!Everything!CYAN!                 ║
echo !\E![8C║   !18!UCheck!CYAN!                        ║   !24!Device Cleanup Tool!CYAN!            ║   !49!Process Hacker!CYAN!             ║
echo !\E![8C║   !19!Windows Update MiniTool!CYAN!       ║   !25!Display Driver Uninstaller!CYAN!     ║   !50!CrystalDiskInfo!CYAN!            ║
echo !\E![8C║   !20!WSUS Offline Update!CYAN!           ║   !26!Radeon Software Slimmer!CYAN!        ║   !51!Defender Control!CYAN!           ║
echo !\E![8C║   !21!DriversCloud!CYAN!                  ║   !27!NVSlimmer!CYAN!                      ║   !52!Edge Blocker!CYAN!               ║
echo !\E![8C║   !22!Snappy Driver Installer!CYAN!       ║   !28!NVCleanstall!CYAN!                   ║   !53!Mem Reduct!CYAN!                 ║
echo !\E![8C║                                        ║   !29!MSI Util v3!CYAN!                    ║   !54!GiveMePower!CYAN!                ║
echo !\E![8C║                                        ║   !30!CPU-Z!CYAN!                          ║   !55!RegScanner!CYAN!                 ║
echo !\E![8C║                                        ║                                         ║   !56!ISLC!CYAN!                       ║
echo !\E![8C╠═══■█!BGYELLOW!!RED!█ Windows Privacy/Telemetry █!BGBLACK!!CYAN!█■════╬════■█!BGYELLOW!!RED!█ Anti Viruses and Malwares █!BGBLACK!!CYAN!█■════╣                                     ║
echo !\E![8C║                                        ║                                         ║                                     ║
echo !\E![8C║   !31!OOSU10 (Win 10)!CYAN!               ║   !39!ADW Cleaner!CYAN!                    ║                                     ║
echo !\E![8C║   !32!Ashampoo AntiSpy (Win 10)!CYAN!     ║   !40!ZHP Cleaner!CYAN!                    ║                                     ║
echo !\E![8C║   !33!DoNotSpy 10!CYAN!                   ║   !41!Rogue Killer!CYAN!                   ║                                     ║
echo !\E![8C║   !34!Windows Privacy Dashboard!CYAN!     ║   !42!No Bot!CYAN!                         ║                                     ║
echo !\E![8C║   !35!Windows 10 Privacy!CYAN!            ║   !43!Kaspersky KVRT!CYAN!                 ║                                     ║
echo !\E![8C║   !36!Windows Spy Blocker!CYAN!           ║   !44!Kaspersky TDSSKiller!CYAN!           ║                                     ║
echo !\E![8C║   !37!Destroy Windows 10 Spying!CYAN!     ║   !45!Microsoft Safety Scanner!CYAN!       ║                                     ║
echo !\E![8C║   !38!BLACKbird!CYAN!                     ║   !46!Spybot - Search and Destroy!CYAN!    ║                                     ║
echo !\E![8C║                                        ║   !47!Batch Antivirus!CYAN!                ║                                     ║
echo !\E![8C║                                        ║                                         ║                                     ║
echo !\E![8C╠════════════════════════════════════════╩═════════════════════════════════════════╩═════════════════════════════════════╣
call :DRAW_CENTER "!YELLOW!57!CYAN!  >  !WHITE!Windows and Office Cracks!CYAN!"
echo !\E![8C╚════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!OPEN!BRIGHTBLACK!" / "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
for /l %%A in (!c1!,1,!c2!) do if "!x!"=="%%A" call :CHECK_INTERNET || (call :ERROR_INTERNET & goto :CONTINUEPORTABLEAPPS)
if "!x!"=="!c3!" goto :WINDOWSANDOFFICE
call :WEBSITECHECK && goto :CONTINUEPORTABLEAPPS
call :CHOOSE open && (call :OPEN_FOLDER Portable_Apps & goto :CONTINUEPORTABLEAPPS)
call :CHOOSE back && goto :MAINMENU
for /l %%A in (!c1!,1,!c2!) do if "!%%A!"=="!YELLOW!%%A !CHECKED!" goto :GOPORTABLEAPPS
call :ERRORMESSAGE
goto :CONTINUEPORTABLEAPPS

:GOPORTABLEAPPS
set IS_Log=1
set Start_Folder=
if "!1!"=="!YELLOW!1 !CHECKED!" call :CURL "Portable_Apps\WinaeroTweaker.7z" "https://winaerotweaker.com/download/winaerotweaker.zip"
if "!2!"=="!YELLOW!2 !CHECKED!" (
if "!WINDOWS_VERSION!"=="10.0" call :CURL "Portable_Apps\Ultimate Windows Tweaker 4.zip" "https://www.thewindowsclub.com/downloads/UWT4.zip"
for %%A in (6.3 6.2) do if "!WINDOWS_VERSION!"=="%%A" call :CURL "Portable_Apps\Ultimate Windows Tweaker 3.zip" "https://www.thewindowsclub.com/downloads/UWT3.zip"
for %%A in (6.1 6.0) do if "!WINDOWS_VERSION!"=="%%A" call :CURL "Portable_Apps\Ultimate Windows Tweaker.zip" "https://www.thewindowsclub.com/downloads/UWT.zip"
if not "!WINDOWS_VERSION:~,2!"=="10" if not "!WINDOWS_VERSION:~,1!"=="6" (
if "!Language!"=="EN" set t="Your Windows version is not supported.!\NL!!\NL!Found more informations here: https://www.thewindowsclub.com/ultimate-windows-tweaker-4-windows-10"
if "!Language!"=="FR" set t="Votre version Windows n'est pas prise en charge.!\NL!!\NL!Trouvé plus d'informations ici: https://www.thewindowsclub.com/ultimate-windows-tweaker-4-windows-10"
call :MSGBOX 69648 "Illegal Services Checker"
)
)
if "!3!"=="!YELLOW!3 !CHECKED!" call :CURL "Portable_Apps\SophiApp.zip" "https://github.com/Sophia-Community/SophiApp/releases/latest/download/SophiApp.zip"
if "!4!"=="!YELLOW!4 !CHECKED!" (
call :CURL "Portable_Apps\Sophia.Script.LTSC.v5.2.14.zip" "https://github.com/farag2/Sophia-Script-for-Windows/releases/download/5.12.3/Sophia.Script.LTSC.v5.2.14.zip"
call :CURL "Portable_Apps\Sophia.Script.v5.12.3.PowerShell.7.zip" "https://github.com/farag2/Sophia-Script-for-Windows/releases/download/5.12.3/Sophia.Script.v5.12.3.PowerShell.7.zip"
call :CURL "Portable_Apps\Sophia.Script.v5.12.3.zip" "https://github.com/farag2/Sophia-Script-for-Windows/releases/download/5.12.3/Sophia.Script.v5.12.3.zip"
call :CURL "Portable_Apps\Sophia.Script.Windows.11.v6.0.4.zip" "https://github.com/farag2/Sophia-Script-for-Windows/releases/download/5.12.3/Sophia.Script.Windows.11.v6.0.4.zip"
call :CURL "Portable_Apps\Sophia.Script.Wrapper.v2.4.zip" "https://github.com/farag2/Sophia-Script-for-Windows/releases/download/5.12.3/Sophia.Script.Wrapper.v2.4.zip"
)
if "!5!"=="!YELLOW!5 !CHECKED!" call :CURL "Portable_Apps\TCPOptimizer.exe" "https://www.speedguide.net/files/TCPOptimizer.exe"
if "!6!"=="!YELLOW!6 !CHECKED!" call :CURL "Portable_Apps\DnsJumper.7z" "`git_raw_downloads`/DnsJumper.7z"
if "!7!"=="!YELLOW!7 !CHECKED!" call :CURL "Portable_Apps\Speedyfox.zip" "https://crystalidea.com/downloads/speedyfox.zip"
if "!8!"=="!YELLOW!8 !CHECKED!" call :CURL "Portable_Apps\Autoruns.zip" "https://download.sysinternals.com/files/Autoruns.zip"
if "!9!"=="!YELLOW!9 !CHECKED!" (
call :CURL "Portable_Apps\CCleaner.zip" "https://download.ccleaner.com/portable/ccsetup587.zip"
call :CURL "Portable_Apps\CCEnhancer Multilingual.zip" "https://singularlabs.com/download/10320/"
)
if "!10!"=="!YELLOW!10 !CHECKED!" call :CURL "Portable_Apps\BleachBit.zip" "https://download.bleachbit.org/BleachBit-4.2.0-portable.zip"
if "!11!"=="!YELLOW!11 !CHECKED!" call :CURL "Portable_Apps\Dism++.zip" "https://github.com/Chuyu-Team/Dism-Multi-language/releases/download/v10.1.1002.1/Dism++10.1.1002.1.zip"
if "!12!"=="!YELLOW!12 !CHECKED!" (
if "!Language!"=="EN" set t="Do you want to crack Glary Utilities ?"
if "!Language!"=="FR" set t="Voulez vous crack Glary Utilities ?"
call :MSGBOX_LEVEL 69668 "Illegal Services Checker"
if "!el!"=="6" (
<nul set /p="3788-6167-9582-6222-6668" | clip
if "!Language!"=="EN" set t="License key copied to your Windows clipboard.!\N!!\N!Paste and register it in Glary Utilities with the username of your choice.!\N!!\N!License key: 3788-6167-9582-6222-6668"
if "!Language!"=="FR" set t="Clé de license copiés dans votre presse-papiers Windows.!\N!!\N!Collez et enregistrez-la dans Glary Utilities avec le nom d'utilisateur de votre choix.!\N!!\N!Clé de license: 3788-6167-9582-6222-6668"
call :MSGBOX 69696 "Illegal Services Checker"
)
call :CURL "Portable_Apps\GlaryUtilities.exe" "https://download.glarysoft.com/guportable.exe"
)
if "!13!"=="!YELLOW!13 !CHECKED!" call :CURL "Portable_Apps\RevoUninstaller.zip" "https://www.revouninstaller.com/download-free-portable.php"
if "!14!"=="!YELLOW!14 !CHECKED!" call :CURL "Portable_Apps\Tweaking.com - Windows Repair.7z" "`git_raw_downloads`/Tweaking.com_-_Windows_Repair.7z"
if "!15!"=="!YELLOW!15 !CHECKED!" call :CURL "Portable_Apps\Windows Repair Toolbox.zip" "https://windows-repair-toolbox.com/files/Windows_Repair_Toolbox.zip"
if "!16!"=="!YELLOW!16 !CHECKED!" (
if "!WINDOWS_VERSION!"=="10.0" call :CURL "Portable_Apps\FixWin10.zip" "https://www.thewindowsclub.com/downloads/FixWin10.zip"
for %%A in (6.3 6.2) do if "!WINDOWS_VERSION!"=="%%A" call :CURL "Portable_Apps\fixwin2.zip" "https://www.thewindowsclub.com/downloads/fixwin2.zip"
for %%A in (6.1 6.0) do if "!WINDOWS_VERSION!"=="%%A" call :CURL "Portable_Apps\FixWin.zip" "https://www.thewindowsclub.com/downloads/FixWin.zip"
if not "!WINDOWS_VERSION:~,2!"=="10" if not "!WINDOWS_VERSION:~,1!"=="6" (
if "!Language!"=="EN" set t="Your Windows version is not supported.!\NL!!\NL!Found more informations here: https://www.thewindowsclub.com/fixwin-for-windows-10"
if "!Language!"=="FR" set t="Votre version Windows n'est pas prise en charge.!\NL!!\NL!Trouvé plus d'informations ici: https://www.thewindowsclub.com/fixwin-for-windows-10"
call :MSGBOX 69648 "Illegal Services Checker"
)
)
if "!17!"=="!YELLOW!17 !CHECKED!" call :CURL "Portable_Apps\PatchMyPC\PatchMyPC.exe" "https://patchmypc.com/freeupdater/PatchMyPC.exe"
if "!18!"=="!YELLOW!18 !CHECKED!" (
if "!ARCH!"=="64" call :CURL "Portable_Apps\UCheck_portable64.exe" "https://download.adlice.com/api/?action=download&app=ucheck&type=x64"
if "!ARCH!"=="86" call :CURL "Portable_Apps\UCheck_portable32.exe" "https://download.adlice.com/api/?action=download&app=ucheck&type=x86"
)
if "!19!"=="!YELLOW!19 !CHECKED!" call :CURL "Portable_Apps\Windows_Update_MiniTool.7z" "`git_raw_downloads`/Windows_Update_MiniTool.7z"
if "!20!"=="!YELLOW!20 !CHECKED!" call :CURL "Portable_Apps\WSUS Offline Update.zip" "https://download.wsusoffline.net/wsusoffline120.zip"
if "!21!"=="!YELLOW!21 !CHECKED!" (
if "!ARCH!"=="64" call :CURL "Portable_Apps\DriversCloud.zip" "https://www.driverscloud.com/plugins/DriversCloudx64_11_0_2_0.zip"
if "!ARCH!"=="86" call :CURL "Portable_Apps\DriversCloud.zip" "https://www.driverscloud.com/plugins/DriversCloud_11_0_2_0.zip"
)
if "!22!"=="!YELLOW!22 !CHECKED!" call :CURL "Portable_Apps\Snappy Driver Installer.zip" "https://sdi-tool.org/releases/SDI_R2102.zip"
if "!23!"=="!YELLOW!23 !CHECKED!" call :CURL "Portable_Apps\Driver Store Explorer.zip" "https://github.com/lostindark/DriverStoreExplorer/releases/download/v0.11.72/DriverStoreExplorer.v0.11.72.zip"
if "!24!"=="!YELLOW!24 !CHECKED!" call :CURL "Portable_Apps\DeviceCleanup.zip" "https://www.uwe-sieber.de/files/DeviceCleanup.zip"
if "!25!"=="!YELLOW!25 !CHECKED!" call :CURL "Portable_Apps\DDU.zip" "https://ftp.nluug.nl/pub/games/PC/guru3d/ddu/%%%%5BGuru3D.com%%%%5D-DDU.zip"
if "!26!"=="!YELLOW!26 !CHECKED!" (
call :CURL "Portable_Apps\RadeonSoftwareSlimmer_1.3.0_net48.zip" "https://github.com/GSDragoon/RadeonSoftwareSlimmer/releases/download/1.3.0/RadeonSoftwareSlimmer_1.3.0_net48.zip"
call :CURL "Portable_Apps\RadeonSoftwareSlimmer_1.3.0_net50.zip" "https://github.com/GSDragoon/RadeonSoftwareSlimmer/releases/download/1.3.0/RadeonSoftwareSlimmer_1.3.0_net50.zip"
call :CURL "Portable_Apps\RadeonSoftwareSlimmer_1.3.0_netcoreapp31.zip" "https://github.com/GSDragoon/RadeonSoftwareSlimmer/releases/download/1.3.0/RadeonSoftwareSlimmer_1.3.0_netcoreapp31.zip"
)
if "!27!"=="!YELLOW!27 !CHECKED!" call :CURL "Portable_Apps\NVSlimmer.zip" "https://ftp.nluug.nl/pub/games/PC/guru3d/nvslimmer/%%%%5BGuru3D.com%%%%5D-NVSlimmer.zip"
if "!28!"=="!YELLOW!28 !CHECKED!" call :CURL "Portable_Apps\NVCleanstall_1.10.0.exe" "https://www.techspot.com/downloads/downloadnow/7246/?evp=99dc9f075f5dc723cda250985ad614d8&file=9654"
if "!29!"=="!YELLOW!29 !CHECKED!" call :CURL "Portable_Apps\MSI_util_v3.exe" "`git_raw_downloads`/MSI_util_v3.exe"
if "!30!"=="!YELLOW!30 !CHECKED!" call :CURL "Portable_Apps\CPU-Z.zip" "https://download.cpuid.com/cpu-z/cpu-z_1.98-en.zip"
if "!31!"=="!YELLOW!31 !CHECKED!" call :CURL "Portable_Apps\OOSU10\OOSU10.exe" "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe"
if "!32!"=="!YELLOW!32 !CHECKED!" call :CURL "Portable_Apps\Ashampoo_AntiSpy\Ashampoo_AntiSpy.exe" "https://cdn1.ashampoo.net/public/ashf/1004/Ashampoo_AntiSpy.exe"
if "!33!"=="!YELLOW!33 !CHECKED!" call :CURL "Portable_Apps\DoNotSpy10.7z" "`git_raw_downloads`/DoNotSpy10.7z"
if "!34!"=="!YELLOW!34 !CHECKED!" call :CURL "Portable_Apps\Windows Privacy Dashboard.zip" "https://wpd.app/get/latest.zip"
if "!38!"=="!YELLOW!35 !CHECKED!" call :CURL "Portable_Apps\W10Privacy.zip" "https://www.w10privacy.de/app/download/12302828636/W10Privacy.zip"
if "!36!"=="!YELLOW!36 !CHECKED!" call :CURL "Portable_Apps\WindowsSpyBlocker\WindowsSpyBlocker.exe" "https://github.com/crazy-max/WindowsSpyBlocker/releases/latest/download/WindowsSpyBlocker.exe"
if "!37!"=="!YELLOW!37 !CHECKED!" (
call :CURL "Portable_Apps\Destroy Windows 10 Spying.zip" "https://github.com/Wohlstand/Destroy-Windows-10-Spying/releases/download/2.2.2.2.27/DWS-build-Win7881-2.2.2.2.27.zip"
call :CURL "Portable_Apps\Destroy Windows 10 Spying RE.zip" "https://github.com/Wohlstand/Destroy-Windows-10-Spying/releases/download/RE-1.0.2.0.23.1/DWS-RE-1.0.2.0.23.zip"
)
if "!38!"=="!YELLOW!38 !CHECKED!" (
if "!ARCH!"=="64" call :CURL "Portable_Apps\Blackbird.zip" "https://getblackbird.net/download/Blackbird_v1.0.80.2_x64.zip"
if "!ARCH!"=="86" call :CURL "Portable_Apps\Blackbird.zip" "https://getblackbird.net/download/Blackbird_v1.0.80.2_x32.zip"
)
if "!39!"=="!YELLOW!39 !CHECKED!" call :CURL "Portable_Apps\AdwCleaner\AdwCleaner.exe" "https://download.toolslib.net/download/direct/1/latest"
if "!40!"=="!YELLOW!40 !CHECKED!" call :CURL "Portable_Apps\ZHPCleaner\ZHPCleaner.exe" "https://nicolascoolman.eu/download/telechargez-zhpcleaner-gratuit/?wpdmdl=23616"
if "!41!"=="!YELLOW!41 !CHECKED!" (
if "!ARCH!"=="64" call :CURL "Portable_Apps\RogueKiller\RogueKiller_portable64.exe" "https://download.adlice.com/api/?action=download&app=roguekiller&type=x64"
if "!ARCH!"=="86" call :CURL "Portable_Apps\RogueKiller\RogueKiller_portable86.exe" "https://download.adlice.com/api/?action=download&app=roguekiller&type=x86"
)
if "!42!"=="!YELLOW!42 !CHECKED!" call :CURL "Portable_Apps\NoBot\NoBot.exe" "https://nobotsecurity.com/Software/NoBot.exe"
if "!43!"=="!YELLOW!43 !CHECKED!" call :CURL "Portable_Apps\KVRT.exe" "https://devbuilds.s.kaspersky-labs.com/devbuilds/KVRT/latest/full/KVRT.exe"
if "!44!"=="!YELLOW!44 !CHECKED!" call :CURL "Portable_Apps\tdsskiller.exe" "https://media.kaspersky.com/utilities/VirusUtilities/EN/tdsskiller.exe"
if "!45!"=="!YELLOW!45 !CHECKED!" (
if "!ARCH!"=="64" call :CURL "Portable_Apps\MSERT.exe" "https://go.microsoft.com/fwlink/?LinkId=212732"
if "!ARCH!"=="86" call :CURL "Portable_Apps\MSERT.exe" "https://go.microsoft.com/fwlink/?LinkId=212733"
)
if "!46!"=="!YELLOW!46 !CHECKED!" call :CURL "Portable_Apps\SpybotPortable_2.7.64-2020-02.paf.exe" "https://download3.portableapps.com/portableapps/SpybotPortable/SpybotPortable_2.8.68.paf.exe"
if "!47!"=="!YELLOW!47 !CHECKED!" call :CURL "Portable_Apps\Batch Antivirus.zip" "https://github.com/anic17/Batch-Antivirus/archive/master.zip"
if "!48!"=="!YELLOW!48 !CHECKED!" (
if "!ARCH!"=="64" call :CURL "Portable_Apps\Everything-x64.zip" "https://www.voidtools.com/Everything-1.4.1.1009.x64.zip"
if "!ARCH!"=="86" call :CURL "Portable_Apps\Everything-x86.zip" "https://www.voidtools.com/Everything-1.4.1.1009.x86.zip"
)
if "!49!"=="!YELLOW!49 !CHECKED!" call :CURL "Portable_Apps\Process Hacker.zip" "https://ci.appveyor.com/api/buildjobs/57bvdicbvxgj0xwq/artifacts/processhacker-3.0.4399-bin.zip"
if "!50!"=="!YELLOW!50 !CHECKED!" call :CURL "Portable_Apps\CrystalDiskInfo.zip" "https://crystalmark.info/redirect.php?product=CrystalDiskInfo"
if "!51!"=="!YELLOW!51 !CHECKED!" call :CURL "Portable_Apps\DefenderControl.zip" "https://www.sordum.org/files/download/d-control/dControl.zip"
if "!52!"=="!YELLOW!52 !CHECKED!" call :CURL "Portable_Apps\EdgeBlocker.zip" "https://www.sordum.org/files/download/edge-blocker/EdgeBlock.zip"
if "!53!"=="!YELLOW!53 !CHECKED!" call :CURL "Portable_Apps\memreduct-3.3.5-bin.zip" "https://github.com/henrypp/memreduct/releases/download/v.3.3.5/memreduct-3.3.5-bin.zip"
if "!54!"=="!YELLOW!54 !CHECKED!" call :CURL "Portable_Apps\GiveMePower v2.1.0.0.exe" "https://www.wagnardsoft.com/DDU/download/GiveMePower%%%%20v2.1.0.0.exe"
if "!55!"=="!YELLOW!55 !CHECKED!" (
if "!ARCH!"=="64" call :CURL "Portable_Apps\regscanner-x64.zip" "https://www.nirsoft.net/utils/regscanner-x64.zip"
if "!ARCH!"=="86" call :CURL "Portable_Apps\regscanner.zip" "https://www.nirsoft.net/utils/regscanner.zip"
)
if "!56!"=="!YELLOW!56 !CHECKED!" call :CURL "Portable_Apps\ISLC v1.0.2.5.exe" "https://www.wagnardsoft.com/ISLC/ISLC%%%%20v1.0.2.5.exe"
set IS_Log=
if exist "!TMPF!\IS_Log.txt" (
echo:
for /f "usebackqtokens=1,*delims=:" %%A in ("!TMPF!\IS_Log.txt") do echo !RED!%%A:!YELLOW!%%B
del /f /q "!TMPF!\IS_Log.txt"
echo !YELLOW!
pause
)
if defined Start_Folder start /max "" "Portable_Apps"
goto :CLEARPORTABLEAPPS

:WINDOWSANDOFFICE
call :SCALE 99 34
title !TITLE:`=Windows and Office Cracks!
call :ROSE "Windows and Office Cracks"

:CLEARWINDOWSANDOFFICE
set db=free.appnee.com/consoleact/ free.appnee.com/aact/ free.appnee.com/ra1n-act1vat0r/ free.appnee.com/re-loader-activator/ free.appnee.com/windows-loader/ free.appnee.com/hwid-gen/ free.appnee.com/w10-digital-license-c-sharp/ free.appnee.com/kmsauto-lite/ free.appnee.com/kmsauto-net/ free.appnee.com/kmsoffline/ free.appnee.com/kmsonline/ github.com/massgravel/Microsoft-Activation-Scripts free.appnee.com/kmsauto-helper/ `www.solidfiles.com/v/QnQeqgqKa3jev `www.solidfiles.com/v/kXqVBML2mmBDA free.appnee.com/msact/ "Windows ISO Downloader" the-eye.eu/public/MSDN/Windows%%207/ tb.rg-adguard.net/public.php free.appnee.com/office-2013-2021-c2r-install/
call :CLEAR 1

:CONTINUEWINDOWSANDOFFICE
call :SCALE 99 34
echo !CYAN!
echo !\E![35C═════════════════════════════════
echo !\E![34C// !RED!█!BGYELLOW!!BLACK! Windows and Office Cracks !RED!█!BGBLACK!!CYAN! \\
echo !\E![6C╔═════════════════════════════════════════════════════════════════════════════════════╗
echo !\E![6C╠════════════■█!BGYELLOW!!RED!█ Activators █!BGBLACK!!CYAN!█■════════════╦══════════════■█!BGYELLOW!!RED!█ Tools █!BGBLACK!!CYAN!█■═══════════════╣
echo !\E![6C║                                          ║                                          ║
echo !\E![6C║    !1!ConsoleAct!CYAN!                      ║   !13!KMSAuto Helper!CYAN!                  ║
echo !\E![6C║    !2!AAct!CYAN!                            ║   !14!KMSCleaner!CYAN!                      ║
echo !\E![6C║    !3!Ra1n Act1vat0r!CYAN!                  ║   !15!WAT Fix!CYAN!                         ║
echo !\E![6C║    !4!Re-Loader Activator!CYAN!             ║   !16!MSAct!CYAN!                           ║
echo !\E![6C║    !5!Windows Loader!CYAN!                  ║                                          ║
echo !\E![6C║    !6!HWID GEN MkVI!CYAN!                   ║                                          ║
echo !\E![6C║    !7!W10 Digital License!CYAN!             ║                                          ║
echo !\E![6C║    !8!KMSAuto Lite!CYAN!                    ║                                          ║
echo !\E![6C║    !9!KMSAuto Net!CYAN!                     ║                                          ║
echo !\E![6C║   !10!KMSoffline!CYAN!                      ║                                          ║
echo !\E![6C║   !11!KMSonline!CYAN!                       ║                                          ║
echo !\E![6C║   !12!Microsoft Activation Scripts!CYAN!    ║                                          ║
echo !\E![6C║                                          ║                                          ║
echo !\E![6C╠══════════════════════════════════════════╩══════════════════════════════════════════╣
echo !\E![6C╠═══════════════════════════════■█!BGYELLOW!!RED!█ ISO Downloaders █!BGBLACK!!CYAN!█■═══════════════════════════════╣
echo !\E![6C║                                                                                     ║
echo !\E![6C║                          !17!Windows ISO Downloader!CYAN!                              ║
echo !\E![6C║                          !18!the-eye.eu!CYAN!                                          ║
echo !\E![6C║                          !19!rg-adguard.net!CYAN!                                      ║
echo !\E![6C║                          !20!Office 2013-2019 C2R Install!CYAN!                        ║
echo !\E![6C║                                                                                     ║
echo !\E![6C╚═════════════════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!OPEN!BRIGHTBLACK!" / "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEWINDOWSANDOFFICE
call :CHOOSE open && (call :OPEN_FOLDER Portable_Apps & goto :CONTINUEWINDOWSANDOFFICE)
call :CHOOSE back && goto :PORTABLEAPPS
call :WEBSITESTART && goto :CLEARWINDOWSANDOFFICE
call :ERRORMESSAGE
goto :CONTINUEWINDOWSANDOFFICE

:MOREFEATURES
call :SCALE 62 23
title !TITLE:`=More Features!
call :ROSE "More Features"

:CONTINUEMOREFEATURES
call :SCALE 62 23
echo !CYAN!
echo !\E![20C═════════════════════
echo !\E![19C// !RED!█!BGYELLOW!!BLACK! MORE FEATURES !RED!█!BGBLACK!!CYAN! \\
echo !\E![11C╔═════════════════════════════════════╗
echo !\E![11C║                                     ║
echo !\E![11C║    !YELLOW!1 !WHITE!Warez Content Creator!CYAN!          ║
echo !\E![11C║    !YELLOW!2 !WHITE!Warez Wikis!CYAN!                    ║
echo !\E![11C║    !YELLOW!3 !WHITE!Release Logs!CYAN!                   ║
echo !\E![11C║    !YELLOW!4 !WHITE!Ebooks!CYAN!                         ║
echo !\E![11C║    !YELLOW!5 !WHITE!Musics!CYAN!                         ║
echo !\E![11C║    !YELLOW!6 !WHITE!Forum Websites!CYAN!                 ║
echo !\E![11C║    !YELLOW!7 !WHITE!Windows Repair!CYAN!                 ║
echo !\E![11C║    !YELLOW!8 !WHITE!Windows Tweaks!CYAN!                 ║
echo !\E![11C║    !YELLOW!9 !WHITE!Windows Game Booster!CYAN!           ║
echo !\E![11C║   !YELLOW!10 !WHITE!Spoofing!CYAN!                       ║
echo !\E![11C║                                     ║
echo !\E![11C╚═════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!OPEN!BRIGHTBLACK!" / "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
set cn=
for %%A in (WAREZCONTENTCREATOR WAREZWIKIS RELEASELOGS EBOOKS MUSICS FORUMWEBSITES WINDOWSREPAIR WINDOWSTWEAKS WINDOWSGAMEBOOSTER SPOOFING) do (
set /a cn+=1
if "!x!"=="!cn!" goto :%%A
)
call :CHOOSE open && (call :OPEN_FOLDER Portable_Apps & goto :CONTINUEMOREFEATURES)
call :CHOOSE back && goto :MAINMENU
call :ERRORMESSAGE
goto :CONTINUEMOREFEATURES

:WAREZCONTENTCREATOR
call :SCALE 69 22
title !TITLE:`=Warez Content Creator!
call :ROSE "Warez Content Creator"

:CLEARWAREZCONTENTCREATOR
set db="Mkv Tool Nix" FFmpeg LosslessCut HandBrake "Subtitle !DEBUG!Editor" CCExtractor "VLC Media Player" MediaInfo "Open Broadcaster Software"
call :CLEAR 1

:CONTINUEWAREZCONTENTCREATOR
call :SCALE 69 22
echo !CYAN!
echo !\E![20C═════════════════════════════
echo !\E![19C// !RED!█!BGYELLOW!!BLACK! WAREZ CONTENT CREATOR !RED!█!BGBLACK!!CYAN! \\
echo !\E![5C╔═════════════════════════════════════════════════════════╗
echo !\E![5C║                                                         ║
echo !\E![5C║    !1!Mkv Tool Nix !GREEN!(.mkv Video Editing)!CYAN!              ║
echo !\E![5C║    !2!FFmpeg !GREEN!(Video/Audio Editing)!CYAN!                   ║
echo !\E![5C║    !3!LosslessCut !GREEN!(Video/Audio Editing)!CYAN!              ║
echo !\E![5C║    !4!HandBrake !GREEN!(Video Transcoder)!CYAN!                   ║
echo !\E![5C║    !5!Subtitle !DEBUG!Editor !GREEN!(Subtitle !DEBUG!Editor)!CYAN!              ║
echo !\E![5C║    !6!CCExtractor !GREEN!(Subtitle !DEBUG!Extractor)!CYAN!               ║
echo !\E![5C║    !7!VLC Media Player !GREEN!(Multimedia Player)!CYAN!           ║
echo !\E![5C║    !8!MediaInfo !GREEN!(Digital Media Analysis)!CYAN!             ║
echo !\E![5C║    !9!Open Broadcaster Software !GREEN!(Screen Recorder)!CYAN!    ║
echo !\E![5C║                                                         ║
echo !\E![5C╚═════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEWAREZCONTENTCREATOR
call :CHOOSE back && goto :MOREFEATURES
if not defined x for /l %%A in (!c1!,1,!c2!) do if "!%%A!"=="!YELLOW!%%A !CHECKED!" goto :GOWAREZCONTENTCREATOR
call :ERRORMESSAGE
goto :CONTINUEWAREZCONTENTCREATOR

:GOWAREZCONTENTCREATOR
if "!1!"=="!YELLOW!1 !CHECKED!" start "" "https://mkvtoolnix.download/" && cmdwiz.exe delay 1500
if "!2!"=="!YELLOW!2 !CHECKED!" start "" "https://ffmpeg.org/" && cmdwiz.exe delay 1500
if "!3!"=="!YELLOW!3 !CHECKED!" start "" "https://mifi.github.io/lossless-cut/" && cmdwiz.exe delay 1500
if "!4!"=="!YELLOW!4 !CHECKED!" start "" "https://handbrake.fr/" && cmdwiz.exe delay 1500
if "!5!"=="!YELLOW!5 !CHECKED!" start "" "https://www.nikse.dk/SubtitleEdit" && cmdwiz.exe delay 1500
if "!6!"=="!YELLOW!6 !CHECKED!" start "" "https://ccextractor.org/" && cmdwiz.exe delay 1500
if "!7!"=="!YELLOW!7 !CHECKED!" start "" "https://www.videolan.org/vlc/" && cmdwiz.exe delay 1500
if "!8!"=="!YELLOW!8 !CHECKED!" start "" "https://mediaarea.net/en/MediaInfo" && cmdwiz.exe delay 1500
if "!9!"=="!YELLOW!9 !CHECKED!" start "" "https://obsproject.com/"
goto :CLEARWAREZCONTENTCREATOR

:WAREZWIKIS
call :SCALE 76 34
title !TITLE:`=Warez Wikis!
call :ROSE "Warez Wikis"

:CLEARWAREZWIKIS
set db=weboas.is/ dirtywarez.org/ link-base.org/warez p2pfr.com/ www.mega-p2p.net/ lewebde.com/ `machicoulis.over-blog.com/2019/11/les-bons-liens-pour-telecharger.html www.reddit.com/r/Piracy/wiki/megathread www.reddit.com/r/FREEMEDIAHECKYEAH/wiki/index rentry.org/SoftwarePirates-Megathread rentry.org/pgames-mega-thread github.com/Igglybuff/awesome-piracy/blob/master/readme.md github.com/nbats/FMHY/blob/main/fmhy.md github.com/Rekulous/FMHY/blob/main/fmhy.md github.com/Rekulous/The-Piratez-List/blob/main/The%%20Safe%%20Shores/Software.md github.com/taskylizard/piratedgames-megathread/blob/main/README.md github.com/Rekulous/PiratedGames/blob/main/README.md darknetlive.com/onions/ dark.fail/ ddosforhire.net/ piracy.moe/
call :CLEAR 1

:CONTINUEWAREZWIKIS
call :SCALE 76 34
echo !CYAN!
echo !\E![28C═══════════════════
echo !\E![27C// !RED!█!BGYELLOW!!BLACK! WAREZ WIKIS !RED!█!BGBLACK!!CYAN! \\
echo !\E![6C╔══════════════════════════════════════════════════════════════╗
echo !\E![6C║                                                              ║
echo !\E![6C║    !1!weboas.is!CYAN!                                           ║
echo !\E![6C║    !2!dirtywarez.org!CYAN!                                      ║
echo !\E![6C║    !3!link-base.org!CYAN!                                       ║
echo !\E![6C║    !4!p2pfr.com !GREEN![FR]!CYAN!                                      ║
echo !\E![6C║    !5!www.mega-p2p.net !GREEN![FR]!CYAN!                               ║
echo !\E![6C║    !6!lewebde.com !GREEN![FR]!CYAN!                                    ║
echo !\E![6C║    !7!machicoulis.over-blog.com !GREEN![FR]!CYAN!                      ║
echo !\E![6C║    !8!r/Piracy!CYAN!                                            ║
echo !\E![6C║    !9!r/FREEMEDIAHECKYEAH!CYAN!                                 ║
echo !\E![6C║   !10!r/SoftwarePirates!CYAN!                                   ║
echo !\E![6C║   !11!r/pgames-mega-thread!CYAN!                                ║
echo !\E![6C║   !12!Igglybuff/awesome-piracy!CYAN!                            ║
echo !\E![6C║   !13!nbats/FMHY!CYAN!                                          ║
echo !\E![6C║   !14!Rekulous/FMHY!CYAN!                                       ║
echo !\E![6C║   !15!taskylizard/piratedgames-megathread !GREEN!(videogames)!CYAN!    ║
echo !\E![6C║   !16!Rekulous/Pirated-Games !GREEN!(videogames)!CYAN!                 ║
echo !\E![6C║   !17!Rekulous/The-Piratez-list !GREEN!(softwares)!CYAN!               ║
echo !\E![6C║   !18!darknetlive.com !GREEN!(darknet)!CYAN!                           ║
echo !\E![6C║   !19!dark.fail !GREEN!(darknet)!CYAN!                                 ║
echo !\E![6C║   !20!ddosforhire.net !GREEN!(DDoS)!CYAN!                              ║
echo !\E![6C║   !21!piracy.moe !GREEN!(animes)!CYAN!                                 ║
echo !\E![6C║                                                              ║
echo !\E![6C╚══════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEWAREZWIKIS
call :CHOOSE back && goto :MOREFEATURES
call :WEBSITESTART && goto :CLEARWAREZWIKIS
call :ERRORMESSAGE
goto :CONTINUEWAREZWIKIS

:RELEASELOGS
call :SCALE 66 23
title !TITLE:`=Release Logs!
call :ROSE "Release Logs"

:CLEARRELEASELOGS
set db=predb.ovh/ predb.me/ corrupt-net.org/ m2v.ru/ www.xrel.to/ forum.squawkr.io/ upawg.ca/ nzbindex.com/ binsearch.info/ www.reddit.com/r/CrackWatch/
call :CLEAR 1

:CONTINUERELEASELOGS
call :SCALE 66 23
echo !CYAN!
echo !\E![22C════════════════════
echo !\E![21C// !RED!█!BGYELLOW!!BLACK! Release Logs !RED!█!BGBLACK!!CYAN! \\
echo !\E![12C╔═══════════════════════════════════════╗
echo !\E![12C║                                       ║
echo !\E![12C║    !1!predb.ovh!CYAN!                    ║
echo !\E![12C║    !2!predb.me!CYAN!                     ║
echo !\E![12C║    !3!corrupt-net.org!CYAN!              ║
echo !\E![12C║    !4!m2v.ru!CYAN!                       ║
echo !\E![12C║    !5!www.xrel.to !GREEN![DE]!CYAN!             ║
echo !\E![12C║    !6!forum.squawkr.io !GREEN!(movies)!CYAN!    ║
echo !\E![12C║    !7!upawg.ca !GREEN!(audio)!CYAN!             ║
echo !\E![12C║    !8!nzbindex.com !GREEN!(NZB)!CYAN!           ║
echo !\E![12C║    !9!binsearch.info !GREEN!(NZB)!CYAN!         ║
echo !\E![12C║   !10!r/CrackWatch !GREEN!(videogames)!CYAN!    ║
echo !\E![12C║                                       ║
echo !\E![12C╚═══════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" / !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUERELEASELOGS
call :CHOOSE back && goto :MOREFEATURES
call :CHOOSE search && (call :IS_SEARCH 25be77c4b1e53f006 & goto :CONTINUERELEASELOGS)
call :WEBSITESTART && goto :CLEARRELEASELOGS
call :ERRORMESSAGE
goto :CONTINUERELEASELOGS

:EBOOKS
call :SCALE 103 62
title !TITLE:`=Ebooks!
call :ROSE Ebooks

:CLEAREBOOKS
set db=z-lib.org/ www.pdfdrive.com/ english-bookys.com/ `bookddl.com/ zone-ebook.com/ ww2.bookys-ebooks.com/ `ebook-planete.org/ planete-bd.org/ dbfree.me/ pdf.1001ebooks.com/ www.pdf-ebookys.com/ downmagaz.net/ magazinelib.com/ telecharge-magazines.com/ fr.downmagaz.net/ allanime.site/manga mangaowl.net/ mangareader.to/ www.mangago.me/ mangadex.org/ manganato.com/ mangaplus.shueisha.co.jp/updates fascans.com/ mangakatana.com/ manga4life.com/ bato.to/ mangapark.net/ www.mangahere.cc/ fanfox.net/ wuxiaworld.site/ hatigarmscanz.net/home leviatanscans.com/cd/ the-nonames.com/home lynxscans.com/home skscans.com/ zeroscans.com/home reader.deathtollscans.net/ reader.kireicake.com/ sensescans.com/ manhuaplus.com/ readm.org/ mangasee123.com/ www.asurascans.com/ naniscans.com/ merakiscans.com/ mangajar.com/ toonily.net/ www.nonstopscans.com/ guya.moe/ mangahub.io/ comick.fun/ www.japanread.cc/ catmanga.org/ mangasushi.net/ arangscans.com/ hunlight-scans.info/home tritinia.com/ readmanhua.net/manga/ flamescans.org/ immortalupdates.com/ manga347.com/ www.bilibilicomics.com/ www.mangatown.com/ www.mangahome.com/ manga47.net/ comix.top/ reaperscans.com/ www.readlightnovel.me/ www.rndnovels.com/ www.justlightnovels.com/ rektnovelcompilations.wordpress.com/ henkanepubs.wordpress.com/ reaperscans.fr/ scantrad.net/ kangaryu-team.fr/ www.japscan.ws/ www.scan-fr.cc/ lelscan-vf.co/ mangas.heoo.workers.dev/0:/ lectortmo.com/ github.com/MALSync/MALSync/blob/master/pages.md
call :CLEAR 1

:CONTINUEEBOOKS
call :SCALE 103 62
echo !CYAN!
echo !\E![42C══════════════
echo !\E![41C// !RED!█!BGYELLOW!!BLACK! Ebooks !RED!█!BGBLACK!!CYAN! \\
echo !\E![6C╔═════════════════════════════════════════════════════════════════════════════════════════╗
echo !\E![6C║                                                                                         ║
echo !\E![6C║    !1!z-lib.org!CYAN!                      │   !7!ebook-planete.org !GREEN![FR]!CYAN!                ║
echo !\E![6C║    !2!www.pdfdrive.com!CYAN!               │   !8!planete-bd.org !GREEN![FR]!CYAN!                   ║
echo !\E![6C║    !3!english-bookys.com!CYAN!             │   !9!dbfree.me !GREEN![FR]!CYAN!                        ║
echo !\E![6C║    !4!bookddl.com !GREEN![FR]!CYAN!               │  !10!pdf.1001ebooks.com !GREEN![FR]!CYAN!               ║
echo !\E![6C║    !5!zone-ebook.com !GREEN![FR]!CYAN!            │  !11!www.pdf-ebookys.com !GREEN![FR]!CYAN!              ║
echo !\E![6C║    !6!ww2.bookys-ebooks.com !GREEN![FR]!CYAN!     │                                               ║
echo !\E![6C║                                                                                         ║
echo !\E![6C╠═════════════════════════════════■█!BGYELLOW!!RED!█ MAGAZINES █!BGBLACK!!CYAN!█■═══════════════════════════════════════╣
echo !\E![6C║                                                                                         ║
echo !\E![6C║   !12!downmagaz.net!CYAN!                  │   !14!telecharge-magazines.com !GREEN![FR]!CYAN!        ║
echo !\E![6C║   !13!magazinelib.com!CYAN!                │   !15!fr.downmagaz.net !GREEN![FR]!CYAN!                ║
echo !\E![6C║                                                                                         ║
echo !\E![6C╠═══════════════════════════════════■█!BGYELLOW!!RED!█ MANGAS █!BGBLACK!!CYAN!█■════════════════════════════════════════╣
echo !\E![6C║                                                                                         ║
echo !\E![6C║   !16!allanime.site!CYAN!                  │   !49!guya.moe!CYAN!                             ║
echo !\E![6C║   !17!mangaowl.net!CYAN!                   │   !50!mangahub.io!CYAN!                          ║
echo !\E![6C║   !18!mangareader.to!CYAN!                 │   !51!comick.fun!CYAN!                           ║
echo !\E![6C║   !19!www.mangago.me!CYAN!                 │   !52!www.japanread.cc!CYAN!                     ║
echo !\E![6C║   !20!mangadex.org!CYAN!                   │   !53!catmanga.org!CYAN!                         ║
echo !\E![6C║   !21!manganato.com!CYAN!                  │   !54!mangasushi.net!CYAN!                       ║
echo !\E![6C║   !22!mangaplus.shueisha.co.jp!CYAN!       │   !55!arangscans.com!CYAN!                       ║
echo !\E![6C║   !23!fascans.com!CYAN!                    │   !56!hunlight-scans.info!CYAN!                  ║
echo !\E![6C║   !24!mangakatana.com!CYAN!                │   !57!tritinia.com!CYAN!                         ║
echo !\E![6C║   !25!manga4life.com!CYAN!                 │   !58!readmanhua.net!CYAN!                       ║
echo !\E![6C║   !26!bato.to!CYAN!                        │   !59!flamescans.org!CYAN!                       ║
echo !\E![6C║   !27!mangapark.net!CYAN!                  │   !60!immortalupdates.com!CYAN!                  ║
echo !\E![6C║   !28!www.mangahere.cc!CYAN!               │   !61!manga347.com!CYAN!                         ║
echo !\E![6C║   !29!fanfox.net!CYAN!                     │   !62!www.bilibilicomics.com!CYAN!               ║
echo !\E![6C║   !30!wuxiaworld.site!CYAN!                │   !63!www.mangatown.com!CYAN!                    ║
echo !\E![6C║   !31!hatigarmscanz.net!CYAN!              │   !64!www.mangahome.com!CYAN!                    ║
echo !\E![6C║   !32!leviatanscans.com!CYAN!              │   !65!manga47.net!CYAN!                          ║
echo !\E![6C║   !33!the-nonames.com!CYAN!                │   !66!comix.top!CYAN!                            ║
echo !\E![6C║   !34!lynxscans.com!CYAN!                  │   !67!reaperscans.com!CYAN!                      ║
echo !\E![6C║   !35!skscans.com!CYAN!                    │   !68!www.readlightnovel.me!CYAN!                ║
echo !\E![6C║   !36!zeroscans.com!CYAN!                  │   !69!www.rndnovels.com!CYAN!                    ║
echo !\E![6C║   !37!reader.deathtollscans.net!CYAN!      │   !70!www.justlightnovels.com!CYAN!              ║
echo !\E![6C║   !38!reader.kireicake.com!CYAN!           │   !71!rektnovelcompilations.wordpress.com!CYAN!  ║
echo !\E![6C║   !39!sensescans.com!CYAN!                 │   !72!henkanepubs.wordpress.com!CYAN!            ║
echo !\E![6C║   !40!manhuaplus.com!CYAN!                 │   !73!reaperscans.fr !GREEN![FR]!CYAN!                  ║
echo !\E![6C║   !41!readm.org!CYAN!                      │   !74!scantrad.net !GREEN![FR]!CYAN!                    ║
echo !\E![6C║   !42!mangasee123.com!CYAN!                │   !75!kangaryu-team.fr !GREEN![FR]!CYAN!                ║
echo !\E![6C║   !43!www.asurascans.com!CYAN!             │   !76!www.japscan.ws !GREEN![FR]!CYAN!                  ║
echo !\E![6C║   !44!naniscans.com!CYAN!                  │   !77!www.scan-fr.cc !GREEN![FR]!CYAN!                  ║
echo !\E![6C║   !45!merakiscans.com!CYAN!                │   !78!lelscan-vf.co !GREEN![FR]!CYAN!                   ║
echo !\E![6C║   !46!mangajar.com!CYAN!                   │   !79!mangas.heoo.workers.dev !GREEN![FR]!CYAN!         ║
echo !\E![6C║   !47!toonily.net!CYAN!                    │   !80!lectortmo.com !GREEN![ES]!CYAN!                   ║
echo !\E![6C║   !48!www.nonstopscans.com!CYAN!           │                                               ║
echo !\E![6C║                                                                                         ║
if "!Language!"=="EN" echo !\E![6C║                     !BRIGHTMAGENTA!Alternatively you can visit: !81!MALSync!CYAN!                         ║
if "!Language!"=="FR" echo !\E![6C║                 !BRIGHTMAGENTA!Alternativement vous pouvez visiter: !81!MALSync!CYAN!                     ║
echo !\E![6C║                                                                                         ║
echo !\E![6C╚═════════════════════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" / !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEEBOOKS
call :CHOOSE back && goto :MOREFEATURES
call :CHOOSE search && (call :IS_SEARCH 6777a3e064386f381 & goto :CONTINUEEBOOKS)
call :WEBSITESTART && goto :CLEAREBOOKS
call :ERRORMESSAGE
goto :CONTINUEEBOOKS

:MUSICS
call :SCALE 68 29
title !TITLE:`=Musics!
call :ROSE Musics

:CLEARMUSICS
set db=flacmusic.info/ losslessma.net/ muxiv.net/ slider.kz/ www.reddit.com/r/riprequests/ downloads.khinsider.com/ www.vgmusic.com/ allanime.site/music hikarinoakari.com/ freshremix.ru/ www.slsknet.org/news/ deemix.app/ freezer.life/
call :CLEAR 1

:CONTINUEMUSICS
call :SCALE 68 29
echo !CYAN!
echo !\E![27C══════════════
echo !\E![26C// !RED!█!BGYELLOW!!BLACK! Musics !RED!█!BGBLACK!!CYAN! \\
echo !\E![8C╔══════════════════════════════════════════════════╗
echo !\E![8C║                                                  ║
echo !\E![8C║    !1!flacmusic.info!CYAN!                          ║
echo !\E![8C║    !2!losslessma.net!CYAN!                          ║
echo !\E![8C║    !3!muxiv.net!CYAN!                               ║
echo !\E![8C║    !4!slider.kz!CYAN!                               ║
echo !\E![8C║    !5!r/riprequests!CYAN!                           ║
echo !\E![8C║    !6!downloads.khinsider.com !GREEN!(videogames)!CYAN!    ║
echo !\E![8C║    !7!www.vgmusic.com !GREEN!(videogames)!CYAN!            ║
echo !\E![8C║    !8!allanime.site !GREEN!(animes)!CYAN!                  ║
echo !\E![8C║    !9!hikarinoakari.com !GREEN!(animes)!CYAN!              ║
echo !\E![8C║   !10!freshremix.ru !GREEN!(remixes)!CYAN!                 ║
echo !\E![8C║                                                  ║
echo !\E![8C╠════════════■█!BGYELLOW!!RED!█ Music Applications █!BGBLACK!!CYAN!█■════════════╣
echo !\E![8C║                                                  ║
echo !\E![8C║   !11!www.slsknet.org!CYAN!                         ║
echo !\E![8C║   !12!deemix.app!CYAN!                              ║
echo !\E![8C║   !13!freezer.life!CYAN!                            ║
echo !\E![8C║                                                  ║
echo !\E![8C╚══════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" / !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEMUSICS
call :CHOOSE back && goto :MOREFEATURES
call :CHOOSE search && (call :IS_SEARCH 77345bf220e8f0c91 & goto :CONTINUEMUSICS)
call :WEBSITESTART && goto :CLEARMUSICS
call :ERRORMESSAGE
goto :CONTINUEMUSICS

:FORUMWEBSITES
call :SCALE 126 38
title !TITLE:`=Forum Websites!
call :ROSE "Forum Websites"

:CLEARFORUMWEBSITES
set db=www.adit-hd.com/ forum.ddlvalley.me/ www.warezheaven.com/index.php fora.snahp.eu/ www.mywarez.org/ ddlbase.net/ forumpoint.org/ wawa-rammstein.de/index.php starwarez-sharing.name/Fofo/ `forum.anime-ultime.net/phpBB3/index.php pirates-forum.org/ eztv.re/forum/ forums.glodls.to/ torrentgalaxy.to/forums.php www.ettvcentral.com/forums.php forums.anidex.moe/ prostylex.org/forums.php/ angietorrents.cc/forum/index.php forum.p2pfr.com/ www.tigers-dl.net/ www.forumzt.com/ www.frboard.com/ rutracker.org/forum/index.php forum.mobilism.me/ forum.release-apk.com/ platinmods.com/ forum.telecharger-jeuxpc.fr/ tapochek.net/ forum.repack.me/ planete-warez.net/ www.nulled.to/ raidforums.com/ hackforums.net/ cracked.to/ payload.sh/ mailaccess.top/ teamos-hkrg.com/ forum.ru-board.com/
call :CLEAR 1

:CONTINUEFORUMWEBSITES
call :SCALE 126 38
echo !CYAN!
echo !\E![51C══════════════════════
echo !\E![50C// !RED!█!BGYELLOW!!BLACK! FORUM WEBSITES !RED!█!BGBLACK!!CYAN! \\
echo !\E![7C╔═════════════════════════════════════════//══════════════════════\\═══════════════════════════════════════════╗
echo !\E![7C╠═══════════════════════════════════════════════■█!BGYELLOW!!RED!█ Warez █!BGBLACK!!CYAN!█■══════════════════════════════════════════════════╣
echo !\E![7C║                                                                                                              ║
echo !\E![7C║    !1!www.adit-hd.com        !GREEN!DDL        [EN]!CYAN!    │   !16!forums.anidex.moe           !GREEN!Torrenting [EN]!CYAN!    ║
echo !\E![7C║    !2!forum.ddlvalley.me     !GREEN!DDL        [EN]!CYAN!    │   !17!prostylex.org               !GREEN!Torrenting [EN]!CYAN!    ║
echo !\E![7C║    !3!www.warezheaven.com    !GREEN!DDL        [EN]!CYAN!    │   !18!angietorrents.cc            !GREEN!Torrenting [EN]!CYAN!    ║
echo !\E![7C║    !4!fora.snahp.eu          !GREEN!DDL        [EN]!CYAN!    │   !19!forum.p2pfr.com             !GREEN!Torrenting [FR]!CYAN!    ║
echo !\E![7C║    !5!www.mywarez.org        !GREEN!DDL        [EN]!CYAN!    │   !20!www.tigers-dl.net           !GREEN!Torrenting [FR]!CYAN!    ║
echo !\E![7C║    !6!ddlbase.net            !GREEN!DDL        [EN]!CYAN!    │   !21!www.forumzt.com             !GREEN!Torrenting [FR]!CYAN!    ║
echo !\E![7C║    !7!forumpoint.org         !GREEN!DDL        [EN]!CYAN!    │   !22!www.frboard.com             !GREEN!Torrenting [FR]!CYAN!    ║
echo !\E![7C║    !8!www.wawa-rammstein.de  !GREEN!DDL        [EN]!CYAN!    │   !23!rutracker.org               !GREEN!Torrenting [RU]!CYAN!    ║
echo !\E![7C║    !9!starwarez-sharing.name !GREEN!DDL        [FR]!CYAN!    │   !24!forum.mobilism.me           !GREEN!Cracking   [EN]!CYAN!    ║
echo !\E![7C║   !10!forum.anime-ultime.net !GREEN!Streaming  [FR]!CYAN!    │   !25!forum.release-apk.com       !GREEN!Cracking   [EN]!CYAN!    ║
echo !\E![7C║   !11!pirates-forum.org      !GREEN!Torrenting [EN]!CYAN!    │   !26!platinmods.com              !GREEN!Cracking   [EN]!CYAN!    ║
echo !\E![7C║   !12!eztv.re                !GREEN!Torrenting [EN]!CYAN!    │   !27!forum.telecharger-jeuxpc.fr !GREEN!Cracking   [FR]!CYAN!    ║
echo !\E![7C║   !13!forums.glodls.to       !GREEN!Torrenting [EN]!CYAN!    │   !28!tapochek.net                !GREEN!Cracking   [RU]!CYAN!    ║
echo !\E![7C║   !14!torrentgalaxy.to       !GREEN!Torrenting [EN]!CYAN!    │   !29!forum.repack.me             !GREEN!Cracking   [RU]!CYAN!    ║
echo !\E![7C║   !15!www.ettvcentral.com    !green!Torrenting [EN]!CYAN!    │   !30!planete-warez.net           !GREEN!Warez      [FR]!CYAN!    ║
echo !\E![7C║                                                                                                              ║
echo !\E![7C╠══════════════════■█!BGYELLOW!!RED!█ Hacking █!BGBLACK!!CYAN!█■═══════════════════╦═════════════════════■█!BGYELLOW!!RED!█ Others █!BGBLACK!!CYAN!█■══════════════════════╣
echo !\E![7C║                                                    ║                                                         ║
echo !\E![7C║   !31!www.nulled.to  !GREEN![EN]!CYAN!                       ║   !37!teamos-hkrg.com    !GREEN![EN]!CYAN!                        ║
echo !\E![7C║   !32!raidforums.com !GREEN![EN]!CYAN!                       ║   !38!forum.ru-board.com !GREEN![RU]!CYAN!                        ║
echo !\E![7C║   !33!hackforums.net !GREEN![EN]!CYAN!                       ║                                                         ║
echo !\E![7C║   !34!cracked.to     !GREEN![EN]!CYAN!                       ║                                                         ║
echo !\E![7C║   !35!payload.sh     !GREEN![EN]!CYAN!                       ║                                                         ║
echo !\E![7C║   !36!mailaccess.top !GREEN![EN]!CYAN!                       ║                                                         ║
echo !\E![7C║                                                    ║                                                         ║
echo !\E![7C╚════════════════════════════════════════════════════╩═════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEFORUMWEBSITES
call :CHOOSE back && goto :MOREFEATURES
call :WEBSITESTART && goto :CLEARFORUMWEBSITES
call :ERRORMESSAGE
goto :CONTINUEFORUMWEBSITES

:WINDOWSREPAIR
call :SCALE 70 26
title !TITLE:`=Windows Repair!
call :ROSE "Windows Repair"

:CONTINUEWINDOWSREPAIR
call :SCALE 70 26
title !TITLE:`=Windows Repair!
echo !CYAN!
echo !\E![26C══════════════════════
echo !\E![25C// !RED!█!BGYELLOW!!BLACK! WINDOWS REPAIR !RED!█!BGBLACK!!CYAN! \\
echo !\E![16C╔═══════════════════════════════════════╗
echo !\E![16C╠════════■█!BGYELLOW!!RED!█ General Repairs █!BGBLACK!!CYAN!█■════════╣
echo !\E![16C║                                       ║
echo !\E![16C║      !YELLOW!1!WHITE! System File Checker Utility!CYAN!    ║
echo !\E![16C║      !YELLOW!2!WHITE! Repair Windows System Image!CYAN!    ║
echo !\E![16C║      !YELLOW!3!WHITE! Check Disk!CYAN!                     ║
echo !\E![16C║      !YELLOW!4!WHITE! Re-Register Store Apps!CYAN!         ║
echo !\E![16C║                                       ║
echo !\E![16C╠═══════■█!BGYELLOW!!RED!█ Specified Repairs █!BGBLACK!!CYAN!█■═══════╣
echo !\E![16C║                                       ║
echo !\E![16C║      !YELLOW!5!WHITE! Windows Store!CYAN!                  ║
echo !\E![16C║      !YELLOW!6!WHITE! Xbox Game!CYAN!                      ║
echo !\E![16C║      !YELLOW!7!WHITE! Push Notifications!CYAN!             ║
echo !\E![16C║      !YELLOW!8!WHITE! Wifi Hotspot!CYAN!                   ║
echo !\E![16C║      !YELLOW!9!WHITE! Clipboard History!CYAN!              ║
echo !\E![16C║     !YELLOW!10!WHITE! Background Apps!CYAN!                ║
echo !\E![16C╚═══════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
if "!x!"=="1" start cmd /c sfc /ScanNow ^& pause ^& exit
if "!x!"=="2" start cmd /c Dism /Online /Cleanup-Image /RestoreHealth ^& pause ^& exit
if "!x!"=="3" start cmd /c chkdsk !SystemDrive! /F /R ^& pause ^& exit
if "!x!"=="4" for %%A in (10.0 6.3) do if "!WINDOWS_VERSION!"=="%%A" (2>nul powershell -ExecutionPolicy Unrestricted Get-AppXPackage -AllUsers ^| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"$($_.InstallLocation)\AppXManifest.xml\"} & goto :CONTINUEWINDOWSREPAIR) else (call :ERROR_WINDOWS_VERSION & goto :CONTINUEWINDOWSREPAIR)
if "!x!"=="5" for %%A in (10.0 6.3) do if "!WINDOWS_VERSION!"=="%%A" (goto :REPAIR_WINDOWS_STORE) else (call :ERROR_WINDOWS_VERSION & goto :CONTINUEWINDOWSREPAIR)
if "!x!"=="6" if "!WINDOWS_VERSION!"=="10.0" (goto :REPAIR_XBOX_GAME) else call :ERROR_WINDOWS_VERSION
if "!x!"=="7" goto :REPAIR_PUSH_NOTIFICATIONS
if "!x!"=="8" if "!WINDOWS_VERSION!"=="10.0" (goto :REPAIR_WIFI_HOTSPOT) else call :ERROR_WINDOWS_VERSION
if "!x!"=="9" if "!WINDOWS_VERSION!"=="10.0" (goto :REPAIR_CLIPBOARD_HISTORY) else call :ERROR_WINDOWS_VERSION
if "!x!"=="10" if "!WINDOWS_VERSION!"=="10.0" (goto :REPAIR_BACKGROUND_APPS) else call :ERROR_WINDOWS_VERSION
for /l %%A in (1,1,10) do if "!x!"=="%%A" goto :CONTINUEWINDOWSREPAIR
call :CHOOSE back && goto :MOREFEATURES
call :ERRORMESSAGE
goto :CONTINUEWINDOWSREPAIR

:REPAIR_WINDOWS_STORE
call :SCALE 81 20
title !TITLE:`=Repair Windows Store!
echo !CYAN!
echo !\E![7C#################################################################
echo !\E![7C#            . . . I'm repairing Windows Store . . .            #
echo !\E![7C#################################################################
echo:
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v "RemoveWindowsStore" /f && echo reg value "RemoveWindowsStore" successfully removed. || echo reg value "RemoveWindowsStore" already removed.
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v "DisableStoreApps" /f && echo reg value "DisableStoreApps" successfully removed. || echo reg value "DisableStoreApps" already removed.
if "!WINDOWS_VERSION!"=="10.0" 2>nul powershell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *WindowsStore*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"
if "!WINDOWS_VERSION!"=="6.3" 2>nul powershell -ExecutionPolicy Unrestricted Add-AppxPackage -DisableDevelopmentMode -Register $Env:SystemRoot\WinStore\AppxManifest.xml
for %%A in (wuauserv BITS DcomLaunch InstallService wlidsvc WaaSMedicSvc UnistoreSvc StorSvc) do >nul 2>&1 net stop "%%A"
for %%A in (wuauserv BITS DcomLaunch) do >nul 2>&1 sc config "%%A" start=auto && echo service "%%A" successfully set to demand. || echo service "%%A" does not exist or an error happend.
for %%A in (InstallService wlidsvc WaaSMedicSvc UnistoreSvc StorSvc) do >nul 2>&1 sc config "%%A" start=demand && echo service "%%A" successfully set to demand. || echo service "%%A" does not exist or an error happend.
for /f "delims=" %%A in ('2^>nul where "wsreset.exe"') do start "" "%%~fA"
<nul set /p=!YELLOW!
timeout /t 5
goto :WINDOWSREPAIR

:REPAIR_XBOX_GAME
call :SCALE 81 20
title !TITLE:`=Repair Xbox Game!
echo !CYAN!
echo !\E![7C#################################################################
echo !\E![7C#              . . . I'm repairing Xbox Game . . .              #
echo !\E![7C#################################################################
echo:
for %%A in (XboxApp Microsoft.XboxGamingOverlay XboxOneSmartGlass) do 2>nul powershell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *%%A*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowgameDVR" /f && echo reg value "AllowgameDVR" successfully removed. || echo reg value "AllowgameDVR" already removed.
>nul reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d 1 /f && echo reg value "AppCaptureEnabled" successfully added. || echo reg value "AppCaptureEnabled" could not be added.
>nul reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnabled" /t REG_DWORD /d 1 /f && echo reg value "HistoricalCaptureEnabled" successfully added. || echo reg value "HistoricalCaptureEnabled" could not be added.
>nul reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 1 /f && echo reg value "GameDVR_Enabled" successfully added. || echo reg value "GameDVR_Enabled" could not be added.
for %%A in (BcastDVRUserService xbgm XboxNetApiSvc XboxGipSvc xboxgip XblAuthManager XblGameSave) do (
>nul 2>&1 net stop "%%A"
>nul 2>&1 sc config "%%A" start=demand && echo service "%%A" successfully set to demand. || echo service "%%A" does not exist or an error happend.
)
<nul set /p=!YELLOW!
timeout /t 5
goto :WINDOWSREPAIR

:REPAIR_PUSH_NOTIFICATIONS
call :SCALE 81 20
title !TITLE:`=Repair Push Notifications!
echo !CYAN!
echo !\E![7C#################################################################
echo !\E![7C#         . . . I'm repairing Push Notifications . . .          #
echo !\E![7C#################################################################
echo:
>nul 2>&1 reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /f && echo reg value "ToastEnabled" successfully removed. || echo reg value "ToastEnabled" already removed.
>nul 2>&1 reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "LockScreenToastEnabled" /f && echo reg value "LockScreenToastEnabled" successfully removed. || echo reg value "LockScreenToastEnabled" already removed.
>nul 2>&1 reg delete "HKCU\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /f && echo reg value "DisableNotificationCenter" successfully removed. || echo reg value "DisableNotificationCenter" already removed.
>nul 2>&1 reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseActionCenterExperience" /f && echo reg value "UseActionCenterExperience" successfully removed. || echo reg value "UseActionCenterExperience" already removed.
if "!WINDOWS_VERSION!"=="10.0" >nul 2>&1 reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableBalloonTips" /t REG_DWORD /d 1 /f && echo reg value "EnableBalloonTips" successfully added. || echo reg value "EnableBalloonTips" could not be added.
for %%A in (WpnService WpnUserService) do (
>nul 2>&1 net stop "%%A"
>nul 2>&1 sc config "%%A" start=demand && echo service "%%A" successfully set to demand. || echo service "%%A" does not exist or an error happend.
)
<nul set /p=!YELLOW!
timeout /t 5
goto :WINDOWSREPAIR

:REPAIR_WIFI_HOTSPOT
call :SCALE 81 20
title !TITLE:`=Repair WiFi Hotspot!
echo !CYAN!
echo !\E![7C#################################################################
echo !\E![7C#            . . . I'm repairing WiFi Hotspot . . .             #
echo !\E![7C#################################################################
echo:
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Network Connections" /v "NC_ShowSharedAccessUI" /f && echo reg value "NC_ShowSharedAccessUI" successfully removed. || echo reg value "NC_ShowSharedAccessUI" already removed.
for %%A in (CDPSvc CDPUserSvc icssvc) do >nul 2>&1 net stop "%%A"
for %%A in (CDPSvc CDPUserSvc) do >nul 2>&1 sc config "%%A" start=auto && echo service "%%A" successfully set to auto. || echo service "%%A" does not exist or an error happend.
>nul 2>&1 sc config "icssvc" start=demand && echo service "icssvc" successfully set to demand. || echo service "icssvc" does not exist or an error happend.
<nul set /p=!YELLOW!
timeout /t 5
goto :WINDOWSREPAIR

:REPAIR_CLIPBOARD_HISTORY
call :SCALE 81 20
title !TITLE:`=Repair Clipboard History!
echo !CYAN!
echo !\E![7C#################################################################
echo !\E![7C#          . . . I'm repairing Clipboard History . . .          #
echo !\E![7C#################################################################
echo:
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "AllowCrossDeviceClipboard" /f && echo reg value "AllowCrossDeviceClipboard" successfully removed. || echo reg value "AllowCrossDeviceClipboard" already removed.
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "AllowClipboardHistory" /f && echo reg value "AllowClipboardHistory" successfully removed. || echo reg value "AllowClipboardHistory" already removed.
>nul 2>&1 reg delete "HKCU\SOFTWARE\Microsoft\Clipboard" /v "EnableClipboardHistory" /f && echo reg value "EnableClipboardHistory" successfully removed. || echo reg value "EnableClipboardHistory" already removed.
>nul 2>&1 net stop "cbdhsvc"
>nul 2>&1 sc config "cbdhsvc" start=demand && echo service "cbdhsvc" successfully set to demand. || echo service "cbdhsvc" does not exist or an error happend.
<nul set /p=!YELLOW!
timeout /t 5
goto :WINDOWSREPAIR

:REPAIR_BACKGROUND_APPS
call :SCALE 81 20
title !TITLE:`=Repair Backgrounds Apps!
echo !CYAN!
echo !\E![7C#################################################################
echo !\E![7C#          . . . I'm repairing Backgrounds Apps . . .           #
echo !\E![7C#################################################################
echo:
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /f && echo reg value "LetAppsRunInBackground" successfully removed. || echo reg value "LetAppsRunInBackground" already removed.
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground_UserInControlOfTheseApps" /f && echo reg value "LetAppsRunInBackground_UserInControlOfTheseApps" successfully removed. || echo reg value "LetAppsRunInBackground_UserInControlOfTheseApps" already removed.
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground_ForceAllowTheseApps" /f && echo reg value "LetAppsRunInBackground_ForceAllowTheseApps" successfully removed. || echo reg value "LetAppsRunInBackground_ForceAllowTheseApps" already removed.
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground_ForceDenyTheseApps" /f && echo reg value "LetAppsRunInBackground_ForceDenyTheseApps" successfully removed. || echo reg value "LetAppsRunInBackground_ForceDenyTheseApps" already removed.
>nul 2>&1 reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /f && echo reg value "GlobalUserDisabled" successfully removed. || echo reg value "GlobalUserDisabled" already removed.
>nul reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d 1 /f && echo reg value "BackgroundAppGlobalToggle" successfully added. || echo reg value "BackgroundAppGlobalToggle" could not be added.
<nul set /p=!YELLOW!
timeout /t 5
goto :WINDOWSREPAIR

:WINDOWSGAMEBOOSTER
echo !CYAN!
if "!Language!"=="EN" (
call :DRAW_CENTER "Do you want to [!YELLOW!E!CYAN!]nable, [!YELLOW!D!CYAN!]isable or [!YELLOW!B!CYAN!]ack ?"
>nul choice /n /c EDB
)
if "!Language!"=="FR" (
call :DRAW_CENTER "Voulez-vous [!YELLOW!A!CYAN!]ctiver, [!YELLOW!D!CYAN!]ésactiver ou [!YELLOW!R!CYAN!]etour ?"
>nul choice /n /c ADR
)
if "!errorlevel!"=="1" call :_WINDOWSGAMEBOOSTER Enabling normal disabled enabled
if "!errorlevel!"=="2" call :_WINDOWSGAMEBOOSTER Disabling normal demand disabled
goto :MOREFEATURES
:_WINDOWSGAMEBOOSTER
call :SCALE 80 29
title !TITLE:`=%1 Game Boost!
echo !CYAN!
echo !\E![7C#################################################################
echo !\E![7C#              . . . I'm %1 Game Boost . . .             #
echo !\E![7C#################################################################
echo:
>nul 2>&1 netsh interface tcp set global autotuninglevel=%2 && echo netsh interface "tcp global autotuninglevel" successfully set to %3. || echo netsh interface "tcp global autotuninglevel" does not exist or an error happend.
>nul 2>&1 netsh interface tcp set heuristics %3 && echo netsh interface "tcp heuristics" successfully set to %3. || echo netsh interface "tcp heuristics" does not exist or an error happend.
if "%1"=="Enabling" >nul 2>&1 ipconfig /flushdns && echo ipconfig "flushdns" succeeded. || echo ipconfig "flushdns" does not exist or an error happend.
for %%A in (PeerDistSvc MSiSCSI SNMPTRAP napagent CertPropSvc AxInstSV AppMgmt RemoteRegistry SCPolicySvc WebClient WinRM CscService WerSvc PNRPsvc p2psvc p2pimsvc) do (
>nul 2>&1 net stop "%%A"
>nul 2>&1 sc config "%%A" start=%3 && echo service "%%A" successfully set to %3. || echo service "%%A" does not exist or an error happend.
)
echo:
echo !\E![7CDone, now GameBoost is %4. :')
<nul set /p=!YELLOW!
timeout /t 5
exit /b

:WINDOWSTWEAKS
call :SCALE 74 23
title !TITLE:`=Windows Tweaks!
call :ROSE "Windows Tweaks"

:CONTINUEWINDOWSTWEAKS
call :SCALE 74 23
title !TITLE:`=Windows Tweaks!
echo !CYAN!
echo !\E![26C══════════════════════
echo !\E![25C// !RED!█!BGYELLOW!!BLACK! WINDOWS TWEAKS !RED!█!BGBLACK!!CYAN! \\
echo !\E![6C╔════════════════════════════════════════════════════════════╗
echo !\E![6C║                                                            ║
echo !\E![6C║    !YELLOW!1!WHITE! Disable desktop F1 keyboard "Help" shortcut.!CYAN!          ║
echo !\E![6C║    !YELLOW!2!WHITE! Disable context menu "Share with" and "Share".!CYAN!        ║
echo !\E![6C║    !YELLOW!3!WHITE! Disable context menu "Troubleshoot compatibility".!CYAN!    ║
echo !\E![6C║    !YELLOW!4!WHITE! Disable context menu "Include in library".!CYAN!            ║
echo !\E![6C║    !YELLOW!5!WHITE! Disable context menu "Send to".!CYAN!                       ║
echo !\E![6C║    !YELLOW!6!WHITE! Disable context menu "Restore previous versions".!CYAN!     ║
echo !\E![6C║    !YELLOW!7!WHITE! Disable Properties Tab "Previous Versions".!CYAN!           ║
echo !\E![6C║    !YELLOW!8!WHITE! Enable "Ultimate Performance" power scheme.!CYAN!           ║
echo !\E![6C║    !YELLOW!9!WHITE! Disk Cleanup.!CYAN!                                         ║
echo !\E![6C║   !YELLOW!10!CYAN!  ^>  !WHITE!More Windows Tweaks !GREEN!(Portable Apps)!CYAN!               ║
echo !\E![6C║                                                            ║
echo !\E![6C╚════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
for /l %%A in (1,1,7) do if "!x!"=="%%A" (
if "!Language!"=="EN" set t="Do you want to Enable (Yes) or Disable (No) this tweak ?"
if "!Language!"=="FR" set t="Voulez-vous Activer (Oui) ou Désactiver (Non) ce tweak ?"
call :MSGBOX_LEVEL 69668 "Illegal Services Checker"
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
for %%A in ("HKCR\*\shellex\ContextMenuHandlers\Sharing" "HKCR\Directory\Background\shellex\ContextMenuHandlers\Sharing" "HKCR\Directory\shellex\ContextMenuHandlers\Sharing" "HKCR\Directory\shellex\CopyHookHandlers\Sharing" "HKCR\Directory\shellex\PropertySheetHandlers\Sharing" "HKCR\Drive\shellex\ContextMenuHandlers\Sharing" "HKCR\Drive\shellex\PropertySheetHandlers\Sharing" "HKCR\LibraryFolder\background\shellex\ContextMenuHandlers\Sharing" "HKCR\UserLibraryFolder\shellex\ContextMenuHandlers\Sharing") do >nul 2>&1 reg delete "%%~A" /f
if "!WINDOWS_VERSION!"=="10.0" >nul 2>&1 reg delete "HKCR\*\shellex\ContextMenuHandlers\ModernSharing" /f
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
if "!WINDOWS_VERSION!"=="10.0" >nul reg add "HKCR\*\shellex\ContextMenuHandlers\ModernSharing" /t REG_SZ /d "{e2bf9676-5f8f-435c-97eb-11607a5bedf7}" /f
)
)
if "!x!"=="3" (
if "!el!"=="6" (
for %%A in ("HKCR\batfile\shellEx\ContextMenuHandlers\Compatibility" "HKCR\cmdfile\shellEx\ContextMenuHandlers\Compatibility" "HKCR\exefile\shellex\ContextMenuHandlers\Compatibility" "HKCR\Msi.Package\shellex\ContextMenuHandlers\Compatibility" "HKCR\MSILink\shellex\ContextMenuHandlers\{1d27f844-3a1f-4410-85ac-14651078412d}") do >nul 2>&1 reg delete "%%~A" /f
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
if "!WINDOWS_VERSION!"=="10.0" (
>nul 2>&1 reg query "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\e9a42b02-d5df-448d-aa00-03f14749eb61"
if "!errorlevel!"=="0" (
set cn=0
for /f "delims=" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes" /f "Ultimate Performance" /s /c ^| findstr /c:"Ultimate Performance"') do set /a cn+=1
if "!cn!"=="1" (
for /f "tokens=2delims=:" %%A in ('powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61') do for /f "delims= " %%B in ("%%A") do call :ENABLE_ULTIMATE_PERFORMANCE %%B
) else (
for /f "delims=" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes" /f "Ultimate Performance" /s /c ^| findstr /c:"PowerSchemes"') do for /f "tokens=8delims=\" %%B in ("%%A") do if not "%%B"=="e9a42b02-d5df-448d-aa00-03f14749eb61" call :ENABLE_ULTIMATE_PERFORMANCES_POWER_SCHEME %%B
)
) else (
if "!Language!"=="EN" set t="ERROR: Power scheme 'Ultimate Performance' doesn't exist in your computer. You cannot use this script."
if "!Language!"=="FR" set t="ERREUR: Le schéma d'alimentation 'Ultimate Performance' n'existe pas sur votre ordinateur. Vous ne pouvez pas utiliser ce script."
call :MSGBOX 69680 "Illegal Services Checker"
)
goto :CONTINUEWINDOWSTWEAKS
) else call :ERROR_WINDOWS_VERSION
)
if "!x!"=="9" start cleanmgr.exe & goto :CONTINUEWINDOWSTWEAKS
if "!x!"=="10" goto :PORTABLEAPPS
for /l %%A in (1,1,7) do if "!x!"=="%%A" call :DONE_REGVALUE & goto :CONTINUEWINDOWSTWEAKS
call :CHOOSE back && goto :MOREFEATURES
call :ERRORMESSAGE
goto :CONTINUEWINDOWSTWEAKS

:SPOOFING
call :SCALE 53 16
title !TITLE:`=Spoofing!
call :ROSE Spoofing

:CLEARSPOOFING
set db=technitium.com/tmac/ docs.microsoft.com/en-us/sysinternals/downloads/volumeid github.com/vektort13/AntiOS
call :CLEAR 1

:CONTINUESPOOFING
call :SCALE 53 16
echo !CYAN!
echo !\E![18C════════════════
echo !\E![17C// !RED!█!BGYELLOW!!BLACK! Spoofing !RED!█!BGBLACK!!CYAN! \\
echo !\E![11C╔════════════════════════════╗
echo !\E![11C║                            ║
echo !\E![11C║    !1!technitium.com!CYAN!    ║
echo !\E![11C║    !2!Volume ID!CYAN!         ║
echo !\E![11C║    !3!AntiOS!CYAN!            ║
echo !\E![11C║                            ║
echo !\E![11C╚════════════════════════════╝
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUESPOOFING
call :CHOOSE back && goto :MOREFEATURES
call :WEBSITESTART && goto :CLEARSPOOFING
call :ERRORMESSAGE
goto :CONTINUESPOOFING

:CHECKER_SETUP_FOUND
if "!Language!"=="EN" set t="New version found. Do you want to update ?!\N!!\N!Current version: !VERSION!!\N!Latest version   : !LastVersion!"
if "!Language!"=="FR" set t="Nouvelle version trouvée. Voulez-vous mettre à jour ?!\N!!\N!Version actuelle  : !VERSION!!\N!Dernière version : !LastVersion!"
call :MSGBOX_LEVEL 69668 "Illegal Services Updater"
if "!el!"=="7" exit /b
:L2
call :CURL "!TMPF!\IS.Setup.exe" "`git_release`" UPDATER || (call :ERROR_INTERNET & exit /b)
>nul reg add "!IS_REG!" /v "FirstLaunch" /t REG_DWORD /d 1 /f
pushd "!TMPF!"
if exist IS.Setup.exe (start /max IS.Setup.exe) else (
if "!Language!"=="EN" set t="ERROR: Disable your antivirus and try again..."
if "!Language!"=="FR" set t="ERREUR: Désactivez votre antivirus et réessayez..."
call :MSGBOX 69680 "Illegal Services Checker"
popd
goto :L2
)
popd
exit

:CHECKER_BUILD_FOUND
:L3
call :CURL "Illegal Services.exe" "`git_build`" UPDATER || (call :ERROR_INTERNET & exit /b)
call :CURL "ChangeLog.txt" "`git_changelog`" UPDATER || (call :ERROR_INTERNET & exit /b)
if exist "Illegal Services.exe" (start "" "Illegal Services.exe") else (
if "!Language!"=="EN" set t="ERROR: Disable your antivirus and try again..."
if "!Language!"=="FR" set t="ERREUR: Désactivez votre antivirus et réessayez..."
call :MSGBOX 69680 "Illegal Services Checker"
goto :L3
)
exit

:PROCESS_FAQ
if "!Language!"=="EN" call :SCALE 105 49
if "!Language!"=="FR" call :SCALE 114 49
title !TITLE:`=Frequently Asked Questions!
call :ROSE FAQ
echo !CYAN!
if "!Language!"=="EN" set "t=Here is a list of frequently asked questions about Illegal Services:"
if "!Language!"=="FR" set "t=Voici une liste questions de questions fréquemment posées à propos d'Illegal Services:"
call :DRAW_CENTER "■█!BGYELLOW!!RED!█ !BLACK!!t!!RED! █!BGBLACK!!CYAN!█■"
echo:
echo !CYAN!
if "!Language!"=="EN" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Is Illegal Services open source ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Yes, under the General Public License v3.0 ^(GNU GPLv3^).
)
if "!Language!"=="FR" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Est-ce qu'Illegal Services est Open Source ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Oui, sous la General Public License v3.0 ^(GNU GPLv3^).
)
echo !\E![6C!GREEN!!UNDERLINE!!git_source!!UNDERLINEOFF!
echo !CYAN!
if "!Language!"=="EN" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Is Illegal Services illegal ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Illegal Services is legal, but services provided inside are mostly illegal.
echo !\E![6C!GREEN!Illegal Services does not store any copyrighted files locally or on its server.
echo !\E![6C!GREEN!All contents are provided by non-affiliated third parties.
echo !\E![6C!GREEN!You are solely responsible for their use at your own risk.
)
if "!Language!"=="FR" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Illegal Services est-il illégal ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Illegal Services est légal, mais les services fournis à l'intérieur sont principalement illégaux.
echo !\E![6C!GREEN!Illegal Services ne stocke aucun fichier sous copyright localement ou sur son serveur.
echo !\E![6C!GREEN!Tous les contenus sont fournis par des tiers non affiliés.
echo !\E![6C!GREEN!Vous ˆtes tenu comme seul responsable de leur utilisation à vos propres risques.
)
echo !CYAN!
if "!Language!"=="EN" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Why Illegal Services is detected by many antiviruses ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!The source code is converted from batch to executable using !UNDERLINE!https://www.abyssmedia.com/quickbfc/!UNDERLINEOFF!
echo !\E![6C!GREEN!This conversion process leads to believe that it is a virus.
)
if "!Language!"=="FR" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Pourquoi Illegal Services est detecté par beaucoup d'antivirus ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Le code source est convertie de batch en executable en utilisant !UNDERLINE!https://www.abyssmedia.com/quickbfc/!UNDERLINEOFF!
echo !\E![6C!GREEN!Ce processus de conversion fait laisser croire qu'il en est un virus.
)
echo !CYAN!
if "!Language!"=="EN" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Why Illegal Services keep telling me that a file is missing ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!It must be your antivirus that quarantined the file^(s^).
echo !\E![6C!GREEN!You must add this file^(s^) or Illegal Services PATH to its whitelist or deactivate it.
)
if "!Language!"=="FR" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Pourquoi Illegal Services continue-il de me dire qu'un fichier est manquant ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Ce doit être votre antivirus qui met en quarantaine le/les fichier^(s^).
echo !\E![6C!GREEN!Vous devez ajouter ce/ces fichier^(s^) ou le chemin d'Illegal Services à sa liste blanche ou désactivez-le.
)
echo !CYAN!
if "!Language!"=="EN" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Why do Illegal Services ask for administrator privileges ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!The administrator privileges are required for:
echo !\E![6C!GREEN!IP Port Scanning, Windows Repair, Windows Tweaks and Windows Game Booster.
)
if "!Language!"=="FR" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Pourquoi Illegal Services demandent-ils des privilèges d'administrateur ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Les privilèges administrateurs sont requis pour:
echo !\E![6C!GREEN!IP Port Scanning, Windows Repair, Windows Tweaks et Windows Game Booster.
)
echo !CYAN!
if "!Language!"=="EN" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ What is the difference between build and release updates ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Build updates are updates that do not require you to update the installer.
echo !\E![6C!GREEN!They are mostly used to update "Illegal_Services.exe".
echo !\E![6C!GREEN!These are the last 2 digits of the version number ^(vx.x.[x.x]^).
echo !\E![6C!GREEN!Release updates are updates that requires updating the installer.
echo !\E![6C!GREEN!They are only used to update Illegal Services dependencies.
echo !\E![6C!GREEN!These are the first 2 digits of the version number ^(v[x.x].x.x^).
)
if "!Language!"=="FR" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Quelle est la différence entre les mises à jour de build et de release ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Les mises à jour de build sont des mises à jour qui ne vous obligent pas à mettre à jour l'installateur.
echo !\E![6C!GREEN!Elles sont principalement utilisés pour mettre à jour "illegal_services.exe".
echo !\E![6C!GREEN!Ce sont les 2 derniers chiffres du  la version ^(vx.x.[x.x]^).
echo !\E![6C!GREEN!Les mises à jour de release sont des mises à jour nécessitant une mise à jour de l'installateur.
echo !\E![6C!GREEN!Ils ne sont utilisés que pour mettre à jour les dépendances d'Illegal Services.
echo !\E![6C!GREEN!Ce sont les 2 premiers chiffres de la version ^(v [x.x].x.x^).
)
echo !CYAN!
if "!Language!"=="EN" echo !\E![3C■█!BGWHITE!!RED!█ ♦ With which operating systems is Illegal Services compatible ? █!BGBLACK!!CYAN!█■
if "!Language!"=="FR" echo !\E![3C■█!BGWHITE!!RED!█ ♦ Avec qu'elle système d'exploitation Illegal Services est-t'il compatible ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Windows 7, 8, 8.1, 10 (x86/x64).
echo !CYAN!
if "!Language!"=="EN" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Can you make Illegal Services compatible with more operating system ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!No. But IS Bookmarks and IS search engines are.
)
if "!Language!"=="FR" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Pouvez-vous rendre Illegal Services compatible pour d'autre système d'exploitation ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Non. Mais IS.Bookmarks et IS search engines le sont.
)
echo !CYAN!
if "!Language!"=="EN" echo !\E![3C■█!BGWHITE!!RED!█ ♦ In which languages is Illegal Services developed ? █!BGBLACK!!CYAN!█■
if "!Language!"=="FR" echo !\E![3C■█!BGWHITE!!RED!█ ♦ En quels langages est développé Illegal Services ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!98%% Batch, 1%% PowerShell, 1%% VBScript.
echo !CYAN!
if "!Language!"=="EN" echo !\E![3C■█!BGWHITE!!RED!█ ♦ When did you started Illegal Services project ? █!BGBLACK!!CYAN!█■
if "!Language!"=="FR" echo !\E![3C■█!BGWHITE!!RED!█ ♦ Quand est-ce que le projet d'Illegal Services à commencé ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!v1.0.0.0 - 22/05/2020
echo:
echo !CYAN!
if "!Language!"=="EN" set "t=Press !YELLOW!{ANY KEY}!CYAN! to exit"
if "!Language!"=="FR" set "t=Appuyez sur !YELLOW!{UNE TOUCHE}!CYAN! pour quitter"
call :DRAW_CENTER "!t!..." 1
%SHOWCURSOR%
>nul pause
exit

:PROCESS_SCANWEBSITES
if "!Language!"=="EN" set t=Establishing connection to websites database
if "!Language!"=="FR" set t=Etablissement de la connexion à la base de donnée des sites internet
set url=!git_raw_downloads!/Websites.txt
title !DEBUG!!t!: '!url!'. - Illegal Services
curl.exe -fIkLs "!url!" -o NUL || (call :ERROR_INTERNET & exit)
set /a index=0, cn=0, result=0
set s=
if "!Language!"=="EN" (
set o1=Website Down
set o2=Website Changed Domain
)
if "!Language!"=="FR" (
set o1=Site Internet Mort
set o2=Site Internet Changé de Domaine
)
for /f %%A in ('curl.exe -fkLs "!url!"') do (
set /a index+=1
title !DEBUG![0 result found from 0/!index! websites indexed]  ^|  [0/100%%]  ^|  [...] - Illegal Services
)
echo !CYAN!
if "!Language!"=="EN" echo Scan of the !index! indexed websites has started. You will be notified if any of them are down or have changed domain.
if "!Language!"=="FR" echo Le scan des !index! sites web indexés a commencé. Vous serez notifié si l'un d'entre eux est mort ou a changé de domaine.
echo:
for /f "tokens=1-4delims=:.," %%A in ("!time: =0!") do set /a "t1=(((1%%A*60)+1%%B)*60+1%%C)*100+1%%D-36610100"
for /f %%A in ('curl.exe -fkLs "!url!"') do (
set /a cn+=1, el=cn*100/index
if !result! gtr 1 set s=s
title !DEBUG![!result! result!s! found from !cn!/!index! websites indexed]  ^|  [!el!/100%%]  ^|  [%%A] - Illegal Services
>nul ping -w 1000 -n 1 "%%A" || >nul curl.exe -IkLs "https://%%A/" || >nul curl.exe -IkLs "http://%%A/" || (
set /a result+=1
echo !RED!!o1!: !YELLOW!%%A !RED!seems to be down for you ^^!
curl.exe -fkLs "https://isitup.org/%%A" | >nul findstr /ic:"Oh no %%A" && (
set /a result+=1
echo !RED!!o1!: !YELLOW!%%A !RED!seems to be down for everyone ^^!
)
)
for /f "tokens=1,*delims=-" %%B in ('curl.exe -Iksw "%%{response_code}-%%{redirect_url}" "https://%%A/"') do if "%%B"=="301" for /f "tokens=2delims=/" %%D in ("%%C") do if not "%%D"=="%%A" if not "%%D"=="github.com" if not "%%D"=="www.microsoft.com" if not "%%D"=="discord.com" if not "%%D"=="danse-musique.org" (
set /a result+=1
for /f "delims=/" %%E in ("%%C") do echo !RED!!o2!: !YELLOW!https://%%A/ !GREEN!^> !YELLOW!%%E//%%D/
)
)
echo !CYAN!
for /f "tokens=1-4delims=:.," %%A in ("!time: =0!") do set /a "t2=(((1%%A*60)+1%%B)*60+1%%C)*100+1%%D-36610100, tDiff=t2-t1, tDiff+=((~(tDiff&(1<<31))>>31)+1)*8640000, seconds=tDiff/100"
title !DEBUG![!result! result!s! found from !index! websites indexed]  ^|  [Scan completed in !seconds! seconds.] - Illegal Services
if "!Language!"=="EN" echo Scan completed with !result! result!s! found from !index! websites indexed in !seconds! seconds.
if "!Language!"=="FR" echo L'analyse s'est terminée avec !result! résultats trouvés à partir de !index! sites web indexés en !seconds! secondes.
echo:
pause
exit

:PROCESS_YOUTUBEDL
call :CHECK_YOUTUBEDLPRIORITY
title !DEBUG!YouTube DL    ^|!youtube_dl!.exe !a!^|    ^|!o1!^|    ^|Priority: !YouTubeDLPriority:~1!^| - Illegal Services
echo !BRIGHTBLACK!
echo !\E![7C##############################################
if "!Language!"=="EN" echo !\E![7C#       !BRIGHTRED!♥   !CYAN!Welcome in YouTube DL   !BRIGHTRED!♥!BRIGHTBLACK!        #
if "!Language!"=="FR" echo !\E![7C#      !BRIGHTRED!♥   !CYAN!Bievenue dans YouTube DL   !BRIGHTRED!♥!BRIGHTBLACK!      #
echo !\E![7C##############################################
echo:
if "!Language!"=="EN" (
set t1=Choice
set t2=Please wait while downloading
)
if "!Language!"=="FR" (
set t1=Choix
set t2=Veuillez patienter pendant le téléchargement de
)
echo !\E![7C♦ !CYAN!!t1!: !YELLOW!!o1!!BRIGHTBLACK!
echo !\E![7C♦ !CYAN!!t2!: !YELLOW!!url!!CYAN! . . .
echo !BRIGHTBLACK!
echo =========================================================================================================
echo !RED!
start /b /w !YouTubeDLPriority! Portable_Apps\YouTube-DL\!youtube_dl!.exe --ffmpeg-location "Portable_Apps\YouTube-DL" --output "!YouTubeDLOutputDirectory!\%%(title)s.%%(ext)s" !a!
set el=!errorlevel!
echo !BRIGHTBLACK!
echo =========================================================================================================
echo !CYAN!
if "!Language!"=="EN" if "!el!"=="0" (
echo !\E![7C♦ Download finished.
<nul set /p=!\E![7C♦ Press !YELLOW!{ANY KEY}!CYAN! to open download location and exit...
) else (
echo !\E![7C♦ Something went wrong and couldn't download the file.
<nul set /p=!\E![7C♦ Press !YELLOW!{ANY KEY}!CYAN! to exit...
)
if "!Language!"=="FR" if "!el!"=="0" (
echo !\E![7C♦ Téchargement terminer.
<nul set /p=!\E![7C♦ Appuyez sur !YELLOW!{UNE TOUCHE}!CYAN! pour ouvrir l'emplacement de téchargement et quitter...
) else (
echo !\E![7C♦ Une erreur s'est produite et n'a pas pu técharger le fichier.
<nul set /p=!\E![7C♦ Appuyez sur !YELLOW!{UNE TOUCHE}!CYAN! pour quitter...
)
%SHOWCURSOR%
>nul pause
if "!el!"=="0" start /max "" "!YouTubeDLOutputDirectory!"
exit

:PROCESS_NMAP
call :CHECK_PORTPRIORITY
title !DEBUG!NMAP    ^|nmap.exe !a!^|    ^|!o1!^|    ^|!o2!^|    ^|Priority: !PortPriority:~1!^| - Illegal Services
>nul 2>&1 net start npcap
for %%A in (MaxUserPort`64534 TcpTimedWaitDelay`30 StrictTimeWaitSeqCheck`1) do for /f "tokens=1,2delims=`" %%B in ("%%~A") do >nul reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "%%B" /t REG_DWORD /d %%C /f
echo !BRIGHTBLACK!
echo !\E![7C#################################################################
if "!Language!"=="EN" echo !\E![7C#       !BRIGHTRED!♥   !CYAN!Welcome in the best Port Scanner by NMAP   !BRIGHTRED!♥!BRIGHTBLACK!        #
if "!Language!"=="FR" echo !\E![7C#    !BRIGHTRED!♥   !CYAN!Bienvenue dans le meilleur Port Scanner par NMAP   !BRIGHTRED!♥!BRIGHTBLACK!   #
echo !\E![7C#################################################################
echo:
if "!Language!"=="EN" (
set t1=Time
set t2=Please wait while scanning
)
if "!Language!"=="FR" (
set t1=Temps
set t2=Veuillez patienter pendant le scan de
)
echo !\E![7C♦ !CYAN!Scan: !YELLOW!!o1!!BRIGHTBLACK!
echo !\E![7C♦ !CYAN!!t1!: !YELLOW!!o2!!BRIGHTBLACK!
echo !\E![7C♦ !CYAN!!t2!: !YELLOW!!url!!CYAN! . . .
echo !BRIGHTBLACK!
echo =========================================================================================================
echo !RED!
>nul chcp 65000
start /b /w !PortPriority! Portable_Apps\NMAP\nmap.exe !a!
set el=!errorlevel!
>nul chcp !CP!
echo !BRIGHTBLACK!
echo =========================================================================================================
echo !CYAN!
if "!Language!"=="EN" if "!el!"=="0" (
echo !\E![7C♦ Scan finished.
<nul set /p=!\E![7C♦ Press !YELLOW!{ANY KEY}!CYAN! to exit...
) else (
echo !\E![7C♦ Something went wrong and couldn't scan.
<nul set /p=!\E![7C♦ Press !YELLOW!{ANY KEY}!CYAN! to exit...
)
if "!Language!"=="FR" if "!el!"=="0" (
echo !\E![7C♦ Scan terminer.
<nul set /p=!\E![7C♦ Appuyez sur !YELLOW!{UNE TOUCHE}!CYAN! pour quitter...
) else (
echo !\E![7C♦ Une erreur s'est produite et n'a pas pu scanner.
<nul set /p=!\E![7C♦ Appuyez sur !YELLOW!{UNE TOUCHE}!CYAN! pour quitter...
)
%SHOWCURSOR%
>nul pause
exit

:PROCESS_PINGER
title !TITLE:`=IP Pinger  ^|  Pinging %fixed_url%!
:_PING
cls
echo !CYAN!
echo          ____________________________________________
echo         /                                            \
echo        /       -------------/###\-------------        \
echo       /                     \###/                      \      !RED!*THIS TOOL WILL ALLOW YOU TO SEE IF YOUR!CYAN!
echo      /                     /     \                      \       !RED!TARGET IS REACHED BY YOUR DDoS OR NOT.!CYAN!
echo     /                     /       \                      \
echo    /                     :   ###   :                      \
echo   /                [O-O-]:    #    :[-O-O]                 \
echo   \                      /\___#___/\                       /
echo    \                    /     0     \                     /   !RED!*!UNDERLINE!WARNING!UNDERLINEOFF!!RED!: SOME ROUTERS DO NOT ALLOW THE PING.!CYAN!
echo     \                  /             \                   /        !RED!FOR THIS REASON IT IS NORMAL IF SOME!CYAN!
echo      \                                                  /            !RED!IP ADDRESSES DO NOT RESPOND!CYAN!
echo       \________________________________________________/                 !RED!WHILE PINGING THEM.!CYAN!
echo        \                                              /
echo         \          Made By IB_U_Z_Z_A_R_Dl           /
echo          \__________________________________________/
echo !BRIGHTBLACK!
if "!Language!"=="EN" echo                       ** PRESS !YELLOW![CTRL + C]!BRIGHTBLACK! ^> !YELLOW![N]!BRIGHTBLACK! ^> !YELLOW![ENTER]!BRIGHTBLACK! to view result and restart. **
if "!Language!"=="FR" echo               ** Presser !YELLOW![CTRL + C]!BRIGHTBLACK! ^> !YELLOW![N]!BRIGHTBLACK! ^> !YELLOW![ENTRER]!BRIGHTBLACK! pour afficher le résultat et recommencer. **
echo !WHITE!
ping -t -l 0 !fixed_url!
goto :_PING

:DONE_REGVALUE
if "!Language!"=="EN" set t="Reg value successfully added/removed."
if "!Language!"=="FR" set t="Valeur du registre ajoutée/supprimée avec succès."
call :MSGBOX 69696 "Illegal Services Checker"
exit /b

:ENABLE_ULTIMATE_PERFORMANCES_POWER_SCHEME
echo:
for /f "tokens=2delims=:" %%A in ('powercfg /getactivescheme') do for /f "delims= " %%B in ("%%A") do if "%%B"=="%1" (
if "!Language!"=="EN" set t="The 'Ultimate Performance' power scheme is already enabled."
if "!Language!"=="FR" set t="Le schéma d'alimentation 'Ultimate Performance' est déjà activé."
call :MSGBOX 69696 "Illegal Services Checker"
exit /b
)
powercfg /setactive %1 && (
if "!Language!"=="EN" set t="The 'Ultimate Performance' power scheme successfully enabled."
if "!Language!"=="FR" set t="Le schéma d'alimentation 'Ultimate Performance' a été activé avec succès."
call :MSGBOX 69696 "Illegal Services Checker"
) || (
if "!Language!"=="EN" set t="ERROR: The 'Ultimate Performance' power scheme couldn't enable."
if "!Language!"=="FR" set t="ERREUR: Le schéma d'alimentation 'Ultimate Performance' n'a pas pu être activé."
call :MSGBOX 69680 "Illegal Services Checker"
)
exit /b

:CHECK_INTERNET
for %%A in (https http) do curl.exe -fIkLs "%%A://www.google.com/" -o NUL && exit /b 0
exit /b 1

:MSGBOX
>"!TMPF!\msgbox.vbs" echo MsgBox WScript.Arguments(0),WScript.Arguments(1),WScript.Arguments(2)
cscript //nologo "!TMPF!\msgbox.vbs" !t! %1 "%~2"
del /f /q "!TMPF!\msgbox.vbs"
exit /b

:MSGBOX_LEVEL
>"!TMPF!\msgbox.vbs" (
echo Dim Response
echo Response=MsgBox^(WScript.Arguments^(0^),WScript.Arguments^(1^),WScript.Arguments^(2^)^)
echo If Response=vbYes then
echo wscript.quit 6
echo End If
echo wscript.quit 7
)
cscript //nologo "!TMPF!\msgbox.vbs" !t! %1 "%~2"
set el=!errorlevel!
del /f /q "!TMPF!\msgbox.vbs"
exit /b

:INPUTBOX
>"%TMPF%\msgbox.vbs" echo WScript.Echo InputBox^(%t%^)
set ID=
>nul chcp 850
for /f "delims=" %%A in ('cscript //nologo "%TMPF%\msgbox.vbs"') do set "ID=%%A"
>nul chcp !CP!
del /f /q "%TMPF%\msgbox.vbs"
exit /b

:ROSE_SETUP
>nul chcp 1252
for /f "tokens=1*delims==" %%A in ('findstr /bc:"[First Launch]=" "Speak\!Language!.lang"') do if defined SPEECH_FR (Speak\speak-x!ARCH!.exe -t "%%~B") else (
set extd=Speak\extd.exe /speak "%%~B"
!extd!
)
>nul chcp !CP!
if "!Language!"=="EN" set t="Do you want to disable Rose voice assistant ?"
if "!Language!"=="FR" set t="Voulez-vous désactiver l'assistante vocale Rose ?"
call :MSGBOX_LEVEL 69668 "Illegal Services Checker"
if "!el!"=="6" >nul reg add "!IS_REG!" /v "VoiceAssistant" /t REG_DWORD /d 0 /f
if "!el!"=="7" >nul reg add "!IS_REG!" /v "VoiceAssistant" /t REG_DWORD /d 1 /f
>nul reg add "!IS_REG!" /v "VoiceAssistantChoice" /t REG_DWORD /d 0 /f
exit /b

:ROSE
if "!VoiceAssistant!"=="0" exit /b
if "%~1"=="" exit /b
for %%A in (extd speak-x!ARCH!) do >nul 2>&1 taskkill /f /im "%%A.exe" /t
>nul chcp 1252
for /f "tokens=1*delims==" %%A in ('findstr /bc:"[%~1]=" "Speak\!Language!.lang"') do if defined SPEECH_FR (start /b Speak\speak-x!ARCH!.exe -t "%%~B") else (
set extd=start /b Speak\extd.exe /speak "%%~B"
!extd!
)
>nul chcp !CP!
exit /b

:CURL
call :CHECK_INTERNET || exit /b 1
set "curl_url=%~2"
if not "!curl_url:`=!"=="!curl_url!" (
if "!git!"=="404 Git proxy not found" call :PROXY || if "!git!"=="404 Git proxy not found" exit /b 2
for /f "tokens=1-3delims=`" %%A in ("[!curl_url!]") do set "curl_url=%%A!%%B!%%C"
set "curl_url=!curl_url:~1,-1!"
)
if defined git_backup if not "!curl_url:%git%=!"=="!curl_url!" if not "%3"=="UPDATER" exit /b 3
if "!Language!"=="EN" set t=Downloading
if "!Language!"=="FR" set t=Téléchargement
<nul set /p="!CYAN!!t!: !YELLOW!!curl_url!!CYAN!"
echo:
curl.exe --create-dirs -f#kLo "%~1" "!curl_url!" || (
if not "!curl_url:%git%=!"=="!curl_url!" (call :CURL_PROXYS "%~1" "!curl_url!" || (call :ERROR_CURL "%~f1" & exit /b 4))
call :ERROR_CURL "%~f1"
exit /b 2
)
if exist "%~f1" for %%A in (7z zip) do if "%~x1"==".%%A" if "%~nx1"=="ffmpeg.7z" (7za\x!ARCH!\7za.exe x -aoa -bso0 -o"%~dp1" -spe -y "%~f1" || (call :ERROR_CURL "%~f1" & exit /b 4) & del /f /q "%~f1") else (7za\x!ARCH!\7za.exe x -aoa -bso0 -o"%~dpn1" -spe -y "%~f1" || (call :ERROR_CURL "%~f1" & exit /b 4) & del /f /q "%~f1")
set Start_Folder=1
exit /b 0

:CURL_PROXYS
set el=
set cn=
for %%A in (main downloads source) do if not "!curl_url:/%%A/=!"=="!curl_url!" set cn=/%%A/
for %%B in (!GIT_LIST!) do if not "%%B"=="!git:*://=!" (
if "%%B"=="github.com/Illegal-Services/Illegal_Services" set el=%%B/raw
if "%%B"=="bitbucket.org/IllegalServices/illegal_services" set el=%%B/raw
if "%%B"=="git.teknik.io/Illegal-Services/Illegal_Services" set el=%%B/raw/branch
if "%%B"=="gitee.com/Illegal-Services/illegal_services" set el=%%B/raw
if "!Language!"=="EN" set "t=Downloading: "
if "!Language!"=="FR" set "t=Téléchargement: "
cmd /c rem
<nul set /p="!CYAN!!t!!YELLOW!https://!el!!cn!%~nx2!CYAN!"
echo:
curl.exe --create-dirs -f#kLo "%~1" "https://!el!!cn!%~nx2" && exit /b 0
)
exit /b 1

:ERROR_CURL
if "!Language!"=="EN" set "t=ERROR WHILE DOWNLOADING: "
if "!Language!"=="FR" set "t=ERREURE PENDANT LE TELECHARGEMENT DE: "
if defined IS_Log >>"!TMPF!\IS_Log.txt" echo !t!"!curl_url!"
echo !RED!!t!!YELLOW!"!curl_url!"
if exist "%~f1" del /f /q "%~f1"
exit /b

:IPLOOKUP_ENTER
if "!Language!"=="EN" set "t=Enter the %1 to track: "
if "!Language!"=="FR" set "t=Entrer l'%1 à tracker: "
%SHOWCURSOR%
set url=
set /p "url=!BRIGHTBLACK!!t!!YELLOW!"
%HIDECURSOR%
if "%1"=="IP" (call :CHECK_IP url || exit /b 1) else call :CHECK_URL url IP/URL || exit /b 1
if "!4!"=="!YELLOW!4 !CHECKED!" start "" "https://check-host.net/ip-info?host=!fixed_url!" && cmdwiz.exe delay 1500
if "!5!"=="!YELLOW!5 !CHECKED!" start "" "https://dnschecker.org/ip-location.php?ip=!fixed_url!" && cmdwiz.exe delay 1500
if "!6!"=="!YELLOW!6 !CHECKED!" start "" "https://www.iplocation.net/ip-lookup" && cmdwiz.exe delay 1500
if "!7!"=="!YELLOW!7 !CHECKED!" start "" "https://www.ip-tracker.org/locator/ip-lookup.php?ip=!fixed_url!" && cmdwiz.exe delay 1500
if "!8!"=="!YELLOW!8 !CHECKED!" start "" "https://whatismyipaddress.com/ip/!fixed_url!"
exit /b 0

:IS_SEARCH
echo !CYAN!
if "!Language!"=="EN" set t=What do you want to search for
if "!Language!"=="FR" set t=Que voulez-vous rechercher
%SHOWCURSOR%
set el=
set /p "el=!t! ? !YELLOW!"
%HIDECURSOR%
call :CHOOSE back && exit /b
if defined el start "" "https://cse.google.com/cse?q=!el!&cx=%1" && exit /b
echo:
call :ERRORMESSAGE el "une recherche" search
exit /b

:INSTALL_FILE
if "%1"=="VLC" if "!ARCH!"=="64" (set url=https://get.videolan.org/vlc/3.0.16/win64/vlc-3.0.16-win64.exe) else set url=https://get.videolan.org/vlc/3.0.16/win32/vlc-3.0.16-win32.exe
if "%1"=="qBittorent" if "!ARCH!"=="64" (set url=https://downloads.sourceforge.net/project/qbittorrent/qbittorrent-win32/qbittorrent-4.3.8/qbittorrent_4.3.8_x64_setup.exe) else set url=https://downloads.sourceforge.net/project/qbittorrent/qbittorrent-win32/qbittorrent-4.3.8/qbittorrent_4.3.8_setup.exe
for %%A in (!url!) do set filename=%%~nxA
call :CURL "!TMPF!\!filename!" "!url!" || (call :ERROR_INTERNET & exit /b)
call :START_DOWNLOADED_FILE !filename!
exit /b

:CHECK_PORT
if defined %1 if "!%1!"=="!%1:..=!" if !%1! geq 0 if !%1! leq 65535 exit /b 0
call :ERRORMESSAGE %1 "un port" port
exit /b 1

:CHECK_URL
for /f "tokens=1-4delims=." %%A in ("!%1!") do call :CHECKBETWEEN0AND255 %%A && call :CHECKBETWEEN0AND255 %%B && call :CHECKBETWEEN0AND255 %%C && call :CHECKBETWEEN0AND255 %%D && call :CHECK_IP %1
call :_CHECK_URL %1 || (call :ERRORMESSAGE %1 "une URL" URL & exit /b 1)
exit /b 0

:_CHECK_URL
for /f "delims=/" %%A in ("!%1:*://=!") do set "fixed_%1=%%A"
<nul set /p="!fixed_%1!" | >nul findstr [A-Z0-9] || exit /b 1
if defined %1 if not "!fixed_%1:~,1!"=="." if not "!fixed_%1:~-1!"=="." if not "!fixed_%1!"=="!fixed_%1:~,3!" if not "!fixed_%1!"=="!fixed_%1:.=!" if "!fixed_%1!"=="!fixed_%1:..=!" exit /b 0
exit /b 1

:CHECK_IP
call :_CHECK_IP %1 || (call :ERRORMESSAGE %1 "une IP" IP & exit /b 1)
exit /b 0

:_CHECK_IP
if not defined %1 exit /b 1
if "!%1!"=="!%1:~,6!" exit /b 1
if not "!%1!"=="!%1:..=!" exit /b 1
for /f "tokens=1-5delims=." %%A in ("!%1!") do (
if not "%%E"=="" exit /b 1
call :CHECKBETWEEN0AND255 %%A || exit /b 1
call :CHECKBETWEEN0AND255 %%B || exit /b 1
call :CHECKBETWEEN0AND255 %%C || exit /b 1
call :CHECKBETWEEN0AND255 %%D || exit /b 1
)
exit /b 0

:CHECKBETWEEN0AND255
if "%~1"=="" exit /b 1
for /f "delims=0123456789" %%A in ("%~1") do exit /b 1
if %~1 lss 0 exit /b 1
if %~1 gtr 255 exit /b 1
exit /b 0

:CHECK_SETTINGS
for %%A in (LANGUAGE USERNAME BACKGROUNDBORDERTRANSPARENCY BACKGROUNDDISABLED BACKGROUNDTRANSPARENCY BACKGROUNDWALLPAPER VOICEASSISTANT VOICEASSISTANTCHOICE FIRSTLAUNCH UNTRUSTEDWEBSITESWARNING YOUTUBEDLP YOUTUBEDLOUTPUTDIRECTORY YOUTUBEDLGEOBYPASS PORTPRIORITY YOUTUBEDLPRIORITY DEVELOPERMODE) do call :CHECK_%%A
exit /b

:APPLY_SETTINGS
for %%A in (BACKGROUNDBORDERTRANSPARENCY BACKGROUNDDISABLED BACKGROUNDTRANSPARENCY BACKGROUNDWALLPAPER) do call :CHECK_%%A
if "!BackgroundDisabled!"=="0" if defined BackgroundWallpaper cmdbkg.exe Backgrounds\background-!BackgroundWallpaper!.jpg!BackgroundBorderTransparency!
if "!BackgroundDisabled!"=="1" cmdbkg.exe
cmdwiz.exe delay 500
if defined BackgroundTransparency cmdwiz.exe setwindowtransparency !BackgroundTransparency!
exit /b

:CHECK_LANGUAGE
set Language=
for /f "tokens=3" %%A in ('2^>nul reg query "!IS_REG!" /v "Language"') do set "Language=%%~A"
if not "!Language!"=="FR" if not "!Language!"=="EN" (
call :ERROR_REGEDIT Language Language
for /f "tokens=3" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Nls\Language" /v "InstallLanguage"') do if "%%A"=="040C" (>nul reg add "!IS_REG!" /v "Language" /t REG_SZ /d FR /f) else >nul reg add "!IS_REG!" /v "Language" /t REG_SZ /d EN /f
goto :CHECK_LANGUAGE
)
set SPEECH_FR=
if "!Language!"=="FR" if exist "!windir!\Speech_OneCore\Engines\TTS\fr-FR" 2>nul reg query "HKCU\SOFTWARE\Microsoft\Speech\Voices" /v "DefaultTokenId" | >nul findstr /ic:"FR-FR" /c:"frFR" /c:"ZIRA" && (set SPEECH_FR=1) || set SPEECH_FR=
::2>nul reg query "HKLM\SOFTWARE\Microsoft\Speech_OneCore\Voices\Tokens" | >nul findstr /ic:"FR-FR" /c:"frFR"
::2>nul reg query "HKCU\SOFTWARE\Microsoft\Speech_OneCore\Settings\TextToSpeech" /v "Voice" | >nul findstr /ic:"FR-FR" /c:"frFR"
exit /b

:CHECK_USERNAME
set IS_Username=
for /f "tokens=2*" %%A in ('2^>nul reg query "!IS_REG!" /v "Username"') do set "IS_Username=%%B"
if defined IS_Username (
set "IS_Username=!IS_Username:"=!"
>nul reg add "!IS_REG!" /v "Username" /t REG_SZ /d "!IS_Username:~,20!" /f
if "!IS_Username:~20!"=="" exit /b
)
call :ERROR_REGEDIT Username IS_Username
>nul reg add "!IS_REG!" /v "Username" /t REG_SZ /d "!Username:~,20!" /f
goto :CHECK_USERNAME

:CHECK_PROXY
set Proxy=
for /f "tokens=2*" %%A in ('2^>nul reg query "!IS_REG!" /v "Proxy"') do set "Proxy=%%~B"
if defined Proxy (
for %%A in (!GIT_LIST!) do if "!Proxy:*://=!"=="%%A" exit /b
call :ERROR_REGEDIT Proxy Proxy
)
set proxy=
>nul 2>&1 reg delete "!IS_REG!" /v "Proxy" /f
exit /b

:CHECK_BACKGROUNDBORDERTRANSPARENCY
set BackgroundBorderTransparencyValue=
set el=
for /f "tokens=3" %%A in ('2^>nul reg query "!IS_REG!" /v "BackgroundBorderTransparency"') do set "el=%%A"
if defined el (
2>nul set /a "BackgroundBorderTransparencyValue=el"
if defined BackgroundBorderTransparencyValue (
if !el! neq !BackgroundBorderTransparencyValue! set "BackgroundBorderTransparencyValue=!el!"
if "!BackgroundBorderTransparencyValue!"=="1" set "BackgroundBorderTransparency=" & exit /b
if "!BackgroundBorderTransparencyValue!"=="0" set "BackgroundBorderTransparency= /b" & exit /b
)
)
call :ERROR_REGEDIT BackgroundBorderTransparency BackgroundBorderTransparencyValue
>nul reg add "!IS_REG!" /v "BackgroundBorderTransparency" /t REG_DWORD /d 1 /f
goto :CHECK_BACKGROUNDBORDERTRANSPARENCY

:CHECK_BACKGROUNDDISABLED
set BackgroundDisabled=
set el=
for /f "tokens=3" %%A in ('2^>nul reg query "!IS_REG!" /v "BackgroundDisabled"') do set "el=%%A"
if defined el (
2>nul set /a "BackgroundDisabled=el"
if defined BackgroundDisabled (
if !el! neq !BackgroundDisabled! set "BackgroundDisabled=!el!"
for %%A in (0 1) do if "!BackgroundDisabled!"=="%%A" exit /b
)
)
call :ERROR_REGEDIT BackgroundDisabled BackgroundDisabled
>nul reg add "!IS_REG!" /v "BackgroundDisabled" /t REG_DWORD /d 0 /f
goto :CHECK_BACKGROUNDDISABLED

:CHECK_BACKGROUNDTRANSPARENCY
set BackgroundTransparency=
set el=
for /f "tokens=3" %%A in ('2^>nul reg query "!IS_REG!" /v "BackgroundTransparency"') do set "el=%%A"
if defined el (
2>nul set /a "BackgroundTransparency=el"
if defined BackgroundTransparency (
if !el! neq !BackgroundTransparency! set "BackgroundTransparency=!el!"
if !BackgroundTransparency! geq 1 if !BackgroundTransparency! leq 100 exit /b
)
)
call :ERROR_REGEDIT BackgroundTransparency BackgroundTransparency
>nul reg add "!IS_REG!" /v "BackgroundTransparency" /t REG_DWORD /d 10 /f
goto :CHECK_BACKGROUNDTRANSPARENCY

:CHECK_BACKGROUNDWALLPAPER
set BackgroundWallpaper=
set el=
for /f "tokens=3" %%A in ('2^>nul reg query "!IS_REG!" /v "BackgroundWallpaper"') do set "el=%%A"
if defined el (
2>nul set /a "BackgroundWallpaper=el"
if defined BackgroundWallpaper (
if !el! neq !BackgroundWallpaper! set "BackgroundWallpaper=!el!"
if !BackgroundWallpaper! geq 1 if !BackgroundWallpaper! leq 12 exit /b
)
)
call :ERROR_REGEDIT BackgroundWallpaper BackgroundWallpaper
>nul reg add "!IS_REG!" /v "BackgroundWallpaper" /t REG_DWORD /d 6 /f
goto :CHECK_BACKGROUNDWALLPAPER

:CHECK_VOICEASSISTANT
set VoiceAssistant=
set el=
for /f "tokens=3" %%A in ('2^>nul reg query "!IS_REG!" /v "VoiceAssistant"') do set "el=%%A"
if defined el (
2>nul set /a "VoiceAssistant=el"
if defined VoiceAssistant (
if !el! neq !VoiceAssistant! set "VoiceAssistant=!el!"
for %%A in (0 1) do if "!VoiceAssistant!"=="%%A" exit /b
)
)
call :ERROR_REGEDIT VoiceAssistant VoiceAssistant
>nul reg add "!IS_REG!" /v "VoiceAssistant" /t REG_DWORD /d 0 /f
goto :CHECK_VOICEASSISTANT

:CHECK_VOICEASSISTANTCHOICE
set VoiceAssistantChoice=
set el=
for /f "tokens=3" %%A in ('2^>nul reg query "!IS_REG!" /v "VoiceAssistantChoice"') do set "el=%%A"
if defined el (
2>nul set /a "VoiceAssistantChoice=el"
if defined VoiceAssistantChoice (
if !el! neq !VoiceAssistantChoice! set "VoiceAssistantChoice=!el!"
for %%A in (0 1) do if "!VoiceAssistantChoice!"=="%%A" exit /b
)
)
call :ERROR_REGEDIT VoiceAssistantChoice VoiceAssistantChoice
>nul reg add "!IS_REG!" /v "VoiceAssistantChoice" /t REG_DWORD /d 1 /f
goto :CHECK_VOICEASSISTANTCHOICE

:CHECK_FIRSTLAUNCH
set FirstLaunch=
set el=
for /f "tokens=3" %%A in ('2^>nul reg query "!IS_REG!" /v "FirstLaunch"') do set "el=%%A"
if defined el (
2>nul set /a "FirstLaunch=el"
if defined FirstLaunch (
if !el! neq !FirstLaunch! set "FirstLaunch=!el!"
for %%A in (0 1) do if "!FirstLaunch!"=="%%A" exit /b
)
)
call :ERROR_REGEDIT FirstLaunch FirstLaunch
>nul reg add "!IS_REG!" /v "FirstLaunch" /t REG_DWORD /d 1 /f
goto :CHECK_FIRSTLAUNCH

:CHECK_UNTRUSTEDWEBSITESWARNING
set UntrustedWebsitesWarning=
set el=
for /f "tokens=3" %%A in ('2^>nul reg query "!IS_REG!" /v "UntrustedWebsitesWarning"') do set "el=%%A"
if defined el (
2>nul set /a "UntrustedWebsitesWarning=el"
if defined UntrustedWebsitesWarning (
if !el! neq !UntrustedWebsitesWarning! set "UntrustedWebsitesWarning=!el!"
for %%A in (0 1) do if "!UntrustedWebsitesWarning!"=="%%A" exit /b
)
)
call :ERROR_REGEDIT UntrustedWebsitesWarning UntrustedWebsitesWarning
>nul reg add "!IS_REG!" /v "UntrustedWebsitesWarning" /t REG_DWORD /d 1 /f
goto :CHECK_UNTRUSTEDWEBSITESWARNING

:CHECK_YOUTUBEDLP
set YouTubeDLP=
set el=
for /f "tokens=3" %%A in ('2^>nul reg query "!IS_REG!" /v "YouTubeDLP"') do set "el=%%A"
if defined el (
2>nul set /a "YouTubeDLP=el"
if defined YouTubeDLP (
if !el! neq !YouTubeDLP! set "YouTubeDLP=!el!"
for %%A in (0 1) do if "!YouTubeDLP!"=="%%A" exit /b
)
)
call :ERROR_REGEDIT YouTubeDLP YouTubeDLP
>nul reg add "!IS_REG!" /v "YouTubeDLP" /t REG_DWORD /d 0 /f
goto :CHECK_YOUTUBEDLP

:CHECK_YOUTUBEDLOUTPUTDIRECTORY
set YouTubeDLOutputDirectory=
for /f "tokens=2*" %%A in ('2^>nul reg query "!IS_REG!" /v "YouTubeDLOutputDirectory"') do set "YouTubeDLOutputDirectory=%%~fB"
if defined YouTubeDLOutputDirectory exit /b
call :ERROR_REGEDIT YouTubeDLOutputDirectory YouTubeDLOutputDirectory
for /f "tokens=3*" %%A in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Music"') do >nul reg add "!IS_REG!" /v "YouTubeDLOutputDirectory" /t REG_SZ /d "%%B\YouTube Downloader" /f
goto :CHECK_YOUTUBEDLOUTPUTDIRECTORY

:CHECK_YOUTUBEDLGEOBYPASS
set YouTubeDLGeoBypass=
set el=
for /f "tokens=3" %%A in ('2^>nul reg query "!IS_REG!" /v "YouTubeDLGeoBypass"') do set "el=%%A"
if defined el (
2>nul set /a "YouTubeDLGeoBypass=el"
if defined YouTubeDLGeoBypass (
if !el! neq !YouTubeDLGeoBypass! set "YouTubeDLGeoBypass=!el!"
for %%A in (0 1) do if "!YouTubeDLGeoBypass!"=="%%A" exit /b
)
)
call :ERROR_REGEDIT YouTubeDLGeoBypass YouTubeDLGeoBypass
>nul reg add "!IS_REG!" /v "YouTubeDLGeoBypass" /t REG_DWORD /d 0 /f
goto :CHECK_YOUTUBEDLGEOBYPASS


:CHECK_YOUTUBEDLPRIORITY
set YouTubeDLPriority=
for /f "tokens=3" %%A in ('2^>nul reg query "!IS_REG!" /v "YouTubeDLPriority"') do set "YouTubeDLPriority=%%~A"
if not "!YouTubeDLPriority!"=="REALTIME" if not "!YouTubeDLPriority!"=="HIGH" if not "!YouTubeDLPriority!"=="ABOVENORMAL" if not "!YouTubeDLPriority!"=="NORMAL" if not "!YouTubeDLPriority!"=="BELOWNORMAL" if not "!YouTubeDLPriority!"=="LOW" (
call :ERROR_REGEDIT YouTubeDLPriority YouTubeDLPriority
>nul reg add "!IS_REG!" /v "YouTubeDLPriority" /t REG_SZ /d NORMAL /f
goto :CHECK_YOUTUBEDLPRIORITY
)
set YouTubeDLPriority=/!YouTubeDLPriority!
exit /b

:CHECK_PORTPRIORITY
set PortPriority=
for /f "tokens=3" %%A in ('2^>nul reg query "!IS_REG!" /v "PortPriority"') do set "PortPriority=%%~A"
if not "!PortPriority!"=="REALTIME" if not "!PortPriority!"=="HIGH" if not "!PortPriority!"=="ABOVENORMAL" if not "!PortPriority!"=="NORMAL" if not "!PortPriority!"=="BELOWNORMAL" if not "!PortPriority!"=="LOW" (
call :ERROR_REGEDIT PortPriority PortPriority
>nul reg add "!IS_REG!" /v "PortPriority" /t REG_SZ /d NORMAL /f
goto :CHECK_PORTPRIORITY
)
set PortPriority=/!PortPriority!
exit /b

:CHECK_DEVELOPERMODE
set DeveloperKey=
set el=
for /f "tokens=3" %%A in ('2^>nul reg query "!IS_REG!" /v "DeveloperMode"') do set "el=%%A"
if defined el (
2>nul set /a "DeveloperKey=el"
if defined DeveloperKey if !el! neq !DeveloperKey! set "DeveloperKey=!el!"
)
2>nul set /a x1=DeveloperKey%%12312, x2=DeveloperKey%%17
if "!x1!"=="826" if "!x2!"=="6" set DeveloperMode=1
if not "!DeveloperMode!"=="1" (
>nul reg add "!IS_REG!" /v "DeveloperMode" /t REG_DWORD /d 0 /f
set DeveloperMode=0
)
for %%A in (DeveloperKey x1 x2) do set %%A=
if not "!DeveloperMode!"=="0" if not "!DeveloperMode!"=="1" (
call :ERROR_REGEDIT DeveloperMode DeveloperMode
>nul reg add "!IS_REG!" /v "DeveloperMode" /t REG_DWORD /d 0 /f
goto :CHECK_DEVELOPERMODE
)
exit /b

:ERROR_REGEDIT
set "el=!%2!"
if defined el if not "!el!"=="!el:~,150!" set "el=!el:~,150!..."
>nul 2>&1 reg query "!IS_REG!" /v "%1" && (
if "!Language!"=="FR" (set t="Une erreur inattendue est survenue.!\N!!\N!Debug: '!IS_REG!\%1=!el!'!\N!!\N!Réinitialisation du paramètre '%1' à la valeur par défaut.") else set t="An unexpected error has occurred.!\N!!\N!Debug: '!IS_REG!\%1=!el!'!\N!!\N!Resetting '%1' setting to default value."
call :MSGBOX 69680 "Illegal Services Checker"
)
exit /b

:SCALE
cls
mode %1,%2
set /a width=%1, height=%2
exit /b

:CLEAR
for /l %%A in (!c1!,1,!c2!) do set %%A=
set /a c1=%1, c2=0, c2+=%1-1
for %%A in (!db!) do set /a c2+=1
for /l %%A in (!c1!,1,!c2!) do set "%%A=!YELLOW!%%A !UNCHECKED!"
if not "%2"=="" (
set /a x1=c2+1, x2=c2+%2, cn=2
for /l %%A in (!x1!,1,!x2!) do (
set /a cn+=1
set c!cn!=%%A
)
)
exit /b

:PROMPT
%SHOWCURSOR%
set /a "_sp=width/2"
set x=
set /p "x=!YELLOW!!\E![!_sp!C"
%HIDECURSOR%
exit /b

:CHOOSE
if not defined x exit /b 1
set "el=%1"
if /i "!el:~,1!"=="!x!" exit /b 0
if /i "!el:~,2!"=="!x:~,2!" exit /b 0
exit /b 1

:WEBSITECHECK
if not defined x exit /b 1
for /f "delims=0123456789-,*" %%A in ("!x!") do exit /b 1
set x1=
for /f "tokens=1,*delims=*" %%A in ("!x!") do if "%%A*%%B"=="!x!" set x1=*
set _el=1
if not "!x:,=!"=="!x!" (
if not defined x1 if "!x:-=!"=="!x!" if "!x:,,=!"=="!x!" set el=,
) else if not "!x:-=!"=="!x!" (
if "!x:,=!"=="!x!" set el=-
) else if not defined x1 if "!x:-=!"=="!x!" if "!x:,=!"=="!x!" (
set el=
)
if not defined el (
for /l %%A in (!c1!,1,!c2!) do if "!x!"=="%%A" (
if "!%%A!"=="!YELLOW!%%A !CHECKED!" (
set "%%A=!YELLOW!%%A !UNCHECKED!"
set _el=0
) else (
call :UNTRUSTED_WEBSITES_WARNING %1 %%A
set "%%A=!YELLOW!%%A !CHECKED!"
set _el=0
)
)
) else if "!el!"=="," (
if not "!x:~,1!"=="," if not "!x:~-1!"=="," for %%A in (!x!) do (
set "el=%%~A"
if not "!el:~,1!"=="0" call :CHECKNUMBER "%%~A" && if %%A geq !c1! if %%A leq !c2! if "!%%A!"=="!YELLOW!%%A !CHECKED!" (
set "%%A=!YELLOW!%%A !UNCHECKED!"
set _el=0
) else (
call :UNTRUSTED_WEBSITES_WARNING %1 %%A
set "%%A=!YELLOW!%%A !CHECKED!"
set _el=0
)
)
) else if "!el!"=="-" (
call :STRLEN x
set x1=!len!
set "el=!x:-=!"
call :STRLEN el
set x2=!len!
set /a el=x1-x2
if not "!el!"=="1" exit /b 1
for /f "tokens=1,2delims=-" %%A in ("!x!") do (
if "%%A"=="*" if "%%B"=="*" (
for /l %%C in (!c1!,1,!c2!) do if "!%%C!"=="!YELLOW!%%C !CHECKED!" (
set "%%C=!YELLOW!%%C !UNCHECKED!"
set _el=0
) else (
call :UNTRUSTED_WEBSITES_WARNING %1 %%C
set "%%C=!YELLOW!%%C !CHECKED!"
set _el=0
)
exit /b !_el!
)
if "%%A"=="*" if not "%%B"=="*" (
set "el=%%B"
if "!el:~,1!"=="0" exit /b 1
call :CHECKNUMBER "%%B" || exit /b 1
for /l %%C in (!c1!,1,%%B) do if "!%%C!"=="!YELLOW!%%C !CHECKED!" (
set "%%C=!YELLOW!%%C !UNCHECKED!"
set _el=0
) else (
call :UNTRUSTED_WEBSITES_WARNING %1 %%C
set "%%C=!YELLOW!%%C !CHECKED!"
set _el=0
)
exit /b !_el!
)
if "%%B"=="*" if not "%%A"=="*" (
set "el=%%A"
if "!el:~,1!"=="0" exit /b 1
call :CHECKNUMBER "%%A" || exit /b 1
for /l %%C in (%%A,1,!c2!) do if "!%%C!"=="!YELLOW!%%C !CHECKED!" (
set "%%C=!YELLOW!%%C !UNCHECKED!"
set _el=0
) else (
call :UNTRUSTED_WEBSITES_WARNING %1 %%C
set "%%C=!YELLOW!%%C !CHECKED!"
set _el=0
)
exit /b !_el!
)
for %%C in ("%%~A" "%%~B") do (
set "el=%%~C"
if "!el:~,1!"=="0" exit /b 1
call :CHECKNUMBER "%%~C" || exit /b 1
)
if %%A leq %%B if %%A geq !c1! if %%A leq !c2! if %%B geq !c1! if %%B leq !c2! for /l %%D in (%%A,1,%%B) do if "!%%D!"=="!YELLOW!%%D !CHECKED!" (
set "%%D=!YELLOW!%%D !UNCHECKED!"
set _el=0
) else (
call :UNTRUSTED_WEBSITES_WARNING %1 %%D
set "%%D=!YELLOW!%%D !CHECKED!"
set _el=0
)
)
)
exit /b !_el!

:UNTRUSTED_WEBSITES_WARNING
if "!UntrustedWebsitesWarning!"=="1" if not "%2"=="" for %%A in (%~1) do for /f "tokens=1,2delims=`" %%B in ("%%A") do if "%2"=="%%B" (
if "!Language!"=="EN" set t="You have selected '%%C' which is flagged as an untrusted* website. Be careful using it.!\N!!\N!*Untrusted websites are known to the warez community to index malicious or suspicious as well as legitimate content."
if "!Language!"=="FR" set t="Vous avez sélectionné '%%C' qui est signalé comme un site web non fiable*. Soyez prudent en l'utilisant.!\N!!\N!*Les sites web non fiables sont connus de la communauté warez pour indexer du contenu malveillant ou suspect ainsi que légitime."
call :MSGBOX 69680 "Illegal Services Checker"
)
exit /b

:CHECKNUMBER
if "%~1"=="" exit /b 1
for /f "delims=0123456789" %%A in ("%~1") do exit /b 1
exit /b 0

:WEBSITESTART
if defined x exit /b 1
set _el=1
set el=
set cn=
for /l %%A in (!c1!,1,!c2!) do if "!%%A!"=="!YELLOW!%%A !CHECKED!" (
set s=s
set /a cn=c1-1
for %%B in (!db!) do (
set /a cn+=1
if "!cn!"=="%%A" (
if "%%~B"=="Dox Tool v2" (set el=1) else if "%%~B"=="Windows ISO Downloader" (set el=2) else (
set "url=%%B"
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
if "!Language!"=="EN" set "t=ERROR: !BRIGHTBLACK!"!YELLOW!!x!!BRIGHTBLACK!" is not a valid choice"
if "!Language!"=="FR" set "t=ERREUR: !BRIGHTBLACK!"!YELLOW!!x!!BRIGHTBLACK!" n'est pas un choix valide"
) else (
if "!Language!"=="EN" set "t=ERROR: !BRIGHTBLACK!"!YELLOW!!%1!!BRIGHTBLACK!" is not a valid %~3"
if "!Language!"=="FR" set "t=ERREUR: !BRIGHTBLACK!"!YELLOW!!%1!!BRIGHTBLACK!" n'est pas %~2 valide"
)
set t=!RED!!t!...
call :DRAW_CENTER_ERROR t
>nul timeout /t 3
exit /b

:START_DOXTOOLV2
for %%A in (Newtonsoft.Json.dll "Dox Tool V2.exe") do if not exist "Portable_Apps\DoxToolV2\%%~A" call :CURL "Portable_Apps\DoxToolV2.7z" "`git_raw_downloads`/DoxToolV2.7z" || (call :ERROR_INTERNET & exit /b)
pushd "Portable_Apps\DoxToolV2"
start "" "Dox Tool V2.exe" && (
if "!Language!"=="EN" set t="Only 'Username Search' & 'Extra Tools' are working.!\N!!\N!The tool has not been updated since 05-02-2016."
if "!Language!"=="FR" set t="Seules 'Username Search' & 'Extra Tools' fonctionnent.!\N!!\N!L'outil n'a pas été mis à jour depuis le 05-02-2016."
call :MSGBOX 69696 "Illegal Services Checker"
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
echo !YELLOW![R]!CYAN! ^> Use REALTIME priority class.
echo !YELLOW![H]!CYAN! ^> Use HIGH priority class.
echo !YELLOW![A]!CYAN! ^> Use ABOVENORMAL priority class.
echo !YELLOW![N]!CYAN! ^> Use NORMAL priority class.
echo !YELLOW![B]!CYAN! ^> Use BELOWNORMAL priority class.
echo !YELLOW![L]!CYAN! ^> Use LOW priority class.
echo:
%SHOWCURSOR%
>nul choice /n /c RHANBL
if "!errorlevel!"=="1" set %1=REALTIME
if "!errorlevel!"=="2" set %1=HIGH
if "!errorlevel!"=="3" set %1=ABOVENORMAL
if "!errorlevel!"=="4" set %1=NORMAL
if "!errorlevel!"=="5" set %1=BELOWNORMAL
if "!errorlevel!"=="6" set %1=LOW
exit /b

:GET_VERSION
call :CURL_RAW JB0xvJRG LastVersion
if defined LastVersion (
if "!VERSION:~1,7!" geq "!LastVersion:~1,7!" exit /b 0
if "!VERSION:~1,3!" lss "!LastVersion:~1,3!" exit /b 1
if "!VERSION:~1,7!" lss "!LastVersion:~1,7!" exit /b 2
) else (
call :ROSE "Error Internet"
if "!Language!"=="EN" set t="Checking the latest version has failed.!\N!!\N!Can't check the latest version.!\N!!\N!Check your current Internet settings and try again."
if "!Language!"=="FR" set t="La vérification de la dernière version a échoué.!\N!!\N!Impossible de vérifier la dernière version.!\N!!\N!Vérifiez vos paramètres Internet actuels et réessayez."
call :MSGBOX 69680 "Illegal Services Checker"
)
exit /b 3

:DRAW_LOGO
echo     ██╗██╗     ██╗     ███████╗ ██████╗  █████╗ ██╗         ███████╗███████╗██████╗ ██╗   ██╗██╗ ██████╗███████╗███████╗
echo     ██║██║     ██║     ██╔════╝██╔════╝ ██╔══██╗██║         ██╔════╝██╔════╝██╔══██╗██║   ██║██║██╔════╝██╔════╝██╔════╝
echo     ██║██║     ██║     █████╗  ██║  ███╗███████║██║         ███████╗█████╗  ██████╔╝██║   ██║██║██║     █████╗  ███████╗
echo     ██║██║     ██║     ██╔══╝  ██║   ██║██╔══██║██║         ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██║██║     ██╔══╝  ╚════██║
echo     ██║███████╗███████╗███████╗╚██████╔╝██║  ██║███████╗    ███████║███████╗██║  ██║ ╚████╔╝ ██║╚██████╗███████╗███████║
echo     ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝    ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚═╝ ╚═════╝╚══════╝╚══════╝
exit /b

:DRAW_CENTER
set "el=%~1"
call :STRLEN el
set x1=!len!
set "el=!el:%\E%=!"
call :STRLEN el
set x2=!len!
set /a el=(x1-x2)*4, len-=el
if !len! lss !width! (set /a "_sp=(width-len)/2") else set _sp=
<nul set /p="!\E![!_sp!C%~1"
if not "%2"=="1" echo:
exit /b

:DRAW_CUSTOM_CENTER
set "el=%~2"
call :STRLEN el
set x1=!len!
set "el=!el:%\E%=!"
call :STRLEN el
set x2=!len!
set /a el=(x1-x2)*4, len-=el
set /a "_sp=(%1-len)/2"
<nul set /p="!\E![!_sp!C%~2"
echo:
exit /b

:DRAW_CENTER_ERROR
set "el=!%1!"
call :STRLEN el
set x1=!len!
set "el=!el:%\E%=!"
call :STRLEN el
set x2=!len!
set /a el=(x1-x2)*4, len-=el
if !len! lss !width! (set /a "_sp=(width-len)/2") else set _sp=
<nul set /p="!\E![!_sp!C!%1!"
if not "%2"=="1" echo:
exit /b

:STRLEN
::https://www.dostips.com/DtTipsStringOperations.php#Function.strLen
set "str=a!%1!"
set len=0
for /l %%A in (12,-1,0) do (
set /a "len|=1<<%%A"
for %%B in (!len!) do if "!str:~%%B,1!"=="" set /a "len&=~1<<%%A"
)
exit /b

:READ_IPLOOKUP
if exist "!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt" (start "" "!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt") else (
if "!Language!"=="EN" set t="IP Lookup list not found.!\N!!\N!You must first save a Lookup to be able to read it."
if "!Language!"=="FR" set t="Liste d'IP Lookup non trouvée.!\N!!\N!Vous devez d'abord enregistrer une Lookup pour pouvoir la lire."
call :MSGBOX 69680 "Illegal Services Checker"
)
exit /b

:DELETE_IPLOOKUP
if exist "!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt" (
del /f /q "!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt" && (
if "!Language!"=="EN" set t="IP Lookup list successfully deleted."
if "!Language!"=="FR" set t="La liste d'IP Lookup a bien été supprimée."
call :MSGBOX 69696 "Illegal Services Checker"
)
) else (
if "!Language!"=="EN" set t="IP Lookup list not found.!\N!!\N!You must first save a Lookup to be able to delete it."
if "!Language!"=="FR" set t="Liste d'IP Lookup non trouvée.!\N!!\N!Vous devez d'abord enregistrer une Lookup pour pouvoir la supprimer."
call :MSGBOX 69680 "Illegal Services Checker"
)
exit /b

:ERROR_INTERNET
if "!errorlevel!"=="1" (
call :ROSE "Error Internet"
if "!Language!"=="EN" set t="Your Internet access appears to be offline.!\N!!\N!You must activate Internet and try again."
if "!Language!"=="FR" set t="Votre accès Internet semble ˆtre hors ligne.!\N!!\N!Veuillez activer Internet et réessayer."
)
if "!errorlevel!"=="2" (
call :ROSE "Error Remote Host"
if "!Language!"=="EN" set t="The remote host appears to be offline.!\N!!\N!Downloading '!curl_url!' impossible."
if "!Language!"=="FR" set t="L'h“te distant semble ˆtre hors ligne.!\N!!\N!Téléchargement de '!curl_url!' impossible."
)
if "!errorlevel!"=="3" (
call :ROSE "Error Git Proxy Backup"
if "!Language!"=="EN" set t="The Git proxy backup server is running. You cannot download external files from it.!\N!!\N!Downloading '!curl_url!' impossible."
if "!Language!"=="FR" set t="Le serveur proxy Git de secours est en marche. Vous ne pouvez pas télécharger de fichiers externes à partir de celui-ci.!\N!!\N!Téléchargement de '!curl_url!' impossible."
)
if "!errorlevel!"=="4" (
call :ROSE "Error Git Proxy"
if "!Language!"=="EN" set t="IS Git proxy: '!git!' appears to be offline.!\N!!\N!Downloading '!curl_url!' impossible.!\N!!\N!Try to restart Illegal Services or join our Telegram groups for more updates."
if "!Language!"=="FR" set t="IS Git proxy: '!git!' semble ˆtre hors ligne.!\N!!\N!Téléchargement de '!curl_url!' impossible.!\N!!\N!Essayez de redémarrer Illegal Services ou rejoignez nos groupes Telegram pour plus de mises à jour."
)
call :MSGBOX 69680 "Illegal Services Checker"
exit /b

:PROXY
call :CHECK_INTERNET || (call :PROXY_DOWN & exit /b 1)
call :CHECK_PROXY
if defined Proxy for /f %%A in ("!Proxy:*://=!") do call :_PROXY %%A && exit /b 0
for %%A in (!GIT_LIST!) do call :_PROXY %%A && exit /b 0
if defined git_backup exit /b 3
set "git_backup=backup "
call :PROXY_DOWN
call :CURL_RAW 1ARL0img git
call :CURL_RAW urudZjdg git_build
call :CURL_RAW c5nbugAf git_changelog
call :CURL_RAW ThrdeC97 git_release
if "!Language!"=="EN" set t="Illegal Services cannot connect to its Git proxy server.!\N!!\N!The Git proxy backup server is running and only updates for Illegal Services can be performed."
if "!Language!"=="FR" set t="Illegal Services ne peut pas se connecter à son serveur proxy Git.!\N!!\N!Le serveur proxy Git de secours est en marche et seules les mises à jour d'Illegal Services peuvent ˆtre effectuées."
call :MSGBOX 69648 "Illegal Services Checker"
exit /b 2

:_PROXY
for /f %%A in ('curl.exe -fIksw "%%{response_code}" -o NUL "https://%1"') do if "%%A"=="200" (
if "%1"=="github.com/Illegal-Services/Illegal_Services" call :__PROXY %1 raw tree/source & exit /b 0
if "%1"=="bitbucket.org/IllegalServices/illegal_services" call :__PROXY %1 raw src/source/ & exit /b 0
if "%1"=="git.teknik.io/Illegal-Services/Illegal_Services" call :__PROXY %1 raw/branch src/branch/source & exit /b 0
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
>nul reg add "!IS_REG!" /v "Proxy" /t REG_SZ /d "!git!" /f
exit /b

:PROXY_DOWN
for %%A in (
git
git_raw_main
git_raw_downloads
git_raw_source
git_build
git_changelog
git_release
git_source
) do set %%A=404 Git proxy not found
exit /b

:CURL_RAW
for /f "delims=" %%A in ('curl.exe -fkLs "https://pastebin.com/raw/%1"') do set "%2=%%A"
exit /b

:ERROR_WINDOWS_VERSION
if "!Language!"=="EN" set t="Your Windows version is not compatible with that feature."
if "!Language!"=="FR" set t="Votre version de Windows n'est pas compatible avec cette fonctionnalité."
call :MSGBOX 69648 "Illegal Services Checker"
exit /b

:OPEN_FOLDER
if exist "%~1" (start "" "%~1") else (
if "!Language!"=="EN" set t="Folder '%~1' not found.!\N!!\N!You must first download to be able to open it."
if "!Language!"=="FR" set t="Dossier '%~1' non trouvée.!\N!!\N!Vous devez d'abord télécharger pour pouvoir ouvrir le dossier."
call :MSGBOX 69680 "Illegal Services Checker"
)
exit /b

:START_DOWNLOADED_FILE
pushd "!TMPF!"
if "!Language!"=="EN" echo Please complete "!YELLOW!%1!CYAN!" installation in the window that appeared...
if "!Language!"=="FR" echo Veuillez terminer l'installation de "!YELLOW!%1!CYAN!" dans la fenˆtre qui est apparue...
echo:
start /w %1
>nul timeout /t 0 /nobreak
del /f /q %1
popd
exit /b

:SHOW_WINDOW
for /f "tokens=2delims=," %%A in ('tasklist /v /fo csv /fi "imagename eq %~1" ^| findstr /ic:"%~2"') do (
set "el=%%A"
set "el=!el:"=!"
cmdwiz.exe showwindow value:1 /p:"!el:"=!"
cmdwiz.exe showwindow top /p:"!el:"=!"
exit /b 0
)
exit /b 1

:MISSING_FILE
if not defined _el (
if "!Language!"=="EN" echo !RED![FAILED: missing file^(s^)] . . .
if "!Language!"=="FR" echo !RED![ECHEC: fichier^(s^) manquant^(s^)] . . .
set _el=1
)
if "!Language!"=="EN" echo !CYAN!The file !RED!"!IS_DIR!%1"!CYAN! is missing, trying to download it...
if "!Language!"=="FR" echo !CYAN!Le fichier !RED!"!IS_DIR!%1"!CYAN! est manquant, tentative de téléchargement...
exit /b

:ERROR_FATAL
set el=
if "!Language!"=="EN" set "t=Illegal Services can't start because '!IS_DIR!%1' is missing."
if "!Language!"=="FR" set "t=Illegal Services ne peut pas démarrer car '!IS_DIR!%1' est manquant."
if "%2"=="CURL" (
if "!Language!"=="EN" set "t=!t!!\N!!\N!Please reinstall Illegal Services and try again."
if "!Language!"=="FR" set "t=!t!!\N!!\N!Veuillez réinstaller Illegal Services et réessayer."
set el=2
) else (
if "!errorlevel!"=="1" (
if "!Language!"=="EN" set "t=!t!!\N!!\N!You must activate Internet and try again."
if "!Language!"=="FR" set "t=!t!!\N!!\N!Veuillez activer Internet et réessayer."
)
if "!errorlevel!"=="2" (
if "!Language!"=="EN" set "t=!t!!\N!!\N!IS Git proxy: '!git!' appears to be offline. For more updates visit our Telegram."
if "!Language!"=="FR" set "t=!t!!\N!!\N!IS Git proxy: '!git!' semble ˆtre hors ligne. Pour plus de mises à jour, visitez notre Telegram."
set el=1
)
)
set t="!t!"
call :MSGBOX 69648 "Illegal Services Checker"
if "!el!"=="1" start https://t.me/illegal_services_forum
if "!el!"=="2" start https://t.me/illegal_services
exit