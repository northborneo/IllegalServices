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
REM  Productversion:  5. 9. 1. 2
REM  Fileversion:  5. 9. 1. 2
REM  Internalname: Illegal_Services.exe
REM  Appicon: Ressources\Icons\icon.ico
REM  AdministratorManifest: Yes
REM  QBFC Project Options End
@ECHO ON
@echo off
setlocal DisableDelayedExpansion
cd /d "%~dp0"
setlocal EnableDelayedExpansion
cls
for /f "delims=" %%A in ('set') do set "DUMP_IS=!DUMP_IS!`%%A"
if defined DUMP_IS set "DUMP_IS=!DUMP_IS!`"
set "HIDECURSOR=<nul set /p=[?25l"
set "SHOWCURSOR=<nul set /p=[?25h"
%HIDECURSOR%
for %%A in (%*) do if "%%~A"=="--debug" set "DEBUG=[Debug] "
if not "%~1"=="" if defined Language for %%A in (FAQ SCANWEBSITES NMAP YOUTUBEDL PINGER) do if "%~1"=="%%A" (
call :APPLY_SETTINGS
for /f "tokens=6" %%A in ('cmdwiz.exe getconsoledim') do if %%A lss 120 call :SCALE 120 30
goto :PROCESS_%%A
)
call :SCALE 125 19
if exist "cmdwiz.exe" cmdwiz.exe setquickedit 0
set IS_REG=HKCU\SOFTWARE\IB_U_Z_Z_A_R_Dl\Illegal Services
call :CHECK_LANGUAGE
call :CHECK_USERNAME
set TITLE=!DEBUG!` - Illegal Services
title !TITLE:`=Launcher!
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
if /i "%~x0"==".exe" (set "IS_PROCESS=%~nx0") else set "IS_PROCESS=cmd.exe" & goto :LAUNCHER
if "%~nx0"=="Illegal Services.exe" (
>nul 2>&1 taskkill /f /im "Illegal_Services.exe" /t
>nul move /y "%~nx0" "Illegal_Services.exe" && (start Illegal_Services.exe !DEBUG!) && exit
)
set cn=
for /f %%A in ('tasklist /fo csv /fi "imagename eq %~nx0" ^| findstr /c:"%~nx0"') do set /a cn+=1
pushd "!TMPF!"
set BATUSED=
for /f %%A in ('dir "????????.bat" /a:-d /o:-d /b ^| findstr /rc:"........\.bat"') do (
if not defined BATUSED (
set "BATUSED=%%A"
attrib -s -h "%%A"
attrib +s +h +i "%%A"
)
if !cn! gtr 1 goto :LAUNCHER
if not "%%A"=="!BATUSED!" del /f /q /a "%%A"
)

:LAUNCHER
popd
for %%A in (VERSION LastVersion) do if defined %%A set old_%%A=!%%A!
set VERSION=v5.9.1.2 - 26/10/2021
set "el=UNDERLINE=[4m,UNDERLINEOFF=[24m,BLACK=[30m,RED=[31m,GREEN=[32m,YELLOW=[33m,BLUE=[34m,MAGENTA=[35m,CYAN=[36m,WHITE=[37m,BGBLACK=[40m,BGYELLOW=[43m,BGWHITE=[47m,BRIGHTBLACK=[90m,BRIGHTRED=[91m,BRIGHTBLUE=[94m,BRIGHTMAGENTA=[95m"
set "%el:,=" && set "%"
echo !BGBLACK!!BRIGHTBLUE!
call :DRAW_LOGO
echo:
echo [28C!CYAN!{!RED!+!CYAN!}---------------------------------------------------------------{!RED!+!CYAN!}!RED!
if "!Language!"=="EN" call :DRAW_CENTER "   !YELLOW!Welcome [!RED!!IS_Username!!YELLOW!] to Illegal Services !VERSION:~,8!   !RED!" 20
if "!Language!"=="FR" call :DRAW_CENTER "   !YELLOW!Bienvenue [!RED!!IS_Username!!YELLOW!] dans Illegal Services !VERSION:~,8!   !RED!" 20
echo [28C!CYAN!{!RED!+!CYAN!}---------------------------------------------------------------{!RED!+!CYAN!}
for /f %%A in ('2^>nul dir "!TMPF!\URL????.url" /a:-d /b ^| findstr /rc:"URL....\.url"') do del /f /q "!TMPF!\%%A"
for %%A in (README.md "Illegal Services.exe" "!TMPF!\msgbox.vbs" "!TMPF!\IS.Setup.exe") do if exist "%%~A" del /f /q "%%~A"
for %%A in ("!CD:~,2!\AI_RecycleBin" "!SystemDrive!\AI_RecycleBin" "!TMPF!\IB_U_Z_Z_A_R_Dl") do if exist "%%~A" 2>nul rd /s /q "%%~A"
set "sp=[28C!YELLOW!{$} !BRIGHTBLACK!"
echo !BRIGHTBLACK!
set "IS_DIR=%~dp0Illegal Services\"
set "IS_DIR=!IS_DIR:Illegal Services\Illegal Services\=Illegal Services\!"
if defined ProgramFiles(x86) (set ARCH=64) else set ARCH=86
if not "!PATH:~-9!"==";Curl\x!ARCH!" set "PATH=!PATH!;Curl\x!ARCH!"
>nul 2>&1 where curl.exe || call :ERROR_FATAL !PATH:~-8!\curl.exe CURL

:LAUNCHER_PROXY
if "!Language!"=="EN" <nul set /p="!sp!Searching a proxy ^> "
if "!Language!"=="FR" <nul set /p="!sp!Recherche d'un proxy ^> "
set GIT_LIST=github.com/Illegal-Services/Illegal_Services bitbucket.org/IllegalServices/illegal_services git.teknik.io/Illegal-Services/Illegal_Services gitee.com/Illegal-Services/illegal_services
call :PROXY

:LAUNCHER_VERSION
if defined git for /f "delims=/" %%A in ("!git:*://=!") do if defined git_backup (echo !GREEN![!RED!Git backup server: !GREEN!%%A] . . .) else if "!git!"=="404 Git proxy not found" (
if "!Language!"=="EN" echo !RED![FAILED] . . .
if "!Language!"=="FR" echo !RED![ECHEC] . . .
) else echo !GREEN![%%A] . . .
if "!Language!"=="EN" <nul set /p="!sp!Searching for a new update ^> "
if "!Language!"=="FR" <nul set /p="!sp!Recherche d'une nouvelle mise … jour ^> "
call :CHECK_VOICEASSISTANT
call :GET_VERSION
if defined OLD_VERSION if defined OLD_LASTVERSION if "!OLD_VERSION!"=="!VERSION!" if "!OLD_LASTVERSION!"=="!LastVersion!" (
if "!Language!"=="EN" echo !RED![FAILED: Wait for the next build update.] . . .
if "!Language!"=="FR" echo !RED![ECHEC: Attendez la prochaine mise … jour de la build.] . . .
goto :CHECKERINTEGRITY
)
if defined LastVersion (echo !GREEN![!LastVersion!] . . .) else (
if "!Language!"=="EN" echo !RED![FAILED] . . .
if "!Language!"=="FR" echo !RED![ECHEC] . . .
)
if "!errorlevel!"=="1" call :CHECKER_SETUP_FOUND
if "!errorlevel!"=="2" call :CHECKER_BUILD_FOUND

:CHECKERINTEGRITY
if "!Language!"=="EN" <nul set /p="!sp!Checking files integrity ^> "
if "!Language!"=="FR" <nul set /p="!sp!Vrification de l'intgrite des fichiers ^> "
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
if "!Language!"=="EN" <nul set /p="!sp!Checking Windows version ^> "
if "!Language!"=="FR" <nul set /p="!sp!Vrification de votre version de Windows ^> "
for /f "tokens=4-7delims=[.] " %%A in ('ver') do if /i "%%A"=="Version" (set "WINDOWS_VERSION=%%B.%%C") else set "WINDOWS_VERSION=%%A.%%B"
for /f "tokens=2delims=:." %%A in ('chcp') do set /a "CP=%%A"
for %%A in (WINDOWS_VERSION ARCH CP) do if not defined %%A set %%A=?
if "!WINDOWS_VERSION!"=="?" (<nul set /p="!RED![!WINDOWS_VERSION!], ") else <nul set /p="!GREEN![!WINDOWS_VERSION!], "
if "!ARCH!"=="?" (<nul set /p="!RED![!ARCH!], ") else <nul set /p="!GREEN![x!ARCH!], "
if "!CP!"=="?" (<nul set /p="!RED![!CP!] . . .") else <nul set /p="!GREEN![CHCP:!CP!] . . ."
echo:
if not "!WINDOWS_VERSION!"=="10.0" if not "!WINDOWS_VERSION!"=="6.3" if not "!WINDOWS_VERSION!"=="6.2" if not "!WINDOWS_VERSION!"=="6.1" (
if "!Language!"=="EN" set t="ERROR: Your computer does not reach the minimum Windows version compatible with Illegal Services." "You need Windows 7 or higher."
if "!Language!"=="FR" set t="ERREUR: Votre ordinateur n'atteint pas la version minimale de Windows compatible avec Illegal Services." "Vous avez besoin de Windows 7 ou suprieur."
call :MSGBOX 2 !t! 69648 "Illegal Services Checker"
exit
)
if "!CP!"=="?" (
if "!Language!"=="EN" set t="Illegal Services could not determine your CHCP number." "Please report this bug on the Illegal Services Telegram forum in order to correct this bug in a future release."
if "!Language!"=="FR" set t="Illegal Services n'a pas pu dterminer votre numro CHCP." "Veuillez signaler ce bug sur le forum Telegram d'Illegal Services afin de corriger ce bug dans une future version."
call :MSGBOX 2 !t! 69648 "Illegal Services Checker"
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
if "!Language!"=="EN" <nul set /p="!sp!Applying your settings ^> "
if "!Language!"=="FR" <nul set /p="!sp!Applique vos paramtres ^> "
call :APPLY_SETTINGS
call :CHECK_UNTRUSTEDWEBSITESWARNING
if "!Language!"=="EN" echo !GREEN![PASSED] . . .
if "!Language!"=="FR" echo !GREEN![PASSER] . . .

:LAUNCHER_START
call :ROSE "Welcome Back"
if "!Language!"=="EN" <nul set /p="!sp!Starting Illegal Services ^> "
if "!Language!"=="FR" <nul set /p="!sp!Dmarrage d'Illegal Services ^> "
for /f "tokens=2*" %%A in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal"') do set "IS_OUTPUTDIRECTORY=%%B\Illegal Services"
set "CHECKED=!CYAN![!YELLOW!x!CYAN!]!WHITE! "
set "UNCHECKED=!CYAN![ ]!WHITE! "
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
echo [19Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
<nul set /p=!BRIGHTRED!                                  !UNDERLINE!!VERSION:~,8!!UNDERLINEOFF!             !RED!Û!BGYELLOW! MAIN MENU !BGBLACK!!RED!Û!BGBLACK!!BRIGHTRED!
if "!Language!"=="EN" (set t=Welcome) else set t=Bienvenue
call :DRAW_CUSTOM_CENTER 37 "!UNDERLINE!!t! !IS_Username!!UNDERLINEOFF!!CYAN!" 14
echo [19Cฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
echo [19Cบ    !YELLOW!1!CYAN!  ^>  !WHITE!Internet Protocol TV (IPTV)!CYAN!    Û    !YELLOW!10!CYAN!  ^>  !WHITE!IP Denial of Services (DDoS)!CYAN!    บ
echo [19Cบ    !YELLOW!2!CYAN!  ^>  !WHITE!Direct Download Link (DDL)!CYAN!     Û    !YELLOW!11!CYAN!  ^>  !WHITE!IP Address Lookup!CYAN!               บ
echo [19Cบ    !YELLOW!3!CYAN!  ^>  !WHITE!Streaming!CYAN!                      Û    !YELLOW!12!CYAN!  ^>  !WHITE!IP Port Scanning!CYAN!                บ
echo [19Cบ    !YELLOW!4!CYAN!  ^>  !WHITE!Torrenting!CYAN!                     Û    !YELLOW!13!CYAN!  ^>  !WHITE!IP Port Pinger!CYAN!                  บ
echo [19Cบ    !YELLOW!5!CYAN!  ^>  !WHITE!Subtitles!CYAN!                      Û    !YELLOW!14!CYAN!  ^>  !WHITE!IP Pinger!CYAN!                       บ
echo [19Cบ    !YELLOW!6!CYAN!  ^>  !WHITE!Cracked Windows apps!CYAN!           Û    !YELLOW!15!CYAN!  ^>  !WHITE!IP Loggers!CYAN!                      บ
echo [19Cบ    !YELLOW!7!CYAN!  ^>  !WHITE!Cracked Android APK's!CYAN!          Û    !YELLOW!16!CYAN!  ^>  !WHITE!Doxing!CYAN!                          บ
echo [19Cบ    !YELLOW!8!CYAN!  ^>  !WHITE!YouTube Downloader!CYAN!             Û    !YELLOW!17!CYAN!  ^>  !WHITE!Portable Apps!CYAN!                   บ
echo [19Cบ    !YELLOW!9!CYAN!  ^>  !WHITE!Useful Websites!CYAN!                Û    !YELLOW!18!CYAN!  ^>  !WHITE!More Features!CYAN!                   บ
echo [19Cฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
if "!Language!"=="EN" echo [19Cบ    !YELLOW!C!CYAN!  ^>  !WHITE!Credits!CYAN!!UNDERLINEOFF!     บ    !YELLOW!N!CYAN!  ^>  !BRIGHTRED!Our Social Networks!CYAN!    บ      !YELLOW!S!CYAN!  ^>  !WHITE!Settings!CYAN!!UNDERLINEOFF!        บ
if "!Language!"=="FR" echo [19Cบ    !YELLOW!C!CYAN!  ^>  !WHITE!Crdits!CYAN!!UNDERLINEOFF!     บ    !YELLOW!R!CYAN!  ^>  !BRIGHTRED!Nos Rseaux Sociaux!CYAN!    บ      !YELLOW!P!CYAN!  ^>  !WHITE!Paramtres!CYAN!!UNDERLINEOFF!      บ
echo [19Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!HELP!BRIGHTBLACK!" / "!YELLOW!FAQ!BRIGHTBLACK!" / "!YELLOW!CHANGELOG!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 40
echo:
call :CHECK_FIRSTLAUNCH
if "!VERSION:~5,3!"=="0.0" if "!FirstLaunch!"=="1" (
if "!Language!"=="EN" (
echo Dim Msg,Style,Title,Response
echo Msg="News in !VERSION:~,8!:"^&vbCrLf^&vbCrLf^&"Updated:"^&vbCrLf^&vbCrLf^&"Settings"^&vbCrLf^&"Internet Protocol Television"^&vbCrLf^&"Direct Download Link"^&vbCrLf^&"Streaming"^&vbCrLf^&"Streaming Applications"^&vbCrLf^&"Torrenting"^&vbCrLf^&"Subtitles"^&vbCrLf^&"Cracked Windows apps"^&vbCrLf^&"Cracked Android APK's"^&vbCrLf^&"Useful Websites"^&vbCrLf^&"IP Denial of Services"^&vbCrLf^&"IP Loggers"^&vbCrLf^&"Doxing"^&vbCrLf^&"Portable Apps"^&vbCrLf^&"More Features Warez Wikis"^&vbCrLf^&"More Features Release Logs"^&vbCrLf^&"More Features Ebooks"^&vbCrLf^&"More Features Musics"^&vbCrLf^&"More Features Forum Websites."
echo Style=69696
echo Title="News - Illegal Services"
echo Response=MsgBox^(Msg,Style,Title^)
)>"!TMPF!\msgbox.vbs"
if "!Language!"=="FR" (
echo Dim Msg,Style,Title,Response
echo Msg="Nouveaut้s dans la !VERSION:~,8!:"^&vbCrLf^&vbCrLf^&"Mise เ jour de:"^&vbCrLf^&vbCrLf^&"Credits"^&vbCrLf^&"Settings"^&vbCrLf^&"Internet Protocol Television"^&vbCrLf^&"Direct Download Link"^&vbCrLf^&"Streaming"^&vbCrLf^&"Streaming Applications"^&vbCrLf^&"Torrenting"^&vbCrLf^&"Subtitles"^&vbCrLf^&"Cracked Windows apps"^&vbCrLf^&"Cracked Android APK's"^&vbCrLf^&"Useful Websites"^&vbCrLf^&"IP Denial of Services"^&vbCrLf^&"IP Loggers"^&vbCrLf^&"Doxing"^&vbCrLf^&"Portable Apps"^&vbCrLf^&"More Features Warez Wikis"^&vbCrLf^&"More Features Release Logs"^&vbCrLf^&"More Features Ebooks"^&vbCrLf^&"More Features Musics"^&vbCrLf^&"More Features Forum Websites."
echo Style=69696
echo Title="Nouveaut้s - Illegal Services"
echo Response=MsgBox^(Msg,Style,Title^)
)>"!TMPF!\msgbox.vbs"
cscript //nologo "!TMPF!\msgbox.vbs"
if "!Language!"=="EN" (
echo Dim Msg,Style,Title,Response
echo Msg="Developer Note:"^&vbCrLf^&vbCrLf^&"In this update, I added:"^&vbCrLf^&vbCrLf^&"Settings: Untrusted Websites Warning"^&vbCrLf^&"Torrenting: Torrent Applications"^&vbCrLf^&"Useful Websites: Combo Lists"^&vbCrLf^&"More Features: Release Logs"^&vbCrLf^&"More Features: Musics"^&vbCrLf^&vbCrLf^&"Updated many categories and fixed various bugs."^&vbCrLf^&vbCrLf^&"For a full version of the ChangeLog: !git_changelog:404 Git proxy not found=https://github.com/Illegal-Services/Illegal_Services/blob/main/ChangeLog.txt!"
echo Style=69696
echo Title="News - Illegal Services"
echo Response=MsgBox^(Msg,Style,Title^)
)>"!TMPF!\msgbox.vbs"
if "!Language!"=="FR" (
echo Dim Msg,Style,Title,Response
echo Msg="Note du d้veloppeur:"^&vbCrLf^&vbCrLf^&"Dans cette mise เ jour, jai ajout้ les menus:"^&vbCrLf^&vbCrLf^&"Param่tres: Untrusted Websites Warning"^&vbCrLf^&"Torrenting: Torrent Applications"^&vbCrLf^&"Useful Websites: Combo Lists"^&vbCrLf^&"More Features: Release Logs"^&vbCrLf^&"More Features: Musics"^&vbCrLf^&vbCrLf^&"Mise เ jour de nombreuses cat้gories et corrig้ divers bugs."^&vbCrLf^&vbCrLf^&"Pour une version compl่te du ChangeLog: !git_changelog:404 Git proxy not found=https://github.com/Illegal-Services/Illegal_Services/blob/main/ChangeLog.txt!"
echo Style=69696
echo Title="Nouveaut้s - Illegal Services"
echo Response=MsgBox^(Msg,Style,Title^)
)>"!TMPF!\msgbox.vbs"
cscript //nologo "!TMPF!\msgbox.vbs"
del /f /q "!TMPF!\msgbox.vbs"
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
call :CHOOSE faq && (call :SHOW_WINDOW "Frequently Asked Questions" || (start "" "%~0" FAQ) & goto :MAINMENU)
if /i "!x!"=="--dump" (>LOG_DUMP.txt set & start LOG_DUMP.txt & goto :MAINMENU)
if /i "!x!"=="--dump-IS" (
if exist LOG_DUMP.txt del /f /q LOG_DUMP.txt
for /f "delims=" %%A in ('set') do if "!DUMP_IS:`%%A`=!"=="!DUMP_IS!" >>LOG_DUMP.txt echo %%A
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
echo [39Cอออออออออออออออ
echo [38C// !RED!Û!BGYELLOW!!BLACK! CREDITS !RED!Û!BGBLACK!!CYAN! \\
echo [9Cษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [9CฬอออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û DEPENDENCIES Û!BGBLACK!!CYAN!Ûþอออออออออออออออออออออออออออน
echo [9Cบ                                                                          บ
echo [9Cบ      !YELLOW!1!CYAN!  ^>  !WHITE!Open/SaveFileBox     : 'Open/Save file box dialog'!CYAN!            บ
echo [9Cบ      !YELLOW!2!CYAN!  ^>  !WHITE!Speak by soyalk 2019 : 'Rose voice assistant'!CYAN!                 บ
echo [9Cบ      !YELLOW!3!CYAN!  ^>  !WHITE!Speak by Fatih Kodak : 'Rose voice assistant'!CYAN!                 บ
echo [9Cบ      !YELLOW!4!CYAN!  ^>  !WHITE!Advanced Installer   : 'Setup Installer'!CYAN!                      บ
echo [9Cบ      !YELLOW!5!CYAN!  ^>  !WHITE!ANSICON: 'Support for Windows 2000, Vista, 7, 8 and 8.1'!CYAN!      บ
echo [9Cบ      !YELLOW!6!CYAN!  ^>  !WHITE!CmdWiz : 'Background Transparency, Hide Cursor, ...'!CYAN!          บ
echo [9Cบ      !YELLOW!7!CYAN!  ^>  !WHITE!CmdBkg : 'Background Image'!CYAN!                                   บ
echo [9Cบ      !YELLOW!8!CYAN!  ^>  !WHITE!7-Zip  : 'Decompressing Tool'!CYAN!                                 บ
echo [9Cบ      !YELLOW!9!CYAN!  ^>  !WHITE!curl   : 'Web Requests'!CYAN!                                       บ
echo [9Cบ                                                                          บ
echo [9CฬออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û DEVELOPERS and HELPERS Û!BGBLACK!!CYAN!Ûþออออออออออออออออออออออน
echo [9Cบ                                                                          บ
echo [9Cบ                   !YELLOW!10!CYAN!  ^>  !WHITE!Program Dream Discord Server!CYAN!                    บ
echo [9Cบ                   !YELLOW!11!CYAN!  ^>  !WHITE!server.bat Discord Server!CYAN!                       บ
echo [9Cบ                   !YELLOW!12!CYAN!  ^>  !WHITE!@anic17!CYAN!                                         บ
echo [9Cบ                   !YELLOW!13!CYAN!  ^>  !WHITE!@^<Tim^>!CYAN!                                          บ
echo [9Cบ                   !YELLOW!14!CYAN!  ^>  !WHITE!@sintrode!CYAN!                                       บ
echo [9Cบ                   !YELLOW!15!CYAN!  ^>  !WHITE!@Grub4K!CYAN!                                         บ
echo [9Cบ                   !YELLOW!16!CYAN!  ^>  !WHITE!@Rosalyn!CYAN!                                        บ
echo [9Cบ                   !YELLOW!17!CYAN!  ^>  !WHITE!@Ms.CatFire!CYAN!                                     บ
echo [9Cบ                   !YELLOW!18!CYAN!  ^>  !WHITE!All other contributors!CYAN!                          บ
echo [9Cศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 20
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
if "!Language!"=="EN" set t="Helping to find existing bugs and vulnerabilities." "Helped to fix bugs related to user input in Regedit."
if "!Language!"=="FR" set t="A aid … trouver les bugs et vulnrabilites existantes." "A aid … la correction de bugs lis … la saisie de l'utilisateur dans le Regedit."
call :MSGBOX 2 !t! 69696 "anic17 'Task failed successfully'"
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
if "!Language!"=="EN" set t="Helped adding Automatic proxy switcher." "Helped to fix bugs related to user input in Regedit."
if "!Language!"=="FR" set t="A aid … ajouter le proxy switcher automatique." "A aid … la correction de bugs lis … la saisie de l'utilisateur dans le Regedit."
call :MSGBOX 2 !t! 69696 "sintrode"
start https://github.com/sintrode
)
if "!x!"=="15" (
if "!Language!"=="EN" set t="Helped improving and reducing code." "Created IS Bookmarks web extension." "Created the timer in seconds to scan indexed websites." "Fixed a bug with the stack memory overflow causing IS to crash. "
if "!Language!"=="FR" set t="A aid … amliorer et … rduire le code." "Cration de l'extension web IS Bookmarks." "Cration de la minuterie en secondes du scan des sites internet indexs." "Correction d'un bug avec le dbordement de la mmoire de la pile provoquant le plantage d'IS."
call :MSGBOX 4 !t! 69696 "Grub4K"
if "!Language!"=="EN" set t="Created the code to center the text on the UI." "Helped reducing Curl PATH algorithm."
if "!Language!"=="FR" set t="A cr le code pour centrer le texte sur l'UI." "A aid … rduire le code de l'algorithme de la PATH de Curl."
call :MSGBOX 2 !t! 69696 "Grub4K"
start https://github.com/Grub4K
)
if "!x!"=="16" (
if "!Language!"=="EN" set t="Helping testing alpha versions." "Helping to find existing bugs." "Gave me a lot of motivation and encouragement." "                                            *Notice you the shine ?"
if "!Language!"=="FR" set t="A aid … tester les versions alpha." "A aid … trouver les bugs existants." "M'a donn beaucoup de motivation et d'encouragement." "                                                           *Notice you the shine ?"
call :MSGBOX 4 !t! 69696 "Rosalyn 'Shine brightest'"
)
if "!x!"=="17" (
if "!Language!"=="EN" set t="Logo designer for v4.0"
if "!Language!"=="FR" set t="Conceptrice du logo de la v4.0"
call :MSGBOX 1 !t! 69696 "Ms.CatFire"
)
if "!x!"=="18" (
if "!Language!"=="EN" (
echo Dim Msg,Style,Title,Response
echo Msg="@Agam - Added ON/OFF switches."^&vbCrLf^&"@Vincent - Helped finding a bug with wrong choices."^&vbCrLf^&"@cocorisss - Updated Python Port Scanner."^&vbCrLf^&"@Chonkus - Added Internet Protocol TV (IPTV)."^&vbCrLf^&"@KiritoLeFakePK - Helped finding existing bugs."^&vbCrLf^&"@Simi - Helped with some English translation."^&vbCrLf^&"@Saltyy - Helped improving UI choices."^&vbCrLf^&"@AMIT - Fixed 'ControlSet001' to 'CurrentControlSet'."^&vbCrLf^&"@0x00 - Updated Glary Utilities crack."^&vbCrLf^&"@0x00 - Helped finding a bug with Windows Update MiniTool."^&vbCrLf^&"@0x00 - Added More Features Spoofing."
echo Style=69696
echo Title="All other contributors:"
echo Response=MsgBox^(Msg,Style,Title^)
)>"!TMPF!\msgbox.vbs"
if "!Language!"=="FR" (
echo Dim Msg,Style,Title,Response
echo Msg="@Agam - A ajout้ les interrupteurs ON/OFF."^&vbCrLf^&"@Vincent - A aid้ เ trouver un bug avec les mauvais choix."^&vbCrLf^&"@cocorisss - Mise เ jour du Port Scanner Python."^&vbCrLf^&"@Chonkus - A ajout้ Internet Protocol TV (IPTV)."^&vbCrLf^&"@KiritoLeFakePK - A aid้ เ trouver les bugs existants."^&vbCrLf^&"@Simi - A aid้ pour certaines traductions Anglaise."^&vbCrLf^&"@Saltyy - A aid้ เ am้liorer les choix d'interface utilisateur."^&vbCrLf^&"@AMIT - A corrig้ 'ControlSet001' vers 'CurrentControlSet'."^&vbCrLf^&"@0x00 - Mise เ jour du crack de Glary Utilities."^&vbCrLf^&"@0x00 - A aid้ เ trouver un bug avec Windows Update MiniTool."^&vbCrLf^&"@0x00 - A ajout้ More Features Spoofing."
echo Style=69696
echo Title="Tous les autres contributeurs:"
echo Response=MsgBox^(Msg,Style,Title^)
)>"!TMPF!\msgbox.vbs"
cscript //nologo "!TMPF!\msgbox.vbs"
if "!Language!"=="EN" (
echo Dim Msg,Style,Title,Response
echo Msg="@blacktario - Added 14 websites."^&vbCrLf^&"@0x00 - Added 8 websites."^&vbCrLf^&"@LeSaintFisti - Added 6 websites."^&vbCrLf^&"@Trident Security - Added 2 websites."^&vbCrLf^&"@Bastien - Added 1 website."^&vbCrLf^&"@RaaFii1 - Added 1 website."^&vbCrLf^&"@snipercat - Added 1 website."^&vbCrLf^&"@PistachePoilue - Added 1 website."^&vbCrLf^&"@FZ_PARRAIN_ZF - Added 1 website."^&vbCrLf^&"@Eiralys - Added 1 website."^&vbCrLf^&"@ayo - Added 1 website."^&vbCrLf^&"@Zyker - Added 1 website."
echo Style=69696
echo Title="All other contributors:"
echo Response=MsgBox^(Msg,Style,Title^)
)>"!TMPF!\msgbox.vbs"
if "!Language!"=="FR" (
echo Dim Msg,Style,Title,Response
echo Msg="@blacktario - A ajout้ 14 sites internet."^&vbCrLf^&"@0x00 - A ajout้ 8 sites internet."^&vbCrLf^&"@LeSaintFisti - A ajout้ 6 sites internet."^&vbCrLf^&"@Trident Security - A ajout้ 2 sites internet."^&vbCrLf^&"@Bastien - A ajout้ 1 site internet."^&vbCrLf^&"@RaaFii1 - A ajout้ 1 site internet."^&vbCrLf^&"@snipercat - A ajout้ 1 site internet."^&vbCrLf^&"@PistachePoilue - A ajout้ 1 site internet."^&vbCrLf^&"@FZ_PARRAIN_ZF - A ajout้ 1 site internet."^&vbCrLf^&"@Eiralys - A ajout้ 1 site internet."^&vbCrLf^&"@ayo - A ajout้ 1 site internet."^&vbCrLf^&"@Zyker - A ajout้ 1 site internet."
echo Style=69696
echo Title="Tous les autres contributeurs:"
echo Response=MsgBox^(Msg,Style,Title^)
)>"!TMPF!\msgbox.vbs"
cscript //nologo "!TMPF!\msgbox.vbs"
del /f /q "!TMPF!\msgbox.vbs"
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
set "BackgroundTransparencyInfo=Change background transparency !CYAN!(!YELLOW!!BackgroundTransparency!!CYAN!)      !el!บ"
if "!BackgroundBorderTransparencyValue!"=="1" set "BackgroundBorderTransparencyInfo=Borders transparency !CYAN!(!GREEN!ON!!CYAN!)                บ"
if "!BackgroundBorderTransparencyValue!"=="0" set "BackgroundBorderTransparencyInfo=Borders transparency !CYAN!(!RED!OFF!!CYAN!)               บ"
if "!BackgroundDisabled!"=="0" set "BackgroundDisabledInfo=Wallpaper background !CYAN!(!GREEN!ON!!CYAN!)                บ"
if "!BackgroundDisabled!"=="1" set "BackgroundDisabledInfo=Wallpaper background !CYAN!(!RED!OFF!!CYAN!)               บ"
if "!UntrustedWebsitesWarning!"=="1" set "UntrustedWebsitesWarningInfo=Untrusted Websites Warning !CYAN!(!GREEN!ON!!CYAN!)          บ"
if "!UntrustedWebsitesWarning!"=="0" set "UntrustedWebsitesWarningInfo=Untrusted Websites Warning !CYAN!(!RED!OFF!!CYAN!)         บ"
if "!VoiceAssistant!"=="1" set "VoiceAssistantInfo=Rose voice assistant !CYAN!(!GREEN!ON!!CYAN!)                บ"
if "!VoiceAssistant!"=="0" set "VoiceAssistantInfo=Rose voice assistant !CYAN!(!RED!OFF!!CYAN!)               บ"
if "!DeveloperMode!"=="1" (
set "DeveloperModeInfo=Developer mode !CYAN!(!GREEN!ON!!CYAN!)                      บ"
set "ExtractSourceInfo=!YELLOW!24!CYAN!  ^> !WHITE! Extract IS source code.!CYAN!                  บ"
)
if "!DeveloperMode!"=="0" (
set "DeveloperModeInfo=Developer mode !CYAN!(!RED!OFF!!CYAN!)                     บ"
set "ExtractSourceInfo=                                                บ"
)
set "ScanWebsitesInfo=Scan down or changed domain websites.!CYAN!    บ"
)
if "!Language!"=="FR" (
set "BackgroundTransparencyInfo=Changer background transparence !CYAN!(!YELLOW!!BackgroundTransparency!!CYAN!)!CYAN!     !el!บ"
if "!BackgroundBorderTransparencyValue!"=="1" set "BackgroundBorderTransparencyInfo=Transparence des bords !CYAN!(!GREEN!ON!!CYAN!)              บ"
if "!BackgroundBorderTransparencyValue!"=="0" set "BackgroundBorderTransparencyInfo=Transparence des bords !CYAN!(!RED!OFF!!CYAN!)             บ"
if "!BackgroundDisabled!"=="0" set "BackgroundDisabledInfo=Fond d'cran !CYAN!(!GREEN!ON!!CYAN!)                        บ"
if "!BackgroundDisabled!"=="1" set "BackgroundDisabledInfo=Fond d'cran !CYAN!(!RED!OFF!!CYAN!)                       บ"
if "!UntrustedWebsitesWarning!"=="1" set "UntrustedWebsitesWarningInfo=Pop-up des sites web non fiables !CYAN!(!GREEN!ON!!CYAN!)    บ"
if "!UntrustedWebsitesWarning!"=="0" set "UntrustedWebsitesWarningInfo=Pop-up des sites web non fiables !CYAN!(!RED!OFF!!CYAN!)   บ"
if "!VoiceAssistant!"=="1" set "VoiceAssistantInfo=Assistance vocal Rose !CYAN!(!GREEN!ON!!CYAN!)               บ"
if "!VoiceAssistant!"=="0" set "VoiceAssistantInfo=Assistance vocal Rose !CYAN!(!RED!OFF!!CYAN!)              บ"
if "!DeveloperMode!"=="1" (
set "DeveloperModeInfo=Mode dveloppeur !CYAN!(!GREEN!ON!!CYAN!)                    บ"
set "ExtractSourceInfo=!YELLOW!24!CYAN!  ^>  !WHITE!Extraire le code source d'IS.!CYAN!            บ"
)
if "!DeveloperMode!"=="0" (
set "DeveloperModeInfo=Mode dveloppeur !CYAN!(!RED!OFF!!CYAN!)                   บ"
set "ExtractSourceInfo=                                                บ"
)
set "ScanWebsitesInfo=Scan les sites internet indexs.!CYAN!         บ"
)

:CONTINUESETTINGS
call :SCALE 113 26
title !TITLE:`=Settings!
echo !CYAN!
if "!Language!"=="EN" (
echo [47Cออออออออออออออออ
echo [46C// !RED!Û!BGYELLOW!!BLACK! SETTINGS !RED!Û!BGBLACK!!CYAN! \\
)
if "!Language!"=="FR" (
echo [46Cออออออออออออออออออ
echo [45C// !RED!Û!BGYELLOW!!BLACK! PARAMETRES !RED!Û!BGBLACK!!CYAN! \\
)
echo [7Cษอออออออออออออออออออออออออออออออออออออออออออออหอออออออออออออออออออออออออออออออออออออออออออออออออออป
if "!Language!"=="EN" echo [7CฬอออออออออออออþÛ!BGYELLOW!!RED!Û WALLPAPERS Û!BGBLACK!!CYAN!ÛþออออออออออออออฮอออออออออออออออออþÛ!BGYELLOW!!RED!Û SETTINGS Û!BGBLACK!!CYAN!Ûþออออออออออออออออออน
if "!Language!"=="FR" echo [7CฬออออออออออออþÛ!BGYELLOW!!RED!Û FOND D'ECRANS Û!BGBLACK!!CYAN!ÛþออออออออออออฮออออออออออออออออþÛ!BGYELLOW!!RED!Û PARAMETRES Û!BGBLACK!!CYAN!Ûþอออออออออออออออออน
echo [7Cบ                                             บ                                                   บ
echo [7Cบ    !YELLOW!1!CYAN!  ^>  !WHITE!Kirito 1 (IS v1.4 icon)!CYAN!            บ   !YELLOW!13!CYAN!  ^>  !WHITE!!BackgroundTransparencyInfo!
echo [7Cบ    !YELLOW!2!CYAN!  ^>  !WHITE!Kirito 2!CYAN!                           บ   !YELLOW!14!CYAN!  ^>  !WHITE!!BackgroundBorderTransparencyInfo!
echo [7Cบ    !YELLOW!3!CYAN!  ^>  !WHITE!Kirito 3!CYAN!                           บ   !YELLOW!15!CYAN!  ^>  !WHITE!!BackgroundDisabledInfo!
echo [7Cบ    !YELLOW!4!CYAN!  ^>  !WHITE!Kirito 4!CYAN!                           บ   !YELLOW!16!CYAN!  ^>  !WHITE!!UntrustedWebsitesWarningInfo!
echo [7Cบ    !YELLOW!5!CYAN!  ^>  !WHITE!49206C6F766520796F75204C697361!CYAN!     บ   !YELLOW!17!CYAN!  ^>  !WHITE!!VoiceAssistantInfo!
echo [7Cบ    !YELLOW!6!CYAN!  ^>  !WHITE!Even Roses are colorless !CYAN!          บ   !YELLOW!18!CYAN!  ^>  !WHITE!!DeveloperModeInfo!
if "!Language!"=="EN" echo [7Cบ    !YELLOW!7!CYAN!  ^>  !WHITE!Tree!CYAN!                               บ   !YELLOW!19!CYAN!  ^>  !WHITE!!ScanWebsitesInfo!
if "!Language!"=="FR" echo [7Cบ    !YELLOW!7!CYAN!  ^>  !WHITE!Arbre!CYAN!                              บ   !YELLOW!19!CYAN!  ^>  !WHITE!!ScanWebsitesInfo!
if "!Language!"=="EN" echo [7Cบ    !YELLOW!8!CYAN!  ^>  !WHITE!Dark Guy!CYAN!                           บ   !YELLOW!20!CYAN!  ^>  !WHITE!Check for updates.!CYAN!                       บ
if "!Language!"=="FR" echo [7Cบ    !YELLOW!8!CYAN!  ^>  !WHITE!Homme sombre!CYAN!                       บ   !YELLOW!20!CYAN!  ^>  !WHITE!Vrifiez les mises … jour.!CYAN!               บ
if "!Language!"=="EN" echo [7Cบ    !YELLOW!9!CYAN!  ^>  !WHITE!Girl eyes!CYAN!                          บ   !YELLOW!21!CYAN!  ^>  !WHITE!Change username.!CYAN!                         บ
if "!Language!"=="FR" echo [7Cบ    !YELLOW!9!CYAN!  ^>  !WHITE!Yeux fille!CYAN!                         บ   !YELLOW!21!CYAN!  ^>  !WHITE!Changer le nom d'utilisateur.!CYAN!            บ
if "!Language!"=="EN" echo [7Cบ   !YELLOW!10!CYAN!  ^>  !WHITE!World map (bytes)!CYAN!                  บ   !YELLOW!22!CYAN!  ^>  !WHITE!Change language to French.!CYAN!               บ
if "!Language!"=="FR" echo [7Cบ   !YELLOW!10!CYAN!  ^>  !WHITE!Carte du monde (bytes)!CYAN!             บ   !YELLOW!22!CYAN!  ^>  !WHITE!Changer la langue en Anglais.!CYAN!            บ
if "!Language!"=="EN" echo [7Cบ   !YELLOW!11!CYAN!  ^>  !WHITE!World map (Corona Virus)!CYAN!           บ   !YELLOW!23!CYAN!  ^>  !WHITE!Export/Import settings.!CYAN!                  บ
if "!Language!"=="FR" echo [7Cบ   !YELLOW!11!CYAN!  ^>  !WHITE!Carte du monde (Corona Virus)!CYAN!      บ   !YELLOW!23!CYAN!  ^>  !WHITE!Exporter/Importer les paramtres.!CYAN!        บ
if "!Language!"=="EN" echo [7Cบ   !YELLOW!12!CYAN!  ^>  !WHITE!World map (cool)!CYAN!                   บ   !ExtractSourceInfo!
if "!Language!"=="FR" echo [7Cบ   !YELLOW!12!CYAN!  ^>  !WHITE!Carte du monde (cool)!CYAN!              บ   !ExtractSourceInfo!
echo [7Cบ                                             บ                                                   บ
echo [7Cศอออออออออออออออออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!OPEN!BRIGHTBLACK!" / "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 30
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
if "!x!"=="19" call :SHOW_WINDOW "websites indexed" || (start "" "%~f0" SCANWEBSITES) & goto :CONTINUESETTINGS
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
if "!Language!"=="FR" echo     Choisissez la transparence de 1 … 100. Nous recommandons une valeur entre 5 et 30 pour un bon rendu.
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
if "!Language!"=="EN" echo [15C^^!^^! You need to be part of the Illegal Services developers to enable that option ^^!^^!
if "!Language!"=="FR" echo [11C^^!^^! Vous devez faire partie des dveloppeurs d'Illegal Services pour activer cette option ^^!^^!
echo =================================================================================================================
echo !CYAN!
if "!Language!"=="EN" set t=Enter your developer license key
if "!Language!"=="FR" set t=Entrez votre cl de licence dveloppeur
%SHOWCURSOR%
set DeveloperKey=
set /p "DeveloperKey=!t!: !YELLOW!"
%HIDECURSOR%
echo:
if defined DeveloperKey >nul 2>&1 reg add "!IS_REG!" /v "DeveloperMode" /t REG_DWORD /d !DeveloperKey! /f
call :CHECK_DEVELOPERMODE
if "!DeveloperMode!"=="1" (
if "!Language!"=="EN" set t="Developer mode has been activated successfully. You can now extract the source code."
if "!Language!"=="FR" set t="Le mode dveloppeur a t activ avec succs. Vous pouvez maintenant extraire le code source."
call :MSGBOX 1 !t! 69696 "Illegal Services Checker"
goto :CLEARSETTINGS
)
if "!DeveloperMode!"=="0" call :ERRORMESSAGE DeveloperKey "une cl de license" "licence key"
goto :CLEARSETTINGS

:SETTING_VERSION
call :GET_VERSION
if "!errorlevel!"=="0" (
if "!Language!"=="EN" set t="Illegal Services is up to date." "Current version: !VERSION!" "Latest version   : !LastVersion!"
if "!Language!"=="FR" set t="Illegal Services est … jour." "Version actuelle : !VERSION!" "Dernire version: !LastVersion!"
call :MSGBOX UPDATER !t! 69696 "Illegal Services Checker"
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
echo       2. Le nom d'utilisateur ne peut pas dpasser 20 caractres.
echo       3. N'utiliser les caractres suivants: "^! %% ^^".
)
:L4
if "!Language!"=="EN" set t=Enter your new username
if "!Language!"=="FR" set t=Entrez votre nouveau nom d'utilisateur
setlocal disabledelayedexpansion
call :INPUTBOX "%t%: "
setlocal enabledelayedexpansion
if defined ID (
set "ID=!ID:%%=%%%%!"
if defined %ID:~1,-1% goto :ERROR_USERNAME
if not "!ID:~20!"=="" goto :ERROR_USERNAME
>nul reg add "!IS_REG!" /v "Username" /t REG_SZ /d "!ID:~,20!" /f
) else >nul reg add "!IS_REG!" /v "Username" /t REG_SZ /d "!Username:~,20!" /f
call :CHECK_USERNAME
if "!Language!"=="EN" set t="Your new username has been changed to: '!IS_Username!'"
if "!Language!"=="FR" set t="Votre nouveau nom d'utilisateur a t remplac par: '!IS_Username!'"
call :MSGBOX 1 !t! 69696 "Illegal Services Checker"
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
if not exist "!IS_OUTPUTDIRECTORY!" md "!IS_OUTPUTDIRECTORY!"
echo !CYAN!
if "!Language!"=="EN" echo Do you want to [!YELLOW!E!CYAN!]xport or [!YELLOW!I!CYAN!]mport your current settings ?
if "!Language!"=="FR" echo Voulez-vous [!YELLOW!E!CYAN!]xporter ou [!YELLOW!I!CYAN!]mporter vos paramtres actuels ?
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
for /f "delims=" %%A in ('SaveFileBox.exe IS_Settings.reg "!t1! (*.reg)|*.reg" "!IS_OUTPUTDIRECTORY!" "!t2!" /f') do set el=%%A
>nul 2>&1 reg export "!IS_REG!" "!el!" /y && (
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
for /f "delims=" %%A in ('OpenFileBox.exe "!t1! (*.reg)|*.reg" "!IS_OUTPUTDIRECTORY!" "!t2!"') do if /i "%%~xA"==".reg" set _el=%%A
>nul 2>&1 find /i "[HKEY_CURRENT_USER\SOFTWARE\IB_U_Z_Z_A_R_Dl\Illegal Services]" "!_el!" && >nul 2>&1 reg import "!_el!" && (
for %%A in (LANGUAGE USERNAME YOUTUBEDLPRIORITY PORTPRIORITY FIRSTLAUNCH VOICEASSISTANT VOICEASSISTANTCHOICE YOUTUBEDLP YOUTUBEDLOUTPUTDIRECTORY YOUTUBEDLGEOBYPASS DEVELOPERMODE) do call :CHECK_%%A
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

:SETTING_EXTRACT_SOURCE
if /i "!IS_PROCESS!"=="cmd.exe" (
echo:
if "!Language!"=="EN" set t=ERROR: Impossible to extract the source code if you are running the batch file
if "!Language!"=="FR" set t=ERREUR: Impossible d'extraire le code source si vous excutez le fichier batch
echo !RED!!t! ^(%~nx0^).!YELLOW!
timeout /t 5
) else if defined BATUSED (
attrib -s -h -i "!TMP!\!BATUSED!"
>nul copy /y "!TMPF!\!BATUSED!" "Illegal_Services.bat"
attrib +s +h +i "!TMP!\!BATUSED!"
2>nul powershell Get-childitem $Illegal_Services.bat ^| ForEach-Object -process {if ^(^($_.attributes -band 0x100^) -eq 0x100^) {$_.attributes = ^($_.attributes -band 0xFEFF^)}}
start /max explorer.exe "%~dp0"
)
goto :CONTINUESETTINGS

:IPTV
call :SCALE 91 32
title !TITLE:`=Internet Protocol Television (IPTV)!
call :ROSE "Internet Protocol Television"

:CLEARIPTV
call :CLEAR 1 38
set db=iptvcat.com/home_11 `pro.allkaicerteam.com/ www.iptvm3ulist.com/ip-tv-free/ www.iptvm3ufree.com/ iptvmate.net/m3u_iptv/ www.links-iptv.com/ iptvforpcwindows.com/ www.techtoreview.com/top-picks/m3u-playlist-url.html www.iptv4free.com/ m3u.pktelcos.com/ freem3uhd.blogspot.com/ dailym3uiptv.com/links-m3u/ www.iptv1.org/ telechargeriptv.com/ www.5kplayer.com/video-music-player/free-iptv-playlist-m3u-links.htm github.com/monetareq/iptv1 github.com/cbn88/cbn88.github.io github.com/Free-IPTV/Countries github.com/coodertv/IPTVM3U8 github.com/Sumon2021/Sumon-IPTV github.com/mancinibig55/45125623 github.com/firojshahriyarmasud/IPTV github.com/duyminh215/iptv-list github.com/riqueenz/iptv github.com/iptv-org/iptv github.com/imDazui/Tvlist-awesome-m3u-m3u8 github.com/tvheadend/tvheadend github.com/Cigaras/IPTV.bundle github.com/lucifersun/China-Telecom-ShangHai-IPTV-list github.com/notanewbie/LegalStream github.com/Fleker/CumulusTV github.com/lylehust/Chinese-IPTV github.com/AlexanderSofronov/iptv.example github.com/chwlibre/iptv github.com/myIPTVChannels/lists github.com/free-greek-iptv/greek-iptv github.com/iptv-ch/iptv-ch.github.io github.com/iptv-restream/iptv-channels

:CONTINUEIPTV
call :SCALE 91 32
echo !CYAN!
echo [23Cอออออออออออออออออออออออออออออออออออออออออออ
echo [22C// !RED!Û!BGYELLOW!!BLACK! INTERNET PROTOCOL TELEVISION (IPTV) !RED!Û!BGBLACK!!CYAN! \\
echo [7Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [7Cบ                                                                           บ
echo [7Cบ    !1!iptvcat.com!CYAN!                ณ   !20!Sumon2021!CYAN!                  บ
echo [7Cบ    !2!pro.allkaicerteam.com!CYAN!      ณ   !21!mancinibig55!CYAN!               บ
echo [7Cบ    !3!www.iptvm3ulist.com!CYAN!        ณ   !22!firojshahriyarmasud!CYAN!        บ
echo [7Cบ    !4!www.iptvm3ufree.com!CYAN!        ณ   !23!duyminh215!CYAN!                 บ
echo [7Cบ    !5!iptvmate.net!CYAN!               ณ   !24!riqueenz!CYAN!                   บ
echo [7Cบ    !6!www.links-iptv.com!CYAN!         ณ   !25!iptv-org!CYAN!                   บ
echo [7Cบ    !7!iptvforpcwindows.com!CYAN!       ณ   !26!imDazui!CYAN!                    บ
echo [7Cบ    !8!www.techtoreview.com!CYAN!       ณ   !27!tvheadend!CYAN!                  บ
echo [7Cบ    !9!www.iptv4free.com!CYAN!          ณ   !28!Cigaras!CYAN!                    บ
echo [7Cบ   !10!m3u.pktelcos.com!CYAN!           ณ   !29!lucifersun!CYAN!                 บ
echo [7Cบ   !11!freem3uhd.blogspot.com!CYAN!     ณ   !30!notanewbie!CYAN!                 บ
echo [7Cบ   !12!dailym3uiptv.com!CYAN!           ณ   !31!Fleker!CYAN!                     บ
echo [7Cบ   !13!www.iptv1.org!CYAN!              ณ   !32!lylehust!CYAN!                   บ
echo [7Cบ   !14!telechargeriptv.com!CYAN!        ณ   !33!AlexanderSofronov!CYAN!          บ
echo [7Cบ   !15!www.5kplayer.com!CYAN!           ณ   !34!chwlibre!CYAN!                   บ
echo [7Cบ   !16!monetareq!CYAN!                  ณ   !35!myIPTVChannels!CYAN!             บ
echo [7Cบ   !17!cbn88!CYAN!                      ณ   !36!free-greek-iptv!CYAN!            บ
echo [7Cบ   !18!Free-IPTV!CYAN!                  ณ   !37!iptv-ch!CYAN!                    บ
echo [7Cบ   !19!coodertv!CYAN!                   ณ   !38!iptv-restream!CYAN!              บ
echo [7Cบ                                                                           บ
echo [7Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!INSTALL!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" / "!YELLOW!HELP!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 50
echo !RED!
>nul 2>&1 reg query "HKCR\.m3u8" || (
if "!Language!"=="EN" echo [17CERROR: To be able to use !YELLOW!IPTV!RED!, first you need to choose: !YELLOW![INSTALL]
if "!Language!"=="FR" echo [13CERREUR: Pour pouvoir utiliser !YELLOW!IPTV!RED!, vous devez d'abord choisir: !YELLOW![INSTALL]
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
echo [24Cอออออออออออออออออออออ
if "!Language!"=="EN" set t=TUTORIAL
if "!Language!"=="FR" set t=TUTORIEL
echo [23C// !RED!Û!BGYELLOW!!BLACK! IPTV !t! !RED!Û!BGBLACK!!CYAN! \\
echo [4Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [4Cบ                                                                                                                                             บ
if "!Language!"=="EN" echo [4Cบ        þÛ!BGYELLOW!!RED!Û  What's IPTV (Wikipedia) ? Û!BGBLACK!!CYAN!Ûþ                                                                                                  บ
if "!Language!"=="FR" echo [4Cบ        þÛ!BGYELLOW!!RED!Û  Qu'est-ce que l'IPTV (Wikipedia) ? Û!BGBLACK!!CYAN!Ûþ                                                                                         บ
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
if "!Language!"=="FR" echo [4Cบ        þÛ!BGYELLOW!!RED!Û  Comment utiliser l'IPTV sur PC en utilisant VLC ? Û!BGBLACK!!CYAN!Ûþ                                                                          บ
if "!Language!"=="EN" echo [4Cบ        þÛ!BGYELLOW!!RED!Û  How to watch IPTV on PC using VLC ? Û!BGBLACK!!CYAN!Ûþ                                                                                        บ
echo [4Cบ                                                                                                                                             บ
if "!Language!"=="EN" echo [4Cบ    [!YELLOW!1!CYAN!]  ^> !WHITE! Download and install VLC Media Player.!CYAN!                                                                                           บ
if "!Language!"=="FR" echo [4Cบ    [!YELLOW!1!CYAN!]  ^> !WHITE! Tlchargez et installer VLC Media Player.!CYAN!                                                                                       บ
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
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 20
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
call :CLEAR 1 71
set db=avxhm.is/ www.heroturko.net/ rmz.cr/ softarchive.is/ www.downduck.com/ scnlog.me/ www.creaxy.com/ downturk.net/ downarchive.org/ 0dayhome.net/ scene-rls.net/ www.freshwap.us/ www.apps4all.com/ dl4all.biz/ worldsrc.net/ movieparadise.org/ release.movieparadise.org/ hdencode.org/ katzdownload.com/ `rlsbb.ru/ apps-pack.com/ oneddl.org/ `www.rlslog.net/ freshwap.cc/ dl4all.org/ warezomen.com/ www.scnsrc.me/ win7dl.org/ www.ddlvalley.me/ downtr.cc/ releasehive.com/ rlstop.net/ uhdmv.org/ tfpdl.to/ softddl.org/ 2ddl.it/ katzddl.net/ warezbb.net/ www.300mbfilms.cx/ downloadhub.onl/ filmsofts.com/ cgpersia.com/ rsload.net/ megaddl.co/ heroturko2.net/ crazy4tv.com/ psarips.top/ themoviesflix.com.co/ themovieflix.co.in/ hevcbay.com/ rarefilmm.com/ 1worldfree4u.trade/ the-eye.eu/ jpddl.com/ animeshare.cf/ anidl.org/ hi10anime.com/ animekayo.com/ animekaizoku.com/ ssanime.ga/ animetosho.org/ cdromance.com/ www.romnation.net/ vimm.net/ nxmac.com/ macdrop.net/ sheet-music.xyz/ audioz.download/ `audiobookbay.nl/ www.gfxtra31.com/ gfx-hub.cc/

:CONTINUEDDLEN
call :SCALE 128 37
echo !CYAN!
echo [44Cอออออออออออออออออออออออออออออออออออออออ
echo [43C// !RED!Û!BGYELLOW!!BLACK! DIRECT DOWNLOAD LINK (DDL) [EN] !RED!Û!BGBLACK!!CYAN! \\
echo [6Cษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [6Cบ                                                                                                                  บ
echo [6Cบ    !1!avxhm.is!CYAN!                     ณ  !25!dl4all.org!CYAN!            ณ   !49!themovieflix.co.in!CYAN!              บ
echo [6Cบ    !2!www.heroturko.net!CYAN!            ณ  !26!warezomen.com!CYAN!         ณ   !50!hevcbay.com!CYAN!                     บ
echo [6Cบ    !3!rmz.cr!CYAN!                       ณ  !27!www.scnsrc.me!CYAN!         ณ   !51!rarefilmm.com!CYAN!                   บ
echo [6Cบ    !4!softarchive.is!CYAN!               ณ  !28!win7dl.org!CYAN!            ณ   !52!1worldfree4u.trade!CYAN!              บ
echo [6Cบ    !5!www.downduck.com!CYAN!             ณ  !29!www.ddlvalley.me!CYAN!      ณ   !53!the-eye.eu!CYAN!                      บ
echo [6Cบ    !6!scnlog.me!CYAN!                    ณ  !30!downtr.cc!CYAN!             ณ   !54!jpddl.com !GREEN!(animes)!CYAN!              บ
echo [6Cบ    !7!www.creaxy.com!CYAN!               ณ  !31!releasehive.com!CYAN!       ณ   !55!animeshare.cf !GREEN!(animes)!CYAN!          บ
echo [6Cบ    !8!downturk.net!CYAN!                 ณ  !32!rlstop.net!CYAN!            ณ   !56!anidl.org !GREEN!(animes)!CYAN!              บ
echo [6Cบ    !9!downarchive.org!CYAN!              ณ  !33!uhdmv.org!CYAN!             ณ   !57!hi10anime.com !GREEN!(animes)!CYAN!          บ
echo [6Cบ   !10!0dayhome.net!CYAN!                 ณ  !34!tfpdl.to!CYAN!              ณ   !58!animekayo.com !GREEN!(animes)!CYAN!          บ
echo [6Cบ   !11!scene-rls.net!CYAN!                ณ  !35!softddl.org!CYAN!           ณ   !59!animekaizoku.com !GREEN!(animes)!CYAN!       บ
echo [6Cบ   !12!www.freshwap.us!CYAN!              ณ  !36!2ddl.it!CYAN!               ณ   !60!ssanime.ga !GREEN!(animes)!CYAN!             บ
echo [6Cบ   !13!www.apps4all.com!CYAN!             ณ  !37!katzddl.net!CYAN!           ณ   !61!animetosho.org !GREEN!(animes)!CYAN!         บ
echo [6Cบ   !14!dl4all.biz!CYAN!                   ณ  !38!warezbb.net!CYAN!           ณ   !62!cdromance.com !GREEN!(roms)!CYAN!            บ
echo [6Cบ   !15!worldsrc.net!CYAN!                 ณ  !39!www.300mbfilms.cx!CYAN!     ณ   !63!www.romnation.net !GREEN!(roms)!CYAN!        บ
echo [6Cบ   !16!movieparadise.org!CYAN!            ณ  !40!downloadhub.onl!CYAN!       ณ   !64!vimm.net !GREEN!(roms)!CYAN!                 บ
echo [6Cบ   !17!release.movieparadise.org!CYAN!    ณ  !41!filmsofts.com!CYAN!         ณ   !65!nxmac.com !GREEN!(MAC)!CYAN!                 บ
echo [6Cบ   !18!hdencode.org!CYAN!                 ณ  !42!cgpersia.com!CYAN!          ณ   !66!macdrop.net !GREEN!(MAC)!CYAN!               บ
echo [6Cบ   !19!katzdownload.com!CYAN!             ณ  !43!rsload.net!CYAN!            ณ   !67!sheet-music.xyz !GREEN!(audio)!CYAN!         บ
echo [6Cบ   !20!rlsbb.ru!CYAN!                     ณ  !44!megaddl.co!CYAN!            ณ   !68!audioz.download !GREEN!(audio)!CYAN!         บ
echo [6Cบ   !21!oneddl.org!CYAN!                   ณ  !45!heroturko2.net!CYAN!        ณ   !69!audiobookbay.nl !GREEN!(audiobooks)!CYAN!    บ
echo [6Cบ   !22!apps-pack.com!CYAN!                ณ  !46!crazy4tv.com!CYAN!          ณ   !70!www.gfxtra31.com !GREEN!(GFX)!CYAN!          บ
echo [6Cบ   !23!www.rlslog.net!CYAN!               ณ  !47!psarips.top!CYAN!           ณ   !71!gfx-hub.cc !GREEN!(GFX)!CYAN!                บ
echo [6Cบ   !24!freshwap.cc!CYAN!                  ณ  !48!themoviesflix.com.co!CYAN!  ณ                                          บ
echo [6Cบ                                                                                                                  บ
echo [6Cศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" / "!YELLOW!FR!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 40
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
call :CLEAR 1 11
set db=www.tirexo.work/ free-telecharger.net/ libertyvf.bz/ www.extreme-down.plus/home.html zone-telechargement.cam/ www.wawacity.work/ ww2.jeddl.com/ www.zone-mania.com/ www.zone-down.com/ nandesuka.moe/ 9docu.org/

:CONTINUEDDLFR
call :SCALE 71 24
echo !CYAN!
echo [16Cอออออออออออออออออออออออออออออออออออออออ
echo [15C// !RED!Û!BGYELLOW!!BLACK! DIRECT DOWNLOAD LINK (DDL) [FR] !RED!Û!BGBLACK!!CYAN! \\
echo [9Cษออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [9Cบ                                                  บ
echo [9Cบ    !1!www.tirexo.work!CYAN!                         บ
echo [9Cบ    !2!free-telecharger.net!CYAN!                    บ
echo [9Cบ    !3!libertyvf.bz!CYAN!                            บ
echo [9Cบ    !4!www.extreme-down.plus!CYAN!                   บ
echo [9Cบ    !5!zone-telechargement.cam!CYAN!                 บ
echo [9Cบ    !6!www.wawacity.work!CYAN!                       บ
echo [9Cบ    !7!ww2.jeddl.com!CYAN!                           บ
echo [9Cบ    !8!www.zone-mania.com!CYAN!                      บ
echo [9Cบ    !9!www.zone-down.com!CYAN!                       บ
echo [9Cบ   !10!nandesuka.moe !GREEN!(animes)!CYAN!                  บ
echo [9Cบ   !11!9docu.org !GREEN!(documentaries)!CYAN!               บ
echo [9Cบ                                                  บ
echo [9Cศออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" / "!YELLOW!EN!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 40
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
call :SCALE 101 53
set t="No payment / installation / registration is required to view the videos on the sites offered by Illegal Services. All sites are free so watch out for scam advertising." "If the player is not visible, disable your ad blocker and click on the button to close the ad in the middle of the video then on the player's Play button to launch the video."
)
if "!Language!"=="FR" (
call :SCALE 101 48
set t="Aucun payment / installation / inscription n'est requis pour voir les videos sur les sites proposes par Illegal Services. Tous les sites sont gratuits donc faites attention aux publicites d'arnaques." "Si le lecteur n'est pas visible, desactiver votre bloqueur de publicites et clique sur le bouton pour fermer la pub au milieu de la video puis sur le bouton Play du lecteur pour lancer la video."
)
call :MSGBOX 2 !t! 69680 "Illegal Services Checker"
)
call :ROSE Streaming
for %%A in (EN FR) do if "!Language!"=="%%A" goto :STREAMING%%A

:STREAMINGEN
call :SCALE 101 53
title !TITLE:`=Streaming [EN]!

:CLEARSTREAMINGEN
call :CLEAR 1 59
set db=www.primewire.li/ losmovies.top/ m4ufree.to/ gomovie.co/ gomovies-online.cam/ 123movies.jp/ www1.123movies.co/ myflixertv.to/ www4.yesmovies.so/ 5movies.pw/ www11.123movieshub.one/ hollymoviehd.cc/home/ watch-serieshd.cc/ watchseriess.net/ flixtor.to/ fmovies.to/ lookmovie.io/ www2.solarmovie.to/ ww.123movies.sc/ frenzymovies.net/ supernova.to/ vumoo.to/ hulu.sc/ watchtvepisodes.me/ ww2.123movieshub.tc/ 0gomovies.so/ soap2day.to/ www1.movie4u.live/ cinehub.wtf/ openloadfreetv.me/ allmoviesforyou.net/ kisscartoon.info/ 9anime.to/ animesuge.io/ animeheaven.pro/ animeowl.net/ animeow.me/ arrayanime.com/ gogoanime.vc/ animefrenzy.org/ anime8.ru/ animevibe.se/ animixplay.to/ www2.kickassanime.ro/ www.animerush.tv/ animepahe.com/ ww1.animesimple.com/ zoro.to/ animedao.to/ kissanimefree.to/ www1.7anime.io/ twist.moe/ runnel.ir/ time4tv.stream/ `live94today.com/ `livetv.sx/ apps.stream2watch.sx/ sportplus.live/ thehomesport.com/

:CONTINUESTREAMINGEN
call :SCALE 101 53
echo !CYAN!
echo [40Cออออออออออออออออออออออ
echo [39C// !RED!Û!BGYELLOW!!BLACK! STREAMING [EN] !RED!Û!BGBLACK!!CYAN! \\
echo [8Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [8CฬอออออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û FILMS Û!BGBLACK!!CYAN!Ûþอออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                   บ
echo [8Cบ    !1!www.primewire.li!CYAN!               ณ   !17!lookmovie.io!CYAN!                   บ
echo [8Cบ    !2!losmovies.top!CYAN!                  ณ   !18!www2.solarmovie.to!CYAN!             บ
echo [8Cบ    !3!m4ufree.to!CYAN!                     ณ   !19!ww.123movies.sc!CYAN!                บ
echo [8Cบ    !4!gomovie.co!CYAN!                     ณ   !20!frenzymovies.net!CYAN!               บ
echo [8Cบ    !5!gomovies-online.cam!CYAN!            ณ   !21!supernova.to!CYAN!                   บ
echo [8Cบ    !6!123movies.jp!CYAN!                   ณ   !22!vumoo.to!CYAN!                       บ
echo [8Cบ    !7!www1.123movies.co!CYAN!              ณ   !23!hulu.sc!CYAN!                        บ
echo [8Cบ    !8!myflixertv.to!CYAN!                  ณ   !24!watchtvepisodes.me!CYAN!             บ
echo [8Cบ    !9!www4.yesmovies.so!CYAN!              ณ   !25!ww2.123movieshub.tc!CYAN!            บ
echo [8Cบ   !10!5movies.pw!CYAN!                     ณ   !26!0gomovies.so!CYAN!                   บ
echo [8Cบ   !11!www11.123movieshub.one!CYAN!         ณ   !27!soap2day.to!CYAN!                    บ
echo [8Cบ   !12!hollymoviehd.cc!CYAN!                ณ   !28!www1.movie4u.live!CYAN!              บ
echo [8Cบ   !13!watch-serieshd.cc!CYAN!              ณ   !29!cinehub.wtf!CYAN!                    บ
echo [8Cบ   !14!watchseriess.net!CYAN!               ณ   !30!openloadfreetv.me!CYAN!              บ
echo [8Cบ   !15!flixtor.to!CYAN!                     ณ   !31!allmoviesforyou.net!CYAN!            บ
echo [8Cบ   !16!fmovies.to!CYAN!                     ณ                                         บ
echo [8Cบ                                                                                   บ
echo [8CฬอออออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û ANIMES Û!BGBLACK!!CYAN!Ûþออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                   บ
echo [8Cบ   !32!kisscartoon.info!CYAN!               ณ   !43!animixplay.to!CYAN!                  บ
echo [8Cบ   !33!9anime.to!CYAN!                      ณ   !44!www2.kickassanime.ro!CYAN!           บ
echo [8Cบ   !34!animesuge.io!CYAN!                   ณ   !45!www.animerush.tv!CYAN!               บ
echo [8Cบ   !35!animeheaven.pro!CYAN!                ณ   !46!animepahe.com!CYAN!                  บ
echo [8Cบ   !36!animeowl.net!CYAN!                   ณ   !47!ww1.animesimple.com!CYAN!            บ
echo [8Cบ   !37!animeow.me!CYAN!                     ณ   !48!zoro.to!CYAN!                        บ
echo [8Cบ   !38!arrayanime.com!CYAN!                 ณ   !49!animedao.to!CYAN!                    บ
echo [8Cบ   !39!gogoanime.vc!CYAN!                   ณ   !50!kissanimefree.to!CYAN!               บ
echo [8Cบ   !40!animefrenzy.org!CYAN!                ณ   !51!www1.7anime.io!CYAN!                 บ
echo [8Cบ   !41!anime8.ru!CYAN!                      ณ   !52!twist.moe!CYAN!                      บ
echo [8Cบ   !42!animevibe.se!CYAN!                   ณ                                         บ
echo [8Cบ                                                                                   บ
echo [8CฬอออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û TELEVISION Û!BGBLACK!!CYAN!Ûþออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                   บ
echo [8Cบ   !53!runnel.ir!CYAN!                      ณ   !57!apps.stream2watch.sx !GREEN!(sport)!CYAN!   บ
echo [8Cบ   !54!time4tv.stream!CYAN!                 ณ   !58!sportplus.live !GREEN!(sport)!CYAN!         บ
echo [8Cบ   !55!live94today.com!CYAN!                ณ   !59!thehomesport.com !GREEN!(sport)!CYAN!       บ
echo [8Cบ   !56!livetv.sx !GREEN!(sport)!CYAN!              ณ                                         บ
echo [8Cบ                                                                                   บ
echo [8Cฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
call :DRAW_CENTER "!YELLOW!60!CYAN!  >  !WHITE!Streaming Applications!CYAN!" 20
echo [8Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" / "!YELLOW!FR!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 40
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUESTREAMINGEN
if "!x!"=="60" (set la=EN) & goto :STREAMINGAPPS
call :CHOOSE fr && goto :STREAMINGFR
call :CHOOSE search && (call :IS_SEARCH ef3978005ffa01b49 & goto :CONTINUESTREAMINGEN)
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARSTREAMINGEN
call :ERRORMESSAGE
goto :CONTINUESTREAMINGEN

:STREAMINGFR
call :SCALE 101 48
title !TITLE:`=Streaming [FR]!

:CLEARSTREAMINGFR
call :CLEAR 1 48
set db=www.filmstreaming1.tel/stream1u/ www6.filmstreaming.to/ french-stream.re/ wvw.hds.lc/ papystreaming-vf.com/accueil// fcine.me/ wwv.films-streams.com/ libertyvf.bz/ www.filmstreaminglol.com/ streaming-films.net/ vfstreamiz.com/ wwv.streamfilm.cc/ vvw.streampourvous.ws/ streaminz.me/ filmstreamingvf.org/ www.illimitestreaming.co/ www.cinezzz.org/ voirseries.tv/ streamcomplet.buzz/ comustream.fr/ tratov.com/ voiranime.com/ neko-sama.fr/ french-manga.net/ www.adkami.com/ www.ianimes.org/ mavanimes.cc/ streaming-integrale.com/ gum-gum-streaming.com/ otakufr.co/ www.mavanimes.co/ vostanimez.com/ toonanime.cc/ wvw.jetanimes.com/ vostfree.tv/ www.universanime.co/ daijoubu.si/ animepourvous.com/ animevostfr.tv/ animecomplet.me/ `www.anime-ultime.net/ v5.anime-ultime.net/ channelstream.watch/ www.myfree-tivi.com/ `livetv.sx/frx/ fr4.sportplus.live/ sport-stream.live/ `streaming-sport.tv/

:CONTINUESTREAMINGFR
call :SCALE 101 48
echo !CYAN!
echo [40Cออออออออออออออออออออออ
echo [39C// !RED!Û!BGYELLOW!!BLACK! STREAMING [FR] !RED!Û!BGBLACK!!CYAN! \\
echo [8Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [8CฬอออออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û FILMS Û!BGBLACK!!CYAN!Ûþอออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                   บ
echo [8Cบ    !1!www.filmstreaming1.tel!CYAN!         ณ   !12!wwv.streamfilm.cc!CYAN!              บ
echo [8Cบ    !2!www6.filmstreaming.to!CYAN!          ณ   !13!vw.streampourvous.ws!CYAN!           บ
echo [8Cบ    !3!french-stream.re!CYAN!               ณ   !14!streaminz.me!CYAN!                   บ
echo [8Cบ    !4!wvw.hds.lc!CYAN!                     ณ   !15!filmstreamingvf.org!CYAN!            บ
echo [8Cบ    !5!papystreaming-vf.com!CYAN!           ณ   !16!www.illimitestreaming.co!CYAN!       บ
echo [8Cบ    !6!fcine.me!CYAN!                       ณ   !17!www.cinezzz.org!CYAN!                บ
echo [8Cบ    !7!wwv.films-streams.com!CYAN!          ณ   !18!voirseries.tv !GREEN!(series)!CYAN!         บ
echo [8Cบ    !8!libertyvf.bz!CYAN!                   ณ   !19!streamcomplet.buzz!CYAN!             บ
echo [8Cบ    !9!www.filmstreaminglol.com!CYAN!       ณ   !20!comustream.fr!CYAN!                  บ
echo [8Cบ    !9!streaming-films.net!CYAN!            ณ   !21!tratov.com!CYAN!                     บ
echo [8Cบ   !10!vfstreamiz.com!CYAN!                 ณ                                         บ
echo [8Cบ                                                                                   บ
echo [8CฬอออออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û ANIMES Û!BGBLACK!!CYAN!Ûþออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                   บ
echo [8Cบ   !22!voiranime.com!CYAN!                  ณ   !33!toonanime.cc!CYAN!                   บ
echo [8Cบ   !23!neko-sama.fr!CYAN!                   ณ   !34!wvw.jetanimes.com!CYAN!              บ
echo [8Cบ   !24!french-manga.net!CYAN!               ณ   !35!vostfree.tv!CYAN!                    บ
echo [8Cบ   !25!www.adkami.com!CYAN!                 ณ   !36!www.universanime.co!CYAN!            บ
echo [8Cบ   !26!www.ianimes.org!CYAN!                ณ   !37!daijoubu.si!CYAN!                    บ
echo [8Cบ   !27!mavanimes.cc!CYAN!                   ณ   !38!animepourvous.com!CYAN!              บ
echo [8Cบ   !28!streaming-integrale.com!CYAN!        ณ   !39!animevostfr.tv!CYAN!                 บ
echo [8Cบ   !29!gum-gum-streaming.com!CYAN!          ณ   !40!animecomplet.me!CYAN!                บ
echo [8Cบ   !30!otakufr.co!CYAN!                     ณ   !41!www.anime-ultime.net!CYAN!           บ
echo [8Cบ   !31!www.mavanimes.co!CYAN!               ณ   !42!v5.anime-ultime.net!CYAN!            บ
echo [8Cบ   !32!vostanimez.com!CYAN!                 ณ                                         บ
echo [8Cบ                                                                                   บ
echo [8CฬอออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û TELEVISION Û!BGBLACK!!CYAN!Ûþออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                   บ
echo [8Cบ   !43!channelstream.watch!CYAN!            ณ   !47!sport-stream.live !GREEN!(sport)!CYAN!      บ
echo [8Cบ   !44!www.myfree-tivi.com!CYAN!            ณ   !48!streaming-sport.tv !GREEN!(sport)!CYAN!     บ
echo [8Cบ   !45!livetv.sx !GREEN!(sport)!CYAN!              ณ                                         บ
echo [8Cบ   !46!fr4.sportplus.live !GREEN!(sport)!CYAN!     ณ                                         บ
echo [8Cบ                                                                                   บ
echo [8Cฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
call :DRAW_CENTER "!YELLOW!49!CYAN!  >  !WHITE!Streaming Applications!CYAN!" 20
echo [8Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" / "!YELLOW!EN!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 40
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUESTREAMINGFR
if "!x!"=="49" (set la=FR) & goto :STREAMINGAPPS
call :CHOOSE en && goto :STREAMINGEN
call :CHOOSE search && (call :IS_SEARCH e49c0bfe5fd6d7fb6 & goto :CONTINUESTREAMINGFR)
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARSTREAMINGFR
call :ERRORMESSAGE
goto :CONTINUESTREAMINGFR

:STREAMINGAPPS
call :SCALE 109 33
title !TITLE:`=Streaming Applications!
call :ROSE "Streaming Applications"

:CLEARSTREAMINGAPPS
call :CLEAR 1 13
set db=popcorn-time.tw/ www.stremio.com/ cinemaapk.com/ teatv.net/ www.morpheustvbox.com/ mediaboxhd.net/ www.vivatv.io/ beetvapk.me/ filmplus.app/ www.novatvapk.com/ animixplay.to/android/app tvmob.net/ www.livenettv.bz/

:CONTINUESTREAMINGAPPS
call :SCALE 109 33
echo !CYAN!
echo [40Cออออออออออออออออออออออออออออออ
echo [39C// !RED!Û!BGYELLOW!!BLACK! STREAMING APPLICATIONS !RED!Û!BGBLACK!!CYAN! \\
echo [6Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [6CฬออออออออþÛ!BGYELLOW!!RED!Û Windows Û!BGBLACK!!CYAN!ÛþออออออออหอออออออออþÛ!BGYELLOW!!RED!Û macOS Û!BGBLACK!!CYAN!ÛþอออออออออหอออออออออþÛ!BGYELLOW!!RED!Û Linux Û!BGBLACK!!CYAN!Ûþอออออออออน
echo [6Cบ                               บ                               บ                               บ
echo [6Cบ    !1!popcorn-time.tw!CYAN!      บ    !1!popcorn-time.tw!CYAN!      บ    !1!popcorn-time.tw!CYAN!      บ
echo [6Cบ    !2!www.stremio.com!CYAN!      บ    !2!www.stremio.com!CYAN!      บ    !2!www.stremio.com!CYAN!      บ
echo [6Cบ                               บ                               บ                               บ
echo [6Cฬอออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออน
echo [6CฬออออออออออออออออþÛ!BGYELLOW!!RED!Û Android Û!BGBLACK!!CYAN!ÛþออออออออออออออออหออออออออออออออออออþÛ!BGYELLOW!!RED!Û iOS Û!BGBLACK!!CYAN!Ûþออออออออออออออออออน
echo [6Cบ                                               บ                                               บ
echo [6Cบ        !1!popcorn-time.tw!CYAN!                  บ          !1!popcorn-time.tw!CYAN!                บ
echo [6Cบ        !2!www.stremio.com!CYAN!                  บ          !2!www.stremio.com!CYAN!                บ
echo [6Cบ        !3!cinemaapk.com!CYAN!                    บ          !6!mediaboxhd.net!CYAN!                 บ
echo [6Cบ        !4!teatv.net!CYAN!                        บ                                               บ
echo [6Cบ        !5!www.morpheustvbox.com!CYAN!            บ                                               บ
echo [6Cบ        !6!mediaboxhd.net!CYAN!                   บ                                               บ
echo [6Cบ        !7!www.vivatv.io!CYAN!                    บ                                               บ
echo [6Cบ        !8!beetvapk.me!CYAN!                      บ                                               บ
echo [6Cบ        !9!filmplus.app!CYAN!                     บ                                               บ
echo [6Cบ       !10!www.novatvapk.com!CYAN!                บ                                               บ
echo [6Cบ       !11!animixplay.to !GREEN!(animes)!CYAN!           บ                                               บ
echo [6Cบ       !12!tvmob.net !GREEN!(television)!CYAN!           บ                                               บ
echo [6Cบ       !13!www.livenettv.bz !GREEN!(television)!CYAN!    บ                                               บ
echo [6Cบ                                               บ                                               บ
echo [6Cศอออออออออออออออออออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 20
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
call :CLEAR 1 77
set db=solidtorrents.net/ www.limetorrents.pro/ www.torrentfunk.com/ www.toros.co/ www.gtdb.to/ www.torrentdownloads.pro/ 1337x.to/ rarbg.to/index80.php www.ettvcentral.com/ torrentz2k.xyz/ thepiratebay.org/index.html prostylex.org/ torrentgalaxy.to/ yourbittorrent.com/ anidex.info/ www.demonoid.is/ angietorrents.cc/ www.torrentdownload.info/ badasstorrents.com/ concen.org/torrents nyaa.si/ www.anirena.com/ subsplease.org/ mac-torrent-download.net/ mac-torrents.io/ yts.mx/ eztv.re/ www3.yggtorrent.nz/ www.sharewood.tv/ www.oxtorrent.sh/ torrent9.to/ bt4g.org/ xbit.pw/ bitsearch.to/ www.7torrents.cc/ bitcq.com/ knaben.eu/ torrentproject2.com/ torrent-paradise.ml/ btdig.com/ ext.to/ www.torlock.com/ ibit.to/ zooqle.com/ snowfl.com/ idope.se/ isohunt.app/ extratorrents.it/ pirateiro.com/ torrentseeker.com/ otorrents.com/ vstorrent.org/ torrents-csv.ml/ torrentz2eu.me/ search.torrends.to/ proxy-bay.me/ proxygalaxy.pw/ yifystatus.com/ eztvstatus.com/ ettvproxies.com/ siteunblocked.info/ unblockproject.monster/ unblocksource.net/ unblockit.kim/ torrentbay.to/ proxyninja.org/ knaben.info/ unblocktorrent.com/ torrends.to/ github.com/Jackett/Jackett www.qbittorrent.org/ www.torrentrover.com/ sonarr.tv/ radarr.video/ lidarr.audio/ github.com/SchizoDuckie/DuckieTV couchpota.to/

:CONTINUETORRENTING
call :SCALE 133 56
echo !CYAN!
echo [57Cออออออออออออออออออ
echo [56C// !RED!Û!BGYELLOW!!BLACK! TORRENTING !RED!Û!BGBLACK!!CYAN! \\
echo [8Cษออออออออออออออออออออออออออออออออออออออออออออออ//ออออออออออออออออออ\\อออออออออออออออออออออออออออออออออออออออออออออออป
echo [8CฬออออออออออออออออออออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û English Û!BGBLACK!!CYAN!Ûþออออออออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                   บ
echo [8Cบ    !1!solidtorrents.net!CYAN!          ณ   !10!torrentz2k.xyz!CYAN!           ณ   !19!www.torrentdownload.info!CYAN!       บ
echo [8Cบ    !2!www.limetorrents.pro!CYAN!       ณ   !11!!RED!thepiratebay.org!CYAN!         ณ   !20!concen.org!CYAN!                     บ
echo [8Cบ    !3!www.torrentfunk.com!CYAN!        ณ   !12!prostylex.org!CYAN!            ณ   !21!nyaa.si !GREEN!(animes)!CYAN!               บ
echo [8Cบ    !4!www.toros.co!CYAN!               ณ   !13!torrentgalaxy.to!CYAN!         ณ   !22!www.anirena.com !GREEN!(animes)!CYAN!       บ
echo [8Cบ    !5!www.gtdb.to!CYAN!                ณ   !14!yourbittorrent.com!CYAN!       ณ   !23!subsplease.org !GREEN!(animes)!CYAN!        บ
echo [8Cบ    !6!www.torrentdownloads.pro!CYAN!   ณ   !15!anidex.info!CYAN!              ณ   !24!mac-torrent-download.net !GREEN!(MAC)!CYAN! บ
echo [8Cบ    !7!1337x.to!CYAN!                   ณ   !16!www.demonoid.is!CYAN!          ณ   !25!mac-torrents.io !GREEN!(MAC)!CYAN!          บ
echo [8Cบ    !8!rarbg.to!CYAN!                   ณ   !17!angietorrents.cc!CYAN!         ณ   !26!yts.mx !GREEN!(movies)!CYAN!                บ
echo [8Cบ    !9!www.ettvcentral.com!CYAN!        ณ   !18!badasstorrents.com!CYAN!       ณ   !27!eztv.re !GREEN!(TV)!CYAN!                   บ
echo [8Cบ                                                                                                                   บ
echo [8CฬออออออออออออออออออออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û French Û!BGBLACK!!CYAN!Ûþอออออออออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                   บ
echo [8Cบ   !28!www3.yggtorrent.nz!CYAN!         ณ   !30!www.oxtorrent.sh!CYAN!         ณ                                         บ
echo [8Cบ   !29!www.sharewood.tv!CYAN!           ณ   !31!torrent9.to!CYAN!              ณ                                         บ
echo [8Cบ                                                                                                                   บ
echo [8CฬอออออออออออออออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Torrent Searching Û!BGBLACK!!CYAN!Ûþอออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                   บ
echo [8Cบ   !32!bt4g.org!CYAN!                   ณ   !41!ext.to!CYAN!                   ณ   !50!torrentseeker.com!CYAN!              บ
echo [8Cบ   !33!xbit.pw!CYAN!                    ณ   !42!www.torlock.com!CYAN!          ณ   !51!otorrents.com!CYAN!                  บ
echo [8Cบ   !34!bitsearch.to!CYAN!               ณ   !43!ibit.to!CYAN!                  ณ   !52!vstorrent.org!CYAN!                  บ
echo [8Cบ   !35!www.7torrents.cc!CYAN!           ณ   !44!zooqle.com!CYAN!               ณ   !53!torrents-csv.ml!CYAN!                บ
echo [8Cบ   !36!bitcq.com!CYAN!                  ณ   !45!snowfl.com!CYAN!               ณ   !54!torrentz2eu.me!CYAN!                 บ
echo [8Cบ   !37!knaben.eu!CYAN!                  ณ   !46!idope.se!CYAN!                 ณ   !55!search.torrends.to!CYAN!             บ
echo [8Cบ   !38!torrentproject2.com!CYAN!        ณ   !47!isohunt.app!CYAN!              ณ                                         บ
echo [8Cบ   !39!torrent-paradise.ml!CYAN!        ณ   !48!extratorrents.it!CYAN!         ณ                                         บ
echo [8Cบ   !40!btdig.com!CYAN!                  ณ   !49!pirateiro.com!CYAN!            ณ                                         บ
echo [8Cบ                                                                                                                   บ
echo [8CฬออออออออออออออออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Torrent Proxys Û!BGBLACK!!CYAN!Ûþอออออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                   บ
echo [8Cบ   !56!proxy-bay.me!CYAN!               ณ   !61!siteunblocked.info!CYAN!       ณ   !66!proxyninja.org!CYAN!                 บ
echo [8Cบ   !57!proxygalaxy.pw!CYAN!             ณ   !62!unblockproject.monster!CYAN!   ณ   !67!knaben.info!CYAN!                    บ
echo [8Cบ   !58!yifystatus.com!CYAN!             ณ   !63!unblocksource.net!CYAN!        ณ   !68!unblocktorrent.com!CYAN!             บ
echo [8Cบ   !59!eztvstatus.com!CYAN!             ณ   !64!unblockit.kim!CYAN!            ณ   !69!torrends.to!CYAN!                    บ
echo [8Cบ   !60!ettvproxies.com!CYAN!            ณ   !65!torrentbay.to!CYAN!            ณ                                         บ
echo [8Cบ                                                                                                                   บ
echo [8CฬอออออออออออออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Torrent Applications Û!BGBLACK!!CYAN!Ûþออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                   บ
echo [8Cบ   !70!Jackett!CYAN!                    ณ   !73!sonarr.tv!CYAN!                ณ   !76!DuckieTV!CYAN!                       บ
echo [8Cบ   !71!www.qbittorrent.org!CYAN!        ณ   !74!radarr.video!CYAN!             ณ   !77!couchpota.to!CYAN!                   บ
echo [8Cบ   !72!www.torrentrover.com!CYAN!       ณ   !75!lidarr.audio!CYAN!             ณ                                         บ
echo [8Cบ                                                                                                                   บ
echo [8Cฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                             !YELLOW!78!CYAN!  ^>  !WHITE!Web Torrenting!CYAN!                                                 บ
echo [8Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!INSTALL!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" / "!YELLOW!ADD!BRIGHTBLACK!" / "!YELLOW!HELP!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 60
echo !RED!
>nul 2>&1 reg query "HKCR\.torrent" || (
if "!Language!"=="EN" call :DRAW_CENTER "ERROR: To be able to use !YELLOW!TORRENTING!RED!, first you need to choose: !YELLOW![INSTALL]" 15
if "!Language!"=="FR" call :DRAW_CENTER "ERREUR: Pour pouvoir utiliser !YELLOW!TORRENTING!RED!, vous devez d'abord choisir: !YELLOW![INSTALL]" 15
echo:
)
call :PROMPT
if "!x!"=="75" goto :WEBTORRENTING
if "!UntrustedWebsitesWarning!"=="1" for %%A in (11`thepiratebay.org) do for /f "tokens=1,2delims=`" %%B in ("%%A") do if "!x!"=="%%B" if "!%%B!"=="!YELLOW!%%B !UNCHECKED!" (
if "!Language!"=="EN" set t="You have selected '%%C' which is flagged as an untrusted website." "Be careful using it."
if "!Language!"=="FR" set t="Vous avez slectionn '%%C' qui est signal comme un site web non fiable." "Soyez prudent en l'utilisant."
call :MSGBOX 2 !t! 69680 "Illegal Services Checker"
)
call :WEBSITECHECK && goto :CONTINUETORRENTING
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
call :CLEAR 1 6
set db=webtorrent.io/ webtor.io/#/ instant.io/ btorrent.xyz/ www.torrentsafe.com/ zbigz.com/

:CONTINUEWEBTORRENTING
call :SCALE 53 19
echo !CYAN!
echo [16Cออออออออออออออออออออออ
echo [15C// !RED!Û!BGYELLOW!!BLACK! WEB TORRENTING !RED!Û!BGBLACK!!CYAN! \\
echo [9Cษอออออออออออออออออออออออออออออออออป
echo [9Cบ                                 บ
echo [9Cบ    !1!webtorrent.io!CYAN!          บ
echo [9Cบ    !2!webtor.io!CYAN!              บ
echo [9Cบ    !3!instant.io!CYAN!             บ
echo [9Cบ    !4!btorrent.xyz!CYAN!           บ
echo [9Cบ    !5!www.torrentsafe.com!CYAN!    บ
echo [9Cบ    !6!zbigz.com!CYAN!              บ
echo [9Cบ                                 บ
echo [9Cศอออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 20
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
echo [42Cออออออออออออออออออออออออ
if "!Language!"=="EN" set t=TUTORIAL
if "!Language!"=="FR" set t=TUTORIEL
echo [41C// !RED!Û!BGYELLOW!!BLACK! TORRENT !t! !RED!Û!BGBLACK!!CYAN! \\
echo [4Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [4Cบ                                                                                                                                           บ
if "!Language!"=="EN" echo [4Cบ                          þÛ!BGYELLOW!!RED!Û  What's a torrent (Wikipedia) ? Û!BGBLACK!!CYAN!Ûþ                                                                         บ
if "!Language!"=="FR" echo [4Cบ                          þÛ!BGYELLOW!!RED!Û  Qu'est-ce qu'un torrent (Wikipedia) ? Û!BGBLACK!!CYAN!Ûþ                                                                  บ
echo [4Cบ                                                                                                                                           บ
if "!Language!"=="EN" echo [4Cบ  Torrents are a method of distributing files over the internet.                                                                           บ
if "!Language!"=="FR" echo [4Cบ  Le Torrent est une mthode de distribution de fichiers sur Internet.                                                                     บ
if "!Language!"=="EN" echo [4Cบ  It operate over the BitTorrent protocol to facilitate what's called peer-to-peer (P2P) file sharing.                                     บ
if "!Language!"=="FR" echo [4Cบ  Il fonctionne sur le protocole Bittorrent pour faciliter ce que l'on appelle le partage de fichiers peer-to-peer (P2P).                  บ
if "!Language!"=="EN" echo [4Cบ  The most common way to use torrents is through a special file that uses the .torrent file extension.                                     บ
if "!Language!"=="FR" echo [4Cบ  La faont la plus courante d'utiliser des torrents consiste … utiliser un fichier spcial qui utilise l'extension de fichier .torrent    บ
echo [4Cบ                                                                                                                                           บ
if "!Language!"=="EN" echo [4Cบ                           þÛ!BGYELLOW!!RED!Û  How to open .torrent files ? Û!BGBLACK!!CYAN!Ûþ                                                                          บ
if "!Language!"=="FR" echo [4Cบ                          þÛ!BGYELLOW!!RED!Û  Comment ouvrir des fichiers .torrent ? Û!BGBLACK!!CYAN!Ûþ                                                                 บ
echo [4Cบ                                                                                                                                           บ
if "!Language!"=="EN" echo [4Cบ  !YELLOW!1!CYAN!  ^> !WHITE! Download and install qBittorrent.!CYAN!                                                                                                  บ
if "!Language!"=="FR" echo [4Cบ  !YELLOW!1!CYAN!  ^> !WHITE! Tlchargez et installer qBittorrent.!CYAN!                                                                                              บ
if "!Language!"=="EN" echo [4Cบ  Then you can run the .torrent that you have downloaded in one of the previous Illegal Services Torrenting links.                         บ
if "!Language!"=="FR" echo [4Cบ  Ensuite, vous pouvez excuter le .torrent que vous avez tlcharg dans l'un des liens de Torrenting depuis Illegal Services.            บ
echo [4Cบ                                                                                                                                           บ
echo [4Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 20
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
echo Cette option vous permet de crer un lien magntique avec un HASH.
echo Exemple d'un HASH: "c12fe1c06bba254a9dc9f519b335aa7c1367a88a"
)
>nul 2>&1 reg query "HKCR\magnet\shell\open\command" || goto :ERROR_ADDTORRENT
echo !CYAN!
if "!Language!"=="EN" set t=Type the torrent's HASH
if "!Language!"=="FR" set t=Entrez le HASH du torrent
%SHOWCURSOR%
set x=
set /p "x=!t!: !YELLOW!"
%HIDECURSOR%
call :CHOOSE back && goto :CONTINUETORRENTING
if defined x if "!x:~39!"=="!x:~-1!" start "" "magnet:?xt=urn:btih:!x!" && goto :CONTINUETORRENTING || goto :ERROR_ADDTORRENT
echo !CYAN!
call :ERRORMESSAGE
goto :CONTINUETORRENTING

:ERROR_ADDTORRENT
echo !RED!
if "!Language!"=="EN" (
echo ERROR: You need a working bittorrent platform in order to make magnet links working.
echo Do you want to install qBittorrent in order to make it working ? [!YELLOW!YES!RED!] / [!YELLOW!NO!RED!]
>nul choice /n /c YN
)
if "!Language!"=="FR" (
echo ERREUR: vous avez besoin d'une plate-forme bittorrent fonctionnelle pour que les liens magntiques fonctionnent.
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
call :CLEAR 1 23
set db=subscene.com/ www.opensubtitles.com/ www.opensubtitles.org/ opensubtitle.info/ ytsubtitles.com/ yifysubtitles.org/ yts-subs.com/ subs.dog/ www.subs4free.info/ www.subtitledb.org/ www.addic7ed.com/ isubtitles.org/ subdl.com/ `www.moviesubtitles.net/ www.podnapisi.net/ tvsubs.net/ www.tvsubtitles.net/ www.subdivx.com/ www.subtitlecat.com/ www.sous-titres.eu/ www.u-sub.net/ www.kitsunekko.net/ subs.nandesuka.workers.dev/

:CONTINUESUBTITLES
call :SCALE 72 35
echo !CYAN!
echo [9Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [9CฬออออออออออออออออออþÛ!BGYELLOW!!RED!Û SUBTITLES Û!BGBLACK!!CYAN!Ûþออออออออออออออออออน
echo [9Cบ                                                     บ
echo [9Cบ    !1!subscene.com!CYAN!                               บ
echo [9Cบ    !2!www.opensubtitles.com!CYAN!                      บ
echo [9Cบ    !3!www.opensubtitles.org!CYAN!                      บ
echo [9Cบ    !4!opensubtitle.info!CYAN!                          บ
echo [9Cบ    !5!ytsubtitles.com!CYAN!                            บ
echo [9Cบ    !6!yifysubtitles.org!CYAN!                          บ
echo [9Cบ    !7!yts-subs.com!CYAN!                               บ
echo [9Cบ    !8!subs.dog!CYAN!                                   บ
echo [9Cบ    !9!www.subs4free.info!CYAN!                         บ
echo [9Cบ   !10!www.subtitledb.org!CYAN!                         บ
echo [9Cบ   !11!www.addic7ed.com!CYAN!                           บ
echo [9Cบ   !12!isubtitles.org!CYAN!                             บ
echo [9Cบ   !13!subdl.com!CYAN!                                  บ
echo [9Cบ   !14!www.moviesubtitles.net!CYAN!                     บ
echo [9Cบ   !15!www.podnapisi.net!CYAN!                          บ
echo [9Cบ   !16!tvsubs.net!CYAN!                                 บ
echo [9Cบ   !17!www.tvsubtitles.net!CYAN!                        บ
echo [9Cบ   !18!www.subdivx.com!CYAN!                            บ
echo [9Cบ   !19!www.subtitlecat.com!CYAN!                        บ
echo [9Cบ   !20!www.sous-titres.eu!CYAN!                         บ
echo [9Cบ   !21!www.u-sub.net!CYAN!                              บ
echo [9Cบ   !22!www.kitsunekko.net !GREEN!(animes)!CYAN!                บ
echo [9Cบ   !23!subs.nandesuka.workers.dev !GREEN!(animes) [FR]!CYAN!   บ
echo [9Cบ                                                     บ
echo [9Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 30
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
call :CLEAR 1 80
set db=getintopc.com/ crackingpatching.com/ karanpc.com/ filecr.com/en/ s0ft4pc.com/ kolompc.com/ www.mazterize.com/ gigapurbalingga.net/ appnee.com/ www.sadeempc.com/ shareappscrack.com/ free4pc.org/ appload.club/ www.4download.net/ haxnode.net/ www.novahax.com/ lostvayne.com/ filewomen.com/ izofile.com/ crackshash.com/ www.cybermania.ws/ cracksurl.com/ fileriver.net/ piratepc.me/ ftuapps.dev/ starcrack.net/ startcrack.net/ keygenninja.net/ fileash.com/ www.trucnet.com/ w14.monkrus.ws/ `www.intercambiosvirtuales.org/ diakov.net/ lrepacks.net/ repack.me/ portable4pc.com/ www.fcportables.com/ portableappz.blogspot.com/ igg-games.com/ pcgamestorrents.com/ www.skidrowcodex.net/ www.mrpcgamer.co/ www.game3rb.com/ agfy.co/ cracked-games.org/ www.ovagames.com/ steamunlocked.net/ gog-games.com/ codex-games.com/ getgamez.net/ www.elamigos-games.com/ crackhub.site/ freegameshub.co/ gogunlocked.com/ alltorrents.co/ www.myabandonware.com/ gamesnostalgia.com/ cygames.fr/ telecharger-jeuxpc.fr/ www.gamestorrents.fm/ repack-games.com/ www.game-repack.site/ elamigos.site/ skidrowrepacks.com/ fitgirl-repacks.site/ repack-mechanics.com/ gamesdrive.net/ darckrepacks.com/ dodi-repacks.site/ www.blackboxrepack.com/ masquerade.site/ scooter-repacks.site/ www.gnarly-repacks.site/ cpgrepacks.site/ www.tiny-repacks.win/ repack.info/ m4ckd0ge-repacks.me/ patricktech-repacks.xyz/ e13.xatab-repack.com/ qoob.name/

:CONTINUEWINDOWS
call :SCALE 136 54
echo !CYAN!
echo [54Cออออออออออออออออออออออออออออ
echo [53C// !RED!Û!BGYELLOW!!BLACK! CRACKED WINDOWS APPS !RED!Û!BGBLACK!!CYAN! \\
echo [8Cษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [8CฬอออออออออออออออออออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Applications Û!BGBLACK!!CYAN!Ûþอออออออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                      บ
echo [8Cบ    !1!!RED!getintopc.com!CYAN!           ณ   !12!free4pc.org!CYAN!                ณ   !23!fileriver.net!CYAN!                      บ
echo [8Cบ    !2!!RED!crackingpatching.com!CYAN!    ณ   !13!appload.club!CYAN!               ณ   !24!piratepc.me!CYAN!                        บ
echo [8Cบ    !3!!RED!karanpc.com!CYAN!             ณ   !14!www.4download.net!CYAN!          ณ   !25!ftuapps.dev!CYAN!                        บ
echo [8Cบ    !4!filecr.com!CYAN!              ณ   !15!!RED!haxnode.net!CYAN!                ณ   !26!starcrack.net!CYAN!                      บ
echo [8Cบ    !5!!RED!s0ft4pc.com!CYAN!             ณ   !16!www.novahax.com!CYAN!            ณ   !27!startcrack.net!CYAN!                     บ
echo [8Cบ    !6!!RED!kolompc.com!CYAN!             ณ   !17!lostvayne.com!CYAN!              ณ   !28!keygenninja.net!CYAN!                    บ
echo [8Cบ    !7!www.mazterize.com!CYAN!       ณ   !18!filewomen.com!CYAN!              ณ   !29!fileash.com!CYAN!                        บ
echo [8Cบ    !8!gigapurbalingga.net!CYAN!     ณ   !19!!RED!izofile.com!CYAN!                ณ   !30!www.trucnet.com !GREEN![FR]!CYAN!               บ
echo [8Cบ    !9!appnee.com!CYAN!              ณ   !20!!RED!crackshash.com!CYAN!             ณ   !31!w14.monkrus.ws !GREEN![RU]!CYAN!                บ
echo [8Cบ   !10!!RED!www.sadeempc.com!CYAN!        ณ   !21!!RED!www.cybermania.ws!CYAN!          ณ   !32!www.intercambiosvirtuales.org !GREEN![ES]!CYAN! บ
echo [8Cบ   !11!shareappscrack.com!CYAN!      ณ   !22!cracksurl.com!CYAN!              ณ                                             บ
echo [8Cบ                                                                                                                      บ
echo [8CฬอออออออออออออออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Application Repacks Û!BGBLACK!!CYAN!Ûþออออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                      บ
echo [8Cบ   !33!diakov.net !GREEN![RU]!CYAN!         ณ   !34!lrepacks.net !GREEN![RU]!CYAN!          ณ   !35!repack.me !GREEN![RU]!CYAN!                     บ
echo [8Cบ                                                                                                                      บ
echo [8CฬออออออออออออออออออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Portable Apps Û!BGBLACK!!CYAN!Ûþอออออออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                      บ
echo [8Cบ   !36!!RED!portable4pc.com!CYAN!         ณ   !37!www.fcportables.com!CYAN!        ณ   !38!portableappz.blogspot.com!CYAN!          บ
echo [8Cบ                                                                                                                      บ
echo [8CฬออออออออออออออออออออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Videogames Û!BGBLACK!!CYAN!Ûþออออออออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                      บ
echo [8Cบ   !39!!RED!igg-games.com!CYAN!           ณ   !47!steamunlocked.net!CYAN!          ณ   !55!alltorrents.co!CYAN!                     บ
echo [8Cบ   !40!!RED!pcgamestorrents.com!CYAN!     ณ   !48!gog-games.com!CYAN!              ณ   !56!www.myabandonware.com !GREEN!(retro)!CYAN!      บ
echo [8Cบ   !41!!RED!www.skidrowcodex.net!CYAN!    ณ   !49!!RED!codex-games.com!CYAN!            ณ   !57!gamesnostalgia.com !GREEN!(retro)!CYAN!         บ
echo [8Cบ   !42!www.mrpcgamer.co!CYAN!        ณ   !50!getgamez.net!CYAN!               ณ   !58!cygames.fr !GREEN![FR]!CYAN!                    บ
echo [8Cบ   !43!www.game3rb.com!CYAN!         ณ   !51!www.elamigos-games.com!CYAN!     ณ   !59!telecharger-jeuxpc.fr !GREEN![FR]!CYAN!         บ
echo [8Cบ   !44!agfy.co!CYAN!                 ณ   !52!crackhub.site!CYAN!              ณ   !60!www.gamestorrents.fm !GREEN![ES]!CYAN!          บ
echo [8Cบ   !45!!RED!cracked-games.org!CYAN!       ณ   !53!freegameshub.co!CYAN!            ณ                                             บ
echo [8Cบ   !46!www.ovagames.com!CYAN!        ณ   !54!gogunlocked.com!CYAN!            ณ                                             บ
echo [8Cบ                                                                                                                      บ
echo [8CฬออออออออออออออออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Videogame Repacks Û!BGBLACK!!CYAN!Ûþอออออออออออออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                                                      บ
echo [8Cบ   !61!repack-games.com!CYAN!        ณ   !68!darckrepacks.com!CYAN!           ณ   !75!www.tiny-repacks.win!CYAN!
echo [8Cบ   !62!www.game-repack.site!CYAN!    ณ   !69!dodi-repacks.site!CYAN!          ณ   !76!repack.info!CYAN!                        บ
echo [8Cบ   !63!elamigos.site!CYAN!           ณ   !70!www.blackboxrepack.com!CYAN!     ณ   !77!m4ckd0ge-repacks.me!CYAN!                บ
echo [8Cบ   !64!skidrowrepacks.com!CYAN!      ณ   !71!masquerade.site!CYAN!            ณ   !78!patricktech-repacks.xyz!CYAN!            บ
echo [8Cบ   !65!fitgirl-repacks.site!CYAN!    ณ   !72!scooter-repacks.site!CYAN!       ณ   !79!e13.xatab-repack.com !GREEN![RU]!CYAN!          บ
echo [8Cบ   !66!repack-mechanics.com!CYAN!    ณ   !73!www.gnarly-repacks.site!CYAN!    ณ   !80!qoob.name !GREEN![RU]!CYAN!                     บ
echo [8Cบ   !67!gamesdrive.net!CYAN!          ณ   !74!cpgrepacks.site!CYAN!            ณ                                             บ
echo [8Cบ                                                                                                                      บ
echo [8Cศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 30
echo:
call :PROMPT
if "!UntrustedWebsitesWarning!"=="1" for %%A in (1`getintopc.com 2`crackingpatching.com 3`karanpc.com 5`s0ft4pc.com 6`kolompc.com 10`www.sadeempc.com 15`haxnode.net 19`izofile.com 20`crackshash.com 21`www.cybermania.ws 36`portable4pc.com 39`igg-games.com 40`pcgamestorrents.com 41`www.skidrowcodex.net 45`cracked-games.org 49`codex-games.com) do for /f "tokens=1,2delims=`" %%B in ("%%A") do if "!x!"=="%%B" if "!%%B!"=="!YELLOW!%%B !UNCHECKED!" (
if "!Language!"=="EN" set t="You have selected '%%C' which is flagged as an untrusted* website. Be careful using it." "*Untrusted websites are known to the warez community to index malicious or suspicious as well as legitimate content."
if "!Language!"=="FR" set t="Vous avez slectionn '%%C' qui est signal comme un site web non fiable*. Soyez prudent en l'utilisant." "*Les sites web non fiables sont connus de la communaut warez pour indexer du contenu malveillant ou suspect ainsi que lgitime."
call :MSGBOX 2 !t! 69680 "Illegal Services Checker"
)
call :WEBSITECHECK && goto :CONTINUEWINDOWS
call :CHOOSE search && (call :IS_SEARCH c63a5dfcf766495b0 & goto :CONTINUEWINDOWS)
call :CHOOSE back && goto :MAINMENU
call :WEBSITESTART && goto :CLEARWINDOWS
call :ERRORMESSAGE
goto :CONTINUEWINDOWS

:ANDROID
call :SCALE 85 33
title !TITLE:`=Cracked Android APK's!
call :ROSE "Cracked Android APK"

:CLEARANDROID
call :CLEAR 1 27
set db=a2zapk.com/ apkhome.net/ apkmagic.com.ar/ oceanofapk.com/ apkgod.net/ 5mod.ru/ apkmb.com/ apk4free.org/ dlandroid.com/ apk4all.com/ rexdl.com/ moddroid.co/temp-home apkmody.io/new-home inewkhushi.com/ proapk.in/mod-apk/ www.apps4download.com/ ihackedit.com/ iplayplus.org/ apk-house.com/ www.rockmods.net/ www.ytricks.net/ www.apkheist.com/ apkfolks.com/ bluesmods.com/ www.whatsappmods.net/ vancedapp.com/ github.com/xManager-v2/xManager-Spotify

:CONTINUEANDROID
call :SCALE 85 33
echo !CYAN!
echo [28Cออออออออออออออออออออออออออออ
echo [27C// !RED!Û!BGYELLOW!!BLACK! CRACKED ANDROID APPS !RED!Û!BGBLACK!!CYAN! \\
echo [7Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [7Cบ                                                                     บ
echo [7Cบ    !1!a2zapk.com!CYAN!             ณ   !13!apkmody.io!CYAN!               บ
echo [7Cบ    !2!apkhome.net!CYAN!            ณ   !14!inewkhushi.com!CYAN!           บ
echo [7Cบ    !3!apkmagic.com.ar!CYAN!        ณ   !15!proapk.in!CYAN!                บ
echo [7Cบ    !4!oceanofapk.com!CYAN!         ณ   !16!www.apps4download.com!CYAN!    บ
echo [7Cบ    !5!apkgod.net!CYAN!             ณ   !17!ihackedit.com!CYAN!            บ
echo [7Cบ    !6!5mod.ru!CYAN!                ณ   !18!iplayplus.org!CYAN!            บ
echo [7Cบ    !7!apkmb.com!CYAN!              ณ   !19!apk-house.com!CYAN!            บ
echo [7Cบ    !8!apk4free.org!CYAN!           ณ   !20!www.rockmods.net!CYAN!         บ
echo [7Cบ    !9!dlandroid.com!CYAN!          ณ   !21!www.ytricks.net!CYAN!          บ
echo [7Cบ   !10!apk4all.com!CYAN!            ณ   !22!www.apkheist.com!CYAN!         บ
echo [7Cบ   !11!rexdl.com!CYAN!              ณ   !23!apkfolks.com!CYAN!             บ
echo [7Cบ   !12!moddroid.co!CYAN!            ณ                                   บ
echo [7Cบ                                                                     บ
echo [7CฬอออออþÛ!BGYELLOW!!RED!Û Discord Modded Û!BGBLACK!!CYAN!ÛþออออออหอออออþÛ!BGYELLOW!!RED!Û Whats App Modded Û!BGBLACK!!CYAN!Ûþออออออน
echo [7Cบ                                 บ                                   บ
echo [7Cบ   !24!BLUEsmods.com!CYAN!          บ   !25!www.whatsappmods.net!CYAN!     บ
echo [7Cบ                                 บ                                   บ
echo [7CฬอออออþÛ!BGYELLOW!!RED!Û YouTube Modded Û!BGBLACK!!CYAN!ÛþออออออฮออออออþÛ!BGYELLOW!!RED!Û Spotify Modded Û!BGBLACK!!CYAN!Ûþอออออออน
echo [7Cบ                                 บ                                   บ
echo [7Cบ   !26!vancedapp.com!CYAN!          บ   !27!xManager-v2!CYAN!              บ
echo [7Cบ                                 บ                                   บ
echo [7Cศอออออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / !YELLOW!SEARCH!BRIGHTBLACK! !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 30
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
set "YouTubeDLDirectoryInfo=Change download location!CYAN!                                   บ"
if "!YouTubeDLGeoBypass!"=="0" set "YouTubeDLGeoBypassInfo=Bypass geographic restriction !CYAN!(!RED!OFF!!CYAN!)                        บ"
if "!YouTubeDLGeoBypass!"=="1" set "YouTubeDLGeoBypassInfo=Bypass geographic restriction !CYAN!(!GREEN!ON!!CYAN!)                         บ"
)
if "!Language!"=="FR" (
set "YouTubeDLDirectoryInfo=Changer l'emplacement de tlchargement!CYAN!                    บ"
if "!YouTubeDLGeoBypass!"=="0" set "YouTubeDLGeoBypassInfo=Contournement de la restriction gographique !CYAN!(!RED!OFF!!CYAN!)         บ"
if "!YouTubeDLGeoBypass!"=="1" set "YouTubeDLGeoBypassInfo=Contournement de la restriction gographique !CYAN!(!GREEN!ON!!CYAN!)          บ"
)
if "!YouTubeDLP!"=="0" (
set youtube_dl=youtube-dl
set "YouTubeDLPInfo=YouTube DLP !CYAN!(!RED!OFF!!CYAN!)                                          บ"
)
if "!YouTubeDLP!"=="1" (
set youtube_dl=yt-dlp
set "YouTubeDLPInfo=YouTube DLP !CYAN!(!GREEN!ON!!CYAN!)                                           บ"
)
if not exist "Portable_Apps\YouTube-DL\" md "Portable_Apps\YouTube-DL"

:CONTINUEYOUTUBEDL
call :SCALE 104 32
echo !CYAN!
echo [39Cออออออออออออออออออออออออออ
echo [38C// !RED!Û!BGYELLOW!!BLACK! YOUTUBE DOWNLOADER !RED!Û!BGBLACK!!CYAN! \\
echo [8Cษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
if "!Language!"=="EN" (set t1=Video Formats) & set t2=Audio Formats
if "!Language!"=="FR" (set t1=Formats vido) & set t2=Formats Audio
echo [8CฬอออออออออออþÛ!BGYELLOW!!RED!Û !t1! Û!BGBLACK!!CYAN!ÛþอออออออออออหออออออออออþÛ!BGYELLOW!!RED!Û !t2! Û!BGBLACK!!CYAN!Ûþอออออออออออน
echo [8Cบ                                           บ                                          บ
echo [8Cบ    !YELLOW!1!CYAN!  ^> !WHITE! BEST!CYAN!                             บ     !YELLOW!7!CYAN!  ^> !WHITE! BEST!CYAN!                           บ
echo [8Cบ    !YELLOW!2!CYAN!  ^> !WHITE! .mp4!CYAN!                             บ     !YELLOW!8!CYAN!  ^> !WHITE! .mp3!CYAN!                           บ
echo [8Cบ    !YELLOW!3!CYAN!  ^> !WHITE! .webm!CYAN!                            บ     !YELLOW!9!CYAN!  ^> !WHITE! .m4a!CYAN!                           บ
echo [8Cบ    !YELLOW!4!CYAN!  ^> !WHITE! .flv!CYAN!                             บ    !YELLOW!10!CYAN!  ^> !WHITE! .flac!CYAN!                          บ
echo [8Cบ    !YELLOW!5!CYAN!  ^> !WHITE! .mkv!CYAN!                             บ    !YELLOW!11!CYAN!  ^> !WHITE! .aac!CYAN!                           บ
echo [8Cบ    !YELLOW!6!CYAN!  ^> !WHITE! .avi!CYAN!                             บ    !YELLOW!12!CYAN!  ^> !WHITE! .opus!CYAN!                          บ
echo [8Cบ                                           บ    !YELLOW!13!CYAN!  ^> !WHITE! .ogg!CYAN!                           บ
echo [8Cบ                                           บ    !YELLOW!14!CYAN!  ^> !WHITE! .wav!CYAN!                           บ
echo [8Cฬอออออออออออออออออออออออออออออออออออออออออออสออออออออออออออออออออออออออออออออออออออออออน
if "!Language!"=="EN" echo [8CฬอออออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Settings Û!BGBLACK!!CYAN!Ûþอออออออออออออออออออออออออออออออออออน
if "!Language!"=="FR" echo [8CฬออออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Paramtres Û!BGBLACK!!CYAN!Ûþออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                      บ
echo [8Cบ                    !YELLOW!15!CYAN!  ^> !WHITE! !YouTubeDLPInfo!
echo [8Cบ                    !YELLOW!16!CYAN!  ^> !WHITE! !YouTubeDLDirectoryInfo!
echo [8Cบ                    !YELLOW!17!CYAN!  ^> !WHITE! !YouTubeDLGeoBypassInfo!
echo [8Cฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
if "!Language!"=="EN" (
echo [8Cบ    !BRIGHTMAGENTA!YouTube DL automatically download the best quality as available at the source.!CYAN!    บ
echo [8Cบ         !BRIGHTMAGENTA!We do not convert to 320 Kbps just for saying it's the best quality.!CYAN!         บ
)
if "!Language!"=="FR" (
echo [8Cบ !BRIGHTMAGENTA!YouTube DL tlcharge la meilleure qualit telle qu'elle est disponible … la source.!CYAN! บ
echo [8Cบ !BRIGHTMAGENTA!Nous ne convertissons pas … 320 Kbps juste pour dire que c'est la meilleure qualit.!CYAN! บ
)
echo [8Cฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
if "!Language!"=="EN" set t=Download location:
if "!Language!"=="FR" set t=Emplacement de tlchargement:
echo           !BRIGHTMAGENTA!!t!!WHITE! !YouTubeDLOutputDirectory!!CYAN!
echo [8Cศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!OPEN!BRIGHTBLACK!" / "!YELLOW!PRIORITY!BRIGHTBLACK!" / "!YELLOW!INSTALL!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 50
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
set x=
set /p "x=!t!URL: !YELLOW!"
%HIDECURSOR%
call :CHECK_URL x URL || goto :CONTINUEYOUTUBEDL
set a=--add-metadata !a! "!x!"
echo:
if not exist "Portable_Apps\YouTube-DL\ffmpeg.exe" call :CURL "Portable_Apps\YouTube-DL\ffmpeg.7z" "`git_raw_downloads`/ffmpeg.7z" || (call :ERROR_INTERNET & goto :CONTINUEYOUTUBEDL)
if "!youtube_dl!"=="youtube-dl" if not exist "Portable_Apps\YouTube-DL\youtube-dl.exe" call :CURL "Portable_Apps\YouTube-DL\youtube-dl.exe" "https://yt-dl.org/downloads/latest/youtube-dl.exe" || (call :ERROR_INTERNET & goto :CONTINUEYOUTUBEDL)
if "!youtube_dl!"=="yt-dlp" if not exist "Portable_Apps\YouTube-DL\yt-dlp.exe" call :CURL "Portable_Apps\YouTube-DL\yt-dlp.exe" "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_x86.exe" || (call :ERROR_INTERNET & goto :CONTINUEYOUTUBEDL)
pushd "Portable_Apps\YouTube-DL"
2>nul !youtube_dl!.exe -U | findstr /vic:"!youtube_dl! is up" /c:"Current Build Hash"
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
if "!Language!"=="FR" echo NOTE: Laisser vide remplacera l'emplacement de tlchargement originale.
echo:
if "!Language!"=="EN" set t=Enter new download location
if "!Language!"=="FR" set t=Entrer le nouvel emplacement de tlchargement
%SHOWCURSOR%
set x=
set /p "x=!BRIGHTBLACK!!t!: !YELLOW!"
%HIDECURSOR%
if defined x (
set "x=!x:"=!"
if "!x:~-1!"=="\" set "x=!x:~,-1!"
for %%A in ("!x!") do >nul reg add "!IS_REG!" /v "YouTubeDLOutputDirectory" /t REG_SZ /d "%%~fA" /f
) else >nul 2>&1 reg delete "!IS_REG!" /v "YouTubeDLOutputDirectory" /f
call :CHECK_YOUTUBEDLOUTPUTDIRECTORY
goto :CONTINUEYOUTUBEDL

:YOUTUBEDL_PRIORITY
call :PRIORITY_PROCESS YouTubeDLPriority
>nul reg add "!IS_REG!" /v "YouTubeDLPriority" /t REG_SZ /d !YouTubeDLPriority! /f && (
if "!Language!"=="EN" set t="YouTube DL priority has been replaced to: '!YouTubeDLPriority!'"
if "!Language!"=="FR" set t="La priorit de YouTube DL a bien t remplace par: '!YouTubeDLPriority!'"
call :MSGBOX 1 !t! 69696 "Illegal Services Checker"
)
call :CHECK_YOUTUBEDLPRIORITY
goto :CONTINUEYOUTUBEDL

:USEFULWEBSITES
call :SCALE 139 49
title !TITLE:`=Useful Websites!
call :ROSE "Useful Websites"

:CLEARUSEFULWEBSITES
call :CLEAR 1 63
set db=www.virustotal.com/gui/ www.hybrid-analysis.com/ metadefender.opswat.com/ antiscan.me/ virusscan.jotti.org/ urlscan.io/ www.security.org/how-secure-is-my-password/ breachalarm.com/ haveibeenpwned.com/ monitor.firefox.com/ cybernews.com/personal-data-leak-check/ leakedsource.ru/ dehashed.com/ leak-lookup.com/search webresolver.nl/tools/leaked_database weleakinfo.to/ protonvpn.com/ www.urban-vpn.com/ courvix.com/ www.freeopenvpn.org/ www.vpnbook.com/ freevpn.me/ www.proxyscan.io/ free-proxy-list.net/ proxy-daily.com/ smallseotools.com/free-proxy-list/ cloudssh.net/ sshdropbear.net/ protonmail.com/ www.startmail.com/ temp-mail.org/ dropmail.me/ yopmail.com/ generator.email/blog/gmail-generator temp-sms.org/ cyber-hub.pw/ webresolver.nl/ www.vedbex.com/tools/home wannabe1337.xyz/ mostwantedhf.info/ shadowcrypt.net/tools/ xresolver.com/ www.skypeipresolver.net/ fakepersongenerator.com/ www.fakeimess.com/generator/ fakeproof.xenot.pro/ www.vedbex.com/tools/fake_proof torrentfreak.com/ `nextwarez.com/ filepursuit.com/ www.aiosearch.com/ www.filechef.com/ leak.sx/combolist.php combo-list.com/ www.frecombo.com/search/label/Combo-List combolist.top/ sinister.ly/Forum-Combo-Lists mailaccess.top/forums/combolists.13/ t.me/s/dailycombolist github.com/gibbed/SteamAchievementManager onehack.us/ www.revshells.com/ www.torproject.org/

:CONTINUEUSEFULWEBSITES
call :SCALE 139 49
echo !CYAN!
echo [58Cอออออออออออออออออออออออ
echo [57C// !RED!Û!BGYELLOW!!BLACK! USEFUL WEBSITES !RED!Û!BGBLACK!!CYAN! \\
echo [8Cษอออออออออออออออออออออออออออออออออออออออออออออออ//อออออออออออออออออออออออ\\อออออออออออออออออออออออออออออออออออออออออออออป
echo [8CฬออออออออþÛ!BGYELLOW!!RED!Û Virus Scanners Û!BGBLACK!!CYAN!ÛþออออออออหอออออออออออออþÛ!BGYELLOW!!RED!Û Security Û!BGBLACK!!CYAN!ÛþอออออออออออออหออออออออออออþÛ!BGYELLOW!!RED!Û Leaks Û!BGBLACK!!CYAN!Ûþออออออออออออน
echo [8Cบ                                      บ                                          บ                                     บ
echo [8Cบ    !1!www.virustotal.com!CYAN!          บ    !7!www.security.org!CYAN!                บ   !12!leakedsource.ru!CYAN!            บ
echo [8Cบ    !2!www.hybrid-analysis.com!CYAN!     บ    !8!breachalarm.com!CYAN!                 บ   !13!dehashed.com!CYAN!               บ
echo [8Cบ    !3!metadefender.opswat.com!CYAN!     บ    !9!haveibeenpwned.com!CYAN!              บ   !14!leak-lookup.com!CYAN!            บ
echo [8Cบ    !4!antiscan.me!CYAN!                 บ   !10!monitor.firefox.com!CYAN!             บ   !15!webresolver.nl!CYAN!             บ
echo [8Cบ    !5!virusscan.jotti.org!CYAN!         บ   !11!cybernews.com!CYAN!                   บ   !16!weleakinfo.to!CYAN!              บ
echo [8Cบ    !6!urlscan.io!CYAN!                  บ                                          บ                                     บ
echo [8Cบ                                      บ                                          บ                                     บ
echo [8CฬอออออþÛ!BGYELLOW!!RED!Û Free VPNs and Proxys Û!BGBLACK!!CYAN!ÛþอออออฮออออออออออþÛ!BGYELLOW!!RED!Û Mails and SMS Û!BGBLACK!!CYAN!ÛþอออออออออออฮออออออออþÛ!BGYELLOW!!RED!Û Web Resolvers Û!BGBLACK!!CYAN!Ûþออออออออน
echo [8Cบ                                      บ                                          บ                                     บ
echo [8Cบ   !17!protonvpn.com!CYAN!               บ   !29!protonmail.com!CYAN!                  บ    !37!webresolver.nl!CYAN!            บ
echo [8Cบ   !18!www.urban-vpn.com!CYAN!           บ   !30!www.startmail.com!CYAN!               บ    !38!www.vedbex.com!CYAN!            บ
echo [8Cบ   !19!courvix.com!CYAN!                 บ   !31!temp-mail.org!CYAN!                   บ    !39!wannabe1337.xyz!CYAN!           บ
echo [8Cบ   !20!www.freeopenvpn.org!CYAN!         บ   !32!dropmail.me!CYAN!                     บ    !40!mostwantedhf.info!CYAN!         บ
echo [8Cบ   !21!www.vpnbook.com!CYAN!             บ   !33!yopmail.com!CYAN!                     บ    !41!shadowcrypt.net!CYAN!           บ
echo [8Cบ   !22!freevpn.me!CYAN!                  บ   !34!generator.email!CYAN!                 บ    !42!xresolver.com!CYAN!             บ
echo [8Cบ   !23!www.proxyscan.io!CYAN!            บ   !35!temp-sms.org!CYAN!                    บ    !43!www.skypeipresolver.net!CYAN!   บ
echo [8Cบ   !24!free-proxy-list.net!CYAN!         บ   !36!cyber-hub.pw!CYAN!                    บ                                     บ
echo [8Cบ   !25!proxy-daily.com!CYAN!             บ                                          บ                                     บ
echo [8Cบ   !26!smallseotools.com!CYAN!           บ                                          บ                                     บ
echo [8Cบ   !27!cloudssh.net!CYAN!                บ                                          บ                                     บ
echo [8Cบ   !28!sshdropbear.net!CYAN!             บ                                          บ                                     บ
echo [8Cบ                                      บ                                          บ                                     บ
echo [8CฬอออออออþÛ!BGYELLOW!!RED!Û Fake Generators Û!BGBLACK!!CYAN!ÛþออออออออฮออออออออออออþÛ!BGYELLOW!!RED!Û Warez News Û!BGBLACK!!CYAN!ÛþออออออออออออฮอออออออþÛ!BGYELLOW!!RED!Û File Searching Û!BGBLACK!!CYAN!Ûþออออออออน
echo [8Cบ                                      บ                                          บ                                     บ
echo [8Cบ   !44!fakepersongenerator.com!CYAN!     บ   !48!torrentfreak.com!CYAN!                บ    !51!www.aiosearch.com!CYAN!         บ
echo [8Cบ   !45!www.fakeimess.com!CYAN!           บ   !49!nextwarez.com !GREEN![FR]!CYAN!              บ    !52!www.filechef.com!CYAN!          บ
echo [8Cบ   !46!fakeproof.xenot.pro!CYAN!         บ   !50!filepursuit.com!CYAN!                 บ                                     บ
echo [8Cบ   !47!www.vedbex.com!CYAN!              บ                                          บ                                     บ
echo [8Cบ                                                                                 บ                                     บ
echo [8CฬอออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Combo Lists Û!BGBLACK!!CYAN!ÛþอออออออออออออออออออออออออออออออออฮอออออออออออþÛ!BGYELLOW!!RED!Û Others Û!BGBLACK!!CYAN!Ûþออออออออออออน
echo [8Cบ                                                                                 บ                                     บ
echo [8Cบ   !53!leak.sx!CYAN!                     ณ   !57!sinister.ly!CYAN!                     บ   !61!onehack.us!CYAN!                 บ
echo [8Cบ   !54!combo-list.com!CYAN!              ณ   !58!mailaccess.top!CYAN!                  บ   !62!www.revshells.com!CYAN!          บ
echo [8Cบ   !55!www.frecombo.com!CYAN!            ณ   !59!dailycombolist!CYAN!                  บ   !63!www.torproject.org!CYAN!         บ
echo [8Cบ   !56!combolist.top!CYAN!               ณ   !60!SteamAchievementManager!CYAN!         บ                                     บ
echo [8Cบ                                                                                 บ                                     บ
echo [8Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 20
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
call :CLEAR 1 17
set db=quez.in/ instant-stresser.com/ freestresser.to/ www.ipstresser.com/ ipstress.in/ royalstresser.com/ anonboot.com/ eor-n.to/ str3ssed.co/ wannabe1337.xyz/stresser vtoxicity.net/ str3sser.io/ databooter.to/ asylumstresser.to/ deltastress.com/ ddosforhire.net/

:CONTINUEDDOS
call :SCALE 82 31
echo !CYAN!
echo [23Cออออออออออออออออออออออออออออออออออออออ
echo [22C// !RED!Û!BGYELLOW!!BLACK! DENIAL OF SERVICES (100%% Free) !RED!Û!BGBLACK!!CYAN! \\
echo [8Cษออออออออออออออออออออออออออออออออหอออออออออออออออออออออออออออออออป
echo [8Cบ   !1!quez.in!CYAN!                บ  [BEST]   [  5/Gbps] [300/s]  บ
echo [8Cบ   !2!instant-stresser.com!CYAN!   บ  [BEST]   [  1/Gbps] [300/s]  บ
echo [8Cบ   !3!freestresser.to!CYAN!        บ           [  1/Gbps] [300/s]  บ
echo [8Cบ   !4!www.ipstresser.com!CYAN!     บ           [200/Mbps] [300/s]  บ
echo [8Cบ   !5!ipstress.in!CYAN!            บ           [  ?/Gbps] [250/s]  บ
echo [8Cบ   !6!royalstresser.com!CYAN!      บ           [  ?/Gbps] [200/s]  บ
echo [8Cบ   !7!anonboot.com!CYAN!           บ           [  ?/Gbps] [120/s]  บ
echo [8Cบ   !8!stresser.zone!CYAN!          บ           [  ?/Gbps] [120/s]  บ
echo [8Cบ   !9!eor-n.to!CYAN!               บ           [  ?/Gbps] [120/s]  บ
echo [8Cบ  !10!str3ssed.co!CYAN!            บ           [  1/Gbps] [120/s]  บ
echo [8Cบ  !11!wannabe1337.xyz!CYAN!        บ           [  ?/Gbps] [120/s]  บ
echo [8Cบ  !12!vtoxicity.net!CYAN!          บ           [100/Mbps] [120/s]  บ
echo [8Cบ  !13!str3sser.io!CYAN!            บ           [  1/Gbps] [ 60/s]  บ
echo [8Cบ  !14!databooter.to!CYAN!          บ           [  1/Gbps] [ 60/s]  บ
echo [8Cบ  !15!asylumstresser.to!CYAN!      บ           [  1/Gbps] [ 60/s]  บ
echo [8Cบ  !16!deltastress.com!CYAN!        บ           [  ?/Gbps] [ 30/s]  บ
echo [8Cฬออออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออน
if "!Language!"=="EN" (
echo [29C!BRIGHTMAGENTA!Last Updated: !WHITE!26/10/2021
echo [15C!BRIGHTMAGENTA!Alternatively you can visit: !17!ddosforhire.net
)
if "!Language!"=="FR" (
echo [28C!BRIGHTMAGENTA!Mise … jour le: !WHITE!26/10/2021
echo [11C!BRIGHTMAGENTA!Alternativement vous pouvez visiter: !17!ddosforhire.net
)
echo [8C!CYAN!ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 20
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
call :CLEAR 1 8
set db=check-host.net/ dnschecker.org/ www.iplocation.net/ www.ip-tracker.org/ whatismyipaddress.com/
if exist "!TMPF!\IS_Log.txt" del /f /q "!TMPF!\IS_Log.txt"

:CONTINUEIPLOOKUP
call :SCALE 73 27
title !TITLE:`=IP Address Lookup!
echo !CYAN!
echo [28Cอออออออออออออออออ
echo [27C// !RED!Û!BGYELLOW!!BLACK! IP LOOKUP !RED!Û!BGBLACK!!CYAN! \\
echo [17Cษอออออออออออออออออออออออออออออออออออออป
echo [17CฬอþÛ!BGYELLOW!!RED!Û  Illegal Services IP Lookup Û!BGBLACK!!CYAN!Ûþอน
echo [17Cบ                                     บ
if "!Language!"=="EN" echo [17Cบ    !YELLOW!1!CYAN!  ^> !WHITE! View your IP!CYAN!               บ
if "!Language!"=="FR" echo [17Cบ    !YELLOW!1!CYAN!  ^> !WHITE! Regarder mon IP!CYAN!            บ
if "!Language!"=="EN" echo [17Cบ    !YELLOW!2!CYAN!  ^> !WHITE! Lookup an other IP!CYAN!         บ
if "!Language!"=="FR" echo [17Cบ    !YELLOW!2!CYAN!  ^> !WHITE! Regarder une autre IP!CYAN!      บ
if "!Language!"=="EN" echo [17Cบ    !YELLOW!3!CYAN!  ^> !WHITE! Lookup an other URL!CYAN!        บ
if "!Language!"=="FR" echo [17Cบ    !YELLOW!3!CYAN!  ^> !WHITE! Regarder une autre URL!CYAN!     บ
echo [17Cบ                                     บ
if "!Language!"=="EN" echo [17CฬอออออþÛ!BGYELLOW!!RED!Û  IP Lookup websites Û!BGBLACK!!CYAN!Ûþอออออน
if "!Language!"=="FR" echo [17CฬอþÛ!BGYELLOW!!RED!Û  Sites Internet d'IP Lookup Û!BGBLACK!!CYAN!Ûþอน
echo [17Cบ                                     บ
echo [17Cบ    !4!check-host.net!CYAN!             บ
echo [17Cบ    !5!dnschecker.org!CYAN!             บ
echo [17Cบ    !6!www.iplocation.net!CYAN!         บ
echo [17Cบ    !7!www.ip-tracker.org!CYAN!         บ
echo [17Cบ                                     บ
if "!Language!"=="EN" echo [17CฬออþÛ!BGYELLOW!!RED!Û  IP Dynamic or Static ? Û!BGBLACK!!CYAN!Ûþออออน
if "!Language!"=="FR" echo [17CฬอþÛ!BGYELLOW!!RED!Û  IP Dynamique ou Satique ? Û!BGBLACK!!CYAN!Ûþออน
echo [17Cบ                                     บ
echo [17Cบ    !8!whatismyipaddress.com!CYAN!      บ
echo [17Cศอออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!READ!BRIGHTBLACK!" / "!YELLOW!DELETE!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 40
echo:
call :PROMPT
for %%A in (1 2 3) do if "%%A"=="!x!" call :CHECK_INTERNET && set "_el=!x!" || (call :ERROR_INTERNET & goto :CLEARIPLOOKUP)
if "!x!"=="1" goto :IPLOOKUP_RESPONSE
if "!x!"=="2" call :ENTER_LOOKUP IP && goto :IPLOOKUP_RESPONSE || goto :CLEARIPLOOKUP
if "!x!"=="3" call :ENTER_LOOKUP IP/URL && goto :IPLOOKUP_RESPONSE || goto :CLEARIPLOOKUP
call :WEBSITECHECK && goto :CONTINUEIPLOOKUP
call :CHOOSE back && goto :MAINMENU
call :CHOOSE read && (call :READ_IPLOOKUP & goto :CLEARIPLOOKUP)
call :CHOOSE delete && (call :DELETE_IPLOOKUP & goto :CLEARIPLOOKUP)
if not defined x for /l %%A in (!c1!,1,!c2!) do if "!%%A!"=="!YELLOW!%%A !CHECKED!" call :ENTER_LOOKUP IP/URL && goto :CLEARIPLOOKUP || goto :CONTINUEIPLOOKUP
call :ERRORMESSAGE
goto :CONTINUEIPLOOKUP

:IPLOOKUP_RESPONSE
cls
if "!x!"=="1" (
title !TITLE:`=Looking up ^> ...!
for /f %%A in ('curl.exe -fkLs "https://api.ipify.org"') do set x=%%A
)
>nul chcp 65001
for %%A in (1 2) do if "!_el!"=="%%A" (
title !TITLE:`=Looking up ^> %x%!
call :IP_DETECTOR
)
if "!_el!"=="3" call :URL_DETECTOR
call :PROXY_DETECTOR
call :VPN_DETECTOR
echo !CYAN!
type "!TMPF!\IS_Log.txt"
>nul chcp !CP!
echo !BRIGHTBLACK!
if "!Language!"=="EN" set t=Do you want to
if "!Language!"=="FR" set t=Voulez vous
call :DRAW_CENTER "!t! Save (!YELLOW!S!BRIGHTBLACK!) / Read (!YELLOW!R!BRIGHTBLACK!) / Delete (!YELLOW!D!BRIGHTBLACK!) / Back (!YELLOW!B!BRIGHTBLACK!) ?" 40

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
if not exist "!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt" (
2>nul md "!IS_OUTPUTDIRECTORY!"
echo =============================================>"!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt"
)
>nul chcp 1252
echo   Name: !ID!>>"!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt"
>nul chcp !CP!
echo =============================================>>"!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt"
type "!TMPF!\IS_Log.txt">>"!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt"
echo =============================================>>"!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt"
if "!errorlevel!"=="0" (
if "!Language!"=="EN" set t="IP Lookup successfully saved at: " "'!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt'" "Do you want to open it now ?"
if "!Language!"=="FR" set t="IP Lookup enregistr้s avec succ่s เ: " "'!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt'" "Voulez-vous l'ouvrir maintenant ?"
call :MSGBOXLEVEL 3 !t! 69668 "Illegal Services Checker"
if "!el!"=="6" start /max explorer.exe "!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt"
) else (
if "!Language!"=="EN" set t="An unexpected error has occurred."
if "!Language!"=="FR" set t="Une erreur inattendue est survenue."
call :MSGBOX 1 !t! 69648 "Illegal Services Checker"
)
goto :CLEARIPLOOKUP

:PORT
call :SCALE 101 33
title !TITLE:`=IP Port Scanning!
call :ROSE "IP Port Scanning"

:CLEARPORT
call :CLEAR 8 11
set db=www.adminsub.net/tcp-udp-port-finder www.speedguide.net/ports.php www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml portforward.com/ports.htm

:CONTINUEPORT
call :SCALE 101 33
echo !CYAN!
echo [37Cออออออออออออออออออออออออออออ
echo [36C// !RED!Û!BGYELLOW!!BLACK! IP TCP PORT SCANNING !RED!Û!BGBLACK!!CYAN! \\
echo [8Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
if "!Language!"=="EN" echo [8CฬออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Scan all Ports Û!BGBLACK!!CYAN!Ûþอออออออออออออออออออออออออออออออน
if "!Language!"=="FR" echo [8CฬออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Scan tous les ports Û!BGBLACK!!CYAN!Ûþออออออออออออออออออออออออออออน
echo [8Cบ                                                                                   บ
if "!Language!"=="EN" echo [8Cบ                       !YELLOW!1!CYAN!  ^> !WHITE! Python: Scan all 65535 ports.!CYAN!                         บ
if "!Language!"=="FR" echo [8Cบ                     !YELLOW!1!CYAN!  ^> !WHITE! Python: Scan tous les 65535 ports.!CYAN!                      บ
if "!Language!"=="EN" echo [8Cบ                       !YELLOW!2!CYAN!  ^> !WHITE! NMAP  : Scan all 65535 ports.!CYAN!                         บ
if "!Language!"=="FR" echo [8Cบ                     !YELLOW!2!CYAN!  ^> !WHITE! NMAP  : Scan tous les 65535 ports.!CYAN!                      บ
echo [8Cฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
if "!Language!"=="EN" echo [8CฬอออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Scan Most Used Ports Û!BGBLACK!!CYAN!Ûþออออออออออออออออออออออออออออน
if "!Language!"=="FR" echo [8CฬอออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Scan les ports les plus utiliss Û!BGBLACK!!CYAN!Ûþออออออออออออออออออออออน
echo [8Cบ                                                                                   บ
if "!Language!"=="EN" echo [8Cบ    !YELLOW!3!CYAN!  ^> !WHITE! NMAP: Scan only ports listeds in the file nmap-services.!CYAN!                 บ
if "!Language!"=="FR" echo [8Cบ    !YELLOW!3!CYAN!  ^> !WHITE! NMAP: Scan uniquement les ports lists dans le fichier nmap-services.!CYAN!    บ
if "!Language!"=="EN" echo [8Cบ    !YELLOW!4!CYAN!  ^> !WHITE! NMAP: Scan + than 1660 ports.!CYAN!                                            บ
if "!Language!"=="FR" echo [8Cบ    !YELLOW!4!CYAN!  ^> !WHITE! NMAP: Scan + de 1660 ports.!CYAN!                                              บ
if "!Language!"=="EN" echo [8Cบ    !YELLOW!5!CYAN!  ^> !WHITE! NMAP: Scan top most useds ports.!CYAN!                                         บ
if "!Language!"=="FR" echo [8Cบ    !YELLOW!5!CYAN!  ^> !WHITE! NMAP: Scan les principaux ports les plus utiliss.!CYAN!                       บ
if "!Language!"=="EN" echo [8Cบ    !YELLOW!6!CYAN!  ^> !WHITE! NMAP: Scan with version detection.!CYAN!                                       บ
if "!Language!"=="FR" echo [8Cบ    !YELLOW!6!CYAN!  ^> !WHITE! NMAP: Scan avec la dtection de version.!CYAN!                                 บ
echo [8Cฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
if "!Language!"=="EN" echo [8CฬออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Custom Port Range Scan Û!BGBLACK!!CYAN!Ûþอออออออออออออออออออออออออออน
if "!Language!"=="FR" echo [8CฬอออออออออออออออออþÛ!BGYELLOW!!RED!Û Scan personnalis de la plage des ports Û!BGBLACK!!CYAN!Ûþอออออออออออออออออออน
echo [8Cบ                                                                                   บ
if "!Language!"=="EN" echo [8Cบ                   !YELLOW!7!CYAN!  ^> !WHITE! NMAP: Scan your range of custom ports!CYAN!                     บ
if "!Language!"=="FR" echo [8Cบ               !YELLOW!7!CYAN!  ^> !WHITE! NMAP: Scan votre plage personnalis de ports.!CYAN!                 บ
echo [8Cฬอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
if "!Language!"=="EN" set t=Description
if "!Language!"=="FR" set t=Dscription
echo [8CฬอออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Portlist !t! Û!BGBLACK!!CYAN!Ûþออออออออออออออออออออออออออออน
echo [8Cบ                                                                                   บ
echo [8Cบ                             !8!www.adminsub.net!CYAN!                                บ
echo [8Cบ                             !9!www.speedguide.net!CYAN!                              บ
echo [8Cบ                            !10!www.iana.org!CYAN!                                    บ
echo [8Cบ                            !11!portforward.com!CYAN!                                 บ
echo [8Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo:
>nul 2>&1 sc query npcap || (
if "!Language!"=="EN" call :DRAW_CENTER "!RED!ERROR: !BRIGHTBLACK!To use NMAP, you must first choose: "!YELLOW!INSTALL!BRIGHTBLACK!"" 20
if "!Language!"=="FR" call :DRAW_CENTER "!RED!ERREUR: !BRIGHTBLACK!Pour utiliser NMAP, vous devez d'abord choisir: "!YELLOW!INSTALL!BRIGHTBLACK!"" 20
echo:
)
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!BRIGHTBLACK!!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!INSTALL!BRIGHTBLACK!" / "!YELLOW!PRIORITY!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 45
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
set /p "p1=!BRIGHTBLACK!!t!: !YELLOW!"
call :CHECK_PORT p1 || goto :CLEARPORT
if "!Language!"=="EN" set t=Enter end port
if "!Language!"=="FR" set t=Entrer le port de fin
set p2=
set /p "p2=!BRIGHTBLACK!!t!: !YELLOW!"
call :CHECK_PORT p2 || goto :CLEARPORT
set a=-p!p1!-!p2!
if "!Language!"=="EN" set o1=Scan your range of custom ports.
if "!Language!"=="FR" set o1=Scan votre plage personnalis de ports.
set o2=Unknow.
)
if "!Language!"=="EN" set "t=Enter "
if "!Language!"=="FR" set t=Entrer l'
%SHOWCURSOR%
set x=
set /p "x=!BRIGHTBLACK!!t!IP/URL: !YELLOW!"
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
call :CURL "!TMPF!\npcap-1.31.exe" "https://nmap.org/npcap/dist/npcap-1.55.exe" || (call :ERROR_INTERNET & goto :CONTINUEPORT)
call :START_DOWNLOADED_FILE npcap-1.31.exe
goto :CONTINUEPORT

:PORT_PRIORITY
call :PRIORITY_PROCESS PortPriority
>nul reg add "!IS_REG!" /v "PortPriority" /t REG_SZ /d !PortPriority! /f && (
if "!Language!"=="EN" set t="Port Scanning priority has been replaced to: '!PortPriority!'"
if "!Language!"=="FR" set t="La priorit du Port Scanning a bien t remplace par: '!PortPriority!'"
call :MSGBOX 1 !t! 69696 "Illegal Services Checker"
)
goto :CONTINUEPORT

:PINGERPORT
title !TITLE:`=IP Port Pinger!
call :ROSE "IP Port Pinger"
if "!Language!"=="EN" set "t=Enter "
if "!Language!"=="FR" set t=Entrer l'
%SHOWCURSOR%
set x=
set /p "x=!BRIGHTBLACK!!t!IP/URL: !YELLOW!"
%HIDECURSOR%
call :CHECK_URL x IP/URL || goto :MAINMENU
if "!Language!"=="EN" set t=Enter Port
if "!Language!"=="FR" set t=Entrer le Port
%SHOWCURSOR%
set p1=
set /p "p1=!BRIGHTBLACK!!t!: !YELLOW!"
%HIDECURSOR%
call :CHECK_PORT p1 || goto :MAINMENU
if not exist "Portable_Apps\paping.exe" call :CURL "Portable_Apps\paping.exe" "`git_raw_downloads`/paping.exe" || (call :ERROR_INTERNET & goto :MAINMENU)
pushd "Portable_Apps"
start paping.exe !x! -p !p1!
popd
goto :MAINMENU

:IPPINGER
title !TITLE:`=IP Pinger!
call :ROSE "IP Pinger"
if "!Language!"=="EN" set "t=Enter "
if "!Language!"=="FR" set t=Entrer l'
%SHOWCURSOR%
set x=
set /p "x=!BRIGHTBLACK!!t!IP/URL: !YELLOW!"
%HIDECURSOR%
call :CHECK_URL x IP/URL || goto :MAINMENU
start "" "%~f0" PINGER
goto :MAINMENU

:IPLOGGERS
call :SCALE 65 26
title !TITLE:`=IP Loggers!
if "!Language!"=="EN" set t="INFORMATION: Url Shortners are useful for hiding the original links of your suspect IPLogger." "This solution does not work with some services that will redirect your shortened links directly to the last linked url. Example FaceBook, Instagram, Twitter..."
if "!Language!"=="FR" set t="INFORMATION: Les URL Shortners sont utiles pour cacher les liens originaux de votre IPLogger suspect." "Cette solution ne fonctionne pas avec certains services qui redirigeront directement votre lien raccourci a la derniere URL liee. Exemple Facebook, Instagram, Twitter..."
call :MSGBOX 2 !t! 69680 "Illegal Services Checker"
call :ROSE "IP Loggers"
goto :CLEARIPLOGGERS

:CLEARIPLOGGERS
call :CLEAR 1 10
set db=iplogger.org/ grabify.link/ blasze.com/ webresolver.nl/tools/iplogger lstu.fr/ kutt.it/ www.shorturl.at/ shorturl.com/ tiny.cc/ bitly.com/

:CONTINUEIPLOGGERS
call :SCALE 65 26
echo !CYAN!
echo [22Cออออออออออออออออออ
echo [21C// !RED!Û!BGYELLOW!!BLACK! IP LOGGERS !RED!Û!BGBLACK!!CYAN! \\
echo [16Cษอออออออออออออออออออออออออออออป
echo [16Cบ                             บ
echo [16Cบ    !1!iplogger.org!CYAN!       บ
echo [16Cบ    !2!grabify.link!CYAN!       บ
echo [16Cบ    !3!blasze.com!CYAN!         บ
echo [16Cบ    !4!webresolver.nl!CYAN!     บ
echo [16Cฬอออออออออออออออออออออออออออออน
echo [16CฬออออþÛ!BGYELLOW!!RED!Û  Url Shortners Û!BGBLACK!!CYAN!Ûþอออน
echo [16Cบ                             บ
echo [16Cบ    !5!lstu.fr!CYAN!            บ
echo [16Cบ    !6!kutt.it!CYAN!            บ
echo [16Cบ    !7!www.shorturl.at!CYAN!    บ
echo [16Cบ    !8!shorturl.com!CYAN!       บ
echo [16Cบ    !9!tiny.cc!CYAN!            บ
echo [16Cบ   !10!bitly.com!CYAN!          บ
echo [16Cบ                             บ
echo [16Cศอออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 20
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
call :CLEAR 1 38
set db=pimeyes.com/ tineye.com/ yandex.com/images images.google.com/ www.bing.com/?scope=images image.baidu.com/ pic.sogou.com/ ascii2d.net/ trace.moe/ saucenao.com/ iqdb.org/ www.pic2map.com/ onlineexifviewer.com/ www.metadata2go.com/ searx.neocities.org/ www.etools.ch/ search.carrot2.org/ www.excite.co.jp/ www.infospace.com/ biznar.com/ metager.org/ www.entireweb.com/ www.delta-search.com/ www.startpage.com/do/advanced-search www.google.com/advanced_search www.google.com/advanced_image_search "Dox Tool v2" knowem.com/ checkusernames.com/ instantusername.com/#/ analyzeid.com/username/ namechk.com/ www.namecheckr.com/ usersearch.org/index.php www.toolsbug.com/youtube-video-tag-extractor.php online-free-tools.com/en/youtube_video_tags_extract_url ytubetool.com/ doxbin.org/

:CONTINUEDOXING
call :SCALE 104 53
echo !CYAN!
echo [45Cออออออออออออออ
echo [44C// !RED!Û!BGYELLOW!!BLACK! DOXING !RED!Û!BGBLACK!!CYAN! \\
echo [8Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [8CฬอออออþÛ!BGYELLOW!!RED!Û Image Search Û!BGBLACK!!CYAN!ÛþอออออออออออออออออหออออออออออþÛ!BGYELLOW!!RED!Û Image Research Û!BGBLACK!!CYAN!Ûþออออออออออน
echo [8Cบ                                          บ                                          บ
echo [8Cบ     !1!pimeyes.com!CYAN!                    บ    !12!www.pic2map.com!CYAN!                บ
echo [8Cบ     !2!tineye.com!CYAN!                     บ    !13!onlineexifviewer.com!CYAN!           บ
echo [8Cบ     !3!yandex.com!CYAN!                     บ    !14!www.metadata2go.com!CYAN!            บ
echo [8Cบ     !4!images.google.com!CYAN!              บ                                          บ
echo [8Cบ     !5!www.bing.com!CYAN!                   บ                                          บ
echo [8Cบ     !6!image.baidu.com!CYAN!                บ                                          บ
echo [8Cบ     !7!pic.sogou.com!CYAN!                  บ                                          บ
echo [8Cบ     !8!ascii2d.net!CYAN!                    บ                                          บ
echo [8Cบ     !9!trace.moe!CYAN!                      บ                                          บ
echo [8Cบ    !10!saucenao.com!CYAN!                   บ                                          บ
echo [8Cบ    !11!iqdb.org!CYAN!                       บ                                          บ
echo [8Cบ                                          บ                                          บ
echo [8CฬอออออออออþÛ!BGYELLOW!!RED!Û Metasearch Engine Û!BGBLACK!!CYAN!ÛอออออออออฮอออออออþÛ!BGYELLOW!!RED!Û Advanced Seach Engine Û!BGBLACK!!CYAN!Ûþออออออน
echo [8Cบ                                          บ                                          บ
echo [8Cบ    !15!searx.neocities.org!CYAN!            บ    !24!www.startpage.com!CYAN!              บ
echo [8Cบ    !16!www.etools.ch!CYAN!                  บ    !25!www.google.com/web!CYAN!             บ
echo [8Cบ    !17!search.carrot2.org!CYAN!             บ    !26!www.google.com/image!CYAN!           บ
echo [8Cบ    !18!www.excite.co.jp!CYAN!               บ                                          บ
echo [8Cบ    !19!www.infospace.com!CYAN!              บ                                          บ
echo [8Cบ    !20!biznar.com!CYAN!                     บ                                          บ
echo [8Cบ    !21!metager.org!CYAN!                    บ                                          บ
echo [8Cบ    !22!www.entireweb.com!CYAN!              บ                                          บ
echo [8Cบ    !23!www.delta-search.com!CYAN!           บ                                          บ
echo [8Cบ                                          บ                                          บ
echo [8CฬออออออออออþÛ!BGYELLOW!!RED!Û Username Search Û!BGBLACK!!CYAN!ÛออออออออออฮอออออþÛ!BGYELLOW!!RED!Û YouTube TAGS Extractors Û!BGBLACK!!CYAN!Ûþออออออน
echo [8Cบ                                          บ                                          บ
echo [8Cบ    !27!Dox Tool v2!CYAN!                    บ    !35!www.toolsbug.com!CYAN!               บ
echo [8Cบ    !28!knowem.com!CYAN!                     บ    !36!online-free-tools.com!CYAN!          บ
echo [8Cบ    !29!checkusernames.com!CYAN!             บ    !37!ytubetool.com!CYAN!                  บ
echo [8Cบ    !30!instantusername.com!CYAN!            บ                                          บ
echo [8Cบ    !31!analyzeid.com!CYAN!                  บ                                          บ
echo [8Cบ    !32!namechk.com!CYAN!                    บ                                          บ
echo [8Cบ    !33!www.namecheckr.com!CYAN!             บ                                          บ
echo [8Cบ    !34!usersearch.org!CYAN!                 บ                                          บ
echo [8Cบ                                          บ                                          บ
echo [8Cบ                                                                                     บ
echo [8CฬออออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Dox Logs Û!BGBLACK!!CYAN!Ûþอออออออออออออออออออออออออออออออออออน
echo [8Cบ                                                                                     บ
echo [8Cบ                                !38!doxbin.org!CYAN!                                    บ
echo [8Cบ                                                                                     บ
echo [8Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 20
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
call :CLEAR 1 56
set db="Winaero Tweaker" "Ultimate Windows Tweaker" SophiApp "Sophia Script" "TCP Optimizer" "DNS Jumper" Autoruns SpeedyFox "CCleaner + CCEnhancer" BleachBit Dism++ "Glary Utilities" "Revo Uninstaller" "Windows Repair AIO" "Windows Repair Toolbox" FixWin "Patch My PC" "UCheck" "Windows Update MiniTool" "WSUS Offline Update" DriversCloud "Snappy Driver Installer" "Driver Store Explorer" "Device Cleanup Tool" "Display Driver Uninstaller" "Radeon Software Slimmer" NVSlimmer NVCleanstall "MSI Util v3" CPU-Z "OOSU10 (Win 10)" "Ashampoo AntiSpy (Win 10)" "DoNotSpy 10" "Windows Privacy Dashboard" "Windows 10 Privacy" "Windows Spy Blocker" "Destroy Windows 10 Spying" Blackbird "ADW Cleaner" "ZHP Cleaner" "Rogue Killer" "No Bot" "Kaspersky KVRT" "Kaspersky TDSSKiller" "Microsoft Safety Scanner" "Spybot - Search and Destroy" "Batch Antivirus" Everything "Process Hacker" CrystalDiskInfo "Defender Control" "Edge Blocker" "Mem Reduct" GiveMePower RegScanner ISLC
if exist "!TMPF!\IS_Log.txt" del /f /q "!TMPF!\IS_Log.txt"

:CONTINUEPORTABLEAPPS
call :SCALE 138 47
echo !CYAN!
echo [59Cอออออออออออออออออออออ
echo [58C// !RED!Û!BGYELLOW!!BLACK! PORTABLE APPS !RED!Û!BGBLACK!!CYAN! \\
echo [8Cษออออออออออออออออออออออออออออออออออออออออออออออออ//อออออออออออออออออออออ\\อออออออออออออออออออออออออออออออออออออออออออออออป
echo [8CฬออออออออออออþÛ!BGYELLOW!!RED!Û Tweakers Û!BGBLACK!!CYAN!ÛþออออออออออออหออออออออออออþÛ!BGYELLOW!!RED!Û Cleaners Û!BGBLACK!!CYAN!ÛþอออออออออออออหอออออออþÛ!BGYELLOW!!RED!Û Windows Repairs Û!BGBLACK!!CYAN!Ûþอออออออน
echo [8Cบ                                        บ                                         บ                                     บ
echo [8Cบ    !1!Winaero Tweaker!CYAN!               บ    !9!CCleaner + CCEnhancer!CYAN!          บ   !14!Windows Repair AIO!CYAN!         บ
echo [8Cบ    !2!Ultimate Windows Tweaker!CYAN!      บ   !10!BleachBit!CYAN!                      บ   !15!Windows Repair Toolbox!CYAN!     บ
echo [8Cบ    !3!SophiApp!CYAN!                      บ   !11!Dism++!CYAN!                         บ   !16!FixWin!CYAN!                     บ
echo [8Cบ    !4!Sophia Script!CYAN!                 บ   !12!Glary Utilities!CYAN!                บ                                     บ
echo [8Cบ    !5!TCP Optimizer!CYAN!                 บ   !13!Revo Uninstaller!CYAN!               บ                                     บ
echo [8Cบ    !6!DNS Jumper!CYAN!                    บ                                         บ                                     บ
echo [8Cบ    !7!SpeedyFox!CYAN!                     บ                                         บ                                     บ
echo [8Cบ    !8!Autoruns!CYAN!                      บ                                         บ                                     บ
echo [8Cบ                                        บ                                         บ                                     บ
echo [8CฬอออออออþÛ!BGYELLOW!!RED!Û Updaters + Drivers Û!BGBLACK!!CYAN!ÛþอออออออฮอออออออออออออþÛ!BGYELLOW!!RED!Û Drivers Û!BGBLACK!!CYAN!ÛþอออออออออออออฮอออออออออออþÛ!BGYELLOW!!RED!Û Others Û!BGBLACK!!CYAN!Ûþออออออออออออน
echo [8Cบ                                        บ                                         บ                                     บ
echo [8Cบ   !17!Patch My PC!CYAN!                   บ   !23!Driver Store Explorer!CYAN!          บ   !48!Everything!CYAN!                 บ
echo [8Cบ   !18!UCheck!CYAN!                        บ   !24!Device Cleanup Tool!CYAN!            บ   !49!Process Hacker!CYAN!             บ
echo [8Cบ   !19!Windows Update MiniTool!CYAN!       บ   !25!Display Driver Uninstaller!CYAN!     บ   !50!CrystalDiskInfo!CYAN!            บ
echo [8Cบ   !20!WSUS Offline Update!CYAN!           บ   !26!Radeon Software Slimmer!CYAN!        บ   !51!Defender Control!CYAN!           บ
echo [8Cบ   !21!DriversCloud!CYAN!                  บ   !27!NVSlimmer!CYAN!                      บ   !52!Edge Blocker!CYAN!               บ
echo [8Cบ   !22!Snappy Driver Installer!CYAN!       บ   !28!NVCleanstall!CYAN!                   บ   !53!Mem Reduct!CYAN!                 บ
echo [8Cบ                                        บ   !29!MSI Util v3!CYAN!                    บ   !54!GiveMePower!CYAN!                บ
echo [8Cบ                                        บ   !30!CPU-Z!CYAN!                          บ   !55!RegScanner!CYAN!                 บ
echo [8Cบ                                        บ                                         บ   !56!ISLC!CYAN!                       บ
echo [8CฬอออþÛ!BGYELLOW!!RED!Û Windows Privacy/Telemetry Û!BGBLACK!!CYAN!ÛþออออฮออออþÛ!BGYELLOW!!RED!Û Anti Viruses and Malwares Û!BGBLACK!!CYAN!Ûþออออน                                     บ
echo [8Cบ                                        บ                                         บ                                     บ
echo [8Cบ   !31!OOSU10 (Win 10)!CYAN!               บ   !39!ADW Cleaner!CYAN!                    บ                                     บ
echo [8Cบ   !32!Ashampoo AntiSpy (Win 10)!CYAN!     บ   !40!ZHP Cleaner!CYAN!                    บ                                     บ
echo [8Cบ   !33!DoNotSpy 10!CYAN!                   บ   !41!Rogue Killer!CYAN!                   บ                                     บ
echo [8Cบ   !34!Windows Privacy Dashboard!CYAN!     บ   !42!No Bot!CYAN!                         บ                                     บ
echo [8Cบ   !35!Windows 10 Privacy!CYAN!            บ   !43!Kaspersky KVRT!CYAN!                 บ                                     บ
echo [8Cบ   !36!Windows Spy Blocker!CYAN!           บ   !44!Kaspersky TDSSKiller!CYAN!           บ                                     บ
echo [8Cบ   !37!Destroy Windows 10 Spying!CYAN!     บ   !45!Microsoft Safety Scanner!CYAN!       บ                                     บ
echo [8Cบ   !38!BLACKbird!CYAN!                     บ   !46!Spybot - Search and Destroy!CYAN!    บ                                     บ
echo [8Cบ                                        บ   !47!Batch Antivirus!CYAN!                บ                                     บ
echo [8Cบ                                        บ                                         บ                                     บ
echo [8Cฬออออออออออออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออออออออน
echo [8Cบ                                             !YELLOW!57!CYAN!  ^>  !WHITE!Windows and Office Cracks!CYAN!                                           บ
echo [8Cศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!OPEN!BRIGHTBLACK!" / "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 30
echo:
call :PROMPT
for /l %%A in (!c1!,1,!c2!) do if "!x!"=="%%A" call :CHECK_INTERNET || (call :ERROR_INTERNET & goto :CONTINUEPORTABLEAPPS)
if "!x!"=="57" goto :WINDOWSANDOFFICE
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
if not "!WINDOWS_VERSION:~,2!"=="10" if not "!WINDOWS_VERSION:~,1!"=="6" call :MSGBOX 2 "Your Windows version is not supported." "Found more informations at: https://www.thewindowsclub.com/ultimate-windows-tweaker-4-windows-10" 69648 "Illegal Services Checker"
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
call :CURL "Portable_Apps\CCleaner.zip" "https://download.ccleaner.com/portable/ccsetup585.zip"
call :CURL "Portable_Apps\CCEnhancer Multilingual.zip" "https://singularlabs.com/download/10320/"
)
if "!10!"=="!YELLOW!10 !CHECKED!" call :CURL "Portable_Apps\BleachBit.zip" "https://download.bleachbit.org/BleachBit-4.2.0-portable.zip"
if "!11!"=="!YELLOW!11 !CHECKED!" call :CURL "Portable_Apps\Dism++.zip" "https://github.com/Chuyu-Team/Dism-Multi-language/releases/download/v10.1.1002.1/Dism++10.1.1002.1.zip"
if "!12!"=="!YELLOW!12 !CHECKED!" (
if "!Language!"=="EN" set t="Do you want to crack Glary Utilities ?"
if "!Language!"=="FR" set t="Voulez vous crack Glary Utilities ?"
call :MSGBOXLEVEL 1 !t! 69668 "Illegal Services Checker"
if "!el!"=="6" (
<nul set /p="3788-6167-9582-6222-6668" | clip
if "!Language!"=="EN" set t="License key copied to your Windows clipboard." "Paste and register it in Glary Utilities with the username of your choice." "License key: 3788-6167-9582-6222-6668"
if "!Language!"=="FR" set t="Cl de license copis dans votre presse-papiers Windows." "Collez et enregistrez-la dans Glary Utilities avec le nom d'utilisateur de votre choix." "Cl de license: 3788-6167-9582-6222-6668"
call :MSGBOX 3 !t! 69696 "Illegal Services Checker"
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
if not "!WINDOWS_VERSION:~,2!"=="10" if not "!WINDOWS_VERSION:~,1!"=="6" call :MSGBOX 2 "Your Windows version is not supported." "Found more informations at: https://www.thewindowsclub.com/fixwin-for-windows-10" 69648 "Illegal Services Checker"
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
if "!30!"=="!YELLOW!30 !CHECKED!" call :CURL "Portable_Apps\CPU-Z.zip" "https://download.cpuid.com/cpu-z/cpu-z_1.97-en.zip"
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
if "!49!"=="!YELLOW!49 !CHECKED!" call :CURL "Portable_Apps\Process Hacker.zip" "https://github.com/ProcessHackerRepoTool/nightly-builds-mirror/releases/download/v3.0.4365/processhacker-build-bin.zip"
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
echo !RED!
type "!TMPF!\IS_Log.txt"
del /f /q "!TMPF!\IS_Log.txt"
echo !YELLOW!
pause
)
if defined Start_Folder start /max explorer.exe "Portable_Apps"
goto :CLEARPORTABLEAPPS

:WINDOWSANDOFFICE
call :SCALE 99 34
title !TITLE:`=Windows and Office Cracks!
call :ROSE "Windows and Office Cracks"

:CLEARWINDOWSANDOFFICE
call :CLEAR 1 20
set db=free.appnee.com/consoleact/ free.appnee.com/aact/ free.appnee.com/ra1n-act1vat0r/ free.appnee.com/re-loader-activator/ free.appnee.com/windows-loader/ free.appnee.com/hwid-gen/ free.appnee.com/w10-digital-license-c-sharp/ free.appnee.com/kmsauto-lite/ free.appnee.com/kmsauto-net/ free.appnee.com/kmsoffline/ free.appnee.com/kmsonline/ github.com/massgravel/Microsoft-Activation-Scripts free.appnee.com/kmsauto-helper/ `www.solidfiles.com/v/QnQeqgqKa3jev `www.solidfiles.com/v/kXqVBML2mmBDA free.appnee.com/msact/ "Windows ISO Downloader" the-eye.eu/public/MSDN/Windows%%207/ tb.rg-adguard.net/public.php free.appnee.com/office-2013-2021-c2r-install/

:CONTINUEWINDOWSANDOFFICE
call :SCALE 99 34
echo !CYAN!
echo [35Cอออออออออออออออออออออออออออออออออ
echo [34C// !RED!Û!BGYELLOW!!BLACK! Windows and Office Cracks !RED!Û!BGBLACK!!CYAN! \\
echo [6Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [6CฬออออออออออออþÛ!BGYELLOW!!RED!Û Activators Û!BGBLACK!!CYAN!ÛþออออออออออออหออออออออออออออþÛ!BGYELLOW!!RED!Û Tools Û!BGBLACK!!CYAN!Ûþอออออออออออออออน
echo [6Cบ                                          บ                                          บ
echo [6Cบ    !1!ConsoleAct!CYAN!                      บ   !13!KMSAuto Helper!CYAN!                  บ
echo [6Cบ    !2!AAct!CYAN!                            บ   !14!KMSCleaner!CYAN!                      บ
echo [6Cบ    !3!Ra1n Act1vat0r!CYAN!                  บ   !15!WAT Fix!CYAN!                         บ
echo [6Cบ    !4!Re-Loader Activator!CYAN!             บ   !16!MSAct!CYAN!                           บ
echo [6Cบ    !5!Windows Loader!CYAN!                  บ                                          บ
echo [6Cบ    !6!HWID GEN MkVI!CYAN!                   บ                                          บ
echo [6Cบ    !7!W10 Digital License!CYAN!             บ                                          บ
echo [6Cบ    !8!KMSAuto Lite!CYAN!                    บ                                          บ
echo [6Cบ    !9!KMSAuto Net!CYAN!                     บ                                          บ
echo [6Cบ   !10!KMSoffline!CYAN!                      บ                                          บ
echo [6Cบ   !11!KMSonline!CYAN!                       บ                                          บ
echo [6Cบ   !12!Microsoft Activation Scripts!CYAN!    บ                                          บ
echo [6Cบ                                          บ                                          บ
echo [6Cฬออออออออออออออออออออออออออออออออออออออออออสออออออออออออออออออออออออออออออออออออออออออน
echo [6CฬอออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û ISO Downloaders Û!BGBLACK!!CYAN!Ûþอออออออออออออออออออออออออออออออน
echo [6Cบ                                                                                     บ
echo [6Cบ                          !17!Windows ISO Downloader!CYAN!                              บ
echo [6Cบ                          !18!the-eye.eu!CYAN!                                          บ
echo [6Cบ                          !19!rg-adguard.net!CYAN!                                      บ
echo [6Cบ                          !20!Office 2013-2019 C2R Install!CYAN!                        บ
echo [6Cบ                                                                                     บ
echo [6Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!OPEN!BRIGHTBLACK!" / "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 30
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
echo [20Cอออออออออออออออออออออ
echo [19C// !RED!Û!BGYELLOW!!BLACK! MORE FEATURES !RED!Û!BGBLACK!!CYAN! \\
echo [11Cษอออออออออออออออออออออออออออออออออออออป
echo [11Cบ                                     บ
echo [11Cบ    !YELLOW!1 !WHITE!Warez Content Creator!CYAN!          บ
echo [11Cบ    !YELLOW!2 !WHITE!Warez Wikis!CYAN!                    บ
echo [11Cบ    !YELLOW!3 !WHITE!Release Logs!CYAN!                   บ
echo [11Cบ    !YELLOW!4 !WHITE!Ebooks!CYAN!                         บ
echo [11Cบ    !YELLOW!5 !WHITE!Musics!CYAN!                         บ
echo [11Cบ    !YELLOW!6 !WHITE!Forum Websites!CYAN!                 บ
echo [11Cบ    !YELLOW!7 !WHITE!Windows Repair!CYAN!                 บ
echo [11Cบ    !YELLOW!8 !WHITE!Windows Tweaks!CYAN!                 บ
echo [11Cบ    !YELLOW!9 !WHITE!Windows Game Booster!CYAN!           บ
echo [11Cบ   !YELLOW!10 !WHITE!Spoofing!CYAN!                       บ
echo [11Cบ                                     บ
echo [11Cศอออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!OPEN!BRIGHTBLACK!" / "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 30
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
call :CLEAR 1 9
set db="Mkv Tool Nix" FFmpeg LosslessCut HandBrake "Subtitle !DEBUG!Editor" CCExtractor "VLC Media Player" MediaInfo "Open Broadcaster Software"

:CONTINUEWAREZCONTENTCREATOR
call :SCALE 69 22
echo !CYAN!
echo [20Cอออออออออออออออออออออออออออออ
echo [19C// !RED!Û!BGYELLOW!!BLACK! WAREZ CONTENT CREATOR !RED!Û!BGBLACK!!CYAN! \\
echo [5Cษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [5Cบ                                                         บ
echo [5Cบ    !1!Mkv Tool Nix !GREEN!(.mkv Video Editing)!CYAN!              บ
echo [5Cบ    !2!FFmpeg !GREEN!(Video/Audio Editing)!CYAN!                   บ
echo [5Cบ    !3!LosslessCut !GREEN!(Video/Audio Editing)!CYAN!              บ
echo [5Cบ    !4!HandBrake !GREEN!(Video Transcoder)!CYAN!                   บ
echo [5Cบ    !5!Subtitle !DEBUG!Editor !GREEN!(Subtitle !DEBUG!Editor)!CYAN!              บ
echo [5Cบ    !6!CCExtractor !GREEN!(Subtitle !DEBUG!Extractor)!CYAN!               บ
echo [5Cบ    !7!VLC Media Player !GREEN!(Multimedia Player)!CYAN!           บ
echo [5Cบ    !8!MediaInfo !GREEN!(Digital Media Analysis)!CYAN!             บ
echo [5Cบ    !9!Open Broadcaster Software !GREEN!(Screen Recorder)!CYAN!    บ
echo [5Cบ                                                         บ
echo [5Cศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 20
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
call :CLEAR 1 21
set db=weboas.is/ dirtywarez.org/ link-base.org/warez p2pfr.com/ www.mega-p2p.net/ lewebde.com/ `machicoulis.over-blog.com/2019/11/les-bons-liens-pour-telecharger.html www.reddit.com/r/Piracy/wiki/megathread www.reddit.com/r/FREEMEDIAHECKYEAH/wiki/index rentry.org/SoftwarePirates-Megathread rentry.org/pgames-mega-thread github.com/Igglybuff/awesome-piracy/blob/master/readme.md github.com/nbats/FMHY/blob/main/fmhy.md github.com/Rekulous/FMHY/blob/main/fmhy.md github.com/Rekulous/The-Piratez-List/blob/main/The%%20Safe%%20Shores/Software.md github.com/taskylizard/piratedgames-megathread/blob/main/README.md github.com/Rekulous/PiratedGames/blob/main/README.md darknetlive.com/onions/ dark.fail/ ddosforhire.net/ piracy.moe/

:CONTINUEWAREZWIKIS
call :SCALE 76 34
echo !CYAN!
echo [28Cอออออออออออออออออออ
echo [27C// !RED!Û!BGYELLOW!!BLACK! WAREZ WIKIS !RED!Û!BGBLACK!!CYAN! \\
echo [6Cษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [6Cบ                                                              บ
echo [6Cบ    !1!weboas.is!CYAN!                                           บ
echo [6Cบ    !2!dirtywarez.org!CYAN!                                      บ
echo [6Cบ    !3!link-base.org!CYAN!                                       บ
echo [6Cบ    !4!p2pfr.com !GREEN![FR]!CYAN!                                      บ
echo [6Cบ    !5!www.mega-p2p.net !GREEN![FR]!CYAN!                               บ
echo [6Cบ    !6!lewebde.com !GREEN![FR]!CYAN!                                    บ
echo [6Cบ    !7!machicoulis.over-blog.com !GREEN![FR]!CYAN!                      บ
echo [6Cบ    !8!r/Piracy!CYAN!                                            บ
echo [6Cบ    !9!r/FREEMEDIAHECKYEAH!CYAN!                                 บ
echo [6Cบ   !10!r/SoftwarePirates!CYAN!                                   บ
echo [6Cบ   !11!r/pgames-mega-thread!CYAN!                                บ
echo [6Cบ   !12!Igglybuff/awesome-piracy!CYAN!                            บ
echo [6Cบ   !13!nbats/FMHY!CYAN!                                          บ
echo [6Cบ   !14!Rekulous/FMHY!CYAN!                                       บ
echo [6Cบ   !15!taskylizard/piratedgames-megathread !GREEN!(videogames)!CYAN!    บ
echo [6Cบ   !16!Rekulous/Pirated-Games !GREEN!(videogames)!CYAN!                 บ
echo [6Cบ   !17!Rekulous/The-Piratez-list !GREEN!(softwares)!CYAN!               บ
echo [6Cบ   !18!darknetlive.com !GREEN!(darknet)!CYAN!                           บ
echo [6Cบ   !19!dark.fail !GREEN!(darknet)!CYAN!                                 บ
echo [6Cบ   !20!ddosforhire.net !GREEN!(DDoS)!CYAN!                              บ
echo [6Cบ   !21!piracy.moe !GREEN!(animes)!CYAN!                                 บ
echo [6Cบ                                                              บ
echo [6Cศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 20
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
call :CLEAR 1 10
set db=predb.ovh/ predb.me/ corrupt-net.org/ m2v.ru/ www.xrel.to/ forum.squawkr.io/ upawg.ca/ nzbindex.com/ binsearch.info/ www.reddit.com/r/CrackWatch/

:CONTINUERELEASELOGS
call :SCALE 66 23
echo !CYAN!
echo [22Cออออออออออออออออออออ
echo [21C// !RED!Û!BGYELLOW!!BLACK! Release Logs !RED!Û!BGBLACK!!CYAN! \\
echo [12Cษอออออออออออออออออออออออออออออออออออออออป
echo [12Cบ                                       บ
echo [12Cบ    !1!predb.ovh!CYAN!                    บ
echo [12Cบ    !2!predb.me!CYAN!                     บ
echo [12Cบ    !3!corrupt-net.org!CYAN!              บ
echo [12Cบ    !4!m2v.ru!CYAN!                       บ
echo [12Cบ    !5!www.xrel.to !GREEN![DE]!CYAN!    บ
echo [12Cบ    !6!forum.squawkr.io !GREEN!(movies)!CYAN!    บ
echo [12Cบ    !7!upawg.ca !GREEN!(audio)!CYAN!             บ
echo [12Cบ    !8!nzbindex.com !GREEN!(NZB)!CYAN!           บ
echo [12Cบ    !9!binsearch.info !GREEN!(NZB)!CYAN!         บ
echo [12Cบ   !10!r/CrackWatch !GREEN!(videogames)!CYAN!    บ
echo [12Cบ                                       บ
echo [12Cศอออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" / !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 30
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUERELEASELOGS
call :CHOOSE back && goto :MOREFEATURES
call :CHOOSE search && (call :IS_SEARCH 25be77c4b1e53f006 & goto :CONTINUERELEASELOGS)
call :WEBSITESTART && goto :CLEARRELEASELOGS
call :ERRORMESSAGE
goto :CONTINUERELEASELOGS

:EBOOKS
call :SCALE 100 59
title !TITLE:`=Ebooks!
call :ROSE Ebooks

:CLEAREBOOKS
call :CLEAR 1 76
set db=z-lib.org/ www.pdfdrive.com/ english-bookys.com/ `bookddl.com/ zone-ebook.com/ ww2.bookys-ebooks.com/ `ebook-planete.org/ planete-bd.org/ dbfree.me/ pdf.1001ebooks.com/ www.pdf-ebookys.com/ downmagaz.net/ magazinelib.com/ telecharge-magazines.com/ fr.downmagaz.net/ mangaowl.net/ mangareader.to/ www.mangago.me/ mangadex.org/ manganato.com/ mangaplus.shueisha.co.jp/updates fascans.com/ mangakatana.com/ manga4life.com/ bato.to/ mangapark.net/ www.mangahere.cc/ fanfox.net/ wuxiaworld.site/ hatigarmscanz.net/ leviatanscans.com/cd/ the-nonames.com/home lynxscans.com/home skscans.com/ zeroscans.com/home reader.deathtollscans.net/ reader.kireicake.com/ sensescans.com/ manhuaplus.com/ readm.org/ mangasee123.com/ www.asurascans.com/ naniscans.com/ merakiscans.com/ mangajar.com/ toonily.net/ www.nonstopscans.com/ guya.moe/ mangahub.io/ comick.fun/ www.japanread.cc/ catmanga.org/ mangasushi.net/ arangscans.com/ hunlight-scans.info/home tritinia.com/ readmanhua.net/manga/ flamescans.org/ immortalupdates.com/ manga347.com/ www.bilibilicomics.com/ www.mangatown.com/ www.mangahome.com/ manga47.net/ comix.top/ www.readlightnovel.me/ reaperscans.com/ reaperscans.fr/ scantrad.net/ kangaryu-team.fr/ www.japscan.ws/ www.scan-fr.cc/ lelscan-vf.co/ mangas.heoo.workers.dev/0:/ lectortmo.com/ github.com/MALSync/MALSync/blob/master/pages.md

:CONTINUEEBOOKS
call :SCALE 100 59
echo !CYAN!
echo [43Cออออออออออออออ
echo [42C// !RED!Û!BGYELLOW!!BLACK! Ebooks !RED!Û!BGBLACK!!CYAN! \\
echo [7Cษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [7Cบ                                                                                    บ
echo [7Cบ    !1!z-lib.org!CYAN!                      ณ   !7!ebook-planete.org !GREEN![FR]!CYAN!           บ
echo [7Cบ    !2!www.pdfdrive.com!CYAN!               ณ   !8!planete-bd.org !GREEN![FR]!CYAN!              บ
echo [7Cบ    !3!english-bookys.com!CYAN!             ณ   !9!dbfree.me !GREEN![FR]!CYAN!                   บ
echo [7Cบ    !4!bookddl.com !GREEN![FR]!CYAN!               ณ  !10!pdf.1001ebooks.com !GREEN![FR]!CYAN!          บ
echo [7Cบ    !5!zone-ebook.com !GREEN![FR]!CYAN!            ณ  !11!www.pdf-ebookys.com !GREEN![FR]!CYAN!         บ
echo [7Cบ    !6!ww2.bookys-ebooks.com !GREEN![FR]!CYAN!     ณ                                          บ
echo [7Cบ                                                                                    บ
echo [7CฬอออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û MAGAZINES Û!BGBLACK!!CYAN!Ûþออออออออออออออออออออออออออออออออออน
echo [7Cบ                                                                                    บ
echo [7Cบ   !12!downmagaz.net!CYAN!                  ณ   !14!telecharge-magazines.com !GREEN![FR]!CYAN!   บ
echo [7Cบ   !13!magazinelib.com!CYAN!                ณ   !15!fr.downmagaz.net !GREEN![FR]!CYAN!           บ
echo [7Cบ                                                                                    บ
echo [7CฬอออออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û MANGAS Û!BGBLACK!!CYAN!Ûþอออออออออออออออออออออออออออออออออออน
echo [7Cบ                                                                                    บ
echo [7Cบ   !16!mangaowl.net!CYAN!                   ณ   !46!toonily.net!CYAN!                     บ
echo [7Cบ   !17!mangareader.to!CYAN!                 ณ   !47!www.nonstopscans.com!CYAN!            บ
echo [7Cบ   !18!www.mangago.me!CYAN!                 ณ   !48!guya.moe!CYAN!                        บ
echo [7Cบ   !19!mangadex.org!CYAN!                   ณ   !49!mangahub.io!CYAN!                     บ
echo [7Cบ   !20!manganato.com!CYAN!                  ณ   !50!comick.fun!CYAN!                      บ
echo [7Cบ   !21!mangaplus.shueisha.co.jp!CYAN!       ณ   !51!www.japanread.cc!CYAN!                บ
echo [7Cบ   !22!fascans.com!CYAN!                    ณ   !52!catmanga.org!CYAN!                    บ
echo [7Cบ   !23!mangakatana.com!CYAN!                ณ   !53!mangasushi.net!CYAN!                  บ
echo [7Cบ   !24!manga4life.com!CYAN!                 ณ   !54!arangscans.com!CYAN!                  บ
echo [7Cบ   !25!bato.to!CYAN!                        ณ   !55!hunlight-scans.info!CYAN!             บ
echo [7Cบ   !26!mangapark.net!CYAN!                  ณ   !56!tritinia.com!CYAN!                    บ
echo [7Cบ   !27!www.mangahere.cc!CYAN!               ณ   !57!readmanhua.net!CYAN!                  บ
echo [7Cบ   !28!fanfox.net!CYAN!                     ณ   !58!flamescans.org!CYAN!                  บ
echo [7Cบ   !29!wuxiaworld.site!CYAN!                ณ   !59!immortalupdates.com!CYAN!             บ
echo [7Cบ   !30!hatigarmscanz.net!CYAN!              ณ   !60!manga347.com!CYAN!                    บ
echo [7Cบ   !31!leviatanscans.com!CYAN!              ณ   !61!www.bilibilicomics.com!CYAN!          บ
echo [7Cบ   !32!the-nonames.com!CYAN!                ณ   !62!www.mangatown.com!CYAN!               บ
echo [7Cบ   !33!lynxscans.com!CYAN!                  ณ   !63!www.mangahome.com!CYAN!               บ
echo [7Cบ   !34!skscans.com!CYAN!                    ณ   !64!manga47.net!CYAN!                     บ
echo [7Cบ   !35!zeroscans.com!CYAN!                  ณ   !65!comix.top!CYAN!                       บ
echo [7Cบ   !36!reader.deathtollscans.net!CYAN!      ณ   !66!www.readlightnovel.me!CYAN!           บ
echo [7Cบ   !37!reader.kireicake.com!CYAN!           ณ   !67!reaperscans.com!CYAN!                 บ
echo [7Cบ   !38!sensescans.com!CYAN!                 ณ   !68!reaperscans.fr !GREEN![FR]!CYAN!             บ
echo [7Cบ   !39!manhuaplus.com!CYAN!                 ณ   !69!scantrad.net !GREEN![FR]!CYAN!               บ
echo [7Cบ   !40!readm.org!CYAN!                      ณ   !70!kangaryu-team.fr !GREEN![FR]!CYAN!           บ
echo [7Cบ   !41!mangasee123.com!CYAN!                ณ   !71!www.japscan.ws !GREEN![FR]!CYAN!             บ
echo [7Cบ   !42!www.asurascans.com!CYAN!             ณ   !72!www.scan-fr.cc !GREEN![FR]!CYAN!             บ
echo [7Cบ   !43!naniscans.com!CYAN!                  ณ   !73!lelscan-vf.co !GREEN![FR]!CYAN!              บ
echo [7Cบ   !44!merakiscans.com!CYAN!                ณ   !74!mangas.heoo.workers.dev !GREEN![FR]!CYAN!    บ
echo [7Cบ   !45!mangajar.com!CYAN!                   ณ   !75!lectortmo.com !GREEN![ES]!CYAN!              บ
echo [7Cบ                                                                                    บ
if "!Language!"=="EN" echo [7Cบ                      !BRIGHTMAGENTA!Alternatively you can visit: !76!MALSync!CYAN!                   บ
if "!Language!"=="FR" echo [7Cบ                  !BRIGHTMAGENTA!Alternativement vous pouvez visiter: !76!MALSync!CYAN!               บ
echo [7Cบ                                                                                    บ
echo [7Cศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" / !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 30
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEEBOOKS
call :CHOOSE back && goto :MOREFEATURES
call :CHOOSE search && (call :IS_SEARCH 6777a3e064386f381 & goto :CONTINUEEBOOKS)
call :WEBSITESTART && goto :CLEAREBOOKS
call :ERRORMESSAGE
goto :CONTINUEEBOOKS

:MUSICS
call :SCALE 68 28
title !TITLE:`=Musics!
call :ROSE Musics

:CLEARMUSICS
call :CLEAR 1 12
set db=flacmusic.info/ losslessma.net/ muxiv.net/ slider.kz/ www.reddit.com/r/riprequests/ downloads.khinsider.com/ www.vgmusic.com/ freshremix.ru/ hikarinoakari.com/ www.slsknet.org/news/ deemix.app/ freezer.life/

:CONTINUEMUSICS
call :SCALE 68 28
echo !CYAN!
echo [27Cออออออออออออออ
echo [26C// !RED!Û!BGYELLOW!!BLACK! Musics !RED!Û!BGBLACK!!CYAN! \\
echo [8Cษออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [8Cบ                                                  บ
echo [8Cบ    !1!flacmusic.info!CYAN!                          บ
echo [8Cบ    !2!losslessma.net!CYAN!                          บ
echo [8Cบ    !3!muxiv.net!CYAN!                               บ
echo [8Cบ    !4!slider.kz!CYAN!                               บ
echo [8Cบ    !5!r/riprequests!CYAN!                           บ
echo [8Cบ    !6!downloads.khinsider.com !GREEN!(videogames)!CYAN!    บ
echo [8Cบ    !7!www.vgmusic.com !GREEN!(videogames)!CYAN!            บ
echo [8Cบ    !8!freshremix.ru !GREEN!(remixes)!CYAN!                 บ
echo [8Cบ    !9!hikarinoakari.com !GREEN!(animes)!CYAN!              บ
echo [8Cบ                                                  บ
echo [8CฬออออออออออออþÛ!BGYELLOW!!RED!Û Music Applications Û!BGBLACK!!CYAN!Ûþออออออออออออน
echo [8Cบ                                                  บ
echo [8Cบ   !10!www.slsknet.org!CYAN!                         บ
echo [8Cบ   !11!deemix.app!CYAN!                              บ
echo [8Cบ   !12!freezer.life!CYAN!                            บ
echo [8Cบ                                                  บ
echo [8Cศออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!SEARCH!BRIGHTBLACK!" / !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 30
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
call :CLEAR 1 38
set db=www.adit-hd.com/ forum.ddlvalley.me/ www.warezheaven.com/index.php fora.snahp.eu/ www.mywarez.org/ ddlbase.net/ forumpoint.org/ wawa-rammstein.de/index.php starwarez-sharing.name/Fofo/ `forum.anime-ultime.net/phpBB3/index.php pirates-forum.org/ eztv.re/forum/ forums.glodls.to/ torrentgalaxy.to/forums.php www.ettvcentral.com/forums.php forums.anidex.moe/ prostylex.org/forums.php/ angietorrents.cc/forum/index.php forum.p2pfr.com/ www.tigers-dl.net/ www.forumzt.com/ www.frboard.com/ rutracker.org/forum/index.php forum.mobilism.me/ forum.release-apk.com/ platinmods.com/ forum.telecharger-jeuxpc.fr/ tapochek.net/ forum.repack.me/ planete-warez.net/ www.nulled.to/ rfmirror.com/ hackforums.net/ cracked.to/ payload.sh/ mailaccess.top/ teamos-hkrg.com/ forum.ru-board.com/

:CONTINUEFORUMWEBSITES
call :SCALE 126 38
echo !CYAN!
echo [51Cออออออออออออออออออออออ
echo [50C// !RED!Û!BGYELLOW!!BLACK! FORUM WEBSITES !RED!Û!BGBLACK!!CYAN! \\
echo [7Cษอออออออออออออออออออออออออออออออออออออออออ//ออออออออออออออออออออออ\\อออออออออออออออออออออออออออออออออออออออออออป
echo [7CฬอออออออออออออออออออออออออออออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Warez Û!BGBLACK!!CYAN!Ûþออออออออออออออออออออออออออออออออออออออออออออออออออน
echo [7Cบ                                                                                                              บ
echo [7Cบ    !1!www.adit-hd.com        !GREEN!DDL        [EN]!CYAN!    ณ   !16!forums.anidex.moe           !GREEN!Torrenting [EN]!CYAN!    บ
echo [7Cบ    !2!forum.ddlvalley.me     !GREEN!DDL        [EN]!CYAN!    ณ   !17!prostylex.org               !GREEN!Torrenting [EN]!CYAN!    บ
echo [7Cบ    !3!www.warezheaven.com    !GREEN!DDL        [EN]!CYAN!    ณ   !18!angietorrents.cc            !GREEN!Torrenting [EN]!CYAN!    บ
echo [7Cบ    !4!fora.snahp.eu          !GREEN!DDL        [EN]!CYAN!    ณ   !19!forum.p2pfr.com             !GREEN!Torrenting [FR]!CYAN!    บ
echo [7Cบ    !5!www.mywarez.org        !GREEN!DDL        [EN]!CYAN!    ณ   !20!www.tigers-dl.net           !GREEN!Torrenting [FR]!CYAN!    บ
echo [7Cบ    !6!ddlbase.net            !GREEN!DDL        [EN]!CYAN!    ณ   !21!www.forumzt.com             !GREEN!Torrenting [FR]!CYAN!    บ
echo [7Cบ    !7!forumpoint.org         !GREEN!DDL        [EN]!CYAN!    ณ   !22!www.frboard.com             !GREEN!Torrenting [FR]!CYAN!    บ
echo [7Cบ    !8!www.wawa-rammstein.de  !GREEN!DDL        [EN]!CYAN!    ณ   !23!rutracker.org               !GREEN!Torrenting [RU]!CYAN!    บ
echo [7Cบ    !9!starwarez-sharing.name !GREEN!DDL        [FR]!CYAN!    ณ   !24!forum.mobilism.me           !GREEN!Cracking   [EN]!CYAN!    บ
echo [7Cบ   !10!forum.anime-ultime.net !GREEN!Streaming  [FR]!CYAN!    ณ   !25!forum.release-apk.com       !GREEN!Cracking   [EN]!CYAN!    บ
echo [7Cบ   !11!pirates-forum.org      !GREEN!Torrenting [EN]!CYAN!    ณ   !26!platinmods.com              !GREEN!Cracking   [EN]!CYAN!    บ
echo [7Cบ   !12!eztv.re                !GREEN!Torrenting [EN]!CYAN!    ณ   !27!forum.telecharger-jeuxpc.fr !GREEN!Cracking   [FR]!CYAN!    บ
echo [7Cบ   !13!forums.glodls.to       !GREEN!Torrenting [EN]!CYAN!    ณ   !28!tapochek.net                !GREEN!Cracking   [RU]!CYAN!    บ
echo [7Cบ   !14!torrentgalaxy.to       !GREEN!Torrenting [EN]!CYAN!    ณ   !29!forum.repack.me             !GREEN!Cracking   [RU]!CYAN!    บ
echo [7Cบ   !15!www.ettvcentral.com    !green!Torrenting [EN]!cyan!    ณ   !30!planete-warez.net           !GREEN!Warez      [FR]!CYAN!    บ
echo [7Cบ                                                                                                              บ
echo [7CฬออออออออออออออออออþÛ!BGYELLOW!!RED!Û Hacking Û!BGBLACK!!CYAN!ÛþอออออออออออออออออออหอออออออออออออออออออออþÛ!BGYELLOW!!RED!Û Others Û!BGBLACK!!CYAN!Ûþออออออออออออออออออออออน
echo [7Cบ                                                    บ                                                         บ
echo [7Cบ   !31!www.nulled.to  !GREEN![EN]!CYAN!                       บ   !37!teamos-hkrg.com    !GREEN![EN]!CYAN!                        บ
echo [7Cบ   !32!rfmirror.com   !GREEN![EN]!CYAN!                       บ   !38!forum.ru-board.com !GREEN![RU]!CYAN!                        บ
echo [7Cบ   !33!hackforums.net !GREEN![EN]!CYAN!                       บ                                                         บ
echo [7Cบ   !34!cracked.to     !GREEN![EN]!CYAN!                       บ                                                         บ
echo [7Cบ   !35!payload.sh     !GREEN![EN]!CYAN!                       บ                                                         บ
echo [7Cบ   !36!mailaccess.top !GREEN![EN]!CYAN!                       บ                                                         บ
echo [7Cบ                                                    บ                                                         บ
echo [7Cศออออออออออออออออออออออออออออออออออออออออออออออออออออสอออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 20
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
echo [26Cออออออออออออออออออออออ
echo [25C// !RED!Û!BGYELLOW!!BLACK! WINDOWS REPAIR !RED!Û!BGBLACK!!CYAN! \\
echo [16Cษอออออออออออออออออออออออออออออออออออออออป
echo [16CฬออออออออþÛ!BGYELLOW!!RED!Û General Repairs Û!BGBLACK!!CYAN!Ûþออออออออน
echo [16Cบ                                       บ
echo [16Cบ      !YELLOW!1!WHITE! System File Checker Utility!CYAN!    บ
echo [16Cบ      !YELLOW!2!WHITE! Repair Windows System Image!CYAN!    บ
echo [16Cบ      !YELLOW!3!WHITE! Check Disk!CYAN!                     บ
echo [16Cบ      !YELLOW!4!WHITE! Re-Register Store Apps!CYAN!         บ
echo [16Cบ                                       บ
echo [16CฬอออออออþÛ!BGYELLOW!!RED!Û Specified Repairs Û!BGBLACK!!CYAN!Ûþอออออออน
echo [16Cบ                                       บ
echo [16Cบ      !YELLOW!5!WHITE! Windows Store!CYAN!                  บ
echo [16Cบ      !YELLOW!6!WHITE! Xbox Game!CYAN!                      บ
echo [16Cบ      !YELLOW!7!WHITE! Push Notifications!CYAN!             บ
echo [16Cบ      !YELLOW!8!WHITE! Wifi Hotspot!CYAN!                   บ
echo [16Cบ      !YELLOW!9!WHITE! Clipboard History!CYAN!              บ
echo [16Cบ     !YELLOW!10!WHITE! Background Apps!CYAN!                บ
echo [16Cศอออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 20
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
echo [7C#################################################################
echo [7C#            . . . I'm repairing Windows Store . . .            #
echo [7C#################################################################
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
echo [7C#################################################################
echo [7C#              . . . I'm repairing Xbox Game . . .              #
echo [7C#################################################################
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
echo [7C#################################################################
echo [7C#         . . . I'm repairing Push Notifications . . .          #
echo [7C#################################################################
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
echo [7C#################################################################
echo [7C#            . . . I'm repairing WiFi Hotspot . . .             #
echo [7C#################################################################
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
echo [7C#################################################################
echo [7C#          . . . I'm repairing Clipboard History . . .          #
echo [7C#################################################################
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
<nul set /p=!YELLOW!
timeout /t 5
goto :WINDOWSREPAIR

:WINDOWSGAMEBOOSTER
echo !CYAN!
if "!Language!"=="EN" (
call :DRAW_CENTER "Do you want to [!YELLOW!E!CYAN!]nable, [!YELLOW!D!CYAN!]isable or [!YELLOW!B!CYAN!]ack ?" 30
>nul choice /n /c EDB
)
if "!Language!"=="FR" (
call :DRAW_CENTER "Voulez-vous [!YELLOW!A!CYAN!]ctiver, [!YELLOW!D!CYAN!]sactiver ou [!YELLOW!R!CYAN!]etour ?" 30
>nul choice /n /c ADR
)
if "!errorlevel!"=="1" call :_WINDOWSGAMEBOOSTER Enabling normal disabled enabled
if "!errorlevel!"=="2" call :_WINDOWSGAMEBOOSTER Disabling normal demand disabled
goto :MOREFEATURES
:_WINDOWSGAMEBOOSTER
call :SCALE 80 29
title !TITLE:`=%1 Game Boost!
echo !CYAN!
echo [7C#################################################################
echo [7C#              . . . I'm %1 Game Boost . . .             #
echo [7C#################################################################
echo:
>nul 2>&1 netsh interface tcp set global autotuninglevel=%2 && echo netsh interface "tcp global autotuninglevel" successfully set to %3. || echo netsh interface "tcp global autotuninglevel" does not exist or an error happend.
>nul 2>&1 netsh interface tcp set heuristics %3 && echo netsh interface "tcp heuristics" successfully set to %3. || echo netsh interface "tcp heuristics" does not exist or an error happend.
if "%1"=="Enabling" >nul 2>&1 ipconfig /flushdns && echo ipconfig "flushdns" succeeded. || echo ipconfig "flushdns" does not exist or an error happend.
for %%A in (PeerDistSvc MSiSCSI SNMPTRAP napagent CertPropSvc AxInstSV AppMgmt RemoteRegistry SCPolicySvc WebClient WinRM CscService WerSvc PNRPsvc p2psvc p2pimsvc) do (
>nul 2>&1 net stop "%%A"
>nul 2>&1 sc config "%%A" start=%3 && echo service "%%A" successfully set to %3. || echo service "%%A" does not exist or an error happend.
)
echo:
echo [7CDone, now GameBoost is %4. :')
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
echo [26Cออออออออออออออออออออออ
echo [25C// !RED!Û!BGYELLOW!!BLACK! WINDOWS TWEAKS !RED!Û!BGBLACK!!CYAN! \\
echo [6Cษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
echo [6Cบ                                                            บ
echo [6Cบ    !YELLOW!1!WHITE! Disable desktop F1 keyboard "Help" shortcut.!CYAN!          บ
echo [6Cบ    !YELLOW!2!WHITE! Disable context menu "Share with" and "Share".!CYAN!        บ
echo [6Cบ    !YELLOW!3!WHITE! Disable context menu "Troubleshoot compatibility".!CYAN!    บ
echo [6Cบ    !YELLOW!4!WHITE! Disable context menu "Include in library".!CYAN!            บ
echo [6Cบ    !YELLOW!5!WHITE! Disable context menu "Send to".!CYAN!                       บ
echo [6Cบ    !YELLOW!6!WHITE! Disable context menu "Restore previous versions".!CYAN!     บ
echo [6Cบ    !YELLOW!7!WHITE! Disable Properties Tab "Previous Versions".!CYAN!           บ
echo [6Cบ    !YELLOW!8!WHITE! Enable "Ultimate Performance" power scheme.!CYAN!           บ
echo [6Cบ    !YELLOW!9!WHITE! Disk Cleanup.!CYAN!                                         บ
echo [6Cบ   !YELLOW!10!CYAN!  ^>  !WHITE!More Windows Tweaks !GREEN!(Portable Apps)!CYAN!               บ
echo [6Cบ                                                            บ
echo [6Cศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 20
echo:
call :PROMPT
for /l %%A in (1,1,7) do if "!x!"=="%%A" (
if "!Language!"=="EN" set t="Do you want to Enable (Yes) or Disable (No) this tweak ?"
if "!Language!"=="FR" set t="Voulez-vous Activer (Oui) ou D้sactiver (Non) ce tweak ?"
call :MSGBOXLEVEL 1 !t! 69668 "Illegal Services Checker"
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
if "!Language!"=="FR" set t="ERREUR: Le schma d'alimentation 'Ultimate Performance' n'existe pas sur votre ordinateur. Vous ne pouvez pas utiliser ce script."
call :MSGBOX 1 !t! 69680 "Illegal Services Checker"
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
call :CLEAR 1 3
set db=technitium.com/tmac/ docs.microsoft.com/en-us/sysinternals/downloads/volumeid github.com/vektort13/AntiOS

:CONTINUESPOOFING
call :SCALE 53 16
echo !CYAN!
echo [18Cออออออออออออออออ
echo [17C// !RED!Û!BGYELLOW!!BLACK! Spoofing !RED!Û!BGBLACK!!CYAN! \\
echo [11Cษออออออออออออออออออออออออออออป
echo [11Cบ                            บ
echo [11Cบ    !1!technitium.com!CYAN!    บ
echo [11Cบ    !2!Volume ID!CYAN!         บ
echo [11Cบ    !3!AntiOS!CYAN!            บ
echo [11Cบ                            บ
echo [11Cศออออออออออออออออออออออออออออผ
echo !BRIGHTBLACK!
if "!Language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!Language!"=="FR" (set t1=Ecrivez un numro OU) & (set t2=et appuy sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!." 20
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUESPOOFING
call :CHOOSE back && goto :MOREFEATURES
call :WEBSITESTART && goto :CLEARSPOOFING
call :ERRORMESSAGE
goto :CONTINUESPOOFING

:CHECKER_SETUP_FOUND
call :MSGBOXLEVEL UPDATER
if "!el!"=="7" exit /b
:L2
call :CURL "!TMPF!\IS.Setup.exe" "`git_release`" UPDATER || (call :ERROR_INTERNET & exit /b)
>nul reg add "!IS_REG!" /v "FirstLaunch" /t REG_DWORD /d 1 /f
pushd "!TMPF!"
if exist IS.Setup.exe (start /max IS.Setup.exe) else (
if "!Language!"=="EN" set t="ERROR: Disable your antivirus and try again..."
if "!Language!"=="FR" set t="ERREUR: Dsactivez votre antivirus et ressayez..."
call :MSGBOX 1 !t! 69680 "Illegal Services Checker"
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
if "!Language!"=="FR" set t="ERREUR: Dsactivez votre antivirus et ressayez..."
call :MSGBOX 1 !t! 69680 "Illegal Services Checker"
goto :L3
)
exit

:PROCESS_FAQ
if "!Language!"=="EN" call :SCALE 105 33
if "!Language!"=="FR" call :SCALE 110 33
title !TITLE:`=Frequently Asked Questions!
call :ROSE FAQ
echo !CYAN!
if "!Language!"=="EN" set "t=Here is a list of frequently asked questions about "
if "!Language!"=="FR" set "t=Voici une liste questions de questions frquemment poses … propos d'"
call :DRAW_CENTER "þÛ!BGYELLOW!!RED!Û !BLACK!!t!Illegal Services:!RED! Û!BGBLACK!!CYAN!Ûþ" 30
echo:
echo !CYAN!
if "!Language!"=="EN" set t=Is Illegal Services illegal
if "!Language!"=="FR" set t=Illegal Services est-il illgal
echo    þÛ!BGWHITE!!RED!Û  !t! ? Û!BGBLACK!!CYAN!Ûþ
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
for %%A in (1 2 3 4) do echo [6C!GREEN!!t%%A!.
echo !CYAN!
if "!Language!"=="EN" set t=Why Illegal Services is detected by many antiviruses
if "!Language!"=="FR" set t=Pourquoi Illegal Services est detect par beaucoup d'antivirus
echo    þÛ!BGWHITE!!RED!Û  !t! ? Û!BGBLACK!!CYAN!Ûþ
if "!Language!"=="EN" (
set t1=The source code is converted from batch to executable using
set t2=This conversion process leads to believe that it is a
)
if "!Language!"=="FR" (
set t1=Le code source est convertie de batch en executable en utilisant
set t2=Ce processus de conversion fait laisser croire qu'il en est un
)
echo [6C!GREEN!!t1! !UNDERLINE!https://www.abyssmedia.com/quickbfc/!UNDERLINEOFF!
echo [6C!GREEN!!t2! virus.
echo !CYAN!
if "!Language!"=="EN" set t=Is Illegal Services open source
if "!Language!"=="FR" set t=Est-ce qu'Illegal Services est Open Source
echo    þÛ!BGWHITE!!RED!Û  !t! ? Û!BGBLACK!!CYAN!Ûþ
if "!Language!"=="EN" set t=Yes, under the General Public License v3.0 (GNU GPLv3)
if "!Language!"=="FR" set t=Oui, sous la General Public License v3.0 (GNU GPLv3)
echo [6C!GREEN!!t!.
echo [6C!GREEN!!UNDERLINE!!git_source!!UNDERLINEOFF!
echo !CYAN!
if "!Language!"=="EN" set t=With which operating systems is Illegal Services compatible
if "!Language!"=="FR" set t=Avec qu'elle systme d'exploitation Illegal Services est-t'il compatible
echo    þÛ!BGWHITE!!RED!Û  !t! ? Û!BGBLACK!!CYAN!Ûþ
echo [6C!GREEN!Windows 7, 8, 8.1, 10 (x86/x64).
echo !CYAN!
if "!Language!"=="EN" set t=Can you make Illegal Services compatible with more operating system
if "!Language!"=="FR" set t=Pouvez-vous rendre Illegal Services compatible pour d'autre systme d'exploitation
echo    þÛ!BGWHITE!!RED!Û  !t! ? Û!BGBLACK!!CYAN!Ûþ
if "!Language!"=="EN" set t=No. But IS Bookmarks and IS search engines are
if "!Language!"=="FR" set t=Non. Mais IS.Bookmarks et IS search engines le sont
echo [6C!GREEN!!t!.
echo !CYAN!
if "!Language!"=="EN" set t=In which languages is Illegal Services developed
if "!Language!"=="FR" set t=En quels langages est dvelopp Illegal Services
echo    þÛ!BGWHITE!!RED!Û  !t! ? Û!BGBLACK!!CYAN!Ûþ
echo [6C!GREEN!93%% Batch, 3%% PowerShell, 2%% VBScript, 2%% CSharp.
echo !CYAN!
if "!Language!"=="EN" set t=When did you started Illegal Services project
if "!Language!"=="FR" set t=Quand est-ce que le projet d'Illegal Services … commenc
echo    þÛ!BGWHITE!!RED!Û  !t! ? Û!BGBLACK!!CYAN!Ûþ
echo [6C!GREEN!v1.0.0.0 - 22/05/2020
echo:
echo !CYAN!
if "!Language!"=="EN" set "t=Press !YELLOW!{ANY KEY}!CYAN! to exit"
if "!Language!"=="FR" set "t=Appuyez sur !YELLOW!{UNE TOUCHE}!CYAN! pour quitter"
call :DRAW_CENTER "!t!..." 10 1
%SHOWCURSOR%
>nul pause
exit

:PROCESS_SCANWEBSITES
if "!Language!"=="EN" set t=Establishing connection to websites database
if "!Language!"=="FR" set t=Etablissement de la connexion … la base de donne des sites internet
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
set o2=Site Internet Chang de Domaine
)
for /f %%A in ('curl.exe -fkLs "!url!"') do (
set /a index+=1
title !DEBUG![0 result found from 0/!index! websites indexed]  ^|  [0/100%%]  ^|  [...] - Illegal Services
)
echo !CYAN!
if "!Language!"=="EN" echo Scan of the !index! indexed websites has started. You will be notified if any of them are down or have changed domain.
if "!Language!"=="FR" echo Le scan des !index! sites web indexs a commenc. Vous serez notifi si l'un d'entre eux est mort ou a chang de domaine.
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
for /f "delims=//" %%E in ("%%C") do echo !RED!!o2!: !YELLOW!https://%%A/ !GREEN!^> !YELLOW!%%E//%%D/
)
)
echo !CYAN!
for /f "tokens=1-4delims=:.," %%A in ("!time: =0!") do set /a "t2=(((1%%A*60)+1%%B)*60+1%%C)*100+1%%D-36610100, tDiff=t2-t1, tDiff+=((~(tDiff&(1<<31))>>31)+1)*8640000, seconds=tDiff/100"
title !DEBUG![!result! result!s! found from !index! websites indexed]  ^|  [Scan completed in !seconds! seconds.] - Illegal Services
if "!Language!"=="EN" echo Scan completed with !result! result!s! found from !index! websites indexed in !seconds! seconds.
if "!Language!"=="FR" echo L'analyse s'est termine avec !result! rsultats trouvs … partir de !index! sites web indexs en !seconds! secondes.
echo:
pause
exit

:PROCESS_YOUTUBEDL
call :CHECK_YOUTUBEDLPRIORITY
title !DEBUG!YouTube DL    ^|!youtube_dl!.exe !a!^|    ^|!o1!^|    ^|Priority: !YouTubeDLPriority:~1!^| - Illegal Services
echo !BRIGHTBLACK!
echo [7C##############################################
if "!Language!"=="EN" echo [7C#       !BRIGHTRED!   !CYAN!Welcome in YouTube DL   !BRIGHTRED!!BRIGHTBLACK!        #
if "!Language!"=="FR" echo [7C#      !BRIGHTRED!   !CYAN!Bievenue dans YouTube DL   !BRIGHTRED!!BRIGHTBLACK!      #
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
echo [7C !CYAN!!t1!: !YELLOW!!o1!!BRIGHTBLACK!
echo [7C !CYAN!!t2!: !YELLOW!!x!!CYAN! . . .
echo !BRIGHTBLACK!
echo =========================================================================================================
echo !RED!
>nul chcp 65001
start /b /w !YouTubeDLPriority! Portable_Apps\YouTube-DL\!youtube_dl!.exe --ffmpeg-location "Portable_Apps\YouTube-DL" --output "!YouTubeDLOutputDirectory!\%%(title)s.%%(ext)s" !a!
set el=!errorlevel!
>nul chcp !CP!
echo !BRIGHTBLACK!
echo =========================================================================================================
echo !CYAN!
if "!Language!"=="EN" if "!el!"=="0" (
echo [7C Download finished.
<nul set /p=[7C Press !YELLOW!{ANY KEY}!CYAN! to open download location and exit...
) else (
echo [7C Something went wrong and couldn't download the file.
<nul set /p=[7C Press !YELLOW!{ANY KEY}!CYAN! to exit...
)
if "!Language!"=="FR" if "!el!"=="0" (
echo [7C Tchargement terminer.
<nul set /p=[7C Appuyez sur !YELLOW!{UNE TOUCHE}!CYAN! pour ouvrir l'emplacement de tchargement et quitter...
) else (
echo [7C Une erreur s'est produite et n'a pas pu tcharger le fichier.
<nul set /p=[7C Appuyez sur !YELLOW!{UNE TOUCHE}!CYAN! pour quitter...
)
%SHOWCURSOR%
>nul pause
if "!el!"=="0" start /max explorer.exe "!YouTubeDLOutputDirectory!"
exit

:PROCESS_NMAP
call :CHECK_PORTPRIORITY
title !DEBUG!NMAP    ^|nmap.exe !a!^|    ^|!o1!^|    ^|!o2!^|    ^|Priority: !PortPriority:~1!^| - Illegal Services
>nul 2>&1 net start npcap
>nul 2>&1 reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d 64534 /f
>nul 2>&1 reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d 30 /f
>nul 2>&1 reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "StrictTimeWaitSeqCheck" /t REG_DWORD /d 1 /f
echo !BRIGHTBLACK!
echo [7C#################################################################
if "!Language!"=="EN" echo [7C#       !BRIGHTRED!   !CYAN!Welcome in the best Port Scanner by NMAP   !BRIGHTRED!!BRIGHTBLACK!        #
if "!Language!"=="FR" echo [7C#    !BRIGHTRED!   !CYAN!Bienvenue dans le meilleur Port Scanner par NMAP   !BRIGHTRED!!BRIGHTBLACK!   #
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
echo [7C !CYAN!Scan: !YELLOW!!o1!!BRIGHTBLACK!
echo [7C !CYAN!!t1!: !YELLOW!!o2!!BRIGHTBLACK!
echo [7C !CYAN!!t2!: !YELLOW!!x!!CYAN! . . .
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
echo [7C Scan finished.
<nul set /p=[7C Press !YELLOW!{ANY KEY}!CYAN! to exit...
) else (
echo [7C Something went wrong and couldn't scan.
<nul set /p=[7C Press !YELLOW!{ANY KEY}!CYAN! to exit...
)
if "!Language!"=="FR" if "!el!"=="0" (
echo [7C Scan terminer.
<nul set /p=[7C Appuyez sur !YELLOW!{UNE TOUCHE}!CYAN! pour quitter...
) else (
echo [7C Une erreur s'est produite et n'a pas pu scanner.
<nul set /p=[7C Appuyez sur !YELLOW!{UNE TOUCHE}!CYAN! pour quitter...
)
%SHOWCURSOR%
>nul pause
exit

:PROCESS_PINGER
title !TITLE:`=IP Pinger  ^|  Pinging %x%!
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
if "!Language!"=="FR" echo               ** Presser !YELLOW![CTRL + C]!BRIGHTBLACK! ^> !YELLOW![N]!BRIGHTBLACK! ^> !YELLOW![ENTRER]!BRIGHTBLACK! pour afficher le rsultat et recommencer. **
echo !WHITE!
ping -t -l 0 !x!
goto :_PING

:DONE_REGVALUE
if "!Language!"=="EN" set t="Reg value successfully added/removed."
if "!Language!"=="FR" set t="Valeur du registre ajoute/supprime avec succs."
call :MSGBOX 1 !t! 69696 "Illegal Services Checker"
exit /b

:ENABLE_ULTIMATE_PERFORMANCES_POWER_SCHEME
echo:
for /f "tokens=2delims=:" %%A in ('powercfg /getactivescheme') do for /f "delims= " %%B in ("%%A") do if "%%B"=="%1" (
if "!Language!"=="EN" set t="The 'Ultimate Performance' power scheme is already enabled."
if "!Language!"=="FR" set t="Le schma d'alimentation 'Ultimate Performance' est dj… activ."
call :MSGBOX 1 !t! 69696 "Illegal Services Checker"
exit /b
)
powercfg /setactive %1 && (
if "!Language!"=="EN" set t="The 'Ultimate Performance' power scheme successfully enabled."
if "!Language!"=="FR" set t="Le schma d'alimentation 'Ultimate Performance' a t activ avec succs."
call :MSGBOX 1 !t! 69696 "Illegal Services Checker"
) || (
if "!Language!"=="EN" set t="ERROR: The 'Ultimate Performance' power scheme couldn't enable."
if "!Language!"=="FR" set t="ERREUR: Le schma d'alimentation 'Ultimate Performance' n'a pas pu ๊tre activ."
call :MSGBOX 1 !t! 69680 "Illegal Services Checker"
)
exit /b

:CHECK_INTERNET
for %%A in (https http) do curl.exe -fIkLs "%%A://www.google.com/" -o NUL && exit /b 0
exit /b 1

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
if "!Language!"=="EN" echo Msg="New version found. Do you want to update ?"^&vbCrLf^&vbCrLf^&"Current version: !VERSION!"^&vbCrLf^&"Latest version   : !LastVersion!"
if "!Language!"=="FR" echo Msg="Nouvelle version trouv้e. Voulez-vous mettre เ jour ?"^&vbCrLf^&vbCrLf^&"Version actuelle  : !VERSION!"^&vbCrLf^&"Derni่re version : !LastVersion!"
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
for /f "delims=" %%A in ('cscript //nologo "%TMPF%\msgbox.vbs"') do set "ID=%%A"
del /f /q "%TMPF%\msgbox.vbs"
exit /b

:ROSE_SETUP
>nul chcp 1252
for /f "tokens=1*delims==" %%A in ('findstr /bc:"[First Launch]=" "Speak\!Language!.lang"') do if defined SPEECH_FR (Speak\speak-x!ARCH!.exe -t "%%~B") else (
set extd=Speak\extd.exe /speak "%%~B"
!extd!
)
>nul chcp !CP!
if "!Language!"=="EN" set t=Do you want to disable Rose voice assistant
if "!Language!"=="FR" set t=Voulez-vous d้sactiver l'assistante vocale Rose
call :MSGBOXLEVEL 1 "!t! ?" 69668 "Illegal Services Checker"
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
set "url=%~2"
if not "!url:`=!"=="!url!" (
if "!git!"=="404 Git proxy not found" call :PROXY || if "!git!"=="404 Git proxy not found" exit /b 2
for /f "tokens=1-3delims=`" %%A in ("[!url!]") do set "url=%%A!%%B!%%C"
set "url=!url:~1,-1!"
)
if defined git_backup if not "!url:%git%=!"=="!url!" if not "%3"=="UPDATER" exit /b 3
if "!Language!"=="EN" set t=Downloading
if "!Language!"=="FR" set t=Tlchargement
<nul set /p="!CYAN!!t!: !YELLOW!!url!!CYAN!"
echo:
curl.exe --create-dirs -f#kLo "%~1" "!url!" || if not "!url:%git%=!"=="!url!" call :CURL_PROXYS "%~1" "!url!" || (call :ERROR_CURL "%~f1" "!url!" & exit /b 4)
if exist "%~f1" for %%A in (7z zip) do if "%~x1"==".%%A" if "%~nx1"=="ffmpeg.7z" (7za\x!ARCH!\7za.exe x -aoa -bso0 -o"%~dp1" -spe -y "%~f1" || (call :ERROR_CURL "%~f1" "!url!" & exit /b 4) & del /f /q "%~f1") else (7za\x!ARCH!\7za.exe x -aoa -bso0 -o"%~dpn1" -spe -y "%~f1" || (call :ERROR_CURL "%~f1" "!url!" & exit /b 4) & del /f /q "%~f1")
set Start_Folder=1
exit /b 0

:CURL_PROXYS
set el=
set cn=
for %%A in (main downloads source) do if not "!url:/%%A/=!"=="!url!" set cn=/%%A/
for %%B in (!GIT_LIST!) do if not "%%B"=="!git:*://=!" (
if "%%B"=="github.com/Illegal-Services/Illegal_Services" set el=%%B/raw
if "%%B"=="bitbucket.org/IllegalServices/illegal_services" set el=%%B/raw
if "%%B"=="git.teknik.io/Illegal-Services/Illegal_Services" set el=%%B/raw/branch
if "%%B"=="gitee.com/Illegal-Services/illegal_services" set el=%%B/raw
if "!Language!"=="EN" set t=Downloading
if "!Language!"=="FR" set t=Tlchargement
cmd /c rem
<nul set /p="!CYAN!!t!: !YELLOW!https://!el!!cn!%~nx2!CYAN!"
echo:
curl.exe --create-dirs -f#kLo "%~1" "https://!el!!cn!%~nx2" && exit /b 0
)
exit /b 1

:ERROR_CURL
if defined IS_Log (
if "!Language!"=="EN" >>"!TMPF!\IS_Log.txt" echo ERROR WHILE DOWNLOADING: "%~2"
if "!Language!"=="FR" >>"!TMPF!\IS_Log.txt" echo ERREURE PENDANT LE TELECHARGEMENT DE: "%~2"
)
if "!Language!"=="EN" set t=ERROR WHILE DOWNLOADING
if "!Language!"=="FR" set t=ERREURE PENDANT LE TELECHARGEMENT DE
echo !RED!!t!: !YELLOW!"%~2"
if exist "%~f1" del /f /q "%~f1"
exit /b

:ENTER_LOOKUP
if "!Language!"=="EN" set t=Enter the %1 to track
if "!Language!"=="FR" set t=Entrer l'%1 … tracker
%SHOWCURSOR%
set x=
set /p "x=!BRIGHTBLACK!!t!: !YELLOW!"
%HIDECURSOR%
if "%1"=="IP" (call :CHECK_IP x || exit /b 1) else call :CHECK_URL x IP/URL || exit /b 1
if "!4!"=="!YELLOW!4 !CHECKED!" start "" "https://check-host.net/ip-info?host=!x!" && cmdwiz.exe delay 1500
if "!5!"=="!YELLOW!5 !CHECKED!" start "" "https://dnschecker.org/ip-location.php?ip=!x!" && cmdwiz.exe delay 1500
if "!6!"=="!YELLOW!6 !CHECKED!" start "" "https://www.iplocation.net/ip-lookup" && cmdwiz.exe delay 1500
if "!7!"=="!YELLOW!7 !CHECKED!" start "" "https://www.ip-tracker.org/locator/ip-lookup.php?ip=!x!" && cmdwiz.exe delay 1500
if "!8!"=="!YELLOW!8 !CHECKED!" start "" "https://whatismyipaddress.com/ip/!x!"
exit /b 0

:IP_DETECTOR
set height=4
for /f "tokens=1,2delims=: " %%A in ('curl.exe -fkLs "https://ipinfo.io/!x!/json" ^| findstr /vc:"{" /c:"}" /c:"ipinfo.io/missingauth"') do (
set /a height+=1
mode 68,!height!
set "data=%%A:%%B"
set "data=!data:"=!"
set "data=!data:ip:=IPv4      : !"
set "data=!data:hostname:=Hostname  : !"
set "data=!data:anycast:=Anycast   : !"
set "data=!data:city:=City      : !"
set "data=!data:region:=Region    : !"
set "data=!data:country:=Country   : !"
set "data=!data:loc:=Location  : !"
set "data=!data:org:=ORG       : !"
set "data=!data:postal:=Postal    : !"
set "data=!data:timezone:=Timezone  : !"
set "data=!data:bogon:=Bogon     : !"
set "data=!data:true=True!"
set "data=!data:false=False!"
if "!data:~-1!"=="," set "data=!data:~,-1!"
echo     !data!
)>>"!TMPF!\IS_Log.txt"
exit /b

:URL_DETECTOR
for /f "delims=/" %%A in ("!x:*://=!") do set "x=%%A"
title !TITLE:`=Looking up ^> %x%!
set height=4
for /f "tokens=2delims=</" %%A in ('curl.exe -fkLs "http://ip-api.com/xml/!x!?fields=8192"') do (
set /a height+=1
mode 68,!height!
set "data=%%A"
set "data=!data:query>=IP v4/v6  : !"
echo     !data!
)>>"!TMPF!\IS_Log.txt"
for /f "tokens=2delims=</" %%A in ('curl.exe -fkLs "http://ip-api.com/xml/!x!?fields=5775161"') do (
set /a height+=1
mode 68,!height!
set "data=%%A"
set "data=!data:"=!"
set "data=!data:continent>=Continent : !"
set "data=!data:country>=Country   : !"
set "data=!data:regionName>=Region    : !"
set "data=!data:city>=City      : !"
set "data=!data:district>=District  : !"
set "data=!data:zip>=Zip       : !"
set "data=!data:timezone>=Timezone  : !"
set "data=!data:isp>=ISP       : !"
set "data=!data:org>=ORG       : !"
set "data=!data:as>=AS        : !"
set "data=!data:asname>=ASName    : !"
set "data=!data:reverse>=Reverse   : !"
echo     !data!
)>>"!TMPF!\IS_Log.txt"
exit /b

:PROXY_DETECTOR
for /f "tokens=1,2delims=: " %%A in ('curl.exe -fkLs "https://proxycheck.io/v2/!x!?vpn=1&port=1" ^| findstr /ic:"type" /c:"proxy"') do (
set /a height+=1
mode 68,!height!
set "data=%%A:%%B"
set "data=!data:"=!"
set "data=!data:type:=Type      : !"
set "data=!data:proxy:=Proxy     : !"
set "data=!data:no=False!"
set "data=!data:yes=True!"
if "!data:~-1!"=="," set "data=!data:~,-1!"
echo     !data!
)>>"!TMPF!\IS_Log.txt"
exit /b

:VPN_DETECTOR
for /f "tokens=2delims=</" %%A in ('curl.exe -fkLs "http://ip-api.com/xml/!x!?fields=16973824"') do (
set /a height+=1
mode 68,!height!
set "data=%%A"
set "data=!data:mobile>=Mobile (cellular) connection      : !"
set "data=!data:proxy>=Proxy, VPN or Tor exit address    : !"
set "data=!data:hosting>=Hosting, colocated or data center : !"
set "data=!data:true=True!"
set "data=!data:false=False!"
echo     !data!
)>>"!TMPF!\IS_Log.txt"
exit /b

:IS_SEARCH
echo !CYAN!
if "!Language!"=="EN" set t=What do you want to search for
if "!Language!"=="FR" set t=Que voulez-vous rechercher
%SHOWCURSOR%
set x=
set /p "x=!t! ? !YELLOW!"
%HIDECURSOR%
call :CHOOSE back && exit /b
if defined x start "" "https://cse.google.com/cse?q=!x!&cx=%1" && exit /b
echo !CYAN!
call :ERRORMESSAGE
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
for /f "delims=1234567890" %%A in ("%~1") do exit /b 1
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
2>nul set /a c1=DeveloperKey%%12312
if "!c1!"=="826" (
2>nul set /a c2=DeveloperKey%%17
if "!c2!"=="6" set DeveloperMode=1
)
if not "!DeveloperMode!"=="1" (
>nul reg add "!IS_REG!" /v "DeveloperMode" /t REG_DWORD /d 0 /f
set DeveloperMode=0
)
for %%A in (DeveloperKey c1 c2) do set %%A=
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
if "!Language!"=="FR" (set t="Une erreur inattendue est survenue." "Debug: '!IS_REG!\%1=!el!'" "Rinitialisation du paramtre '%1' … la valeur par dfaut.") else set t="An unexpected error has occurred." "Debug: '!IS_REG!\%1=!el!'" "Resetting '%1' setting to default value."
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
for /l %%A in (!c1!,1,!c2!) do set "%%A=!YELLOW!%%A !UNCHECKED!"
exit /b

:PROMPT
%SHOWCURSOR%
set /a "_sp=width/2"
set x=
set /p "x=!YELLOW![!_sp!C"
%HIDECURSOR%
exit /b

:CHOOSE
if not defined x exit /b 1
set "c=%1"
if /i "!c:~,1!"=="!x!" exit /b 0
if /i "!c:~,2!"=="!x:~,2!" exit /b 0
exit /b 1

:WEBSITECHECK
if not defined x exit /b 1
for /l %%A in (!c1!,1,!c2!) do if "!x!"=="%%A" if "!%%A!"=="!YELLOW!%%A !UNCHECKED!" (
set "%%A=!YELLOW!%%A !CHECKED!"
exit /b 0
) else (
set "%%A=!YELLOW!%%A !UNCHECKED!"
exit /b 0
)
exit /b 1

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
call :DRAW_CENTER_ERROR t 20
>nul timeout /t 3
exit /b

:START_DOXTOOLV2
for %%A in (Newtonsoft.Json.dll "Dox Tool V2.exe") do if not exist "Portable_Apps\DoxToolV2\%%~A" call :CURL "Portable_Apps\DoxToolV2.7z" "`git_raw_downloads`/DoxToolV2.7z" || (call :ERROR_INTERNET & exit /b)
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
for /l %%A in (12,-1,0) do (
set /a "len|=1<<%%A"
for %%B in (!len!) do if "!str:~%%B,1!"=="" set /a "len&=~1<<%%A"
)
exit /b

:READ_IPLOOKUP
if exist "!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt" (start "" "!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt") else (
if "!Language!"=="EN" set t="IP Lookup list not found." "You must first save a Lookup to be able to read it."
if "!Language!"=="FR" set t="Liste d'IP Lookup non trouve." "Vous devez d'abord enregistrer une Lookup pour pouvoir la lire."
call :MSGBOX 2 !t! 69680 "Illegal Services Checker"
)
exit /b

:DELETE_IPLOOKUP
if exist "!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt" (
del /f /q "!IS_OUTPUTDIRECTORY!\IP Lookup Saved.txt" && (
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
if defined Proxy for /f %%A in ("!Proxy:*://=!") do call :_PROXY %%A && exit /b 0
for %%A in (!GIT_LIST!) do call :_PROXY %%A && exit /b 0
if defined git_backup exit /b 3
set "git_backup=backup "
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
for /f "delims=" %%A in ('curl.exe -fkLs "https://pastebin.com/raw/%1"') do set %2=%%A
exit /b

:ERROR_WINDOWS_VERSION
if "!Language!"=="EN" set t="Your Windows version is not compatible with that feature."
if "!Language!"=="FR" set t="Votre version de Windows n'est pas compatible avec cette fonctionnalit."
call :MSGBOX 1 !t! 69648 "Illegal Services Checker"
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
if "!Language!"=="EN" echo Please complete "!YELLOW!%1!CYAN!" installation in the window that appeared...
if "!Language!"=="FR" echo Veuillez terminer l'installation de "!YELLOW!%1!CYAN!" dans la fentre qui est apparue...
echo:
start /w %1
>nul timeout /t 0 /nobreak
del /f /q %1
popd
exit /b

:SHOW_WINDOW
for /f "tokens=2delims=," %%A in ('tasklist /v /fo csv /fi "imagename eq !IS_PROCESS!" ^| findstr /ic:"%~1"') do (
set el=%%A
set el=!el:"=!
cmdwiz.exe showwindow value:1 /p:!el:"=!
cmdwiz.exe showwindow top /p:!el:"=!
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
if "!Language!"=="FR" echo !CYAN!Le fichier !RED!"!IS_DIR!%1"!CYAN! est manquant, tentative de tlchargement...
exit /b

:ERROR_FATAL
set el=
if "!Language!"=="EN" set t="Illegal Services can't start because '!IS_DIR!%1' is missing."
if "!Language!"=="FR" set t="Illegal Services ne peut pas dmarrer car '!IS_DIR!%1' est manquant."
if "%2"=="CURL" (
if "!Language!"=="EN" set t=!t! "Please reinstall Illegal Services and try again."
if "!Language!"=="FR" set t=!t! "Veuillez rinstaller Illegal Services et ressayer."
set el=2
) else (
if "!errorlevel!"=="1" (
if "!Language!"=="EN" set t=!t! "You must activate Internet and try again."
if "!Language!"=="FR" set t=!t! "You must activate Internet and try again."
)
if "!errorlevel!"=="2" (
if "!Language!"=="EN" set t=!t! "IS Git proxy: '!git!' appears to be offline. For more updates visit our Telegram."
if "!Language!"=="FR" set t=!t! "IS Git proxy: '!git!' semble tre hors ligne. Pour plus de mises … jour, visitez notre Telegram."
set el=1
)
)
call :MSGBOX 2 !t! 69648 "Illegal Services Checker"
if "!el!"=="1" start https://t.me/illegal_services_forum
if "!el!"=="2" start https://t.me/illegal_services
exit