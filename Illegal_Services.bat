@ECHO OFF
REM  QBFC Project Options Begin
REM  HasVersionInfo: Yes
REM  Companyname: IB_U_Z_Z_A_R_Dl
REM  Productname: Illegal Services
REM  Filedescription: Illegal Services
REM  Copyrights: Copyright (C) 2022 IB_U_Z_Z_A_R_Dl
REM  Trademarks: Copyright (C) 2022 IB_U_Z_Z_A_R_Dl
REM  Originalname: Illegal_Services.exe
REM  Comments: Illegal Services
REM  Productversion:  6. 1. 2. 1
REM  Fileversion:  6. 1. 2. 1
REM  Internalname: Illegal_Services.exe
REM  Appicon: Ressources\Icons\icon.ico
REM  AdministratorManifest: Yes
REM  QBFC Project Options End
@ECHO ON
@echo off
cls
>nul chcp 65001
setlocal DisableDelayedExpansion
pushd "%~dp0"
for /f %%A in ('forfiles /m "%~nx0" /c "cmd /c echo 0x1B"') do set "\E=%%A"
set "x1=%~nx0"
setlocal EnableDelayedExpansion
for /f "delims==" %%A in ('set') do if not "%%A"=="x1" if not "%%A"=="\E" (
    set "LOOKUP_DUMP_IS_EXCLUDED_NOT_IS_VARIABLES=!LOOKUP_DUMP_IS_EXCLUDED_NOT_IS_VARIABLES!`%%A"
)
if defined LOOKUP_DUMP_IS_EXCLUDED_NOT_IS_VARIABLES (
    set "LOOKUP_DUMP_IS_EXCLUDED_NOT_IS_VARIABLES=!LOOKUP_DUMP_IS_EXCLUDED_NOT_IS_VARIABLES!`"
)
set "x2=%~nx0"
set IS_REG=HKCU\SOFTWARE\IB_U_Z_Z_A_R_Dl\Illegal Services
call :CHECK_LANGUAGE
(set \N=^
%=leave unchanged=%
)
for /f "tokens=2*" %%A in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal"') do (
    set "IS_OUTPUT_DIRECTORY=%%~fB\Illegal Services"
)
call :CHECK_PATH IS_OUTPUT_DIRECTORY || (
    md "!IS_OUTPUT_DIRECTORY!"
    if exist "!IS_OUTPUT_DIRECTORY!\" (
        rd "!IS_OUTPUT_DIRECTORY!"
    ) else (
        call :ERROR_FATAL IS_OUTPUT_DIRECTORY
    )
)
set "IS_OUTPUT_DIRECTORY_LOGS=!IS_OUTPUT_DIRECTORY!\logs"
set "IS_OUTPUT_DIRECTORY_YOUTUBE_DL=!IS_OUTPUT_DIRECTORY!\YouTube Downloader"
set "IS_OUTPUT_DIRECTORY_PORTABLE_APPS=!IS_OUTPUT_DIRECTORY!\Portable Apps"
for /f "tokens=4-7delims=[.] " %%A in ('ver') do (
    if /i "%%A"=="version" (
        set "WINDOWS_VERSION=%%B.%%C"
    ) else (
        set "WINDOWS_VERSION=%%A.%%B"
    )
)
if not "!WINDOWS_VERSION!"=="10.0" (
    call :ERROR_FATAL WINDOWS_VERSION
)
>nul 2>&1 <nul set /p="╔╦╗╚╩╝╠╬╣║═█■"
if not !errorlevel!==1 (
    call :ERROR_FATAL UNICODE
)
if not "!x1!"=="!x2!" call :ERROR_FATAL NAME
set "@SHOWCURSOR=<nul set /p=!\E![?25h"
set "@HIDECURSOR=<nul set /p=!\E![?25l"
%@HIDECURSOR%
if defined ProgramFiles(x86) (
    set ARCH=64
) else (
    set ARCH=86
)
if not "!ARCH!"=="64" (
    if not "!ARCH!"=="86" (
        call :ERROR_FATAL ARCH
    )
)
for %%A in (%*) do (
    if "%%~A"=="--debug" (
        set "DEBUG=[Debug] "
    )
)
set 7za.exe=lib\7za\x!ARCH!\7za.exe
set binread.exe=lib\binread\x!ARCH!\binread.exe
set extd.exe=lib\speak\extd.exe
set speak-x!ARCH!.exe=lib\speak\x!ARCH!\speak-x!ARCH!.exe
set bookmarks_parser.exe=lib\bookmarks_parser.exe
set cmdbkg.exe=lib\cmdbkg.exe
set cmdwiz.exe=lib\cmdwiz.exe
set OpenFileBox.exe=lib\OpenFileBox.exe
set SaveFileBox.exe=lib\SaveFileBox.exe
if /i not "%~x0"==".exe" (
    >nul findstr /bec:"for %%%%A in (%%cmdln%%) do (" "%~0" && (
        call :ERROR_FATAL CMDLN
    )
)
if not "%~1"=="" (
    if defined language (
        for %%A in (FAQ SCANWEBSITES NMAP YOUTUBEDL PINGER IS_BOOKMARKS_PARSER) do (
            if "%~1"=="%%A" (
                call :APPLY_BACKGROUND_SETTINGS
                for /f "tokens=6" %%A in ('!cmdwiz.exe! getconsoledim') do (
                    if %%A lss 120 (
                        call :SCALE 120 30
                    )
                )
                goto :PROCESS_%%A
            )
        )
    )
)
if defined WINDOWS_TERMINAL (
    set WINDOWS_TERMINAL=
)
if defined WT_SESSION (
    set WINDOWS_TERMINAL=1
    goto :SKIP_WINDOWS_TERMINAL
)
set WINDOWS_TERMINAL=1
2>nul reg query "HKEY_CURRENT_USER\Console\%%%%Startup" /v "DelegationTerminal" | >nul find "{00000000-0000-0000-0000-000000000000}" && (
    set WINDOWS_TERMINAL=
)
:SKIP_WINDOWS_TERMINAL
if defined WINDOWS_TERMINAL (
    tasklist /v /fo csv /fi "imagename eq WindowsTerminal.exe" | >nul find "WindowsTerminal.exe" && (
        tasklist /v /fo csv /fi "imagename eq OpenConsole.exe" | >nul find "OpenConsole.exe" || (
            set WINDOWS_TERMINAL=
        )
    ) || (
        set WINDOWS_TERMINAL=
    )
)
call :SCALE 125 19
if not defined WINDOWS_TERMINAL (
    if exist "!cmdwiz.exe!" (
        !cmdwiz.exe! setquickedit 0
    )
)
call :CHECK_USERNAME
set #TITLE=!DEBUG!` - Illegal Services
if "!language!"=="EN" (
    title !#TITLE:`=Launcher!
) else if "!language!"=="FR" (
    title !#TITLE:`=Lanceur!
)
if defined TEMP (set "TMPF=!TMP!") else if defined TMP (set "TMPF=!TEMP!") else call :ERROR_FATAL TMP
if not exist "lib" <nul set /p="%~dp0" | >nul findstr /c:"!TMP!" /c:"!TEMP!" && (
if "!language!"=="EN" set t="Illegal Services cannot start because you are running it from an archive. Reopen it once the archive is extracted."
if "!language!"=="FR" set t="Illegal Services ne peut pas démarrer car vous l'exécutez à partir d'une archive. Rouvrez-le une fois l'archive extraite."
call :MSGBOX 69680 "Illegal Services"
exit 0
)
set cn=0
if /i "%~x0"==".exe" (
    set "IS_PROCESS=%~nx0"
    if defined BAT_USED (
        set BAT_USED=
    )
    if "%~n0"=="Illegal Services" (
        >nul 2>&1 taskkill /f /im "Illegal_Services.exe" /t
        >nul move /y "%~nx0" "Illegal_Services.exe" && (
            start Illegal_Services.exe !DEBUG! && (
                exit 0
            )
        )
    )
    for /f %%A in ('tasklist /fo csv /fi "imagename eq !IS_PROCESS!" ^| find "!IS_PROCESS!"') do (
        set /a cn+=1
    )
) else (
    set IS_PROCESS=cmd.exe
    set "BAT_USED=%~nx0"
)
for /f %%A in ('tasklist /fo csv /fi "imagename eq Illegal_Services.exe" ^| find "Illegal_Services.exe"') do (
    set /a cn+=1
)
pushd "!TMPF!"
for /f %%A in ('2^>nul dir "????????.bat" /a:-d /o:-d /b ^| findstr /rc:"........\.bat"') do (
    if not defined BAT_USED (
        if /i "%~x0"==".exe" (
            set "BAT_USED=%%A"
            attrib -s -h "!BAT_USED!"
            attrib +s +h +i "!BAT_USED!"
        )
    )
    if !cn! gtr 1 (
        popd
        goto :LAUNCHER
    )
    if not "%%A"=="!BAT_USED!" (
        del /f /q /a "%%A"
    )
)
popd

:LAUNCHER
if defined VERSION set OLD_VERSION=!VERSION!
if defined lastversion set OLD_LASTVERSION=!lastversion!
set VERSION=v6.1.2.1 - 09/03/2022
set "el=UNDERLINE=!\E![04m,UNDERLINEOFF=!\E![24m,BLACK=!\E![30m,RED=!\E![31m,GREEN=!\E![32m,YELLOW=!\E![33m,BLUE=!\E![34m,MAGENTA=!\E![35m,CYAN=!\E![36m,WHITE=!\E![37m,BGBLACK=!\E![40m,BGYELLOW=!\E![43m,BGWHITE=!\E![47m,BGBRIGHTBLACK=!\E![100m,BRIGHTBLACK=!\E![90m,BRIGHTRED=!\E![91m,BRIGHTBLUE=!\E![94m,BRIGHTMAGENTA=!\E![95m"
set "%el:,=" && set "%"
echo !BGBLACK!!BRIGHTBLUE!
call :DRAW_LOGO
echo:
echo !\E![28C!CYAN!{!RED!+!CYAN!}---------------------------------------------------------------{!RED!+!CYAN!}
if "!language!"=="EN" call :DRAW_CENTER "!RED!♥   !YELLOW!Welcome [!RED!!IS_Username!!YELLOW!] to Illegal Services !VERSION:~0,8!   !RED!♥"
if "!language!"=="FR" call :DRAW_CENTER "!RED!♥   !YELLOW!Bienvenue [!RED!!IS_Username!!YELLOW!] dans Illegal Services !VERSION:~0,8!   !RED!♥"
echo !\E![28C!CYAN!{!RED!+!CYAN!}---------------------------------------------------------------{!RED!+!CYAN!}
for /f %%A in ('2^>nul dir "!TMPF!\URL????.url" /a:-d /b ^| findstr /rc:"URL....\.url"') do del /f /q "!TMPF!\%%A"
for %%A in (README.md "Illegal Services.exe" "!TMPF!\msgbox.vbs" "!TMPF!\IS.Setup.exe") do if exist "%%~A" del /f /q "%%~A"
for %%A in ("!CD:~0,2!\AI_RecycleBin" "!SystemDrive!\AI_RecycleBin" "!TMPF!\IB_U_Z_Z_A_R_Dl") do if exist "%%~A" 2>nul rd /s /q "%%~A"
set "sp=!\E![28C!YELLOW!{$} !BRIGHTBLACK!"
echo !BRIGHTBLACK!
set "IS_DIR=%~dp0"
if not "!PATH:~-13!"==";lib\curl\x!ARCH!" set "PATH=!PATH!;lib\curl\x!ARCH!"
:: set "git_raw_github=https://github.com/Illegal-Services/Illegal_Services/raw/!git_item_branch!/!git_item_path!"
:: set "git_raw_bitbucket=https://bitbucket.org/IllegalServices/illegal_services/raw/!git_item_branch!/!git_item_path!"
:: set "git_raw_teknik=https://git.teknik.io/Illegal-Services/Illegal_Services/raw/branch/!git_item_branch!/!git_item_path!"
:: set "git_raw_devops=https://dev.azure.com/Illegal-Services/ffc14ecb-bedd-4220-bb60-091d2b356bd0/_apis/git/repositories/492fa534-7ba9-4019-bee0-0203fcf0158c/items?path=/!git_item_path!&versionDescriptor%%5BversionOptions%%5D=0&versionDescriptor%%5BversionType%%5D=0&versionDescriptor%%5Bversion%%5D=!git_item_branch!&resolveLfs=true&%%24format=octetStream&api-version=5.0&download=true"
:: set "git_raw_gitee=https://gitee.com/Illegal-Services/illegal_services/raw/!git_item_branch!/!git_item_path!"
:: set "git_raw_notabug=https://notabug.org/Illegal-Services/Illegal_Services/raw/!git_item_branch!/!git_item_path!"
:: set "git_source_github=https://github.com/Illegal-Services/Illegal_Services/tree/source"
:: set "git_source_bitbucket=https://bitbucket.org/IllegalServices/illegal_services/src/source/"
:: set "git_source_teknik=https://git.teknik.io/Illegal-Services/Illegal_Services/src/branch/source"
:: set "git_source_devops=https://dev.azure.com/Illegal-Services/_git/Illegal_Services?path=%%2F&version=GBsource&_a=contents"
:: set "git_source_gitee=https://gitee.com/Illegal-Services/illegal_services/tree/source/"
:: set "git_source_notabug=https://notabug.org/Illegal-Services/Illegal_Services/src/source"
:: set "GIT_LIST=github bitbucket teknik devops gitee notabug"
set "GIT_LIST=github.com/Illegal-Services/Illegal_Services`raw`tree/source bitbucket.org/IllegalServices/illegal_services`raw`src/source/ git.teknik.io/Illegal-Services/Illegal_Services`raw/branch`src/branch/source gitee.com/Illegal-Services/illegal_services`raw`tree/source/ notabug.org/Illegal-Services/Illegal_Services`raw`src/source"
>nul 2>&1 where curl.exe || (
    call :DOWNLOAD_CURL || (
        call :ERROR_FATAL lib\curl\x!ARCH!\curl.exe CURL
    )
)

:LAUNCHER_PROXY
if "!language!"=="EN" <nul set /p="!sp!Searching a proxy > "
if "!language!"=="FR" <nul set /p="!sp!Recherche d'un proxy > "
call :PROXY

:LAUNCHER_VERSION
if defined git (
    for /f "delims=/" %%A in ("!git:*://=!") do (
        if defined git_backup (
            echo !GREEN![!RED!Git backup server: !GREEN!%%A] . . .
        ) else (
            if "!git!"=="[404 Git proxy not found]" (
                if "!language!"=="EN" echo !RED![FAILED] . . .
                if "!language!"=="FR" echo !RED![ECHEC] . . .
            ) else (
                echo !GREEN![%%A] . . .
            )
        )
    )
)
if "!language!"=="EN" <nul set /p="!sp!Searching for a new update > "
if "!language!"=="FR" <nul set /p="!sp!Recherche d'une nouvelle mise à jour > "
call :CHECK_VOICEASSISTANT
call :GET_VERSION
if defined OLD_VERSION (
    if defined OLD_LASTVERSION (
        if "!OLD_VERSION!"=="!VERSION!" (
            if "!OLD_LASTVERSION!"=="!lastversion!" (
                if "!language!"=="EN" echo !RED![FAILED: Wait for the next build update.] . . .
                if "!language!"=="FR" echo !RED![ECHEC: Attendez la prochaine mise à jour de la build.] . . .
                goto :CHECKERINTEGRITY
            )
        )
    )
)
if defined lastversion (
    echo !GREEN![!lastversion!] . . .
) else (
    if "!language!"=="EN" echo !RED![FAILED] . . .
    if "!language!"=="FR" echo !RED![ECHEC] . . .
)
if !errorlevel!==1 call :CHECKER_SETUP_FOUND
if !errorlevel!==2 call :CHECKER_BUILD_FOUND
if defined lastversion (
    if "!VERSION:~1,7!" lss "!lastversion:~1,7!" (
        set t="WARNING: You are using an outdated version, you must know that it is unsafe to use it because web requests to Illegal Services proxy server will download the latest files instead of those used for this old version."
        call :MSGBOX 69680 "Illegal Services"
    )
)

:CHECKERINTEGRITY
if "!language!"=="EN" <nul set /p="!sp!Checking files integrity > "
if "!language!"=="FR" <nul set /p="!sp!Vérification de l'intégrite des fichiers > "
set x1=
for %%A in (lib\binread\x!ARCH!\binread.exe ChangeLog.txt COPYING EULA.rtf Illegal_Services.exe Tutorial.html lib\7za\x64\7za.dll lib\7za\x64\7za.exe lib\7za\x64\7zxa.dll lib\7za\x86\7za.dll lib\7za\x86\7za.exe lib\7za\x86\7zxa.dll lib\backgrounds\background-1.jpg lib\backgrounds\background-2.jpg lib\backgrounds\background-3.jpg lib\backgrounds\background-4.jpg lib\backgrounds\background-5.jpg lib\backgrounds\background-6.jpg lib\backgrounds\background-7.jpg lib\backgrounds\background-8.jpg lib\backgrounds\background-9.jpg lib\backgrounds\background-10.jpg lib\backgrounds\background-11.jpg lib\backgrounds\background-12.jpg lib\binread\x64\binread.exe lib\binread\x86\binread.exe lib\curl\x64\curl.exe lib\curl\x86\curl.exe lib\speak\extd.exe lib\speak\EN.lang lib\speak\FR.lang lib\speak\x64\speak-x64.exe lib\speak\x86\speak-x86.exe lib\bookmarks_parser.exe lib\cmdbkg.exe lib\cmdwiz.exe lib\OpenFileBox.exe lib\SaveFileBox.exe) do (
    if not exist %%A (
        call :MISSING_FILE %%A
        set "x2=%%A"
        call :CURL "%%A" "`git_raw_main`/!x2:\=/!" || (
            call :ERROR_FATAL %%A
        )
    )
)
if not defined x1 (
if "!language!"=="EN" echo  !GREEN![PASSED] . . .
if "!language!"=="FR" echo  !GREEN![PASSER] . . .
)

:CHECKERWINDOWS
if "!language!"=="EN" <nul set /p="!sp!Checking Windows version > "
if "!language!"=="FR" <nul set /p="!sp!Vérification de votre version de Windows > "
<nul set /p="!GREEN![!WINDOWS_VERSION!], [x!ARCH!], "
if defined CP (
    set CP=
)
for /f "tokens=2delims=:." %%A in ('chcp') do (
    set /a "CP=%%A"
)
if not defined CP (
    set CP=?
)
if "!CP!"=="65001" (
    <nul set /p="!GREEN![CHCP:!CP!] . . ."
) else (
    <nul set /p="!RED![CHCP:!CP!] . . ."
)
echo:
if not "!CP!"=="65001" (
    call :ERROR_FATAL CHCP
)

:LAUNCHER_APPLY_SETTINGS
if "!language!"=="EN" <nul set /p="!sp!Applying your settings > "
if "!language!"=="FR" <nul set /p="!sp!Applique vos paramètres > "
call :APPLY_BACKGROUND_SETTINGS
call :CHECK_UNTRUSTEDWEBSITESWARNING
if "!language!"=="EN" echo !GREEN![PASSED] . . .
if "!language!"=="FR" echo !GREEN![PASSER] . . .

:LAUNCHER_START
call :ROSE "Welcome Back"
if "!language!"=="EN" <nul set /p="!sp!Starting Illegal Services > "
if "!language!"=="FR" <nul set /p="!sp!Démarrage d'Illegal Services > "
set "CHECKED=!CYAN![!YELLOW!x!CYAN!]!WHITE! "
set "UNCHECKED=!CYAN![ ]!WHITE! "
set /a c1=0, c2=0, untrusted_website_index=0
call :CHECK_VOICEASSISTANTCHOICE
if "!VoiceAssistantChoice!"=="1" call :ROSE_SETUP
if "!language!"=="EN" echo !GREEN![PASSED] . . .
if "!language!"=="FR" echo !GREEN![PASSER] . . .
:L1
for %%A in (extd speak-x!ARCH!) do tasklist /fo csv /fi "imagename eq %%A.exe" | >nul findstr /c:"%%A.exe" && goto :L1
if "!VoiceAssistant!"=="0" >nul timeout /t 1 /nobreak
call :SCALE 125 29
if "!language!"=="EN" (
    set el=Main Menu
    set t2=9
) else if "!language!"=="FR" (
    set el=Menu Principal
    set t2=14
)
set "el=!el! |Git !git_backup!proxy: !git!| - Illegal Services"
for /l %%A in (1,1,%t2%) do (
    title !DEBUG!!el:~0,%%A!
    !cmdwiz.exe! delay 5
)

:MAINMENU
if "!language!"=="EN" (
    set t=Main Menu
) else if "!language!"=="FR" (
    set t=Menu Principal
)
title !#TITLE:`=%t% ^|Git %git_backup%proxy: %git%^|!
call :ROSE "Main Menu"
call :SCALE 125 29
echo !BRIGHTBLACK!
call :DRAW_LOGO
echo !CYAN!
echo !\E![19C╔═════════════════════════════════════════════════════════════════════════════════════╗
<nul set /p=!BRIGHTRED!                                  !UNDERLINE!!VERSION:~0,8!!UNDERLINEOFF!             !RED!█!BGYELLOW! MAIN MENU !BGBLACK!!RED!█!BGBLACK!!BRIGHTRED!
if "!language!"=="EN" (set t=Welcome) else set t=Bienvenue
call :DRAW_CUSTOM_CENTER 37 "!UNDERLINE!!t! !IS_Username!!UNDERLINEOFF!!CYAN!"
echo !\E![19C╠═════════════════════════════════════════════════════════════════════════════════════╣
echo !\E![19C║    !YELLOW!1!CYAN!  ^>  !WHITE!Internet Protocol TV (IPTV)!CYAN!    █    !YELLOW!10!CYAN!  ^>  !WHITE!IP Denial of Services (DDoS)!CYAN!    ║
echo !\E![19C║    !YELLOW!2!CYAN!  ^>  !WHITE!Direct Download Link (DDL)!CYAN!     █    !YELLOW!11!CYAN!  ^>  !WHITE!IP Address Lookup!CYAN!               ║
echo !\E![19C║    !YELLOW!3!CYAN!  ^>  !WHITE!Streaming!CYAN!                      █    !YELLOW!12!CYAN!  ^>  !WHITE!IP Port Scanning!CYAN!                ║
echo !\E![19C║    !YELLOW!4!CYAN!  ^>  !WHITE!Torrenting!CYAN!                     █    !YELLOW!13!CYAN!  ^>  !WHITE!IP Port Pinger!CYAN!                  ║
echo !\E![19C║    !YELLOW!5!CYAN!  ^>  !WHITE!Subtitles!CYAN!                      █    !YELLOW!14!CYAN!  ^>  !WHITE!IP Pinger!CYAN!                       ║
echo !\E![19C║    !YELLOW!6!CYAN!  ^>  !WHITE!Cracked Windows apps/games!CYAN!     █    !YELLOW!15!CYAN!  ^>  !WHITE!IP Loggers!CYAN!                      ║
echo !\E![19C║    !YELLOW!7!CYAN!  ^>  !WHITE!Modded Android apps/games!CYAN!      █    !YELLOW!16!CYAN!  ^>  !WHITE!Doxing!CYAN!                          ║
echo !\E![19C║    !YELLOW!8!CYAN!  ^>  !WHITE!YouTube Downloader!CYAN!             █    !YELLOW!17!CYAN!  ^>  !WHITE!Portable Apps!CYAN!                   ║
echo !\E![19C║    !YELLOW!9!CYAN!  ^>  !WHITE!Useful Websites!CYAN!                █    !YELLOW!18!CYAN!  ^>  !WHITE!More Features!CYAN!                   ║
echo !\E![19C╠═════════════════════════════════════════════════════════════════════════════════════╣
if "!language!"=="EN" echo !\E![19C║    !YELLOW!C!CYAN!  ^>  !WHITE!Credits!CYAN!!UNDERLINEOFF!     ║    !YELLOW!N!CYAN!  ^>  !BRIGHTRED!Our Social Networks!CYAN!    ║      !YELLOW!S!CYAN!  ^>  !WHITE!Settings!CYAN!!UNDERLINEOFF!        ║
if "!language!"=="FR" echo !\E![19C║    !YELLOW!C!CYAN!  ^>  !WHITE!Crédits!CYAN!!UNDERLINEOFF!     ║    !YELLOW!R!CYAN!  ^>  !BRIGHTRED!Nos Réseaux Sociaux!CYAN!    ║      !YELLOW!P!CYAN!  ^>  !WHITE!Paramètres!CYAN!!UNDERLINEOFF!      ║
echo !\E![19C╚═════════════════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
call :CHECK_FIRSTLAUNCH
if "!FirstLaunch!"=="1" (
    if "!VERSION:~5,3!"=="0.0" (
        if "!language!"=="EN" (
            set t="News in !VERSION:~0,8!, in this update:!\N!!\N!I updated:!\N!- IP Address Lookup!\N!!\N!I added:!\N!- IS bookmarks parser. (Illegal Services x IS.bookmarks.html)!\N!- Support for Windows 11. (but unfortunately had to drop support for Windows 7, 8 and 8.1)!\N!- Multiple checkbox choices.!\N!!\N!Updated many categories, fixed various bugs and improved the source code.!\N!!\N!For a full version of the ChangeLog:!\N!%~dp0ChangeLog.txt"
            call :MSGBOX 69696 "News - Illegal Services"
        )
        if "!language!"=="FR" (
            set t="Nouveautés dans la !VERSION:~0,8!, dans cette mise à jour:!\N!!\N!J'ai mis à jour:!\N!- IP Address Lookup!\N!!\N!J'ai ajouté:!\N!- IS bookmarks parseur. (Illegal Services x IS.bookmarks.html)!\N!- Support pour Windows 11. (mais a malheureusement dû abandonner le support de Windows 7, 8 et 8.1)!\N!- Plusieurs choix de cases à cocher.!\N!!\N!Mise à jour de nombreuses catégories, corrigé divers bugs et améliorer le code source.!\N!!\N!Pour une version complète du ChangeLog:!\N!%~dp0ChangeLog.txt"
            call :MSGBOX 69696 "Nouveautés - Illegal Services"
        )
        >nul reg add "!IS_REG!" /v "FirstLaunch" /t REG_DWORD /d 0 /f
    )
)
if "!language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!HELP!BRIGHTBLACK!" / "!YELLOW!FAQ!BRIGHTBLACK!" / "!YELLOW!CHANGELOG!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
for %%A in (3 4) do if "!x!"=="1%%A" call :CHECK_INTERNET || (call :ERROR_INTERNET & goto :MAINMENU)
for %%A in (
    "1`Internet Protocol Television (IPTV)"
    "2`Direct Download Link (DDL)"
    "3`Streaming"
    "4`Torrenting"
    "5`Subtitles"
    "6`Cracked Windows apps/games"
    "7`Modded Android apps/games"
    "9`Useful Websites"
    "15`IP Loggers"
    "16`Doxing"
    "17`Portable Apps"
) do (
    for /f "tokens=1,2delims=`" %%B in ("%%~A") do (
        if "!x!"=="%%B" (
            set "category_folder=%%C"
            start "" "%~nx0" IS_BOOKMARKS_PARSER
            goto :MAINMENU
        )
    )
)
if "!x!"=="8" goto :YOUTUBEDL
if "!x!"=="10" goto :DDOS
if "!x!"=="11" goto :IPLOOKUP
if "!x!"=="12" goto :PORT
if "!x!"=="13" goto :PINGERPORT
if "!x!"=="14" goto :IPPINGER
if "!x!"=="17" goto :PORTABLEAPPS
if "!x!"=="18" goto :MOREFEATURES
call :CHOOSE Crédits && goto :CREDITS
if "!language!"=="EN" set t=Networks
if "!language!"=="FR" set t=Réseaux
call :CHOOSE !t! && (
    start "" "https://illegal-services.github.io/Illegal_Services/" && !cmdwiz.exe! delay 1500
    start "" "https://github.com/Illegal-Services/Illegal_Services" && !cmdwiz.exe! delay 1500
    start "" "https://t.me/illegal_services_forum" && !cmdwiz.exe! delay 1500
    start "" "https://t.me/illegal_services" && !cmdwiz.exe! delay 1500
    start "" "https://discord.gg/rU2w2E83KF" && !cmdwiz.exe! delay 1500
    start "" "https://chrome.google.com/webstore/detail/illegal-services-bookmark/dkddkjnnbeohinbbcfdklcehcmgpdofi"
    REM start "" "https://addons.mozilla.org/addon/illegal-services"
    goto :MAINMENU
)
if "!language!"=="EN" set t=Settings
if "!language!"=="FR" set t=Paramètres
call :CHOOSE !t! && goto :SETTINGS
call :CHOOSE HELP && (start /max "" "tutorial.html" & goto :MAINMENU)
call :CHOOSE CHANGELOG && (start /max "" "changeLog.txt" & goto :MAINMENU)
call :CHOOSE FAQ && (call :SHOW_WINDOW "Frequently Asked Questions" || (start "" "%~f0" FAQ) & goto :MAINMENU)
if /i "!x!"=="--dump" (
    call :LOGGING_GET_DATE_TIME
    if not exist "!IS_OUTPUT_DIRECTORY_LOGS!\user\!date_time!\" (
        md "!IS_OUTPUT_DIRECTORY_LOGS!\user\!date_time!\"
    )
    >"!IS_OUTPUT_DIRECTORY_LOGS!\user\!date_time!\DUMP.log" (
        echo errorlevel=%errorlevel%
        set "
    )
    start "" "!IS_OUTPUT_DIRECTORY_LOGS!\user\!date_time!"
    goto :MAINMENU
) else if /i "!x!"=="--dump-IS" (
    call :LOGGING_GET_DATE_TIME
    if not exist "!IS_OUTPUT_DIRECTORY_LOGS!\user\!date_time!\" (
        md "!IS_OUTPUT_DIRECTORY_LOGS!\user\!date_time!\"
    ) else if exist "!IS_OUTPUT_DIRECTORY_LOGS!\user\!date_time!\DUMP_IS.log" (
        del /f /q "!IS_OUTPUT_DIRECTORY_LOGS!\user\!date_time!\DUMP_IS.log"
    )
    for /f "tokens=1*delims==" %%A in ('set') do (
        if "!LOOKUP_DUMP_IS_EXCLUDED_NOT_IS_VARIABLES:`%%A`=!"=="!LOOKUP_DUMP_IS_EXCLUDED_NOT_IS_VARIABLES!" (
            >>"!IS_OUTPUT_DIRECTORY_LOGS!\user\!date_time!\DUMP_IS.log" (
                echo !"!%%A=%%B!"!
            )
        )
    )
    start "" "!IS_OUTPUT_DIRECTORY_LOGS!\user\!date_time!"
    goto :MAINMENU
)
call :ERRORMESSAGE
goto :MAINMENU

:CREDITS
call :SCALE 99 35
title !#TITLE:`=Credits!
call :ROSE Credits

:CONTINUECREDITS
call :SCALE 94 35
echo !CYAN!
echo !\E![39C═══════════════
echo !\E![38C// !RED!█!BGYELLOW!!BLACK! CREDITS !RED!█!BGBLACK!!CYAN! \\
echo !\E![9C╔══════════════════════════════════════════════════════════════════════════╗
echo !\E![9C╠═══════════════════════════■█!BGYELLOW!!RED!█ DEPENDENCIES █!BGBLACK!!CYAN!█■═══════════════════════════╣
echo !\E![9C║                                                                          ║
echo !\E![9C║      !YELLOW!1!CYAN!  ^>  !WHITE!Advanced Installer   : 'Setup installer'!CYAN!                      ║
echo !\E![9C║      !YELLOW!2!CYAN!  ^>  !WHITE!Speak by soyalk 2019 : 'Rose voice assistant'!CYAN!                 ║
echo !\E![9C║      !YELLOW!3!CYAN!  ^>  !WHITE!Speak by Fatih Kodak : 'Rose voice assistant'!CYAN!                 ║
echo !\E![9C║      !YELLOW!4!CYAN!  ^>  !WHITE!Open/SaveFileBox     : 'Open/Save file box dialog'!CYAN!            ║
echo !\E![9C║      !YELLOW!5!CYAN!  ^>  !WHITE!Bookmarks Parser     : 'Parse IS bookmarks HTML file.'!CYAN!        ║
echo !\E![9C║      !YELLOW!6!CYAN!  ^>  !WHITE!binread : 'Read files in hexadecimal format'!CYAN!                  ║
echo !\E![9C║      !YELLOW!7!CYAN!  ^>  !WHITE!7za     : 'Decompressing tool'!CYAN!                                ║
echo !\E![9C║      !YELLOW!8!CYAN!  ^>  !WHITE!curl    : 'Web requests'!CYAN!                                      ║
echo !\E![9C║      !YELLOW!9!CYAN!  ^>  !WHITE!CmdBkg  : 'Background image'!CYAN!                                  ║
echo !\E![9C║     !YELLOW!10!CYAN!  ^>  !WHITE!CmdWiz  : 'Background transparency, Hide cursor, ...'!CYAN!         ║
echo !\E![9C║                                                                          ║
echo !\E![9C╠══════════════════════■█!BGYELLOW!!RED!█ DEVELOPERS and HELPERS █!BGBLACK!!CYAN!█■══════════════════════╣
echo !\E![9C║                                                                          ║
echo !\E![9C║                   !YELLOW!11!CYAN!  ^>  !WHITE!Program Dream Discord Server!CYAN!                    ║
echo !\E![9C║                   !YELLOW!12!CYAN!  ^>  !WHITE!server.bat Discord Server!CYAN!                       ║
echo !\E![9C║                   !YELLOW!13!CYAN!  ^>  !WHITE!@anic17!CYAN!                                         ║
echo !\E![9C║                   !YELLOW!14!CYAN!  ^>  !WHITE!@^<Tim^>!CYAN!                                          ║
echo !\E![9C║                   !YELLOW!15!CYAN!  ^>  !WHITE!@sintrode!CYAN!                                       ║
echo !\E![9C║                   !YELLOW!16!CYAN!  ^>  !WHITE!@Grub4K!CYAN!                                         ║
echo !\E![9C║                   !YELLOW!17!CYAN!  ^>  !WHITE!@Rosalyn!CYAN!                                        ║
echo !\E![9C║                   !YELLOW!18!CYAN!  ^>  !WHITE!@Ms.CatFire!CYAN!                                     ║
echo !\E![9C║                   !YELLOW!19!CYAN!  ^>  !WHITE!All other contributors!CYAN!                          ║
echo !\E![9C╚══════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
if "!x!"=="1" start "" "https://www.advancedinstaller.com/"
if "!x!"=="2" start "" "https://github.com/soyalk/speak-text-windows"
if "!x!"=="3" start "" "https://f2ko.de/programme/cmd-tools/"
if "!x!"=="4" start "" "https://www.robvanderwoude.com/dialogboxes.php"
if "!x!"=="5" start "" "https://pastebin.com/gUVdJGdP"
if "!x!"=="6" start "" "https://pastebin.com/gpiFrv1A"
if "!x!"=="7" start "" "https://www.7-zip.org/"
if "!x!"=="8" start "" "https://curl.se/"
if "!x!"=="9" start "" "https://www.dostips.com/forum/viewtopic.php?t=7407"
if "!x!"=="10" start "" "https://www.dostips.com/forum/viewtopic.php?t=7402"
if "!x!"=="11" start "" "https://discord.com/invite/eCMBHUB"
if "!x!"=="12" start "" "https://discord.com/invite/eXjp7PQ"
if "!x!"=="13" (
if "!language!"=="EN" set t="Helped improving and reducing code.!\N!!\N!Helped fixing a bug that where creating temporary files without deleting them.!\N!!\N!Helped improving IP Address Lookup API's.!\N!!\N!Helped adding launcher updater.!\N!!\N!Helping to find existing bugs and vulnerabilities.!\N!!\N!Helped to fix bugs related to user input in Regedit.!\N!!\N!Helped to find algorithm to download new database of 'IS.bookmarks.html' every day.!\N!!\N!Creator of 'binread.exe' source executable."
if "!language!"=="FR" set t="A aidé à améliorer et à réduire le code.!\N!!\N!A aidé à la correction d'un bug qui entraînait la création de fichiers temporaires sans les supprimer.!\N!!\N!A aidé à améliorer l'API de l'IP Address Lookup.!\N!!\N!A aidé à l'ajout des mises à jour du launcher.A aidé à trouver les bugs et vulnérabilitées existantes.!\N!!\N!A aidé à la correction de bugs liés à la saisie de l'utilisateur dans le Regedit.!\N!!\N!A aidé à trouver l'algorithme permettant de télécharger la nouvelle database de 'IS.bookmarks.html' tous les jours.!\N!!\N!A aidé à implémenter le parseur d'IS.bookmarks.html!\N!!\N!Créateur de l'exécutable 'binread.exe' dans la source."
call :MSGBOX 69696 "anic17 'Task failed successfully'"
start "" "https://github.com/anic17"
)
if "!x!"=="14" (
if "!language!"=="EN" set t="Helped improving and reducing code.!\N!!\N!Helped adding launcher updater.!\N!!\N!Helped creating windows repair.!\N!!\N!Helped adding Rose voice assistant."
if "!language!"=="FR" set t="A aidé à améliorer et à réduire le code.!\N!!\N!A aidé à l'ajout des mises à jour du launcher.!\N!!\N!A aidé à la création de windows repair.!\N!!\N!A aidé à l'ajout de l'assistante vocal Rose."
call :MSGBOX 69696 "<Tim>"
start "" "https://tim-greller.de/home/"
)
if "!x!"=="15" (
if "!language!"=="EN" set t="Helped improving and reducing code.!\N!!\N!Helped using curl for IS source.!\N!!\N!Helped adding Rose voice assistant.!\N!!\N!Helped adding choice verification.!\N!!\N!Helped adding Automatic proxy switcher.!\N!!\N!Helped to fix bugs related to user input in Regedit.!\N!!\N!Helped implementing the Windows 11 support.!\N!!\N!Helped implementing the IS.bookmarks.html parser."
if "!language!"=="FR" set t="A aidé à améliorer et à réduire le code.!\N!!\N!A aidé à l'utilisation de curl pour la source d'IS.!\N!!\N!A aidé à l'ajout de l'assistante vocale Rose.!\N!!\N!A aidé à l'ajout de la vérification des choix.!\N!!\N!A aidé à ajouter le proxy switcher automatique.!\N!!\N!A aidé à la correction de bugs liés à la saisie de l'utilisateur dans le Regedit.!\N!!\N!A aidé à implémenter le support de Windows 11."
call :MSGBOX 69696 "sintrode"
start "" "https://github.com/sintrode"
)
if "!x!"=="16" (
if "!language!"=="EN" set t="Helped improving and reducing code.!\N!!\N!Algorithm for checking a file signature.!\N!!\N!Created IS Bookmarks web extension.!\N!!\N!Created the timer in seconds to scan indexed websites.!\N!!\N!Fixed a bug with the stack memory overflow causing IS to crash.!\N!!\N!Created the code to center the text on the UI.!\N!!\N!Helped reducing curl PATH algorithm.!\N!!\N!Helped converting Illegal Services VBScript messages to UTF-8 encoding.!\N!!\N!Helped fixing a bug when user edits 'IP Lookup Saved.txt' but forgets the ending newline.!\N!!\N!Helped implementing the Windows 11 support.!\N!!\N!Helped implementing the IS.bookmarks.html parser."
if "!language!"=="FR" set t="A aidé à améliorer et à réduire le code.!\N!!\N!Algorithme de vérification de la signature d''un fichier.!\N!!\N!Création de l'extension web IS Bookmarks.!\N!!\N!Création de la minuterie en secondes du scan des sites internet indexés.!\N!!\N!Correction d'un bug avec le débordement de la mémoire de la pile provoquant le plantage d'IS.!\N!!\N!A créé le code pour centrer le texte sur l'UI.!\N!!\N!A aidé à convertir les messages VBScript d'Illegal Services en encodage UTF-8.!\N!!\N!A aidé à corriger un bug lorsque l'utilisateur modifie 'IP Lookup Saved.txt' mais oublie la nouvelle ligne de fin.!\N!!\N!A aidé à implémenter le support de Windows 11.!\N!!\N!A aidé à implémenter le parseur d'IS.bookmarks.html"
call :MSGBOX 69696 "Grub4K"
start "" "https://github.com/Grub4K"
)
if "!x!"=="17" (
if "!language!"=="EN" set t="Helping testing alpha versions.!\N!!\N!Helping to find existing bugs.!\N!!\N!Advised me in updating the CLI.!\N!!\N!Gave me a lot of motivation and encouragement.!\N!!\N!                                            *Notice you the shine ?"
if "!language!"=="FR" set t="A aidé à tester les versions alpha.!\N!!\N!A aidé à trouver les bugs existants.!\N!!\N!M'a conseillé dans la mise à jour de la CLI.!\N!!\N!M'a donné beaucoup de motivation et d'encouragement.!\N!!\N!                                                           *Notice you the shine ?"
call :MSGBOX 69696 "Rosalyn 'Shine brightest'"
)
if "!x!"=="18" (
if "!language!"=="EN" set t="Logo designer for v4.0"
if "!language!"=="FR" set t="Conceptrice du logo de la v4.0"
call :MSGBOX 69696 "Ms.CatFire"
)
if "!x!"=="19" (
if "!language!"=="EN" (
set t="@Agam - Added ON/OFF switches.!\N!@Vincent - Helped finding a bug with wrong choices.!\N!@cocorisss - Updated Python Port Scanner.!\N!@Chonkus - Added Internet Protocol TV (IPTV).!\N!@KiritoLeFakePK - Helped finding existing bugs.!\N!@Simi - Helped with some English translation.!\N!@Saltyy - Helped improving UI choices.!\N!@AMIT - Fixed 'ControlSet001' to 'CurrentControlSet'.!\N!@0x00 - Updated Glary Utilities crack.!\N!@0x00 - Helped finding a bug with Windows Update MiniTool.!\N!@0x00 - Added More Features Spoofing."
call :MSGBOX 69696 "All other contributors:"
set t="@blacktario - Added 23 websites.!\N!@0x00 - Added 8 websites.!\N!@LeSaintFisti - Added 6 websites.!\N!@Trident Security - Added 2 websites.!\N!@Grub4K - Added 2 websites.!\N!@Bastien - Added 1 website.!\N!@RaaFii1 - Added 1 website.!\N!@snipercat - Added 1 website.!\N!@PistachePoilue - Added 1 website.!\N!@FZ_PARRAIN_ZF - Added 1 website.!\N!@Eiralys - Added 1 website.!\N!@ayo - Added 1 website.!\N!@Zyker - Added 1 website.!\N!@Bлaд A4 - Added 1 website.!\N!@Lubomira - Added 1 website."
call :MSGBOX 69696 "All other contributors:"
)
if "!language!"=="FR" (
set t="@Agam - A ajouté les interrupteurs ON/OFF.!\N!@Vincent - A aidé à trouver un bug avec les mauvais choix.!\N!@cocorisss - Mise à jour du Port Scanner Python.!\N!@Chonkus - A ajouté Internet Protocol TV (IPTV).!\N!@KiritoLeFakePK - A aidé à trouver les bugs existants.!\N!@Simi - A aidé pour certaines traductions Anglaise.!\N!@Saltyy - A aidé à améliorer les choix d'interface utilisateur.!\N!@AMIT - A corrigé 'ControlSet001' vers 'CurrentControlSet'.!\N!@0x00 - Mise à jour du crack de Glary Utilities.!\N!@0x00 - A aidé à trouver un bug avec Windows Update MiniTool.!\N!@0x00 - A ajouté More Features Spoofing."
call :MSGBOX 69696 "Tous les autres contributeurs:"
set t="@blacktario - A ajouté 23 sites internet.!\N!@0x00 - A ajouté 8 sites internet.!\N!@LeSaintFisti - A ajouté 6 sites internet.!\N!@Trident Security - A ajouté 2 sites internet.!\N!@Grub4K - A ajouté 2 sites internet.!\N!@Bastien - A ajouté 1 site internet.!\N!@RaaFii1 - A ajouté 1 site internet.!\N!@snipercat - A ajouté 1 site internet.!\N!@PistachePoilue - A ajouté 1 site internet.!\N!@FZ_PARRAIN_ZF - A ajouté 1 site internet.!\N!@Eiralys - A ajouté 1 site internet.!\N!@ayo - A ajouté 1 site internet.!\N!@Zyker - A ajouté 1 site internet.!\N!@Bлaд A4 - A ajouté 1 site internet.!\N!@Lubomira - A ajouté 1 site internet."
call :MSGBOX 69696 "Tous les autres contributeurs:"
)
)
for /l %%A in (1,1,19) do if "!x!"=="%%A" goto :CONTINUECREDITS
call :CHOOSE BACK && goto :MAINMENU
call :ERRORMESSAGE
goto :CONTINUECREDITS

:SETTINGS
call :SCALE 113 26
title !#TITLE:`=Settings!
call :ROSE Settings

:CLEARSETTINGS
call :CHECK_SETTINGS
if !BackgroundTransparency! lss 10 (set "el= ") else set el=
if "!language!"=="EN" (
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
)
if "!DeveloperMode!"=="0" (
set "DeveloperModeInfo=Developer mode !CYAN!(!RED!OFF!!CYAN!)                     ║"
)
)
if "!language!"=="FR" (
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
)
if "!DeveloperMode!"=="0" (
set "DeveloperModeInfo=Mode développeur !CYAN!(!RED!OFF!!CYAN!)                   ║"
)
)

:CONTINUESETTINGS
call :SCALE 113 26
title !#TITLE:`=Settings!
echo !CYAN!
if "!language!"=="EN" (
echo !\E![47C════════════════
echo !\E![46C// !RED!█!BGYELLOW!!BLACK! SETTINGS !RED!█!BGBLACK!!CYAN! \\
)
if "!language!"=="FR" (
echo !\E![46C══════════════════
echo !\E![45C// !RED!█!BGYELLOW!!BLACK! PARAMETRES !RED!█!BGBLACK!!CYAN! \\
)
echo !\E![7C╔═════════════════════════════════════════════╦═══════════════════════════════════════════════════╗
if "!language!"=="EN" echo !\E![7C╠═════════════■█!BGYELLOW!!RED!█ WALLPAPERS █!BGBLACK!!CYAN!█■══════════════╬═════════════════■█!BGYELLOW!!RED!█ SETTINGS █!BGBLACK!!CYAN!█■══════════════════╣
if "!language!"=="FR" echo !\E![7C╠════════════■█!BGYELLOW!!RED!█ FOND D'ECRANS █!BGBLACK!!CYAN!█■════════════╬════════════════■█!BGYELLOW!!RED!█ PARAMETRES █!BGBLACK!!CYAN!█■═════════════════╣
echo !\E![7C║                                             ║                                                   ║
echo !\E![7C║    !YELLOW!1!CYAN!  ^>  !WHITE!Kirito 1 (IS v1.4 icon)!CYAN!            ║   !YELLOW!13!CYAN!  ^>  !WHITE!!BackgroundTransparencyInfo!
echo !\E![7C║    !YELLOW!2!CYAN!  ^>  !WHITE!Kirito 2!CYAN!                           ║   !YELLOW!14!CYAN!  ^>  !WHITE!!BackgroundBorderTransparencyInfo!
echo !\E![7C║    !YELLOW!3!CYAN!  ^>  !WHITE!Kirito 3!CYAN!                           ║   !YELLOW!15!CYAN!  ^>  !WHITE!!BackgroundDisabledInfo!
echo !\E![7C║    !YELLOW!4!CYAN!  ^>  !WHITE!Kirito 4!CYAN!                           ║   !YELLOW!16!CYAN!  ^>  !WHITE!!UntrustedWebsitesWarningInfo!
echo !\E![7C║    !YELLOW!5!CYAN!  ^>  !WHITE!49206C6F766520796F75204C697361!CYAN!     ║   !YELLOW!17!CYAN!  ^>  !WHITE!!VoiceAssistantInfo!
echo !\E![7C║    !YELLOW!6!CYAN!  ^>  !WHITE!Even Roses are colorless !CYAN!          ║   !YELLOW!18!CYAN!  ^>  !WHITE!!DeveloperModeInfo!
if "!language!"=="EN" echo !\E![7C║    !YELLOW!7!CYAN!  ^>  !WHITE!Tree!CYAN!                               ║   !YELLOW!19!CYAN!  ^>  !WHITE!Scan down or changed domain websites.!CYAN!    ║
if "!language!"=="FR" echo !\E![7C║    !YELLOW!7!CYAN!  ^>  !WHITE!Arbre!CYAN!                              ║   !YELLOW!19!CYAN!  ^>  !WHITE!Scan les sites internet indexés.!CYAN!         ║
if "!language!"=="EN" echo !\E![7C║    !YELLOW!8!CYAN!  ^>  !WHITE!Dark Guy!CYAN!                           ║   !YELLOW!20!CYAN!  ^>  !WHITE!Check for updates.!CYAN!                       ║
if "!language!"=="FR" echo !\E![7C║    !YELLOW!8!CYAN!  ^>  !WHITE!Homme sombre!CYAN!                       ║   !YELLOW!20!CYAN!  ^>  !WHITE!Vérifiez les mises à jour.!CYAN!               ║
if "!language!"=="EN" echo !\E![7C║    !YELLOW!9!CYAN!  ^>  !WHITE!Girl eyes!CYAN!                          ║   !YELLOW!21!CYAN!  ^>  !WHITE!Change username.!CYAN!                         ║
if "!language!"=="FR" echo !\E![7C║    !YELLOW!9!CYAN!  ^>  !WHITE!Yeux fille!CYAN!                         ║   !YELLOW!21!CYAN!  ^>  !WHITE!Changer le nom d'utilisateur.!CYAN!            ║
if "!language!"=="EN" echo !\E![7C║   !YELLOW!10!CYAN!  ^>  !WHITE!World map (bytes)!CYAN!                  ║   !YELLOW!22!CYAN!  ^>  !WHITE!Change language to French.!CYAN!               ║
if "!language!"=="FR" echo !\E![7C║   !YELLOW!10!CYAN!  ^>  !WHITE!Carte du monde (bytes)!CYAN!             ║   !YELLOW!22!CYAN!  ^>  !WHITE!Changer la langue en Anglais.!CYAN!            ║
if "!language!"=="EN" echo !\E![7C║   !YELLOW!11!CYAN!  ^>  !WHITE!World map (Corona Virus)!CYAN!           ║   !YELLOW!23!CYAN!  ^>  !WHITE!Export/Import settings.!CYAN!                  ║
if "!language!"=="FR" echo !\E![7C║   !YELLOW!11!CYAN!  ^>  !WHITE!Carte du monde (Corona Virus)!CYAN!      ║   !YELLOW!23!CYAN!  ^>  !WHITE!Exporter/Importer les paramètres.!CYAN!        ║
if "!language!"=="EN" echo !\E![7C║   !YELLOW!12!CYAN!  ^>  !WHITE!World map (cool)!CYAN!                   ║   !YELLOW!24!CYAN!  ^>  !WHITE!Extract IS source code.!CYAN!                  ║
if "!language!"=="FR" echo !\E![7C║   !YELLOW!12!CYAN!  ^>  !WHITE!Carte du monde (cool)!CYAN!              ║   !YELLOW!24!CYAN!  ^>  !WHITE!Extraire le code source d'IS.!CYAN!            ║
echo !\E![7C║                                             ║                                                   ║
echo !\E![7C╚═════════════════════════════════════════════╩═══════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!OPEN!BRIGHTBLACK!" / "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
for %%A in (8,9) do if "!x!"=="1%%A" call :CHECK_INTERNET || (call :ERROR_INTERNET & goto :CONTINUESETTINGS)
for /l %%A in (1,1,12) do if "!x!"=="%%A" if defined WINDOWS_TERMINAL (
if "!language!"=="EN" set t="You can not access the background settings because you are using 'Windows Terminal'."
if "!language!"=="FR" set t="Vous ne pouvez pas accéder aux paramètres d'arrière-plan car vous utilisez 'Windows Terminal'."
call :MSGBOX 69680 "Illegal Services"
goto :CONTINUESETTINGS
) else goto :SETTING_BACKGROUND_WALLPAPER
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
if "!x!"=="24" goto :SETTING_EXTRACT_SOURCE
call :CHOOSE OPEN && (call :OPEN_FOLDER "!IS_OUTPUT_DIRECTORY!" SETTINGS & goto :CONTINUESETTINGS)
call :CHOOSE BACK && goto :MAINMENU
call :ERRORMESSAGE
goto :CONTINUESETTINGS

:SETTING_BACKGROUND_WALLPAPER
>nul reg add "!IS_REG!" /v "BackgroundWallpaper" /t REG_DWORD /d !x! /f
>nul reg add "!IS_REG!" /v "BackgroundDisabled" /t REG_DWORD /d 0 /f
call :APPLY_BACKGROUND_SETTINGS
goto :CLEARSETTINGS

:SETTING_BACKGROUND_TRANSPARENCY
echo:
if "!language!"=="EN" echo     Choose the transparency level from 1 to 100. We recommend a value beetwen 5 and 30 for a good looking.
if "!language!"=="FR" echo     Choisissez la transparence de 1 à 100. Nous recommandons une valeur entre 5 et 30 pour un bon rendu.
call :PROMPT
for /l %%A in (1,1,100) do if "!x!"=="%%A" (
>nul reg add "!IS_REG!" /v "BackgroundTransparency" /t REG_DWORD /d !x! /f
call :APPLY_BACKGROUND_SETTINGS
goto :CLEARSETTINGS
)
call :ERRORMESSAGE x "une valeur" value
goto :CLEARSETTINGS

:SETTING_BACKGROUND_BORDER_TRANSPARENCY
if "!BackgroundBorderTransparencyValue!"=="0" >nul reg add "!IS_REG!" /v "BackgroundBorderTransparency" /t REG_DWORD /d 1 /f
if "!BackgroundBorderTransparencyValue!"=="1" if "!BackgroundDisabled!"=="0" >nul 2>&1 reg add "!IS_REG!" /v "BackgroundBorderTransparency" /t REG_DWORD /d 0 /f
call :APPLY_BACKGROUND_SETTINGS
goto :CLEARSETTINGS

:SETTING_BACKGROUND
if "!BackgroundDisabled!"=="0" (
>nul reg add "!IS_REG!" /v "BackgroundDisabled" /t REG_DWORD /d 1 /f
>nul reg add "!IS_REG!" /v "BackgroundBorderTransparency" /t REG_DWORD /d 1 /f
)
if "!BackgroundDisabled!"=="1" >nul reg add "!IS_REG!" /v "BackgroundDisabled" /t REG_DWORD /d 0 /f
call :APPLY_BACKGROUND_SETTINGS
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
if "!language!"=="EN" echo !\E![15C^^!^^! You need to be part of the Illegal Services developers to enable that option ^^!^^!
if "!language!"=="FR" echo !\E![11C^^!^^! Vous devez faire partie des développeurs d'Illegal Services pour activer cette option ^^!^^!
echo =================================================================================================================
echo !CYAN!
if "!language!"=="EN" set t=Enter your developer license key
if "!language!"=="FR" set t=Entrez votre clé de licence développeur
%@SHOWCURSOR%
set _el=
set /p "_el=!t!: !YELLOW!"
%@HIDECURSOR%
echo:
if defined _el >nul 2>&1 reg add "!IS_REG!" /v "DeveloperMode" /t REG_DWORD /d !_el! /f
call :CHECK_DEVELOPERMODE
if "!DeveloperMode!"=="1" (
if "!language!"=="EN" set t="Developer mode has been activated successfully."
if "!language!"=="FR" set t="Le mode développeur a été activé avec succès."
call :MSGBOX 69696 "Illegal Services"
goto :CLEARSETTINGS
)
if "!DeveloperMode!"=="0" call :ERRORMESSAGE _el "une clé de license" "licence key"
goto :CLEARSETTINGS

:SETTING_VERSION
call :GET_VERSION
if !errorlevel!==0 (
if "!language!"=="EN" set t="Illegal Services is up to date.!\N!!\N!Current version: !VERSION!!\N!Latest version   : !lastversion!"
if "!language!"=="FR" set t="Illegal Services est à jour.!\N!!\N!Version actuelle : !VERSION!!\N!Dernière version: !lastversion!"
call :MSGBOX 69696 "Illegal Services"
)
if !errorlevel!==1 call :CHECKER_SETUP_FOUND
if !errorlevel!==2 call :CHECKER_BUILD_FOUND
goto :CONTINUESETTINGS

:SETTING_USERNAME
echo !CYAN!
if "!language!"=="EN" (
echo NOTE: 1. Leaving blank will replace the original username.
echo       2. Username cannot exceed 20 characters.
echo       3. Do not use the following characters: "^! %% ^^".
)
if "!language!"=="FR" (
echo NOTE: 1. Laisser vide remplacera le nom d'utilisateur d'origine.
echo       2. Le nom d'utilisateur ne peut pas dépasser 20 caractères.
echo       3. N'utiliser les caractères suivants: "^! %% ^^".
)
:L3
if "!language!"=="EN" set t="Enter your new username: "
if "!language!"=="FR" set t="Entrez votre nouveau nom d'utilisateur: "
setlocal DisableDelayedExpansion
call :INPUTBOX
setlocal EnableDelayedExpansion
if defined ID (
set "ID=!ID:%%=%%%%!"
if defined %ID:~1,-1% goto :ERROR_USERNAME
if not "!ID:~20!"=="" goto :ERROR_USERNAME
>nul reg add "!IS_REG!" /v "Username" /t REG_SZ /d "!ID:~0,20!" /f
) else >nul reg add "!IS_REG!" /v "Username" /t REG_SZ /d "!Username:~0,20!" /f
call :CHECK_USERNAME
if "!language!"=="EN" set t="Your new username has been changed to: '!IS_Username!'"
if "!language!"=="FR" set t="Votre nouveau nom d'utilisateur a été remplacé par: '!IS_Username!'"
call :MSGBOX 69696 "Illegal Services"
)
goto :CONTINUESETTINGS

:ERROR_USERNAME
echo:
call :ERRORMESSAGE ID "un nom d'utilisateur" username
goto :L3

:SETTING_LANGUAGE
if "!language!"=="EN" set t=FR
if "!language!"=="FR" set t=EN
>nul reg add "!IS_REG!" /v "Language" /t REG_SZ /d !t! /f
for %%A in (extd speak-x!ARCH!) do >nul 2>&1 taskkill /f /im "%%A.exe" /t
goto :CLEARSETTINGS

:SETTING_EXPORTIMPORT
echo !CYAN!
if "!language!"=="EN" echo Do you want to [!YELLOW!E!CYAN!]xport or [!YELLOW!I!CYAN!]mport your current settings ?
if "!language!"=="FR" echo Voulez-vous [!YELLOW!E!CYAN!]xporter ou [!YELLOW!I!CYAN!]mporter vos paramètres actuels ?
>nul choice /n /c EI
if !errorlevel!==1 goto :SETTING_EXPORT
if !errorlevel!==2 goto :SETTING_IMPORT
goto :CONTINUESETTINGS

:SETTING_EXPORT
if "!language!"=="EN" (
set t1=Registration Files
set t2=Save As
)
if "!language!"=="FR" (
set t1=Fichiers d'enregistrements
set t2=Enregistrer sous
)
set el=
for /f "delims=" %%A in ('!SaveFileBox.exe! IS_Settings.reg "!t1! (*.reg)|*.reg" "!IS_OUTPUT_DIRECTORY!" "!t2!" /f') do set "el=%%~A"
if not defined el goto :CONTINUESETTINGS
>nul 2>&1 reg export "!IS_REG!" "!el!" /y && (
if "!language!"=="EN" set t="Settings exported successfully.!\N!You can now import them using the generated file at:!\N!!\N!'!el!'"
if "!language!"=="FR" set t="Paramètres exportés avec succès.!\N!Vous pouvez maintenant les importer à l'aide du fichier généré à:!\N!!\N!'!el!'"
call :MSGBOX 69696 "Illegal Services"
goto :CONTINUESETTINGS
)
goto :SETTING_EXPORT

:SETTING_IMPORT
if "!language!"=="EN" (
set t1=Registration Files
set t2=Open
)
if "!language!"=="FR" (
set t1=Fichiers d'enregistrements
set t2=Ouvrir
)
set _el=
for /f "delims=" %%A in ('!OpenFileBox.exe! "!t1! (*.reg)|*.reg" "!IS_OUTPUT_DIRECTORY!" "!t2!"') do set "_el=%%~A"
if not defined _el goto :CONTINUESETTINGS
for %%A in ("!_el!") do if /i "%%~xA"==".reg" >nul 2>&1 find /i "[HKEY_CURRENT_USER\SOFTWARE\IB_U_Z_Z_A_R_Dl\Illegal Services]" "!_el!" && >nul 2>&1 reg import "!_el!" && (
for %%B in (LANGUAGE USERNAME YOUTUBEDLPRIORITY PORTPRIORITY FIRSTLAUNCH VOICEASSISTANT VOICEASSISTANTCHOICE YOUTUBEDLP YOUTUBEDLOUTPUTDIRECTORY YOUTUBEDLGEOBYPASS DEVELOPERMODE) do call :CHECK_%%B
call :APPLY_BACKGROUND_SETTINGS
if "!language!"=="EN" set t="Settings imported successfully from:!\N!!\N!'!_el!'"
if "!language!"=="FR" set t="Paramètres importés avec succès à partir de:!\N!!\N!'!_el!'"
call :MSGBOX 69696 "Illegal Services"
goto :CLEARSETTINGS
)
if "!language!"=="EN" set t="File '!_el!' invalid.!\N!!\N!You need to import a '*.reg' file exported from Illegal Services."
if "!language!"=="FR" set t="Le fichier '!_el!' est invalide.!\N!!\N!Vous devez importer un fichier '*.reg' exporté par Illegal Services."
call :MSGBOX 69680 "Illegal Services"
goto :SETTING_IMPORT

:SETTING_EXTRACT_SOURCE
if /i "!IS_PROCESS!"=="cmd.exe" (
    echo:
    if "!language!"=="EN" set t=ERROR: Impossible to extract the source code if you are running the batch file
    if "!language!"=="FR" set t=ERREUR: Impossible d'extraire le code source si vous exécutez le fichier batch
    echo !RED!!t! ^(!BAT_USED!^).!YELLOW!
    timeout /t 5
) else (
    if defined temp_pushd (
        set temp_pushd=
    )
    if defined BAT_USED (
        >nul Robocopy "!TMPF!" "!IS_OUTPUT_DIRECTORY!" "!BAT_USED!" /A-:SHTN /IS /IT /IM
        if !errorlevel!==1 (
            pushd "!IS_OUTPUT_DIRECTORY!" && (
                set temp_pushd=1
                if exist "!BAT_USED!" (
                    >nul move "!BAT_USED!" "Illegal_Services.bat.part1" && (
                        if exist "Illegal_Services.bat.part1" (
                            set "temp_VERSION=!VERSION:~1,7!"
                            if defined temp_VERSION (
                                set "temp_VERSION=!temp_VERSION:.=. !"
                            )
                            >"Illegal_Services.bat.part0" (
                                echo @ECHO OFF
                                echo REM  QBFC Project Options Begin
                                echo REM  HasVersionInfo: Yes
                                echo REM  Companyname: Illegal Services
                                echo REM  Productname: Illegal Services
                                echo REM  Filedescription: Illegal Services
                                echo REM  Copyrights: Copyright ^(C^) 2022 IB_U_Z_Z_A_R_Dl
                                echo REM  Trademarks: Copyright ^(C^) 2022 IB_U_Z_Z_A_R_Dl
                                echo REM  Originalname: Illegal_Services.exe
                                echo REM  Comments: Illegal Services
                                echo REM  Productversion:  !temp_VERSION!
                                echo REM  Fileversion:  !temp_VERSION!
                                echo REM  Internalname: Illegal_Services.exe
                                echo REM  Appicon: Ressources\Icons\icon.ico
                                echo REM  AdministratorManifest: Yes
                                echo REM  QBFC Project Options End
                                echo @ECHO ON
                            )
                            if exist "Illegal_Services.bat.part0" (
                                if defined temp_VERSION (
                                    set temp_VERSION=
                                )
                                >"Illegal_Services.bat.part2" (
                                    findstr /bevc:"@shift" "Illegal_Services.bat.part1"
                                )
                                if exist "Illegal_Services.bat.part2" (
                                    >nul copy /b "Illegal_Services.bat.part0"+"Illegal_Services.bat.part2" "Illegal_Services.bat"
                                    for %%A in (
                                        "Illegal_Services.bat.part0"
                                        "Illegal_Services.bat.part1"
                                        "Illegal_Services.bat.part2"
                                    ) do (
                                        del /f /q /a "%%~A"
                                    )
                                    if exist "Illegal_Services.bat" (
                                        cmd /c start "" "!IS_OUTPUT_DIRECTORY!"
                                        if "!language!"=="EN" set t="Successfully extracted source code under 'Illegal_Services.bat' name."
                                        if "!language!"=="FR" set t="Code source extrait avec succès sous le nom de 'Illegal_services.bat'."
                                        call :MSGBOX 69696 "Illegal Services"
                                        if "!language!"=="EN" set t="That said, this is not an authentic copy from the original Illegal Services source code.!\N!!\N!Do not run Illegal Services under this 'Illegal_Services.bat' batch file, it will break an important feature of Illegal Services.!\N!!\N!Use this one instead: !git_source:[404 Git proxy not found]=[404 Git proxy not found]. Maybe: https://github.com/Illegal-Services/Illegal_Services/tree/source!"
                                        if "!language!"=="FR" set t="Cela dit, ce n'est pas une copie authentique du code source original d'Illegal Services.!\N!!\N!N'utilisez pas Illegal Services avec ce fichier batch 'Illegal_Services.bat', cela cassera une fonctionnalité importante d'Illegal Services.!\N!!\N!Utilisez celui-ci à la place: !git_source:[404 Git proxy not found]=[404 Git proxy not found]. Maybe: https://github.com/Illegal-Services/Illegal_Services/tree/source!"
                                        call :MSGBOX 69680 "Illegal Services"
                                        goto :JUMP_EXIT_SETTING_EXTRACT_SOURCE
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    )
    if "!language!"=="EN" set t="Something went wrong and couldn't extract the source code."
    if "!language!"=="FR" set t="Une erreur s'est produite et n'a pas pu extraire le code source"
    call :MSGBOX 69680 "Illegal Services"
)
:JUMP_EXIT_SETTING_EXTRACT_SOURCE
if defined temp_pushd (
    set temp_pushd=
    popd
)
goto :CONTINUESETTINGS


:YOUTUBEDL
call :SCALE 104 32
title !#TITLE:`=YouTube Downloader!
call :ROSE "YouTube Downloader"

:CLEARYOUTUBEDL
for %%A in (YOUTUBEDLP YOUTUBEDLGEOBYPASS YOUTUBEDLPRIORITY YOUTUBEDLOUTPUTDIRECTORY) do call :CHECK_%%A
if "!language!"=="EN" (
set "YouTubeDLDirectoryInfo=Change download location!CYAN!                                   ║"
if "!YouTubeDLGeoBypass!"=="0" set "YouTubeDLGeoBypassInfo=Bypass geographic restriction !CYAN!(!RED!OFF!!CYAN!)                        ║"
if "!YouTubeDLGeoBypass!"=="1" set "YouTubeDLGeoBypassInfo=Bypass geographic restriction !CYAN!(!GREEN!ON!!CYAN!)                         ║"
)
if "!language!"=="FR" (
set "YouTubeDLDirectoryInfo=Changer l'emplacement de téléchargement!CYAN!                    ║"
if "!YouTubeDLGeoBypass!"=="0" set "YouTubeDLGeoBypassInfo=Contournement de la restriction géographique !CYAN!(!RED!OFF!!CYAN!)         ║"
if "!YouTubeDLGeoBypass!"=="1" set "YouTubeDLGeoBypassInfo=Contournement de la restriction géographique !CYAN!(!GREEN!ON!!CYAN!)          ║"
)
if "!YouTubeDLP!"=="0" (
set youtube_dl_type=youtube-dl
set youtube_dl_executable=youtube-dl.exe
set "YouTubeDLPInfo=YouTube DLP !CYAN!(!RED!OFF!!CYAN!)                                          ║"
)
if "!YouTubeDLP!"=="1" (
set youtube_dl_type=yt-dlp
if "!ARCH!"=="64" (
    set youtube_dl_executable=yt-dlp.exe
) else (
    set youtube_dl_executable=yt-dlp_x86.exe
)
set "YouTubeDLPInfo=YouTube DLP !CYAN!(!GREEN!ON!!CYAN!)                                           ║"
)

:CONTINUEYOUTUBEDL
call :SCALE 104 32
echo !CYAN!
echo !\E![39C══════════════════════════
echo !\E![38C// !RED!█!BGYELLOW!!BLACK! YOUTUBE DOWNLOADER !RED!█!BGBLACK!!CYAN! \\
echo !\E![8C╔══════════════════════════════════════════════════════════════════════════════════════╗
if "!language!"=="EN" (set t1=Video Formats) & set t2=Audio Formats
if "!language!"=="FR" (set t1=Formats vidéo) & set t2=Formats Audio
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
if "!language!"=="EN" echo !\E![8C╠═══════════════════════════════════■█!BGYELLOW!!RED!█ Settings █!BGBLACK!!CYAN!█■═══════════════════════════════════╣
if "!language!"=="FR" echo !\E![8C╠══════════════════════════════════■█!BGYELLOW!!RED!█ Paramètres █!BGBLACK!!CYAN!█■══════════════════════════════════╣
echo !\E![8C║                                                                                      ║
echo !\E![8C║                    !YELLOW!15!CYAN!  ^> !WHITE! !YouTubeDLPInfo!
echo !\E![8C║                    !YELLOW!16!CYAN!  ^> !WHITE! !YouTubeDLDirectoryInfo!
echo !\E![8C║                    !YELLOW!17!CYAN!  ^> !WHITE! !YouTubeDLGeoBypassInfo!
echo !\E![8C╠══════════════════════════════════════════════════════════════════════════════════════╣
if "!language!"=="EN" (
echo !\E![8C║    !BRIGHTMAGENTA!YouTube DL automatically download the best quality as available at the source.!CYAN!    ║
echo !\E![8C║         !BRIGHTMAGENTA!We do not convert to 320 Kbps just for saying it's the best quality.!CYAN!         ║
)
if "!language!"=="FR" (
echo !\E![8C║ !BRIGHTMAGENTA!YouTube DL télécharge la meilleure qualité telle qu'elle est disponible à la source.!CYAN! ║
echo !\E![8C║ !BRIGHTMAGENTA!Nous ne convertissons pas à 320 Kbps juste pour dire que c'est la meilleure qualité.!CYAN! ║
)
echo !\E![8C╠══════════════════════════════════════════════════════════════════════════════════════╣
if "!language!"=="EN" set t=Download location:
if "!language!"=="FR" set t=Emplacement de téléchargement:
echo           !BRIGHTMAGENTA!!t!!WHITE! !YouTubeDLOutputDirectory!!CYAN!
echo !\E![8C╚══════════════════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
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
call :CHOOSE OPEN && (call :OPEN_FOLDER "!YouTubeDLOutputDirectory!" YOUTUBEDL & goto :CONTINUEYOUTUBEDL)
call :CHOOSE PRIORITY && goto :YOUTUBEDL_PRIORITY
call :CHOOSE INSTALL && goto :YOUTUBEDLINSTALL
call :CHOOSE BACK && goto :MAINMENU
call :ERRORMESSAGE
goto :CONTINUEYOUTUBEDL

:GOYOUTUBEDL
if !x! geq 1 (
    if !x! leq 6 (
        set youtube_dl_format=video
    )
)
if !x! geq 7 (
    if !x! leq 14 (
        set youtube_dl_format=audio
    )
)
if !x!==1 (
set o1=Convert to BEST
set a=--format bestvideo[ext=best]+bestaudio[ext=best]/best
)
if !x!==2 (
set o1=Convert to .mp4
set a=--merge-output-format mp4 --recode-video mp4
)
if !x!==3 (
set o1=Convert to .webm
set a=--format bestvideo[ext=best]+bestaudio[ext=best]/best --recode-video webm
)
if !x!==4 (
set o1=Convert to .flv
set a=--recode-video flv
)
if !x!==5 (
set o1=Convert to .mkv
set a=--merge-output-format mkv --recode-video mkv
)
if !x!==6 (
set o1=Convert to .avi
set a=--recode-video avi
)
if !x!==7 (
set o1=Convert to BEST
set a=--extract-audio --format bestaudio[ext=best]/best --audio-quality 0
)
if !x!==8 (
set o1=Convert to .mp3
set a=--extract-audio --audio-format mp3 --audio-quality 0
)
if !x!==9 (
set o1=Convert to .m4a
set a=--extract-audio --audio-format m4a --audio-quality 0
)
if !x!==10 (
set o1=Convert to .flac
set a=--extract-audio --audio-format flac --audio-quality 0
)
if !x!==11 (
set o1=Convert to .aac
set a=--extract-audio --audio-format aac --audio-quality 0
)
if !x!==12 (
set o1=Convert to .opus
set a=--extract-audio --audio-format opus --audio-quality 0
)
if !x!==13 (
set o1=Convert to .ogg
set a=--merge-output-format ogg --extract-audio --audio-format vorbis --audio-quality 0
)
if !x!==14 (
set o1=Convert to .wav
set a=--extract-audio --audio-format wav --audio-quality 0
)
echo !BRIGHTBLACK!
if "!language!"=="EN" set "t=Enter "
if "!language!"=="FR" set t=Entrer l'
%@SHOWCURSOR%
set url=
set /p "url=!t!URL: !YELLOW!"
%@HIDECURSOR%
call :CHECK_URL url URL || goto :CONTINUEYOUTUBEDL
set a=--add-metadata !a! "!url!"
echo !CYAN!
if not exist "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\youtube-dl\ffmpeg.exe" (
    call :CURL "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\youtube-dl\ffmpeg.7z" "`git_raw_downloads`/ffmpeg.7z" || (
        call :ERROR_INTERNET
        goto :CONTINUEYOUTUBEDL
    )
)
if not exist "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\youtube-dl\!youtube_dl_executable!" (
    if "!youtube_dl_type!"=="youtube-dl" (
        call :CURL "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\youtube-dl\!youtube_dl_executable!" "https://yt-dl.org/downloads/latest/!youtube_dl_executable!" || (
            call :ERROR_INTERNET
            goto :CONTINUEYOUTUBEDL
        )
    ) else if "!youtube_dl_type!"=="yt-dlp" (
        call :CURL "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\youtube-dl\!youtube_dl_executable!" "https://github.com/yt-dlp/yt-dlp/releases/latest/download/!youtube_dl_executable!" || (
            call :ERROR_INTERNET
            goto :CONTINUEYOUTUBEDL
        )
    )
)
pushd "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\youtube-dl"
if "!youtube_dl_type!"=="youtube-dl" (
    for %%A in (youtube-dl.exe.new youtube-dl-updater.bat) do (
        if exist "%%A" (
            del /f /q "%%~A"
        )
    )
)
if "!youtube_dl_type!"=="youtube-dl" (
    2>nul !youtube_dl_executable! -U --no-check-certificate | find /v /i "!youtube_dl_type! is up-to-date ("
) else if "!youtube_dl_type!"=="yt-dlp" (
    2>nul !youtube_dl_executable! -U --no-check-certificate | find /v /i "Latest version: " | find /v /i "!youtube_dl_type! is up to date (" | find /v /i "Current Build Hash"
)
:YOUTUBEDL_UPDATER
if "!youtube_dl_type!"=="youtube-dl" (
    if exist "youtube-dl-updater.bat" (
        goto :YOUTUBEDL_UPDATER
    )
    if exist "youtube-dl.exe.new" (
        del /f /q "youtube-dl.exe"
        ren "youtube-dl.exe.new" "youtube-dl.exe"
    )
)
popd
start "" "%~f0" YOUTUBEDL
goto :CONTINUEYOUTUBEDL

:YOUTUBEDLINSTALL
call :CURL "!TMPF!\vcredist_x86.exe" "https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x86.exe" || (call :ERROR_INTERNET & goto :CONTINUEYOUTUBEDL)
call :START_DOWNLOADED_FILE vcredist_x86.exe
goto :CONTINUEYOUTUBEDL

:YOUTUBEDLDIRECTORY
echo:
if "!language!"=="EN" echo NOTE: Leaving blank will replace the original download location.
if "!language!"=="FR" echo NOTE: Laisser vide remplacera l'emplacement de téléchargement originale.
echo:
if "!language!"=="EN" set t=Enter new download location
if "!language!"=="FR" set t=Entrer le nouvel emplacement de téléchargement
%@SHOWCURSOR%
set el=
set /p "el=!BRIGHTBLACK!!t!: !YELLOW!"
%@HIDECURSOR%
if defined el (
set "el=!el:"=!"
if "!el:~-1!"=="\" set "el=!el:~0,-1!"
for %%A in ("!el!") do >nul reg add "!IS_REG!" /v "YouTubeDLOutputDirectory" /t REG_SZ /d "%%~fA" /f
) else >nul 2>&1 reg delete "!IS_REG!" /v "YouTubeDLOutputDirectory" /f
call :CHECK_YOUTUBEDLOUTPUTDIRECTORY
goto :CONTINUEYOUTUBEDL

:YOUTUBEDL_PRIORITY
call :PRIORITY_PROCESS YouTubeDLPriority
>nul reg add "!IS_REG!" /v "YouTubeDLPriority" /t REG_SZ /d !YouTubeDLPriority! /f && (
if "!language!"=="EN" set t="YouTube Downloader priority has been replaced to: '!YouTubeDLPriority!'"
if "!language!"=="FR" set t="La priorité de YouTube Downloader a bien été remplacée par: '!YouTubeDLPriority!'"
call :MSGBOX 69696 "Illegal Services"
)
call :CHECK_YOUTUBEDLPRIORITY
goto :CONTINUEYOUTUBEDL

:DDOS
call :SCALE 89 34
title !#TITLE:`=Denial Of Services (DDoS)!
call :ROSE "IP Denial of Services"
if defined DDOS (
    set DDOS=
)

:CLEARDDOS
set db=redstresser.cc/welcome/index quez.in/ instant-stresser.com/ freestresser.to/ stresser.ai/ anonboot.com/ cryptostresser.com/ stressing.ninja/ str3ssed.co/ www.ipstresser.com/ ipstress.in/ royalstresser.com/ stresslab.sx/ stresser.zone/ vtoxicity.net/ stresser.gg/ ipstresser.io/ deltastress.com/ str3sser.io/ ddosforhire.net/
call :CLEAR 1

:CONTINUEDDOS
call :SCALE 89 34
echo !CYAN!
echo !\E![23C══════════════════════════════════════
echo !\E![22C// !RED!█!BGYELLOW!!BLACK! DENIAL OF SERVICES (100%% Free) !RED!█!BGBLACK!!CYAN! \\
echo !\E![8C╔════════════════════════════════╦══════════════════════════════════════╗
echo !\E![8C║   !1!redstresser.cc!CYAN!         ║  [BEST]         [  10/Gbps] [350/s]  ║
echo !\E![8C║   !2!quez.in!CYAN!                ║  [BEST]         [   5/Gbps] [300/s]  ║
echo !\E![8C║   !3!instant-stresser.com!CYAN!   ║  [BEST]         [   1/Gbps] [300/s]  ║
echo !\E![8C║   !4!freestresser.to!CYAN!        ║  [BEST]         [   1/Gbps] [300/s]  ║
echo !\E![8C║   !5!stresser.ai!CYAN!            ║  [BEST]         [   1/Gbps] [300/s]  ║
echo !\E![8C║   !6!anonboot.com!CYAN!           ║  [BEST]         [   ?/Gbps] [300/s]  ║
echo !\E![8C║   !7!cryptostresser.com!CYAN!     ║  [BEST]         [   ?/Gbps] [300/s]  ║
echo !\E![8C║   !8!stressing.ninja!CYAN!        ║  [BEST]         [   ?/Gbps] [300/s]  ║
echo !\E![8C║   !9!str3ssed.co!CYAN!            ║  [BEST]         [7-13/Gbps] [300/s]  ║
echo !\E![8C║  !10!www.ipstresser.com!CYAN!     ║                 [ 200/Mbps] [300/s]  ║
echo !\E![8C║  !11!ipstress.in!CYAN!            ║                 [   ?/Gbps] [250/s]  ║
echo !\E![8C║  !12!royalstresser.com!CYAN!      ║                 [   ?/Gbps] [200/s]  ║
echo !\E![8C║  !13!stresslab.sx!CYAN!           ║                 [8-20/Gbps] [120/s]  ║
echo !\E![8C║  !14!stresser.zone!CYAN!          ║                 [5-15/Gbps] [120/s]  ║
echo !\E![8C║  !15!vtoxicity.net!CYAN!          ║                 [ 100/Mbps] [120/s]  ║
echo !\E![8C║  !16!stresser.gg!CYAN!            ║                 [ 3-5/Gbps] [ 60/s]  ║
echo !\E![8C║  !17!ipstresser.io!CYAN!          ║                 [   2/Gbps] [ 60/s]  ║
echo !\E![8C║  !18!deltastress.com!CYAN!        ║                 [   ?/Gbps] [ 60/s]  ║
echo !\E![8C║  !19!str3sser.io!CYAN!            ║                 [   1/Gbps] [ 60/s]  ║
echo !\E![8C╠════════════════════════════════╩══════════════════════════════════════╣
if "!language!"=="EN" (
call :DRAW_CENTER "!BRIGHTMAGENTA!Illegal Services index only stressers in layer 4."
call :DRAW_CENTER "!BRIGHTMAGENTA!Last Updated: !WHITE!05/03/2022"
call :DRAW_CENTER "!BRIGHTMAGENTA!Alternatively you can visit: !20!ddosforhire.net"
)
if "!language!"=="FR" (
call :DRAW_CENTER "!BRIGHTMAGENTA!Illegal Services index seulement les stresseurs en layer 4."
call :DRAW_CENTER "!BRIGHTMAGENTA!Mise à jour le: !WHITE!05/03/2022"
call :DRAW_CENTER "!BRIGHTMAGENTA!Alternativement vous pouvez visiter: !20!ddosforhire.net"
)
echo !\E![8C!CYAN!╚═══════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
call :WEBSITECHECK && goto :CONTINUEDDOS
call :CHOOSE BACK && goto :MAINMENU
call :WEBSITESTART && goto :CLEARDDOS
call :ERRORMESSAGE
goto :CONTINUEDDOS

:IPLOOKUP
call :SCALE 73 27
title !#TITLE:`=IP Address Lookup!
call :ROSE "IP Address Lookup"

:CLEARIPLOOKUP
set db=check-host.net/ dnschecker.org/ www.iplocation.net/ www.ip-tracker.org/ whatismyipaddress.com/
call :CLEAR 4
if exist "!TMPF!\IS_Log.txt" del /f /q "!TMPF!\IS_Log.txt"

:CONTINUEIPLOOKUP
call :SCALE 73 27
title !#TITLE:`=IP Address Lookup!
echo !CYAN!
echo !\E![24C═════════════════════════
echo !\E![23C// !RED!█!BGYELLOW!!BLACK! IP ADDRESS LOOKUP !RED!█!BGBLACK!!CYAN! \\
echo !\E![17C╔═════════════════════════════════════╗
echo !\E![17C╠═■█!BGYELLOW!!RED!█  Illegal Services IP Lookup █!BGBLACK!!CYAN!█■═╣
echo !\E![17C║                                     ║
if "!language!"=="EN" echo !\E![17C║    !YELLOW!1!CYAN!  ^> !WHITE! View your IP!CYAN!               ║
if "!language!"=="FR" echo !\E![17C║    !YELLOW!1!CYAN!  ^> !WHITE! Regarder mon IP!CYAN!            ║
if "!language!"=="EN" echo !\E![17C║    !YELLOW!2!CYAN!  ^> !WHITE! Lookup an other IP!CYAN!         ║
if "!language!"=="FR" echo !\E![17C║    !YELLOW!2!CYAN!  ^> !WHITE! Regarder une autre IP!CYAN!      ║
if "!language!"=="EN" echo !\E![17C║    !YELLOW!3!CYAN!  ^> !WHITE! Lookup an other URL!CYAN!        ║
if "!language!"=="FR" echo !\E![17C║    !YELLOW!3!CYAN!  ^> !WHITE! Regarder une autre URL!CYAN!     ║
echo !\E![17C║                                     ║
if "!language!"=="EN" echo !\E![17C╠═════■█!BGYELLOW!!RED!█  IP Lookup websites █!BGBLACK!!CYAN!█■═════╣
if "!language!"=="FR" echo !\E![17C╠═■█!BGYELLOW!!RED!█  Sites Internet d'IP Lookup █!BGBLACK!!CYAN!█■═╣
echo !\E![17C║                                     ║
echo !\E![17C║    !4!check-host.net!CYAN!             ║
echo !\E![17C║    !5!dnschecker.org!CYAN!             ║
echo !\E![17C║    !6!www.iplocation.net!CYAN!         ║
echo !\E![17C║    !7!www.ip-tracker.org!CYAN!         ║
echo !\E![17C║                                     ║
if "!language!"=="EN" echo !\E![17C╠═══■█!BGYELLOW!!RED!█  IP Dynamic or Static ? █!BGBLACK!!CYAN!█■═══╣
if "!language!"=="FR" echo !\E![17C╠═■█!BGYELLOW!!RED!█  IP Dynamique ou Satique ? █!BGBLACK!!CYAN!█■══╣
echo !\E![17C║                                     ║
echo !\E![17C║    !8!whatismyipaddress.com!CYAN!      ║
echo !\E![17C╚═════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!READ!BRIGHTBLACK!" / "!YELLOW!DELETE!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
for %%A in (1 2 3) do if "!x!"=="%%A" call :CHECK_INTERNET || (
call :ERROR_INTERNET
goto :CLEARIPLOOKUP
)
if "!x!"=="1" (
title !#TITLE:`=Looking up ^> ...!
for /f %%A in ('curl.exe -fkLs "https://api.ipify.org"') do set "url=%%A"
call :CHECK_IP url && goto :IPLOOKUP_RESPONSE || goto :CLEARIPLOOKUP
)
if "!x!"=="2" call :IPLOOKUP_ENTER IP && goto :IPLOOKUP_RESPONSE || goto :CLEARIPLOOKUP
if "!x!"=="3" call :IPLOOKUP_ENTER IP/URL && goto :IPLOOKUP_RESPONSE || goto :CLEARIPLOOKUP
call :WEBSITECHECK && goto :CONTINUEIPLOOKUP
call :CHOOSE BACK && goto :MAINMENU
call :CHOOSE READ && (call :READ_IPLOOKUP & goto :CLEARIPLOOKUP)
call :CHOOSE DELETE && (call :DELETE_IPLOOKUP & goto :CLEARIPLOOKUP)
if not defined x for /l %%A in (!c1!,1,!c2!) do if "!%%A!"=="!YELLOW!%%A !CHECKED!" call :IPLOOKUP_ENTER IP/URL && goto :CLEARIPLOOKUP || goto :CONTINUEIPLOOKUP
call :ERRORMESSAGE
goto :CONTINUEIPLOOKUP

:IPLOOKUP_RESPONSE
set /a width=68, height=4
if not "!x!"=="3" set "fixed_url=!url!"
title !#TITLE:`=Looking up ^> %fixed_url%!
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
if "!el:~-1!"=="," set "el=!el:~0,-1!"
for /f "tokens=2delims=:" %%B in ("!el!") do if not "%%B"==" " (
set /a height+=1
if not defined WINDOWS_TERMINAL (
    mode !width!,!height!
)
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
if not defined WINDOWS_TERMINAL (
    mode !width!,!height!
)
>>"!TMPF!\IS_Log.txt" echo !el!
)
)
for /f "tokens=2delims=</" %%A in ('curl.exe -fkLs "http://ip-api.com/xml/!fixed_url!?fields=5775161"') do if not "%%~A"=="" (
set "el=%%A"
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
if not defined WINDOWS_TERMINAL (
    mode !width!,!height!
)
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
if "!el:~-1!"=="," set "el=!el:~0,-1!"
for /f "tokens=2delims=:" %%B in ("!el!") do if not "%%B"==" " (
set /a height+=1
if not defined WINDOWS_TERMINAL (
    mode !width!,!height!
)
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
if not defined WINDOWS_TERMINAL (
    mode !width!,!height!
)
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
if not defined WINDOWS_TERMINAL (
    mode !width!,!height!
)
>>"!TMPF!\IS_Log.txt" echo Pinging   : True
goto :__IPLOOKUP_RESPONSE
)
if not "!el::null=!"=="!el!" goto :_IPLOOKUP_RESPONSE
set /a height+=1
if not defined WINDOWS_TERMINAL (
    mode !width!,!height!
)
>>"!TMPF!\IS_Log.txt" echo Pinging   : False
)
)
:__IPLOOKUP_RESPONSE
set /a height+=1
if not defined WINDOWS_TERMINAL (
    mode !width!,!height!
)
cls
set el=
echo:
for /f "usebackqtokens=1,*delims=:" %%A in ("!TMPF!\IS_Log.txt") do echo     !BRIGHTRED!%%A:!CYAN!%%B
if exist "!IS_OUTPUT_DIRECTORY!\IP Lookup Saved.txt" >nul find /i "!fixed_url!" "!IS_OUTPUT_DIRECTORY!\IP Lookup Saved.txt" && (
set el=True
)
if not defined el set el=False
echo     !BRIGHTRED!Saved     : !CYAN!!el!
echo:
if "!language!"=="EN" set t=Do you want to
if "!language!"=="FR" set t=Voulez-vous
call :DRAW_CENTER "!BRIGHTBLACK!!t! Save (!YELLOW!S!BRIGHTBLACK!) / Ping (!YELLOW!P!BRIGHTBLACK!) / Back (!YELLOW!B!BRIGHTBLACK!) ?"

:IPLOOKUP_CHOICE
>nul choice /n /c SPB
if !errorlevel!==1 goto :IPLOOKUP_SAVE
if !errorlevel!==2 start "" "%~f0" PINGER
goto :CLEARIPLOOKUP

:IPLOOKUP_SAVE
if "!language!"=="EN" set t="Enter victim's name: "
if "!language!"=="FR" set t="Entrez le nom de la victime: "
call :INPUTBOX
if not exist "!IS_OUTPUT_DIRECTORY!\IP Lookup Saved.txt" (
    if not exist "!IS_OUTPUT_DIRECTORY!\" (
        md "!IS_OUTPUT_DIRECTORY!"
    )
    >"!IS_OUTPUT_DIRECTORY!\IP Lookup Saved.txt" (
        echo =============================================
    )
)
set "write_newline_file_path=!IS_OUTPUT_DIRECTORY!\IP Lookup Saved.txt"
call :CHECK_FILE_NEWLINE write_newline_file_path || (
    >>"!IS_OUTPUT_DIRECTORY!\IP Lookup Saved.txt" (
        echo:
    )
)
set write_newline_file_path=
>>"!IS_OUTPUT_DIRECTORY!\IP Lookup Saved.txt" (
    echo   Name: !ID! [!url!]
    echo =============================================
    type "!TMPF!\IS_Log.txt"
    echo =============================================
)
if "!language!"=="EN" set t="IP Lookup successfully saved at:!\N!!\N!'!IS_OUTPUT_DIRECTORY!\IP Lookup Saved.txt'!\N!!\N!Do you want to open it now ?"
if "!language!"=="FR" set t="IP Lookup enregistrés avec succès à:!\N!!\N!'!IS_OUTPUT_DIRECTORY!\IP Lookup Saved.txt'!\N!!\N!Voulez-vous l'ouvrir maintenant ?"
call :MSGBOX_LEVEL 69668 "Illegal Services"
if "!el!"=="6" start /max "" "!IS_OUTPUT_DIRECTORY!\IP Lookup Saved.txt"
goto :CLEARIPLOOKUP

:PORT
call :SCALE 101 33
title !#TITLE:`=IP Port Scanning!
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
if "!language!"=="EN" echo !\E![8C╠══════════════════════════════■█!BGYELLOW!!RED!█ Scan all Ports █!BGBLACK!!CYAN!█■═══════════════════════════════╣
if "!language!"=="FR" echo !\E![8C╠════════════════════════════■█!BGYELLOW!!RED!█ Scan tous les ports █!BGBLACK!!CYAN!█■════════════════════════════╣
echo !\E![8C║                                                                                   ║
if "!language!"=="EN" echo !\E![8C║                       !YELLOW!1!CYAN!  ^> !WHITE! Python: Scan all 65535 ports.!CYAN!                         ║
if "!language!"=="FR" echo !\E![8C║                     !YELLOW!1!CYAN!  ^> !WHITE! Python: Scan tous les 65535 ports.!CYAN!                      ║
if "!language!"=="EN" echo !\E![8C║                       !YELLOW!2!CYAN!  ^> !WHITE! NMAP  : Scan all 65535 ports.!CYAN!                         ║
if "!language!"=="FR" echo !\E![8C║                     !YELLOW!2!CYAN!  ^> !WHITE! NMAP  : Scan tous les 65535 ports.!CYAN!                      ║
echo !\E![8C╠═══════════════════════════════════════════════════════════════════════════════════╣
if "!language!"=="EN" echo !\E![8C╠═══════════════════════════■█!BGYELLOW!!RED!█ Scan Most Used Ports █!BGBLACK!!CYAN!█■════════════════════════════╣
if "!language!"=="FR" echo !\E![8C╠═════════════════════■█!BGYELLOW!!RED!█ Scan les ports les plus utilisés █!BGBLACK!!CYAN!█■══════════════════════╣
echo !\E![8C║                                                                                   ║
if "!language!"=="EN" echo !\E![8C║    !YELLOW!3!CYAN!  ^> !WHITE! NMAP: Scan only ports listeds in the file nmap-services.!CYAN!                 ║
if "!language!"=="FR" echo !\E![8C║    !YELLOW!3!CYAN!  ^> !WHITE! NMAP: Scan uniquement les ports listés dans le fichier nmap-services.!CYAN!    ║
if "!language!"=="EN" echo !\E![8C║    !YELLOW!4!CYAN!  ^> !WHITE! NMAP: Scan + than 1660 ports.!CYAN!                                            ║
if "!language!"=="FR" echo !\E![8C║    !YELLOW!4!CYAN!  ^> !WHITE! NMAP: Scan + de 1660 ports.!CYAN!                                              ║
if "!language!"=="EN" echo !\E![8C║    !YELLOW!5!CYAN!  ^> !WHITE! NMAP: Scan top most useds ports.!CYAN!                                         ║
if "!language!"=="FR" echo !\E![8C║    !YELLOW!5!CYAN!  ^> !WHITE! NMAP: Scan les principaux ports les plus utilisés.!CYAN!                       ║
if "!language!"=="EN" echo !\E![8C║    !YELLOW!6!CYAN!  ^> !WHITE! NMAP: Scan with version detection.!CYAN!                                       ║
if "!language!"=="FR" echo !\E![8C║    !YELLOW!6!CYAN!  ^> !WHITE! NMAP: Scan avec la détection de version.!CYAN!                                 ║
echo !\E![8C╠═══════════════════════════════════════════════════════════════════════════════════╣
if "!language!"=="EN" echo !\E![8C╠══════════════════════════■█!BGYELLOW!!RED!█ Custom Port Range Scan █!BGBLACK!!CYAN!█■═══════════════════════════╣
if "!language!"=="FR" echo !\E![8C╠═════════════════■█!BGYELLOW!!RED!█ Scan personnalisé de la plage des ports █!BGBLACK!!CYAN!█■═══════════════════╣
echo !\E![8C║                                                                                   ║
if "!language!"=="EN" echo !\E![8C║                   !YELLOW!7!CYAN!  ^> !WHITE! NMAP: Scan your range of custom ports!CYAN!                     ║
if "!language!"=="FR" echo !\E![8C║               !YELLOW!7!CYAN!  ^> !WHITE! NMAP: Scan votre plage personnalisé de ports.!CYAN!                 ║
echo !\E![8C╠═══════════════════════════════════════════════════════════════════════════════════╣
if "!language!"=="EN" set t=Description
if "!language!"=="FR" set t=Déscription
echo !\E![8C╠═══════════════════════════■█!BGYELLOW!!RED!█ Portlist !t! █!BGBLACK!!CYAN!█■════════════════════════════╣
echo !\E![8C║                                                                                   ║
echo !\E![8C║                             !8!www.adminsub.net!CYAN!                                ║
echo !\E![8C║                             !9!www.speedguide.net!CYAN!                              ║
echo !\E![8C║                            !10!www.iana.org!CYAN!                                    ║
echo !\E![8C║                            !11!portforward.com!CYAN!                                 ║
echo !\E![8C╚═══════════════════════════════════════════════════════════════════════════════════╝
echo:
>nul 2>&1 sc query npcap || (
if "!language!"=="EN" call :DRAW_CENTER "!RED!ERROR: !BRIGHTBLACK!To use NMAP, you must first choose: "!YELLOW!INSTALL!BRIGHTBLACK!""
if "!language!"=="FR" call :DRAW_CENTER "!RED!ERREUR: !BRIGHTBLACK!Pour utiliser NMAP, vous devez d'abord choisir: "!YELLOW!INSTALL!BRIGHTBLACK!""
echo:
)
if "!language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!BRIGHTBLACK!!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!INSTALL!BRIGHTBLACK!" / "!YELLOW!PRIORITY!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
for /l %%A in (1,1,7) do if "!x!"=="%%A" call :CHECK_INTERNET && goto :GOPORTSCANNING || (call :ERROR_INTERNET & goto :CONTINUEPORT)
call :WEBSITECHECK && goto :CONTINUEPORT
call :CHOOSE INSTALL && goto :NMAPINSTALL
call :CHOOSE PRIORITY && goto :PORT_PRIORITY
call :CHOOSE BACK && goto :MAINMENU
call :WEBSITESTART && goto :CLEARPORT
call :ERRORMESSAGE
goto :CONTINUEPORT

:GOPORTSCANNING
set o1=
set o2=
set a=
if "!x!"=="2" (
if "!language!"=="EN" set o1=all 65535 ports.
if "!language!"=="FR" set o1=tous les 65535 ports.
set o2=minimum 1 minute.
set a=-p-
)
if "!x!"=="3" (
if "!language!"=="EN" set o1=only ports listeds in the file nmap-services.
if "!language!"=="FR" set o1=uniquement les ports listés dans le fichier nmap-services.
set o2=minimum 3 seconds.
set a=-F
)
if "!x!"=="4" (
if "!language!"=="EN" set o1=+ than 1660 ports.
if "!language!"=="FR" set o1=+ de 1660 ports.
set o2=minimum 3 seconds.
)
if "!x!"=="5" (
if "!language!"=="EN" set o1=top most useds ports.
if "!language!"=="FR" set o1=Scan les principaux ports les plus utilisés.
set o2=minimum 13 seconds.
set a=--top-ports 65535
)
if "!x!"=="6" (
if "!language!"=="EN" set o1=Scan with version detection.
if "!language!"=="FR" set o1=Scan avec la détection de version.
set o2=minimum 19 seconds.
set a=-sV --allports
)
if "!x!"=="7" (
if "!language!"=="EN" set t=Enter start port
if "!language!"=="FR" set t=Entrer le port de début
set p1=
set /p "p1=!BRIGHTBLACK!!t!: !YELLOW!"
call :CHECK_PORT p1 || goto :CLEARPORT
if "!language!"=="EN" set t=Enter end port
if "!language!"=="FR" set t=Entrer le port de fin
set p2=
set /p "p2=!BRIGHTBLACK!!t!: !YELLOW!"
call :CHECK_PORT p2 || goto :CLEARPORT
set a=-p!p1!-!p2!
if "!language!"=="EN" set o1=Scan your range of custom ports.
if "!language!"=="FR" set o1=Scan votre plage personnalisé de ports.
set o2=Unknow.
)
if "!language!"=="EN" set "t=Enter "
if "!language!"=="FR" set t=Entrer l'
%@SHOWCURSOR%
set url=
set /p "url=!BRIGHTBLACK!!t!IP/URL: !YELLOW!"
call :CHECK_URL url IP/URL || goto :CLEARPORT
if not defined o1 (
if not exist "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\TCP_Port_Scanner.exe" call :CURL "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\TCP_Port_Scanner.exe" "`git_raw_downloads`/TCP_Port_Scanner.exe" || (call :ERROR_INTERNET & goto :CLEARPORT)
pushd "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!"
call :CHECK_PORTPRIORITY
start !PortPriority! TCP_Port_Scanner.exe "!fixed_url!"
popd
goto :CLEARPORT
)
set a=-Pn -T5 --open !a! "!fixed_url!"
set a=!a:  = !
if not exist "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\NMAP\nmap.exe" call :CURL "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\NMAP.7z" "`git_raw_downloads`/NMAP.7z" || (call :ERROR_INTERNET & goto :CLEARPORT)
start "" "%~f0" NMAP
goto :CLEARPORT

:NMAPINSTALL
call :CURL "!TMPF!\vcredist_x86.exe" "https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x86.exe" || (call :ERROR_INTERNET & goto :CONTINUEPORT)
call :START_DOWNLOADED_FILE vcredist_x86.exe
call :CURL "!TMPF!\npcap-1.60.exe" "https://nmap.org/npcap/dist/npcap-1.60.exe" || (call :ERROR_INTERNET & goto :CONTINUEPORT)
call :START_DOWNLOADED_FILE npcap-1.60.exe
goto :CONTINUEPORT

:PORT_PRIORITY
call :PRIORITY_PROCESS PortPriority
>nul reg add "!IS_REG!" /v "PortPriority" /t REG_SZ /d !PortPriority! /f && (
if "!language!"=="EN" set t="Port Scanning priority has been replaced to: '!PortPriority!'"
if "!language!"=="FR" set t="La priorité du Port Scanning a bien été remplacée par: '!PortPriority!'"
call :MSGBOX 69696 "Illegal Services"
)
goto :CONTINUEPORT

:PINGERPORT
title !#TITLE:`=IP Port Pinger!
call :ROSE "IP Port Pinger"
if "!language!"=="EN" set "t=Enter "
if "!language!"=="FR" set t=Entrer l'
%@SHOWCURSOR%
set url=
set /p "url=!BRIGHTBLACK!!t!IP/URL: !YELLOW!"
%@HIDECURSOR%
call :CHECK_URL url IP/URL || goto :MAINMENU
if "!language!"=="EN" set t=Enter Port
if "!language!"=="FR" set t=Entrer le Port
%@SHOWCURSOR%
set p1=
set /p "p1=!BRIGHTBLACK!!t!: !YELLOW!"
%@HIDECURSOR%
call :CHECK_PORT p1 || goto :MAINMENU
if not exist "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\paping.exe" call :CURL "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\paping.exe" "`git_raw_downloads`/paping.exe" || (call :ERROR_INTERNET & goto :MAINMENU)
pushd "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!"
start paping.exe !fixed_url! -p !p1!
popd
goto :MAINMENU

:IPPINGER
title !#TITLE:`=IP Pinger!
call :ROSE "IP Pinger"
if "!language!"=="EN" set "t=Enter "
if "!language!"=="FR" set t=Entrer l'
%@SHOWCURSOR%
set url=
set /p "url=!BRIGHTBLACK!!t!IP/URL: !YELLOW!"
%@HIDECURSOR%
call :CHECK_URL url IP/URL || goto :MAINMENU
start "" "%~f0" PINGER
goto :MAINMENU

:MOREFEATURES
call :SCALE 62 23
title !#TITLE:`=More Features!
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
echo !\E![11C║    !YELLOW!7 !WHITE!Spoofing!CYAN!                       ║
echo !\E![11C║    !YELLOW!8 !WHITE!Windows Repair!CYAN!                 ║
echo !\E![11C║    !YELLOW!9 !WHITE!Windows Tweaks!CYAN!                 ║
echo !\E![11C║   !YELLOW!10 !WHITE!Windows Game Booster!CYAN!           ║
echo !\E![11C║                                     ║
echo !\E![11C╚═════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
for %%A in (
    "1`Warez Content Creator"
    "2`Warez Wikis"
    "3`Release Logs"
    "4`Ebooks"
    "5`Musics"
    "6`Forum Websites"
    "7`Spoofing"
) do (
    for /f "tokens=1,2delims=`" %%B in ("%%~A") do (
        if "!x!"=="%%B" (
            set "category_folder=%%C"
            start "" "%~nx0" IS_BOOKMARKS_PARSER
            goto :CONTINUEMOREFEATURES
        )
    )
)
if "!x!"=="8" (
    goto :WINDOWSREPAIRS
) else if "!x!"=="9" (
    goto :WINDOWSTWEAKS
) else if "!x!"=="10" (
    goto :WINDOWSGAMEBOOSTER
)
call :CHOOSE BACK && goto :MAINMENU
call :ERRORMESSAGE
goto :CONTINUEMOREFEATURES

:WINDOWSREPAIRS
call :SCALE 70 26
title !#TITLE:`=Windows Repairs!
call :ROSE "Windows Repairs"

:CONTINUEWINDOWSREPAIRS
call :SCALE 70 26
title !#TITLE:`=Windows Repairs!
echo !CYAN!
echo !\E![26C══════════════════════
echo !\E![25C// !RED!█!BGYELLOW!!BLACK! WINDOWS REPAIRS !RED!█!BGBLACK!!CYAN! \\
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
if "!language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
if "!x!"=="1" start cmd /c sfc /ScanNow ^& pause ^& exit 0
if "!x!"=="2" start cmd /c Dism /Online /Cleanup-Image /RestoreHealth ^& pause ^& exit 0
if "!x!"=="3" start cmd /c chkdsk !SystemDrive! /F /R ^& pause ^& exit 0
if "!x!"=="4" if "!WINDOWS_VERSION!"=="10.0" (
    >nul chcp 437
    2>nul powershell -ExecutionPolicy Unrestricted Get-AppXPackage -AllUsers ^| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register \"$($_.InstallLocation)\AppXManifest.xml\"}
    >nul chcp 65001
) else (
    call :ERROR_WINDOWS_VERSION
)
if "!x!"=="5" if "!WINDOWS_VERSION!"=="10.0" (goto :REPAIR_WINDOWS_STORE) else call :ERROR_WINDOWS_VERSION
if "!x!"=="6" if "!WINDOWS_VERSION!"=="10.0" (goto :REPAIR_XBOX_GAME) else call :ERROR_WINDOWS_VERSION
if "!x!"=="7" goto :REPAIR_PUSH_NOTIFICATIONS
if "!x!"=="8" if "!WINDOWS_VERSION!"=="10.0" (goto :REPAIR_WIFI_HOTSPOT) else call :ERROR_WINDOWS_VERSION
if "!x!"=="9" if "!WINDOWS_VERSION!"=="10.0" (goto :REPAIR_CLIPBOARD_HISTORY) else call :ERROR_WINDOWS_VERSION
if "!x!"=="10" if "!WINDOWS_VERSION!"=="10.0" (goto :REPAIR_BACKGROUND_APPS) else call :ERROR_WINDOWS_VERSION
for /l %%A in (1,1,10) do if "!x!"=="%%A" goto :CONTINUEWINDOWSREPAIRS
call :CHOOSE BACK && goto :MOREFEATURES
call :ERRORMESSAGE
goto :CONTINUEWINDOWSREPAIRS

:REPAIR_WINDOWS_STORE
call :SCALE 81 20
title !#TITLE:`=Repair Windows Store!
echo !CYAN!
echo !\E![7C#################################################################
echo !\E![7C#            . . . I'm repairing Windows Store . . .            #
echo !\E![7C#################################################################
echo:
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v "RemoveWindowsStore" /f && echo reg value "RemoveWindowsStore" successfully removed. || echo reg value "RemoveWindowsStore" already removed.
>nul 2>&1 reg delete "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v "DisableStoreApps" /f && echo reg value "DisableStoreApps" successfully removed. || echo reg value "DisableStoreApps" already removed.
if "!WINDOWS_VERSION!"=="10.0" (
    >nul chcp 437
    2>nul powershell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *WindowsStore*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"
    >nul chcp 65001
)
if "!WINDOWS_VERSION!"=="6.3" (
    >nul chcp 437
    2>nul powershell -ExecutionPolicy Unrestricted Add-AppxPackage -DisableDevelopmentMode -Register $Env:SystemRoot\WinStore\AppxManifest.xml
    >nul chcp 65001
)
for %%A in (wuauserv BITS DcomLaunch InstallService wlidsvc WaaSMedicSvc UnistoreSvc StorSvc) do >nul 2>&1 net stop "%%A"
for %%A in (wuauserv BITS DcomLaunch) do >nul 2>&1 sc config "%%A" start=auto && echo service "%%A" successfully set to demand. || echo service "%%A" does not exist or an error happend.
for %%A in (InstallService wlidsvc WaaSMedicSvc UnistoreSvc StorSvc) do >nul 2>&1 sc config "%%A" start=demand && echo service "%%A" successfully set to demand. || echo service "%%A" does not exist or an error happend.
for /f "delims=" %%A in ('2^>nul where "wsreset.exe"') do start "" "%%~fA"
<nul set /p=!YELLOW!
timeout /t 5
goto :WINDOWSREPAIRS

:REPAIR_XBOX_GAME
call :SCALE 81 20
title !#TITLE:`=Repair Xbox Game!
echo !CYAN!
echo !\E![7C#################################################################
echo !\E![7C#              . . . I'm repairing Xbox Game . . .              #
echo !\E![7C#################################################################
echo:
for %%A in (XboxApp Microsoft.XboxGamingOverlay XboxOneSmartGlass) do (
    >nul chcp 437
    2>nul powershell -ExecutionPolicy Unrestricted -Command "& {$manifest = (Get-AppxPackage *%%A*).InstallLocation + '\AppxManifest.xml' ; Add-AppxPackage -DisableDevelopmentMode -Register $manifest}"
    >nul chcp 65001
)
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
goto :WINDOWSREPAIRS

:REPAIR_PUSH_NOTIFICATIONS
call :SCALE 81 20
title !#TITLE:`=Repair Push Notifications!
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
goto :WINDOWSREPAIRS

:REPAIR_WIFI_HOTSPOT
call :SCALE 81 20
title !#TITLE:`=Repair WiFi Hotspot!
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
goto :WINDOWSREPAIRS

:REPAIR_CLIPBOARD_HISTORY
call :SCALE 81 20
title !#TITLE:`=Repair Clipboard History!
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
goto :WINDOWSREPAIRS

:REPAIR_BACKGROUND_APPS
call :SCALE 81 20
title !#TITLE:`=Repair Backgrounds Apps!
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
goto :WINDOWSREPAIRS

:WINDOWSGAMEBOOSTER
echo !CYAN!
if "!language!"=="EN" (
call :DRAW_CENTER "Do you want to [!YELLOW!E!CYAN!]nable, [!YELLOW!D!CYAN!]isable or [!YELLOW!B!CYAN!]ack ?"
>nul choice /n /c EDB
)
if "!language!"=="FR" (
call :DRAW_CENTER "Voulez-vous [!YELLOW!A!CYAN!]ctiver, [!YELLOW!D!CYAN!]ésactiver ou [!YELLOW!R!CYAN!]etour ?"
>nul choice /n /c ADR
)
if !errorlevel!==1 call :_WINDOWSGAMEBOOSTER Enabling normal disabled enabled
if !errorlevel!==2 call :_WINDOWSGAMEBOOSTER Disabling normal demand disabled
goto :MOREFEATURES
:_WINDOWSGAMEBOOSTER
call :SCALE 80 29
title !#TITLE:`=%1 Game Boost!
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
title !#TITLE:`=Windows Tweaks!
call :ROSE "Windows Tweaks"

:CONTINUEWINDOWSTWEAKS
call :SCALE 74 23
title !#TITLE:`=Windows Tweaks!
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
if "!language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
for /l %%A in (1,1,7) do if "!x!"=="%%A" (
if "!language!"=="EN" set t="Do you want to Enable (Yes) or Disable (No) this tweak ?"
if "!language!"=="FR" set t="Voulez-vous Activer (Oui) ou Désactiver (Non) ce tweak ?"
call :MSGBOX_LEVEL 69668 "Illegal Services"
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
>nul 2>&1 reg query "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes\e9a42b02-d5df-448d-aa00-03f14749eb61" && (
set cn=0
for /f %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes" /f "Ultimate Performance" /s /c ^| findstr /c:"Ultimate Performance"') do set /a cn+=1
if "!cn!"=="1" (
for /f "tokens=2delims=:" %%A in ('powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61') do for /f "delims= " %%B in ("%%A") do call :ENABLE_POWER_SCHEME_ULTIMATE_PERFORMANCE %%B
) else (
for /f "delims=" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes" /f "Ultimate Performance" /s /c ^| findstr /c:"PowerSchemes"') do for /f "tokens=8delims=\" %%B in ("%%A") do if not "%%B"=="e9a42b02-d5df-448d-aa00-03f14749eb61" call :ENABLE_POWER_SCHEME_ULTIMATE_PERFORMANCE %%B
)
) || (
if "!language!"=="EN" set t="ERROR: Power scheme 'Ultimate Performance' doesn't exist in your computer. You cannot use this script."
if "!language!"=="FR" set t="ERREUR: Le schéma d'alimentation 'Ultimate Performance' n'existe pas sur votre ordinateur. Vous ne pouvez pas utiliser ce script."
call :MSGBOX 69680 "Illegal Services"
)
goto :CONTINUEWINDOWSTWEAKS
) else call :ERROR_WINDOWS_VERSION
)
if "!x!"=="9" start cleanmgr.exe & goto :CONTINUEWINDOWSTWEAKS
if "!x!"=="10" goto :PORTABLEAPPS
for /l %%A in (1,1,7) do if "!x!"=="%%A" call :DONE_REGVALUE & goto :CONTINUEWINDOWSTWEAKS
call :CHOOSE BACK && goto :MOREFEATURES
call :ERRORMESSAGE
goto :CONTINUEWINDOWSTWEAKS

:CHECKER_SETUP_FOUND
if "!language!"=="EN" set t="New version found. Do you want to update ?!\N!!\N!Current version: !VERSION!!\N!Latest version   : !lastversion!"
if "!language!"=="FR" set t="Nouvelle version trouvée. Voulez-vous mettre à jour ?!\N!!\N!Version actuelle  : !VERSION!!\N!Dernière version : !lastversion!"
call :MSGBOX_LEVEL 69668 "Illegal Services Updater"
if "!el!"=="7" exit /b
:L2
call :CURL "!TMPF!\IS.Setup.exe" "`git_release`" UPDATER || (call :ERROR_INTERNET & exit /b)
>nul reg add "!IS_REG!" /v "FirstLaunch" /t REG_DWORD /d 1 /f
if exist "!TMPF!\IS.Setup.exe" (start /max "" "!TMPF!\IS.Setup.exe") else (
if "!language!"=="EN" set t="ERROR: Disable your antivirus and try again..."
if "!language!"=="FR" set t="ERREUR: Désactivez votre antivirus et réessayez..."
call :MSGBOX 69680 "Illegal Services"
goto :L2
)
exit 0

:CHECKER_BUILD_FOUND
call :CURL "Illegal Services.exe" "`git_build`" UPDATER || (call :ERROR_INTERNET & exit /b)
call :CURL "ChangeLog.txt" "`git_changelog`" UPDATER || (call :ERROR_INTERNET & exit /b)
if exist "Illegal Services.exe" (
    start "" "Illegal Services.exe" && (
        exit 0
    )
)
if "!language!"=="EN" set t="Illegal Services cannot continue running 'Illegal Services.exe' because it's access appears to be denied.!\N!This error: '!errorlevel!' is known to be Windows Defender blocking access to the file because the file is detected to contain a virus or unwanted software.!\N!!\N!We recommend whitelisting the Illegal Services PATH (%~dp0) in your antivirus software(s) to fix this issue and prevent a similar issue in the future."
if "!language!"=="FR" set t="Illegal Services ne peut pas continuer à exécuter 'Illegal Services.exe' car son accès semble être refusé.!\N!Cette erreur: '!errorlevel!' est connue pour être Windows Defender bloquant l'accès au fichier car il est détecté que le fichier contient un virus ou un logiciel indésirable.!\N!!\N!Nous vous recommandons de mettre en liste blanche le chemin d'accès d'Illegal Services (%~dp0) dans votre ou vos logiciels antivirus pour réparer ce problème et éviter un problème similaire à l'avenir."
call :MSGBOX 69680 "Illegal Services"
goto :CHECKER_BUILD_FOUND

:PROCESS_FAQ
if "!language!"=="EN" call :SCALE 105 49
if "!language!"=="FR" call :SCALE 114 49
title !#TITLE:`=Frequently Asked Questions!
call :ROSE FAQ
echo !CYAN!
if "!language!"=="EN" set "t=Here is a list of frequently asked questions about Illegal Services:"
if "!language!"=="FR" set "t=Voici une liste questions de questions fréquemment posées à propos d'Illegal Services:"
call :DRAW_CENTER "■█!BGYELLOW!!RED!█ !BLACK!!t!!RED! █!BGBLACK!!CYAN!█■"
echo:
echo !CYAN!
if "!language!"=="EN" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Is Illegal Services open source ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Yes, under the General Public License v3.0 ^(GNU GPLv3^).
)
if "!language!"=="FR" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Est-ce qu'Illegal Services est Open Source ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Oui, sous la General Public License v3.0 ^(GNU GPLv3^).
)
echo !\E![6C!GREEN!!UNDERLINE!!git_source:[404 Git proxy not found]=[404 Git proxy not found]. Maybe: https://github.com/Illegal-Services/Illegal_Services/tree/source!!UNDERLINEOFF!
echo !CYAN!
if "!language!"=="EN" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Is Illegal Services illegal ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Illegal Services is legal, but services provided inside are mostly illegal.
echo !\E![6C!GREEN!Illegal Services does not store any copyrighted files locally or on its server.
echo !\E![6C!GREEN!All contents are provided by non-affiliated third parties.
echo !\E![6C!GREEN!You are solely responsible for their use at your own risk.
)
if "!language!"=="FR" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Illegal Services est-il illégal ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Illegal Services est légal, mais les services fournis à l'intérieur sont principalement illégaux.
echo !\E![6C!GREEN!Illegal Services ne stocke aucun fichier sous copyright localement ou sur son serveur.
echo !\E![6C!GREEN!Tous les contenus sont fournis par des tiers non affiliés.
echo !\E![6C!GREEN!Vous êtes tenu comme seul responsable de leur utilisation à vos propres risques.
)
echo !CYAN!
if "!language!"=="EN" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Why Illegal Services is detected by many antiviruses ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!The source code is converted from batch to executable using !UNDERLINE!https://www.abyssmedia.com/quickbfc/!UNDERLINEOFF!
echo !\E![6C!GREEN!This conversion process leads to believe that it is a virus.
)
if "!language!"=="FR" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Pourquoi Illegal Services est detecté par beaucoup d'antivirus ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Le code source est convertie de batch en executable en utilisant !UNDERLINE!https://www.abyssmedia.com/quickbfc/!UNDERLINEOFF!
echo !\E![6C!GREEN!Ce processus de conversion fait laisser croire qu'il en est un virus.
)
echo !CYAN!
if "!language!"=="EN" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Why Illegal Services keep telling me that a file is missing ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!It must be your antivirus that quarantined the file^(s^).
echo !\E![6C!GREEN!You must add this file^(s^) or Illegal Services PATH to its whitelist or deactivate it.
)
if "!language!"=="FR" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Pourquoi Illegal Services continue-il de me dire qu'un fichier est manquant ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Ce doit être votre antivirus qui met en quarantaine le/les fichier^(s^).
echo !\E![6C!GREEN!Vous devez ajouter ce/ces fichier^(s^) ou le chemin d'Illegal Services à sa liste blanche ou désactivez-le.
)
echo !CYAN!
if "!language!"=="EN" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Why do Illegal Services ask for administrator privileges ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!The administrator privileges are required for:
echo !\E![6C!GREEN!IP Port Scanning, Windows Repair, Windows Tweaks and Windows Game Booster.
)
if "!language!"=="FR" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Pourquoi Illegal Services demandent-ils des privilèges d'administrateur ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Les privilèges administrateurs sont requis pour:
echo !\E![6C!GREEN!IP Port Scanning, Windows Repair, Windows Tweaks et Windows Game Booster.
)
echo !CYAN!
if "!language!"=="EN" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ What is the difference between build and release updates ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Build updates are updates that do not require you to update the installer.
echo !\E![6C!GREEN!They are mostly used to update "Illegal_Services.exe".
echo !\E![6C!GREEN!These are the last 2 digits of the version number ^(vx.x.[x.x]^).
echo !\E![6C!GREEN!Release updates are updates that requires updating the installer.
echo !\E![6C!GREEN!They are only used to update Illegal Services dependencies.
echo !\E![6C!GREEN!These are the first 2 digits of the version number ^(v[x.x].x.x^).
)
if "!language!"=="FR" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Quelle est la différence entre les mises à jour de build et de release ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Les mises à jour de build sont des mises à jour qui ne vous obligent pas à mettre à jour l'installateur.
echo !\E![6C!GREEN!Elles sont principalement utilisés pour mettre à jour "illegal_services.exe".
echo !\E![6C!GREEN!Ce sont les 2 derniers chiffres du  la version ^(vx.x.[x.x]^).
echo !\E![6C!GREEN!Les mises à jour de release sont des mises à jour nécessitant une mise à jour de l'installateur.
echo !\E![6C!GREEN!Ils ne sont utilisés que pour mettre à jour les dépendances d'Illegal Services.
echo !\E![6C!GREEN!Ce sont les 2 premiers chiffres de la version ^(v [x.x].x.x^).
)
echo !CYAN!
if "!language!"=="EN" echo !\E![3C■█!BGWHITE!!RED!█ ♦ With which operating systems is Illegal Services compatible ? █!BGBLACK!!CYAN!█■
if "!language!"=="FR" echo !\E![3C■█!BGWHITE!!RED!█ ♦ Avec qu'elle système d'exploitation Illegal Services est-t'il compatible ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Windows 10 and 11 (x86/x64).
echo !CYAN!
if "!language!"=="EN" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Can you make Illegal Services compatible with more operating system ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!No, but IS.bookmarks.html and IS Bookmarks web extension are.
)
if "!language!"=="FR" (
echo !\E![3C■█!BGWHITE!!RED!█ ♦ Pouvez-vous rendre Illegal Services compatible pour d'autre système d'exploitation ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!Non. Mais IS.bookmarks.html et l'extension pour navigateur IS Bookmarks le sont.
)
echo !CYAN!
if "!language!"=="EN" echo !\E![3C■█!BGWHITE!!RED!█ ♦ In which languages is Illegal Services developed ? █!BGBLACK!!CYAN!█■
if "!language!"=="FR" echo !\E![3C■█!BGWHITE!!RED!█ ♦ En quels langages est développé Illegal Services ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!98%% Batch, 1%% PowerShell, 1%% VBScript.
echo !CYAN!
if "!language!"=="EN" echo !\E![3C■█!BGWHITE!!RED!█ ♦ When did you started Illegal Services project ? █!BGBLACK!!CYAN!█■
if "!language!"=="FR" echo !\E![3C■█!BGWHITE!!RED!█ ♦ Quand est-ce que le projet d'Illegal Services à commencé ? █!BGBLACK!!CYAN!█■
echo !\E![6C!GREEN!v1.0.0.0 - 22/05/2020
echo:
echo !CYAN!
if "!language!"=="EN" set "t=Press !YELLOW!{ANY KEY}!CYAN! to exit"
if "!language!"=="FR" set "t=Appuyez sur !YELLOW!{UNE TOUCHE}!CYAN! pour quitter"
call :DRAW_CENTER "!t!..." 1
%@SHOWCURSOR%
>nul pause
exit 0

:PROCESS_SCANWEBSITES
if "!language!"=="EN" (
    title !#TITLE:`=Initializing!
) else if "!language!"=="FR" (
    title !#TITLE:`=Initialisation!
)
call :DOWNLOAD_IS_BOOKMARKS_DB SCANWEBSITES || (
    exit 0
)
set /a index=0, counter=0, results=0
if defined s (
    set s=
)
if "!language!"=="EN" (
    set o1=Domain Dead
    set o2=Website Down
    set o3=seems to be down for you
    set o4=seems to be down for everyone
    set o5=Website Changed Address
    set o6=Website Changed Domain
)
if "!language!"=="FR" (
    set o1=Domaine mort
    set o2=Site Internet Mort
    set o3=semble être mort pour toi
    set o4=semble être mort pour tout le monde
    set o5=Site Internet Changé d'Addresse
    set o6=Site Internet Changé de Domaine
)
call :CHECK_PATCH_BOOKMARKS_PARSER
call :CHECK_FILE_ACCESS_IS_BOOKMARKS_PARSER
for /f "tokens=3" %%A in ('!bookmarks_parser.exe! -l -e "!IS_OUTPUT_DIRECTORY!\IS.bookmarks.html"') do (
    set /a index+=1
    title !DEBUG![0 result found from 0/!index! websites indexed]  ^|  [0/100%%]  ^|  [...] - Illegal Services
)
echo !CYAN!
if "!language!"=="EN" echo Scan of the !index! indexed websites has started. You will be notified if any of them are down or have changed address.
if "!language!"=="FR" echo Le scan des !index! sites web indexés a commencé. Vous serez notifié si l'un d'entre eux est mort ou a changé de d'addresse.
echo:
for /f "tokens=1-4delims=:.," %%A in ("!time: =0!") do set /a "t1=(((1%%A*60)+1%%B)*60+1%%C)*100+1%%D-36610100"
for /f "tokens=3" %%A in ('!bookmarks_parser.exe! -l -e "!IS_OUTPUT_DIRECTORY!\IS.bookmarks.html"') do (
    set /a counter+=1, percentage=counter*100/index
    if !results! gtr 1 (
        set s=s
    )
    set "src_url=%%A"
    for /f "delims=/" %%B in ("!src_url:*://=!") do (
        <nul set /p="!\E!]0;!DEBUG![!results! result!s! found from !counter!/!index! websites indexed]  |  [!percentage!/100%%]  |  [!src_url!] - Illegal Services!\E!\"
        if not defined website_[%%A] (
            set website_[%%A]=1
            >nul ping -w 1000 -n 1 "%%B" || (
                >nul curl.exe -IkLs -X GET "!src_url!" || (
                    if !errorlevel!==6 (
                        set /a results+=1
                        echo !RED!!o1!: !YELLOW!!src_url! !RED!!o3! ^^!
                        curl.exe -fkLs "https://isitup.org/%%B" | >nul find /i "Oh no %%B" && (
                            set /a results+=1
                            echo !RED!!o2!: !YELLOW!!src_url! !RED!!o4! ^^!
                        )
                    ) else (
                        call :PROTECTED_WEBSITE_DETECTION src_url || (
                            set /a results+=1
                            echo !RED!!o2!: !YELLOW!!src_url! !RED!!o3! ^^!
                            curl.exe -fkLs "https://isitup.org/%%B" | >nul find /i "Oh no %%B" && (
                                set /a results+=1
                                echo !RED!!o2!: !YELLOW!!src_url! !RED!!o4! ^^!
                            )
                        )
                    )
                )
            )
            for /f %%C in ('curl.exe -Iks -X GET -o NUL "!src_url!" -w "%%{redirect_url}"') do (
                set "dst_url=%%C"
                for /f "delims=/" %%D in ("!dst_url:*://=!") do (
                    if not "!src_url!"=="!dst_url!" (
                        if not "%%B_%%D"=="discord.gg_discord.com" (
                            if not "%%B_%%D"=="github.com_raw.githubusercontent.com" (
                                if not "%%B_%%D"=="github.com_objects.githubusercontent.com" (
                                    if "%%B"=="%%D" (
                                        set /a results+=1
                                        echo !RED!!o5!: !YELLOW!!src_url! !GREEN!^> !YELLOW!!dst_url!
                                    ) else (
                                        set /a results+=1
                                        echo !RED!!o6!: !YELLOW!!src_url! !GREEN!^> !YELLOW!!dst_url!
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
    )
)
echo !CYAN!
for /f "tokens=1-4delims=:.," %%A in ("!time: =0!") do set /a "t2=(((1%%A*60)+1%%B)*60+1%%C)*100+1%%D-36610100, tDiff=t2-t1, tDiff+=((~(tDiff&(1<<31))>>31)+1)*8640000, seconds=tDiff/100"
title !DEBUG![!results! result!s! found from !index! websites indexed]  ^|  [Scan completed in !seconds! seconds.] - Illegal Services
if "!language!"=="EN" echo Scan completed with !results! result!s! found from !index! websites indexed in !seconds! seconds.
if "!language!"=="FR" echo L'analyse s'est terminée avec !results! résultats trouvés à partir de !index! sites web indexés en !seconds! secondes.
echo:
pause
exit 0

:PROTECTED_WEBSITE_DETECTION
if not defined %1 (
    exit /b 1
)
if defined cn (
    set cn=
)
for /f "tokens=1*delims=: " %%A in ('curl.exe -Iks -X GET "!%1!" ^| findstr /ric:"^^Connection: keep-alive$" /c:"^^Server: ddos-guard$"') do (
    if /i "%%A: %%B"=="Connection: keep-alive" (
        set /a cn+=1
    ) else if /i "%%A: %%B"=="Server: ddos-guard" (
        set /a cn+=1
    )
)
if defined cn (
    if !cn!==2 (
        goto :PROTECTED_WEBSITE_DETECTED
    )
)
for %%A in (cn http_code) do (
    if defined %%A (
        set %%A=
    )
)
for /f "tokens=1*delims=: " %%A in ('curl.exe -Iks -X GET "!%1!" -w "%%{response_code}" ^| findstr /ric:"^^Connection: close$" /c:"^^Server: cloudflare$" /c:"^^CF-RAY: [a-z0-9]*-[A-Z]*$" /c:"^^[0-9]*$"') do (
    if /i "%%A: %%B"=="Connection: close" (
        set /a cn+=1
    ) else if /i "%%A: %%B"=="Server: cloudflare" (
        set /a cn+=1
    ) else if /i "%%A: "=="CF-RAY: " (
        set /a cn+=1
    ) else (
        set "x=%%A"
        call :CHECK_NUMBER x && (
            set /a cn+=1
            set "http_code=%%A"
        )
    )
)
if defined cn (
    if defined http_code (
        if !cn!==4 (
            if not "!http_code!"=="403" (
                if not "!http_code!"=="503" (
                    set http_code=
                )
            )
            if defined http_code (
                goto :PROTECTED_WEBSITE_DETECTED
            )
        )
    )
)
for %%A in (cn http_code) do (
    if defined %%A (
        set %%A=
    )
)
exit /b 0
:PROTECTED_WEBSITE_DETECTED
exit /b 1

:PROCESS_YOUTUBEDL
call :CHECK_YOUTUBEDLPRIORITY
<nul set /p="!\E!]0;!DEBUG!YouTube Downloader    |!youtube_dl_executable! !a!|    |!o1!|    |Priority: !YouTubeDLPriority:~1!| - Illegal Services!\E!\"
echo !BRIGHTBLACK!
echo !\E![7C##############################################
if "!language!"=="EN" echo !\E![7C#   !BRIGHTRED!♥   !CYAN!Welcome in YouTube Downloader   !BRIGHTRED!♥!BRIGHTBLACK!    #
if "!language!"=="FR" echo !\E![7C#  !BRIGHTRED!♥   !CYAN!Bievenue dans YouTube Downloader   !BRIGHTRED!♥!BRIGHTBLACK!  #
echo !\E![7C##############################################
echo:
if "!language!"=="EN" (
set t1=Choice
set t2=Please wait while downloading
)
if "!language!"=="FR" (
set t1=Choix
set t2=Veuillez patienter pendant le téléchargement de
)
echo !\E![7C♦ !CYAN!!t1!: !YELLOW!!o1!!BRIGHTBLACK!
echo !\E![7C♦ !CYAN!!t2!: !YELLOW!!url!!CYAN! . . .
echo !BRIGHTBLACK!
echo =========================================================================================================
echo !RED!
start /b /w !YouTubeDLPriority! "" "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\youtube-dl\!youtube_dl_executable!" --output "!YouTubeDLOutputDirectory!\!youtube_dl_format!\%%(title)s.%%(ext)s" !a!
set el=!errorlevel!
echo !BRIGHTBLACK!
echo =========================================================================================================
echo !CYAN!
if "!language!"=="EN" if "!el!"=="0" (
echo !\E![7C♦ Download finished.
<nul set /p=!\E![7C♦ Press !YELLOW!{ANY KEY}!CYAN! to open download location and exit...
) else (
echo !\E![7C♦ Something went wrong and couldn't download the file.
<nul set /p=!\E![7C♦ Press !YELLOW!{ANY KEY}!CYAN! to exit...
)
if "!language!"=="FR" if "!el!"=="0" (
echo !\E![7C♦ Téchargement terminer.
<nul set /p=!\E![7C♦ Appuyez sur !YELLOW!{UNE TOUCHE}!CYAN! pour ouvrir l'emplacement de téchargement et quitter...
) else (
echo !\E![7C♦ Une erreur s'est produite et n'a pas pu técharger le fichier.
<nul set /p=!\E![7C♦ Appuyez sur !YELLOW!{UNE TOUCHE}!CYAN! pour quitter...
)
%@SHOWCURSOR%
>nul pause
if "!el!"=="0" start /max "" "!YouTubeDLOutputDirectory!\!youtube_dl_format!"
exit 0

:PROCESS_NMAP
call :CHECK_PORTPRIORITY
<nul set /p="!\E!]0;!DEBUG!NMAP    |nmap.exe !a!|    |!o1!|    |!o2!|    |Priority: !PortPriority:~1!| - Illegal Services!\E!\"
>nul 2>&1 net start npcap
for %%A in (MaxUserPort`64534 TcpTimedWaitDelay`30 StrictTimeWaitSeqCheck`1) do for /f "tokens=1,2delims=`" %%B in ("%%~A") do >nul reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "%%B" /t REG_DWORD /d %%C /f
echo !BRIGHTBLACK!
echo !\E![7C#################################################################
if "!language!"=="EN" echo !\E![7C#       !BRIGHTRED!♥   !CYAN!Welcome in the best Port Scanner by NMAP   !BRIGHTRED!♥!BRIGHTBLACK!        #
if "!language!"=="FR" echo !\E![7C#    !BRIGHTRED!♥   !CYAN!Bienvenue dans le meilleur Port Scanner par NMAP   !BRIGHTRED!♥!BRIGHTBLACK!   #
echo !\E![7C#################################################################
echo:
if "!language!"=="EN" (
set t1=Time
set t2=Please wait while scanning
)
if "!language!"=="FR" (
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
start /b /w !PortPriority! "" "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\NMAP\nmap.exe" !a!
set el=!errorlevel!
>nul chcp 65001
echo !BRIGHTBLACK!
echo =========================================================================================================
echo !CYAN!
if "!language!"=="EN" if "!el!"=="0" (
echo !\E![7C♦ Scan finished.
<nul set /p=!\E![7C♦ Press !YELLOW!{ANY KEY}!CYAN! to exit...
) else (
echo !\E![7C♦ Something went wrong and couldn't scan.
<nul set /p=!\E![7C♦ Press !YELLOW!{ANY KEY}!CYAN! to exit...
)
if "!language!"=="FR" if "!el!"=="0" (
echo !\E![7C♦ Scan terminer.
<nul set /p=!\E![7C♦ Appuyez sur !YELLOW!{UNE TOUCHE}!CYAN! pour quitter...
) else (
echo !\E![7C♦ Une erreur s'est produite et n'a pas pu scanner.
<nul set /p=!\E![7C♦ Appuyez sur !YELLOW!{UNE TOUCHE}!CYAN! pour quitter...
)
%@SHOWCURSOR%
>nul pause
exit 0

:PROCESS_PINGER
title !#TITLE:`=IP Pinger  ^|  Pinging %fixed_url%!
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
if "!language!"=="EN" echo                       ** PRESS !YELLOW![CTRL + C]!BRIGHTBLACK! ^> !YELLOW![N]!BRIGHTBLACK! ^> !YELLOW![ENTER]!BRIGHTBLACK! to view result and restart. **
if "!language!"=="FR" echo               ** Presser !YELLOW![CTRL + C]!BRIGHTBLACK! ^> !YELLOW![N]!BRIGHTBLACK! ^> !YELLOW![ENTRER]!BRIGHTBLACK! pour afficher le résultat et recommencer. **
echo !WHITE!
ping -t -l 0 !fixed_url!
goto :_PING

:DONE_REGVALUE
if "!language!"=="EN" set t="Reg value successfully added/removed."
if "!language!"=="FR" set t="Valeur du registre ajoutée/supprimée avec succès."
call :MSGBOX 69696 "Illegal Services"
exit /b

:ENABLE_POWER_SCHEME_ULTIMATE_PERFORMANCE
echo:
for /f "tokens=2delims=:" %%A in ('powercfg /getactivescheme') do for /f "delims= " %%B in ("%%A") do if "%%B"=="%1" (
if "!language!"=="EN" set t="The 'Ultimate Performance' power scheme is already enabled."
if "!language!"=="FR" set t="Le schéma d'alimentation 'Ultimate Performance' est déjà activé."
call :MSGBOX 69696 "Illegal Services"
exit /b
)
powercfg /setactive %1 && (
if "!language!"=="EN" set t="The 'Ultimate Performance' power scheme successfully enabled."
if "!language!"=="FR" set t="Le schéma d'alimentation 'Ultimate Performance' a été activé avec succès."
call :MSGBOX 69696 "Illegal Services"
) || (
if "!language!"=="EN" set t="ERROR: The 'Ultimate Performance' power scheme couldn't enable."
if "!language!"=="FR" set t="ERREUR: Le schéma d'alimentation 'Ultimate Performance' n'a pas pu être activé."
call :MSGBOX 69680 "Illegal Services"
)
exit /b

:CHECK_INTERNET
for %%A in (1.1.1.1 8.8.8.8) do (
    >nul curl.exe -fIkLs -X GET -o NUL "https://%%A/" && (
        exit /b 0
    )
)
exit /b 1

:CHECK_INTERNET_PING
for %%A in (1.1.1.1 8.8.8.8) do (
    >nul 2>&1 ping -n 1 -l 0 "%%A" && (
        exit /b 0
    )
)
exit /b 1

:CHECK_FILE_SIGNATURE
if not exist "%~f1" (
    exit /b 1
)
if "%~f1"=="!IS_DIR!lib\binread\x!ARCH!\binread.exe" (
    exit /b 0
)
>nul 2>&1 !binread.exe! "!binread.exe!" 0
if not !errorlevel!==0 (
    if !errorlevel!==9020 (
        del /f /q "!binread.exe!"
    )
    exit /b 1
)
if defined file_signature (
    set file_signature=
)
for /f %%A in ('!binread.exe! "%~f1" %2') do (
    set "file_signature=!file_signature!%%A"
)
if defined file_signature (
    if "%~3"=="IS_BOOKMARKS_PARSER" (
        if "!file_signature:~0,70!"=="3C21444F4354595045204E455453434150452D426F6F6B6D61726B2D66696C652D313E" (
            exit /b 0
        ) else (
            exit /b 4
        )
    ) else (
        if "%~2"=="8" (
            if "%~x1"==".exe" (
                if "!file_signature:~0,4!"=="4D5A" (
                    exit /b 0
                )
            ) else if "%~x1"==".zip" (
                if "!file_signature:~0,8!"=="504B0304" (
                    exit /b 0
                ) else if "!file_signature:~0,4!"=="504B0506" (
                    exit /b 0
                ) else if "!file_signature:~0,4!"=="504B0708" (
                    exit /b 0
                )
            ) else if "%~x1"==".7z" (
                if "!file_signature:~0,12!"=="377ABCAF271C" (
                    exit /b 0
                )
            ) else (
                exit /b 0
            )
        )
    )
)
exit /b 1

:CHECK_NUMBER
if "%~1"=="" exit /b 1
for /f "delims=0123456789" %%A in ("%~1") do exit /b 1
exit /b 0

:CHECK_PATH
if not defined %1 exit /b 1
set "%1=!%1:"=!"
set "%1=!%1:/=\!"
:CHECK_PATH_STRIP_WHITE_SPACES
if "!%1:~0,1!"==" " (
set "%1=!%1:~1!"
goto :CHECK_PATH_STRIP_WHITE_SPACES
)
:_CHECK_PATH_STRIP_WHITE_SPACES
if "!%1:~-1!"==" " (
set "%1=!%1:~0,-1!"
goto :_CHECK_PATH_STRIP_WHITE_SPACES
)
:CHECK_PATH_STRIP_SLASHES
if "!%1:~-2!"=="\\" (
set "%1=!%1:~0,-1!"
goto :CHECK_PATH_STRIP_SLASHES
)
if exist "!%1!" exit /b 0
exit /b 1

:CHECK_FILE_NEWLINE
if not exist "!%1!" (
    exit /b 0
)
if defined write_newline (
    set write_newline=
)
<"!%1!" >nul (
    for %%A in ("!%1!") do (
        for /l %%. in (2 1 %%~zA) do (
            pause
        )
        set /p write_newline=
    )
)
if defined write_newline (
    set write_newline=
    exit /b 1
)
exit /b 0

:CHECK_FILE_ACCESS_IS_BOOKMARKS_PARSER
>nul 2>&1 !bookmarks_parser.exe! -h
if not !errorlevel!==0 (
    call :ERROR_FATAL ERRORLEVEL !bookmarks_parser.exe!
)
exit /b

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
>nul chcp 65001
del /f /q "%TMPF%\msgbox.vbs"
exit /b

:ROSE_SETUP
for /f "tokens=1*delims==" %%A in ('findstr /bc:"[First Launch]=" "lib\speak\!language!.lang"') do (
    if defined SPEECH_FR (
        !speak-x%ARCH%.exe! -t "%%~B"
    ) else (
        set extd=!extd.exe! /speak "%%~B"
        !extd!
    )
)
if "!language!"=="EN" set t="Do you want to disable Rose voice assistant ?"
if "!language!"=="FR" set t="Voulez-vous désactiver l'assistante vocale Rose ?"
call :MSGBOX_LEVEL 69668 "Illegal Services"
if "!el!"=="6" (
    >nul reg add "!IS_REG!" /v "VoiceAssistant" /t REG_DWORD /d 0 /f
) else (
    >nul reg add "!IS_REG!" /v "VoiceAssistant" /t REG_DWORD /d 1 /f
)
>nul reg add "!IS_REG!" /v "VoiceAssistantChoice" /t REG_DWORD /d 0 /f
exit /b

:ROSE
if "!VoiceAssistant!"=="0" (
    exit /b
)
for %%A in (extd speak-x!ARCH!) do >nul 2>&1 taskkill /f /im "%%A.exe" /t
for /f "tokens=1*delims==" %%A in ('findstr /bc:"[%~1]=" "lib\speak\!language!.lang"') do (
    if defined SPEECH_FR (
        start /b !speak-x%ARCH%.exe! -t "%%~B"
    ) else (
        set extd=start /b !extd.exe! /speak "%%~B"
        !extd!
    )
)
exit /b

:DOWNLOAD_CURL
for %%A in (!GIT_LIST!) do (
    for /f "tokens=1,2delims=`" %%B in ("%%A") do (
        for %%E in ("https://%%B/%%C/main/lib/curl/x!ARCH!/curl.exe") do (
            if "!language!"=="EN" set "t=Downloading: "
            if "!language!"=="FR" set "t=Téléchargement: "
            <nul set /p="!CYAN!!t!!YELLOW!%%~E!CYAN!"
            echo:
            >nul chcp 437
            powershell Invoke-WebRequest -Uri "%%~E" -OutFile "%~dp0curl.exe"
            >nul chcp 65001
            call :_DOWNLOAD_CURL && (
                exit /b 0
            )
            bitsadmin /transfer someDownload /download /priority normal "%%~E" "%~dp0curl.exe"
            call :_DOWNLOAD_CURL && (
                exit /b 0
            )
        )
    )
)
exit /b 1

:_DOWNLOAD_CURL
if not exist "curl.exe" (
    exit /b 1
)
call :CHECK_FILE_SIGNATURE curl.exe 8 || (
    exit /b 1
)
if not exist "lib\curl\x!ARCH!\" (
    md "lib\curl\x!ARCH!" || (
        exit /b 1
    )
)
>nul move /y "curl.exe" "lib\curl\x!ARCH!\curl.exe" || (
    exit /b 1
)
>nul 2>&1 where curl.exe || (
    exit /b 1
)
exit /b 0

:CURL
call :CHECK_INTERNET || (
    exit /b 1
)
set "curl_url=%~2"
if "!curl_url:`=!"=="!curl_url!" (
    if defined LOOKUP_curl_proxy_url_tries (
        set LOOKUP_curl_proxy_url_tries=
    )
) else (
    if "!git!"=="[404 Git proxy not found]" (
        call :PROXY || (
            if "!git!"=="[404 Git proxy not found]" (
                exit /b 2
            )
        )
    )
    for /f "tokens=1-3delims=`" %%A in ("$!curl_url!$") do (
        set "curl_url=%%A!%%B!%%C"
    )
    set "curl_url=!curl_url:~1,-1!"
    set "LOOKUP_curl_proxy_url_tries=`!curl_url!`"
)
if defined git_backup (
    if defined LOOKUP_curl_proxy_url_tries (
        if not "%3"=="UPDATER" (
            exit /b 3
        )
    )
)
if "!language!"=="EN" set t=Downloading
if "!language!"=="FR" set t=Téléchargement
<nul set /p="!CYAN!!t!: !YELLOW!!curl_url!!CYAN!"
echo:
>nul curl.exe --create-dirs -f#kLo "%~1" "!curl_url!" || (
    if not defined LOOKUP_curl_proxy_url_tries (
        call :ERROR_CURL "%~f1"
        exit /b 2
    ) else (
        goto :CURL_PROXYS
    )
)
call :CHECK_FILE_SIGNATURE "%~f1" 8 || (
    if not defined LOOKUP_curl_proxy_url_tries (
        call :ERROR_CURL "%~f1"
        exit /b 2
    )
    goto :CURL_PROXYS
)
:CURL_CONTINUE
if not exist "%~f1" (
    goto :CURL_PROXYS
)
for %%A in (7z zip) do (
    if "%~x1"==".%%A" (
        if "%~nx1"=="ffmpeg.7z" (!7za.exe! x -aoa -bso0 -o"%~dp1" -spe -y "%~f1" || goto :CURL_PROXYS) else !7za.exe! x -aoa -bso0 -o"%~dpn1" -spe -y "%~f1" || goto :CURL_PROXYS
        del /f /q "%~f1"
    )
)
if not defined start_folder (
    set start_folder=1
)
exit /b 0

:CURL_PROXYS
if not defined LOOKUP_curl_proxy_url_tries (
    exit /b 2
)
for /f "tokens=1*delims=/" %%A in ("%~2") do (
    for %%C in (main downloads source) do (
        if not "!curl_url:/%%C/=!"=="!curl_url!" (
            for %%D in (!GIT_LIST!) do (
                for /f "tokens=1,2delims=`" %%E in ("%%D") do (
                    for %%G in ("https://%%E/%%F/%%C/%%~B") do (
                        if "!LOOKUP_curl_proxy_url_tries:`%%~G`=!"=="!LOOKUP_curl_proxy_url_tries!" (
                            set "LOOKUP_curl_proxy_url_tries=!LOOKUP_curl_proxy_url_tries!%%~G`"
                            if "!language!"=="EN" set "t=Downloading: "
                            if "!language!"=="FR" set "t=Téléchargement: "
                            <nul set /p="!CYAN!!t!!YELLOW!%%~G!CYAN!"
                            echo:
                            >nul curl.exe --create-dirs -f#kLo "%~1" "%%~G" && (
                                call :CHECK_FILE_SIGNATURE "%~f1" 8 && (
                                    goto :CURL_CONTINUE
                                )
                            )
                        )
                    )
                )
            )
        )
    )
)
call :ERROR_CURL "%~f1"
exit /b 5

:ERROR_CURL
if "!language!"=="EN" set "t=ERROR WHILE DOWNLOADING: "
if "!language!"=="FR" set "t=ERREURE PENDANT LE TELECHARGEMENT DE: "
if defined IS_Log >>"!TMPF!\IS_Log.txt" echo !t!"!curl_url!"
echo !RED!!t!!YELLOW!"!curl_url!"
if exist "%~f1" del /f /q "%~f1"
exit /b

:IPLOOKUP_ENTER
if "!language!"=="EN" set "t=Enter the %1 to track: "
if "!language!"=="FR" set "t=Entrer l'%1 à tracker: "
%@SHOWCURSOR%
set url=
set /p "url=!BRIGHTBLACK!!t!!YELLOW!"
%@HIDECURSOR%
if "%1"=="IP" (call :CHECK_IP url || exit /b 1) else call :CHECK_URL url IP/URL || exit /b 1
if "!4!"=="!YELLOW!4 !CHECKED!" start "" "https://check-host.net/ip-info?host=!fixed_url!" && !cmdwiz.exe! delay 1500
if "!5!"=="!YELLOW!5 !CHECKED!" start "" "https://dnschecker.org/ip-location.php?ip=!fixed_url!" && !cmdwiz.exe! delay 1500
if "!6!"=="!YELLOW!6 !CHECKED!" start "" "https://www.iplocation.net/ip-lookup" && !cmdwiz.exe! delay 1500
if "!7!"=="!YELLOW!7 !CHECKED!" start "" "https://www.ip-tracker.org/locator/ip-lookup.php?ip=!fixed_url!" && !cmdwiz.exe! delay 1500
if "!8!"=="!YELLOW!8 !CHECKED!" start "" "https://whatismyipaddress.com/ip/!fixed_url!"
exit /b 0

:INSTALL_FILE
if "%1"=="VLC" if "!ARCH!"=="64" (set url=https://get.videolan.org/vlc/3.0.16/win64/vlc-3.0.16-win64.exe) else set url=https://get.videolan.org/vlc/3.0.16/win32/vlc-3.0.16-win32.exe
if "%1"=="qBittorent" if "!ARCH!"=="64" (set url=https://downloads.sourceforge.net/project/qbittorrent/qbittorrent-win32/qbittorrent-4.3.8/qbittorrent_4.3.8_x64_setup.exe) else set url=https://downloads.sourceforge.net/project/qbittorrent/qbittorrent-win32/qbittorrent-4.3.8/qbittorrent_4.3.8_setup.exe
for %%A in (!url!) do set filename=%%~nxA
call :CURL "!TMPF!\!filename!" "!url!" || (call :ERROR_INTERNET & exit /b)
call :START_DOWNLOADED_FILE !filename!
exit /b

:CHECK_HASH_SHA1
if not defined %1 (
    exit /b 1
)
if not "!%1:~39!"=="!%1:~-1!" (
    exit /b 1
)
for /f "delims=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789" %%A in ("!%1!") do (
    exit /b 1
)
exit /b 0

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
if defined %1 if not "!fixed_%1:~0,1!"=="." if not "!fixed_%1:~-1!"=="." if not "!fixed_%1!"=="!fixed_%1:~0,3!" if not "!fixed_%1!"=="!fixed_%1:.=!" if "!fixed_%1!"=="!fixed_%1:..=!" exit /b 0
exit /b 1

:CHECK_IP
call :_CHECK_IP %1 || (call :ERRORMESSAGE %1 "une IP" IP & exit /b 1)
exit /b 0

:_CHECK_IP
if not defined %1 exit /b 1
if "!%1!"=="!%1:~0,6!" exit /b 1
if not "!%1!"=="!%1:..=!" exit /b 1
for /f "tokens=1-5delims=." %%A in ("!%1!") do (
if not "%%E"=="" exit /b 1
call :CHECKBETWEEN0AND255 "%%~A" || exit /b 1
call :CHECKBETWEEN0AND255 "%%~B" || exit /b 1
call :CHECKBETWEEN0AND255 "%%~C" || exit /b 1
call :CHECKBETWEEN0AND255 "%%~D" || exit /b 1
)
exit /b 0

:CHECKBETWEEN0AND255
if "%~1"=="" exit /b 1
for /f "delims=0123456789" %%A in ("%~1") do exit /b 1
if %~1 lss 0 exit /b 1
if %~1 gtr 255 exit /b 1
exit /b 0

:CHECK_SETTINGS
for %%A in (LANGUAGE USERNAME BACKGROUNDBORDERTRANSPARENCY BACKGROUNDDISABLED BACKGROUNDTRANSPARENCY BACKGROUNDWALLPAPER VOICEASSISTANT VOICEASSISTANTCHOICE FIRSTLAUNCH DBLASTDOWNLOAD UNTRUSTEDWEBSITESWARNING YOUTUBEDLP YOUTUBEDLOUTPUTDIRECTORY YOUTUBEDLGEOBYPASS PORTPRIORITY YOUTUBEDLPRIORITY DEVELOPERMODE) do call :CHECK_%%A
exit /b

:APPLY_BACKGROUND_SETTINGS
for %%A in (BACKGROUNDBORDERTRANSPARENCY BACKGROUNDDISABLED BACKGROUNDTRANSPARENCY BACKGROUNDWALLPAPER) do call :CHECK_%%A
if defined WINDOWS_TERMINAL exit /b
if "!BackgroundDisabled!"=="0" if defined BackgroundWallpaper !cmdbkg.exe! lib\backgrounds\background-!BackgroundWallpaper!.jpg!BackgroundBorderTransparency!
if "!BackgroundDisabled!"=="1" !cmdbkg.exe!
!cmdwiz.exe! delay 500
if defined BackgroundTransparency !cmdwiz.exe! setwindowtransparency !BackgroundTransparency!
exit /b

:CHECK_LANGUAGE
set language=
for /f "tokens=3" %%A in ('2^>nul reg query "!IS_REG!" /v "Language"') do set "language=%%~A"
if not "!language!"=="FR" if not "!language!"=="EN" (
call :ERROR_REGEDIT Language language
for /f "tokens=3" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Nls\Language" /v "InstallLanguage"') do if "%%A"=="040C" (>nul reg add "!IS_REG!" /v "Language" /t REG_SZ /d FR /f) else >nul reg add "!IS_REG!" /v "Language" /t REG_SZ /d EN /f
goto :CHECK_LANGUAGE
)
set SPEECH_FR=
if "!language!"=="FR" if exist "!windir!\Speech_OneCore\Engines\TTS\fr-FR" 2>nul reg query "HKCU\SOFTWARE\Microsoft\Speech\Voices" /v "DefaultTokenId" | >nul findstr /ic:"FR-FR" /c:"frFR" /c:"ZIRA" && (set SPEECH_FR=1) || set SPEECH_FR=
::2>nul reg query "HKLM\SOFTWARE\Microsoft\Speech_OneCore\Voices\Tokens" | >nul findstr /ic:"FR-FR" /c:"frFR"
::2>nul reg query "HKCU\SOFTWARE\Microsoft\Speech_OneCore\Settings\TextToSpeech" /v "Voice" | >nul findstr /ic:"FR-FR" /c:"frFR"
exit /b

:CHECK_USERNAME
set IS_Username=
for /f "tokens=2*" %%A in ('2^>nul reg query "!IS_REG!" /v "Username"') do set "IS_Username=%%B"
if defined IS_Username (
set "IS_Username=!IS_Username:"=!"
>nul reg add "!IS_REG!" /v "Username" /t REG_SZ /d "!IS_Username:~0,20!" /f
if "!IS_Username:~20!"=="" exit /b
)
call :ERROR_REGEDIT Username IS_Username
>nul reg add "!IS_REG!" /v "Username" /t REG_SZ /d "!Username:~0,20!" /f
goto :CHECK_USERNAME

:CHECK_PROXY
set Proxy=
for /f "tokens=2*" %%A in ('2^>nul reg query "!IS_REG!" /v "Proxy"') do set "Proxy=%%~B"
if defined Proxy (
    for %%A in (!GIT_LIST!) do (
        for /f "delims=`" %%B in ("%%A") do (
            if "%%B"=="!Proxy:*://=!" (
                exit /b
            )
        )
    )
)
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

:CHECK_DBLASTDOWNLOAD
set DBLastDownload=
for /f "tokens=2*" %%A in ('2^>nul reg query "!IS_REG!" /v "DBLastDownload"') do set "DBLastDownload=%%B"
if defined DBLastDownload (
    if "!DBLastDownload!"=="N/A" (
        exit /b
    )
    call :CHECK_IS_BOOKMARKS_DATE_TIME DBLastDownload && (
        exit /b
    )
)
call :ERROR_REGEDIT DBLastDownload DBLastDownload
>nul reg add "!IS_REG!" /v "DBLastDownload" /t REG_SZ /d "N/A" /f
goto :CHECK_DBLASTDOWNLOAD

:CHECK_NUMBER_BETWEEN_CUSTOM
if "%~1"=="" exit /b 1
for /f "delims=0123456789" %%A in ("%~1") do exit /b 1
for /f "tokens=1,2delims=-" %%A in ("%~2") do (
    if %~1 lss %%A exit /b 1
    if %~1 gtr %%B exit /b 1
)
exit /b 0

:IS_LEAP_YEAR_OR_NOT
::https://stackoverflow.com/questions/35157817/batch-file-leap-year
set /a "leap=^!(years%%4) + (^!^!(years%%100)-^!^!(years%%400))"
exit /b

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
>nul reg add "!IS_REG!" /v "YouTubeDLOutputDirectory" /t REG_SZ /d "!IS_OUTPUT_DIRECTORY_YOUTUBE_DL!" /f
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
if defined el if not "!el!"=="!el:~0,150!" set "el=!el:~0,150!..."
>nul 2>&1 reg query "!IS_REG!" /v "%1" && (
    if "!language!"=="FR" (
        set t="Une erreur inattendue est survenue.!\N!!\N!Debug: '!IS_REG!\%1=!el!'!\N!!\N!Réinitialisation du paramètre '%1' à la valeur par défaut."
    ) else (
        set t="An unexpected error has occurred.!\N!!\N!Debug: '!IS_REG!\%1=!el!'!\N!!\N!Resetting '%1' setting to default value."
    )
    call :MSGBOX 69680 "Illegal Services"
)
exit /b

:SCALE
cls
if not defined WINDOWS_TERMINAL (
    mode %1,%2
)
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
set /a "_sp=width/2"
set x=
%@SHOWCURSOR%
set /p "x=!YELLOW!!\E![!_sp!C"
%@HIDECURSOR%
exit /b

:CHOOSE
if not defined x (
    exit /b 1
)
set "choose_x=`%1"
if /i "!choose_x:~1,1!"=="!x!" (
    exit /b 0
)
if /i "!choose_x:~1,2!"=="!x:~0,2!" (
    if /i not "!choose_x:`%x%=!"=="!choose_x!" (
        exit /b 0
    )
)
exit /b 1

:WEBSITECHECK
if not defined x exit /b 1
for /f "delims=0123456789-,*" %%A in ("!x!") do exit /b 1
set x1=
for /f "tokens=1,*delims=*" %%A in ("!x!") do if "%%A*%%B"=="!x!" set x1=*
set #el=1
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
set #el=0
) else (
if !untrusted_website_index! gtr 0 call :UNTRUSTED_WEBSITES_WARNING %%A
set "%%A=!YELLOW!%%A !CHECKED!"
set #el=0
)
)
) else if "!el!"=="," (
if not "!x:~0,1!"=="," if not "!x:~-1!"=="," for %%A in (!x!) do (
set "el=%%~A"
if not "!el:~0,1!"=="0" call :CHECK_NUMBER "%%~A" && if %%A geq !c1! if %%A leq !c2! if "!%%A!"=="!YELLOW!%%A !CHECKED!" (
set "%%A=!YELLOW!%%A !UNCHECKED!"
set #el=0
) else (
if !untrusted_website_index! gtr 0 call :UNTRUSTED_WEBSITES_WARNING %%A
set "%%A=!YELLOW!%%A !CHECKED!"
set #el=0
)
)
) else if "!el!"=="-" (
call :STRLEN x
set x1=!errorlevel!
set "el=!x:-=!"
call :STRLEN el
set x2=!errorlevel!
set /a el=x1-x2
if not "!el!"=="1" exit /b 1
for /f "tokens=1,2delims=-" %%A in ("!x!") do (
if "%%A"=="*" if "%%B"=="*" (
for /l %%C in (!c1!,1,!c2!) do if "!%%C!"=="!YELLOW!%%C !CHECKED!" (
set "%%C=!YELLOW!%%C !UNCHECKED!"
set #el=0
) else (
if !untrusted_website_index! gtr 0 call :UNTRUSTED_WEBSITES_WARNING %%C
set "%%C=!YELLOW!%%C !CHECKED!"
set #el=0
)
exit /b !#el!
)
if "%%A"=="*" if not "%%B"=="*" (
set "el=%%B"
if "!el:~0,1!"=="0" exit /b 1
call :CHECK_NUMBER "%%B" || exit /b 1
for /l %%C in (!c1!,1,%%B) do if "!%%C!"=="!YELLOW!%%C !CHECKED!" (
set "%%C=!YELLOW!%%C !UNCHECKED!"
set #el=0
) else (
if !untrusted_website_index! gtr 0 call :UNTRUSTED_WEBSITES_WARNING %%C
set "%%C=!YELLOW!%%C !CHECKED!"
set #el=0
)
exit /b !#el!
)
if "%%B"=="*" if not "%%A"=="*" (
set "el=%%A"
if "!el:~0,1!"=="0" exit /b 1
call :CHECK_NUMBER "%%A" || exit /b 1
for /l %%C in (%%A,1,!c2!) do if "!%%C!"=="!YELLOW!%%C !CHECKED!" (
set "%%C=!YELLOW!%%C !UNCHECKED!"
set #el=0
) else (
if !untrusted_website_index! gtr 0 call :UNTRUSTED_WEBSITES_WARNING %%C
set "%%C=!YELLOW!%%C !CHECKED!"
set #el=0
)
exit /b !#el!
)
for %%C in ("%%~A" "%%~B") do (
set "el=%%~C"
if "!el:~0,1!"=="0" exit /b 1
call :CHECK_NUMBER "%%~C" || exit /b 1
)
if %%A leq %%B if %%A geq !c1! if %%A leq !c2! if %%B geq !c1! if %%B leq !c2! for /l %%D in (%%A,1,%%B) do if "!%%D!"=="!YELLOW!%%D !CHECKED!" (
set "%%D=!YELLOW!%%D !UNCHECKED!"
set #el=0
) else (
if !untrusted_website_index! gtr 0 call :UNTRUSTED_WEBSITES_WARNING %%D
set "%%D=!YELLOW!%%D !CHECKED!"
set #el=0
)
)
)
exit /b !#el!

:UNTRUSTED_WEBSITES_WARNING
if not "!UntrustedWebsitesWarning!"=="1" (
    exit /b
)
for /l %%A in (1,1,!untrusted_website_index!) do (
    for /f "tokens=1*delims=`" %%B in ("!untrusted_website_%%A!") do (
        if "%%B"=="%1" (
            if "!language!"=="EN" set t="You have selected '%%B - %%C' which is flagged as an untrusted* website. Be careful using it.!\N!!\N!*Untrusted websites are known to the warez community to index malicious or suspicious as well as legitimate content."
            if "!language!"=="FR" set t="Vous avez sélectionné '%%B - %%C' qui est signalé comme un site web non fiable*. Soyez prudent en l'utilisant.!\N!!\N!*Les sites web non fiables sont connus de la communauté warez pour indexer du contenu malveillant ou suspect ainsi que légitime."
            call :MSGBOX 69680 "Illegal Services"
        )
    )
)
exit /b

:WEBSITESTART
if defined x exit /b 1
set #el=1
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
if "!url:~0,1!"=="`" set s=
start "" "http!s!://!url:*`=!" && !cmdwiz.exe! delay 1500
)
set #el=0
)
)
)
if "!el!"=="1" call :START_DOXTOOLV2
if "!el!"=="2" call :START_WINDOWSISODOWNLOADER
exit /b !#el!

:ERRORMESSAGE
call :ROSE "Error Choice"
if "%~1"=="" (
if "!language!"=="EN" set "t=ERROR: !BRIGHTBLACK!"!YELLOW!!x!!BRIGHTBLACK!" is not a valid choice"
if "!language!"=="FR" set "t=ERREUR: !BRIGHTBLACK!"!YELLOW!!x!!BRIGHTBLACK!" n'est pas un choix valide"
) else (
if "!language!"=="EN" set "t=ERROR: !BRIGHTBLACK!"!YELLOW!!%1!!BRIGHTBLACK!" is not a valid %~3"
if "!language!"=="FR" set "t=ERREUR: !BRIGHTBLACK!"!YELLOW!!%1!!BRIGHTBLACK!" n'est pas %~2 valide"
)
set t=!RED!!t!...
call :DRAW_CENTER_ERROR t
>nul timeout /t 3
exit /b

:START_DOXTOOLV2
for %%A in (Newtonsoft.Json.dll "Dox Tool V2.exe") do (
    if not exist "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\Dox Tool V2\%%~A" (
        call :CURL "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\Dox Tool V2.7z" "`git_raw_downloads`/DoxToolV2.7z" || (
            call :ERROR_INTERNET
            exit /b
        )
    )
)
pushd "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\Dox Tool V2"
start "" "Dox Tool V2.exe" && (
    if "!language!"=="EN" set t="Only 'Username Search' & 'Extra Tools' are working.!\N!!\N!The tool has not been updated since 05-02-2016."
    if "!language!"=="FR" set t="Seules 'Username Search' & 'Extra Tools' fonctionnent.!\N!!\N!L'outil n'a pas été mis à jour depuis le 05-02-2016."
    call :MSGBOX 69696 "Illegal Services"
)
popd
exit /b

:START_WINDOWSISODOWNLOADER
if not exist "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\Windows-ISO-Downloader\Windows-ISO-Downloader.exe" (
    call :CURL "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\Windows-ISO-Downloader\Windows-ISO-Downloader.exe" "https://heidoc.net/php/Windows-ISO-Downloader.exe" || (
        call :ERROR_INTERNET
        exit /b
    )
)
pushd "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\Windows-ISO-Downloader"
start "" "Windows-ISO-Downloader.exe"
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
%@SHOWCURSOR%
>nul choice /n /c RHANBL
if !errorlevel!==1 set %1=REALTIME
if !errorlevel!==2 set %1=HIGH
if !errorlevel!==3 set %1=ABOVENORMAL
if !errorlevel!==4 set %1=NORMAL
if !errorlevel!==5 set %1=BELOWNORMAL
if !errorlevel!==6 set %1=LOW
exit /b

:GET_VERSION
call :CURL_RAW JB0xvJRG lastversion
if defined lastversion (
if "!VERSION:~1,7!" geq "!lastversion:~1,7!" exit /b 0
if "!VERSION:~1,3!" lss "!lastversion:~1,3!" exit /b 1
if "!VERSION:~1,7!" lss "!lastversion:~1,7!" exit /b 2
) else (
call :ROSE "Error Internet"
if "!language!"=="EN" set t="Checking the latest version has failed.!\N!!\N!Can't check the latest version.!\N!!\N!Check your current Internet settings and try again."
if "!language!"=="FR" set t="La vérification de la dernière version a échoué.!\N!!\N!Impossible de vérifier la dernière version.!\N!!\N!Vérifiez vos paramètres Internet actuels et réessayez."
call :MSGBOX 69680 "Illegal Services"
)
exit /b 3

:GET_FILE_HASH
for /f %%A in ('CertUtil -hashfile "%1" SHA1 ^| findstr /ber "[a-f0-9]*"') do (
    set "file_hash=%%A"
    goto :_GET_FILE_HASH
)
:_GET_FILE_HASH
call :CHECK_HASH_SHA1 file_hash && (
    exit /b 0
)
exit /b 1

:LOGGING_GET_DATE_TIME
if defined date_time (
    set date_time=
)
for /f "tokens=2delims==." %%A in ('2^>nul wmic os get Localdatetime /value') do (
    set "date_time=%%A"
    set "date_time=!date_time:~0,-10!-!date_time:~-10,2!-!date_time:~-8,2!_!date_time:~-6,2!-!date_time:~-4,2!-!date_time:~-2,2!"
)
call :CHECK_LOGGING_DATE_TIME date_time && (
    exit /b 0
)
if defined date_time (
    set date_time=
)
>nul chcp 437
for /f "delims=" %%A in ('2^>nul powershell get-date -format "{yyyy-MM-dd_HH-mm-ss}"') do (
    set "date_time=%%A"
)
>nul chcp 65001
call :CHECK_LOGGING_DATE_TIME date_time && (
    exit /b 0
)
if "%1"=="ERROR_FATAL" (
    exit /b 1
)
call :ERROR_FATAL DATE_TIME

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
set x1=!errorlevel!
set "el=!el:%\E%=!"
call :STRLEN el
set x2=!errorlevel!
set /a el=(x1-x2)*4, len=x2-el
if !len! lss !width! (set /a "_sp=(width-len)/2") else set _sp=0
<nul set /p="!\E![!_sp!C%~1"
if not "%2"=="1" echo:
exit /b

:DRAW_CUSTOM_CENTER
set "el=%~2"
call :STRLEN el
set x1=!errorlevel!
set "el=!el:%\E%=!"
call :STRLEN el
set x2=!errorlevel!
set /a el=(x1-x2)*4, len=x2-el
set /a "_sp=(%1-len)/2"
<nul set /p="!\E![!_sp!C%~2"
echo:
exit /b

:DRAW_CENTER_ERROR
set "el=!%1!"
call :STRLEN el
set x1=!errorlevel!
set "el=!el:%\E%=!"
call :STRLEN el
set x2=!errorlevel!
set /a el=(x1-x2)*4, len=x2-el
if !len! lss !width! (set /a "_sp=(width-len)/2") else set _sp=0
<nul set /p="!\E![!_sp!C!%1!"
if not "%2"=="1" echo:
exit /b

:STRLEN
::https://www.dostips.com/DtTipsStringOperations.php#Function.strLen
if not defined %1 (
    exit /b 0
)
set "str=a!%1!"
set len=0
for /l %%A in (12,-1,0) do (
    2>nul set /a "len|=1<<%%A"
    if not defined len (
        exit /b 0
    )
    for %%B in (!len!) do (
        if "!str:~%%B,1!"=="" (
            2>nul set /a "len&=~1<<%%A"
            if not defined len (
                exit /b 0
            )
        )
    )
)
exit /b !len!

:READ_IPLOOKUP
if exist "!IS_OUTPUT_DIRECTORY!\IP Lookup Saved.txt" (start "" "!IS_OUTPUT_DIRECTORY!\IP Lookup Saved.txt") else (
if "!language!"=="EN" set t="IP Lookup list not found.!\N!!\N!You must first save a Lookup to be able to read it."
if "!language!"=="FR" set t="Liste d'IP Lookup non trouvée.!\N!!\N!Vous devez d'abord enregistrer une Lookup pour pouvoir la lire."
call :MSGBOX 69680 "Illegal Services"
)
exit /b

:DELETE_IPLOOKUP
if exist "!IS_OUTPUT_DIRECTORY!\IP Lookup Saved.txt" (
    del /f /q "!IS_OUTPUT_DIRECTORY!\IP Lookup Saved.txt"
    if exist "!IS_OUTPUT_DIRECTORY!\IP Lookup Saved.txt" (
        if "!language!"=="EN" set t="IP Lookup list could not be deleted."
        if "!language!"=="FR" set t="La liste d'IP Lookup n'a pas pu être supprimée."
        call :MSGBOX 69680 "Illegal Services"
    ) else (
        if "!language!"=="EN" set t="IP Lookup list successfully deleted."
        if "!language!"=="FR" set t="La liste d'IP Lookup a bien été supprimée."
        call :MSGBOX 69696 "Illegal Services"
    )
) else (
    if "!language!"=="EN" set t="IP Lookup list not found.!\N!!\N!You must first save a Lookup to be able to delete it."
    if "!language!"=="FR" set t="Liste d'IP Lookup non trouvée.!\N!!\N!Vous devez d'abord enregistrer une Lookup pour pouvoir la supprimer."
    call :MSGBOX 69680 "Illegal Services"
)
exit /b

:ERROR_INTERNET
if !errorlevel!==1 (
    call :ROSE "Error Internet"
    if "!language!"=="EN" set t="Your Internet access appears to be offline.!\N!!\N!You must activate Internet and try again."
    if "!language!"=="FR" set t="Votre accès Internet semble être hors ligne.!\N!!\N!Veuillez activer Internet et réessayer."
) else if !errorlevel!==2 (
    call :ROSE "Error Remote Host"
    if "!language!"=="EN" set t="The remote host appears to be offline.!\N!!\N!Downloading '!curl_url!' impossible."
    if "!language!"=="FR" set t="L'hôte distant semble être hors ligne.!\N!!\N!Téléchargement de '!curl_url!' impossible."
) else if !errorlevel!==3 (
    call :ROSE "Error Git Proxy Backup"
    if "!language!"=="EN" set t="The Git proxy backup server is running. You cannot download external files from it.!\N!!\N!Downloading '!curl_url!' impossible."
    if "!language!"=="FR" set t="Le serveur proxy Git de secours est en marche. Vous ne pouvez pas télécharger de fichiers externes à partir de celui-ci.!\N!!\N!Téléchargement de '!curl_url!' impossible."
) else if !errorlevel!==4 (
    call :ROSE "Error Git Proxy"
    if "!language!"=="EN" set t="IS Git proxy: '!git!' appears to be offline.!\N!!\N!Downloading '!curl_url!' impossible.!\N!!\N!Try to restart Illegal Services or join our Telegram groups for more updates."
    if "!language!"=="FR" set t="IS Git proxy: '!git!' semble être hors ligne.!\N!!\N!Téléchargement de '!curl_url!' impossible.!\N!!\N!Essayez de redémarrer Illegal Services ou rejoignez nos groupes Telegram pour plus de mises à jour."
) else if !errorlevel!==5 (
    call :ROSE "Error all Git Proxys"
    if "!language!"=="EN" set t="All IS Git proxys appears to be offline.!\N!!\N!Downloading '!curl_url!' impossible.!\N!!\N!Try to restart Illegal Services or join our Telegram groups for more updates."
    if "!language!"=="FR" set t="All IS Git proxys semble être hors ligne.!\N!!\N!Téléchargement de '!curl_url!' impossible.!\N!!\N!Essayez de redémarrer Illegal Services ou rejoignez nos groupes Telegram pour plus de mises à jour."
)
call :MSGBOX 69680 "Illegal Services"
exit /b

:PROXY
call :CHECK_INTERNET || (call :PROXY_DOWN & exit /b 1)
call :CHECK_PROXY
for %%A in (!GIT_LIST!) do (
    for /f "tokens=1-3delims=`" %%B in ("%%A") do (
        if defined Proxy (
            if "%%B"=="!Proxy:*://=!" (
                call :APPLY_PROXY %%B %%C %%D && (
                    exit /b 0
                )
            )
        ) else (
            call :APPLY_PROXY %%B %%C %%D && (
                exit /b 0
            )
        )
    )
)
if defined git_backup exit /b 3
set "git_backup=backup "
call :PROXY_DOWN
call :CURL_RAW 1ARL0img git
call :CURL_RAW urudZjdg git_build
call :CURL_RAW c5nbugAf git_changelog
call :CURL_RAW ThrdeC97 git_release
if "!language!"=="EN" set t="Illegal Services cannot connect to its Git proxy server.!\N!!\N!The Git proxy backup server is running and only updates for Illegal Services can be performed."
if "!language!"=="FR" set t="Illegal Services ne peut pas se connecter à son serveur proxy Git.!\N!!\N!Le serveur proxy Git de secours est en marche et seules les mises à jour d'Illegal Services peuvent être effectuées."
call :MSGBOX 69648 "Illegal Services"
exit /b 2

:APPLY_PROXY
for /f %%A in ('curl.exe -fIks -X GET -o NUL "https://%1" -w "%%{response_code}"') do (
    if "%%A"=="200" (
        set "git=https://%1"
        set "git_raw_main=!git!/%2/main"
        set "git_raw_downloads=!git!/%2/downloads"
        set "git_raw_source=!git!/%2/source"
        set "git_build=!git_raw_main!/Illegal_Services.exe"
        set "git_changelog=!git_raw_main!/ChangeLog.txt"
        set "git_release=!git_raw_downloads!/IS.Setup.exe"
        set "git_source=!git!/%3"
        >nul reg add "!IS_REG!" /v "Proxy" /t REG_SZ /d "!git!" /f
        exit /b 0
    )
)
exit /b 1

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
) do set %%A=[404 Git proxy not found]
exit /b

:CURL_RAW
for /f "delims=" %%A in ('curl.exe -fkLs "https://pastebin.com/raw/%1"') do set "%2=%%A"
exit /b

:ERROR_WINDOWS_VERSION
if "!language!"=="EN" set t="Your Windows version is not compatible with that feature."
if "!language!"=="FR" set t="Votre version de Windows n'est pas compatible avec cette fonctionnalité."
call :MSGBOX 69648 "Illegal Services"
exit /b

:OPEN_FOLDER
if exist "%~1" (
    start "" "%~1"
) else (
    if "!language!"=="EN" set "t=Folder '%~1' not found.!\N!!\N!"
    if "!language!"=="FR" set "t=Dossier '%~1' non trouvée.!\N!!\N!"
    if "%2"=="SETTINGS" (
        if "!language!"=="EN" set t="!t!You must first 'Extract IS source code.' or 'Export settings' to be able to open it."
        if "!language!"=="FR" set t="!t!Vous devez d'abord 'Extraire le code source d'IS' ou 'Exporter les paramètres' pour pouvoir ouvrir le dossier."
    ) else if "%2"=="YOUTUBEDL" (
        if "!language!"=="EN" set t="!t!You must first download an item to be able to open it."
        if "!language!"=="FR" set t="!t!Vous devez d'abord télécharger un élément pour pouvoir ouvrir le dossier."
    ) else if "%2"=="IS_BOOKMARKS" (
        if "!language!"=="EN" set t="!t!You must first download an item to be able to open it."
        if "!language!"=="FR" set t="!t!Vous devez d'abord télécharger un élément pour pouvoir ouvrir le dossier."
    )
    call :MSGBOX 69680 "Illegal Services"
)
exit /b

:START_DOWNLOADED_FILE
pushd "!TMPF!"
if "!language!"=="EN" echo Please complete "!YELLOW!%1!CYAN!" installation in the window that appeared...
if "!language!"=="FR" echo Veuillez terminer l'installation de "!YELLOW!%1!CYAN!" dans la fenêtre qui est apparue...
echo:
start /w %1
>nul timeout /t 0 /nobreak
del /f /q %1
popd
exit /b

:SHOW_WINDOW
if defined WT_SESSION (
    set el=cmd.exe
) else (
    if defined WINDOWS_TERMINAL (
        set el=WindowsTerminal.exe
    ) else (
        set "el=!IS_PROCESS!"
    )
)
for /f "tokens=2delims=," %%A in ('tasklist /v /fo csv /fi "imagename eq !el!" ^| find "%~1"') do (
!cmdwiz.exe! showwindow minimize /p:"%%~A"
!cmdwiz.exe! showwindow restore /p:"%%~A"
!cmdwiz.exe! showwindow top /p:"%%~A"
exit /b 0
)
exit /b 1

:MISSING_FILE
if not defined x1 (
if "!language!"=="EN" echo !RED![FAILED: missing file^(s^)] . . .
if "!language!"=="FR" echo !RED![ECHEC: fichier^(s^) manquant^(s^)] . . .
set x1=1
)
if "!language!"=="EN" echo !CYAN!The file !RED!"!IS_DIR!%1"!CYAN! is missing, trying to download it...
if "!language!"=="FR" echo !CYAN!Le fichier !RED!"!IS_DIR!%1"!CYAN! est manquant, tentative de téléchargement...
exit /b

:ERROR_FATAL
for %%A in (x1 x2) do (
    if defined %%A (
        set %%A=
    )
)
if "%1"=="WINDOWS_VERSION" (
    if "!language!"=="EN" set t="ERROR: Your Windows version is not compatible with Illegal Services.!\N!!\N!You need Windows 10 or 11 (x86/x64)."
    if "!language!"=="FR" set t="ERREUR: Votre version de Windows n'est pas compatible avec Illegal Services.!\N!!\N!Vous avez besoin de Windows 10 ou 11 (x86/x64)."
) else if "%1"=="UNICODE" (
    if "!language!"=="EN" set t="Illegal Services cannot start because Unicode characters cannot be displayed correctly.!\N!!\N!If you receive this error message, then you are probably experiencing this bug issue: https://github.com/Illegal-Services/Illegal_Services/issues/10!\N!!\N!For more information, contact us on our Telegram forum."
    if "!language!"=="FR" set t="Illegal Services ne peut pas démarrer car les caractères Unicode ne peuvent pas être affichés correctement.!\N!!\N!Si vous recevez ce message d'erreur, vous rencontrez probablement l'issue de ce bug: https://github.com/Illegal-Services/Illegal_Services/issues/10!\N!!\N!Pour plus d'informations, contactez-nous sur le forum Telegram d'Illegal Services."
    set x2=1
) else if "%1"=="NAME" (
    if "!language!"=="EN" set t="Invalid characters detected in your executable name.!\N!!\N!Illegal Services should be named 'Illegal_Services.exe'.!\N!!\N!Please rename Illegal Services and try again."
    if "!language!"=="FR" set t="Caractères invalides détectés dans votre nom d'exécutable.!\N!!\N!Illegal Services devrais être nommés 'Illegal_Services.exe'.!\N!!\N!Veuillez renommer Illegal Services et réessayer."
) else if "%1"=="ARCH" (
    if "!language!"=="EN" set t="Illegal Services could not determine your Windows architecture.!\N!!\N!Please report this bug: '!ARCH!' on our Telegram forum in order to correct this bug in a future release."
    if "!language!"=="FR" set t="Illegal Services n'a pas pu déterminer votre architecture Windows.!\N!!\N!Veuillez signaler ce bug: '!ARCH!' sur le forum Telegram d'Illegal Services afin de corriger ce bug dans une future version."
    set x2=1
) else if "%1"=="CMDLN" (
    if "!language!"=="EN" set t="You are running the extracted source code from 'Illegal_Services.exe'.!\N!!\N!That said, this is not an authentic copy from the original Illegal Services source code.!\N!!\N!This extracted source code break an important feature of Illegal Services.!\N!!\N!Use this one instead: [404 Git proxy not found]. Maybe: https://github.com/Illegal-Services/Illegal_Services/tree/source"
    if "!language!"=="FR" set t="Vous exécutez le code source extrait de 'Illegal_services.exe'.!\N!!\N!Cela dit, ce n'est pas une copie authentique du code source original d'Illegal Services.!\N!!\N!Ce code source extrait casse une fonctionnalité importante d'Illegal Services.!\N!!\N!Utilisez celui-ci à la place: [404 Git proxy not found]. Maybe: https://github.com/Illegal-Services/Illegal_Services/tree/source"
) else if "%1"=="TMP" (
    if "!language!"=="EN" (
        set t1="Your 'TEMP' and 'TMP' environment variables do not exist."
        set t2="Please fix one of them and try again."
    )
    if "!language!"=="FR" (
        set t1="Vos variables d'environnement 'TEMP' et 'TMP' n'existent pas."
        set t2="Veuillez réparer l'une d'entre elles et réessayer."
    )
    set /a x1=1, x2=1
) else if "%1"=="CHCP" (
    if "!language!"=="EN" set t="Illegal Services could not set your code page number to 65001.!\N!!\N!Please report this bug: '!CP!' on our Telegram forum in order to correct this bug in a future release."
    if "!language!"=="FR" set t="Illegal Services n'a pas pu définir votre numéro de page de code sur 65001.!\N!!\N!Veuillez signaler ce bug: '!CP!' sur le forum Telegram d'Illegal Services afin de corriger ce bug dans une future version."
    set x2=1
) else if "%1"=="IS_OUTPUT_DIRECTORY" (
    if "!language!"=="EN" set t="Illegal Services could not determine its output directory.!\N!!\N!Please report this bug: '!IS_OUTPUT_DIRECTORY!' on our Telegram forum in order to correct this bug in a future release."
    if "!language!"=="FR" set t="Illegal Services n'a pas pu déterminer son répertoire de sortie.!\N!!\N!Veuillez signaler ce bug: '!IS_OUTPUT_DIRECTORY!' sur le forum Telegram d'Illegal Services afin de corriger ce bug dans une future version."
    set x2=1
) else if "%1"=="DATE_TIME" (
    if "!language!"=="EN" set t="Illegal Services could not determine the current date and time.!\N!!\N!Please report this bug on our Telegram forum in order to correct this bug in a future release."
    if "!language!"=="FR" set t="Illegal Services n'a pas pu déterminer la date et l'heure actuelles.!\N!!\N!Veuillez signaler ce bug sur le forum Telegram d'Illegal Services afin de corriger ce bug dans une future version."
    set x2=1
) else if "%1"=="HASH" (
    if "!language!"=="EN" set t="Illegal Services could not determine the HASH of the file '%~2'.!\N!!\N!Please report this bug on our Telegram forum in order to correct this bug in a future release."
    if "!language!"=="FR" set t="Illegal Services n'a pas pu déterminer le HASH du fichier '%~2'.!\N!!\N!Veuillez signaler ce bug sur le forum Telegram d'Illegal Services afin de corriger ce bug dans une future version."
    set x2=1
) else if "%1"=="ERRORLEVEL" (
    if !errorlevel!==5 (
        if "!language!"=="EN" set t="Illegal Services cannot continue running '%~2' because it's access appears to be denied.!\N!This error: '!errorlevel!' is known to be Windows Defender blocking access to the file because the file is detected to contain a virus or unwanted software.!\N!!\N!We recommend whitelisting the Illegal Services PATH (%~dp0) in your antivirus software(s) to fix this issue and prevent a similar issue in the future."
        if "!language!"=="FR" set t="Illegal Services ne peut pas continuer à exécuter '%~2' car son accès semble être refusé.!\N!Cette erreur: '!errorlevel!' est connue pour être Windows Defender bloquant l'accès au fichier car il est détecté que le fichier contient un virus ou un logiciel indésirable.!\N!!\N!Nous vous recommandons de mettre en liste blanche le chemin d'accès d'Illegal Services (%~dp0) dans votre ou vos logiciels antivirus pour réparer ce problème et éviter un problème similaire à l'avenir."
    ) else (
        if "!language!"=="EN" set t="Illegal Services cannot continue running '%~2' because it's access appears to be impossible.!\N!!\N!Please report this bug: '!errorlevel!' on our Telegram forum in order to correct this bug in a future release."
        if "!language!"=="FR" set t="Illegal Services ne peut pas continuer à exécuter '%~2' car son accès semble être impossible.!\N!!\N!Veuillez signaler ce bug: '!errorlevel!' sur le forum Telegram d'Illegal Services afin de corriger ce bug dans une future version."
        set x2=1
    )
)
) else (
    if "!language!"=="EN" set "t=Illegal Services can't start because '!IS_DIR!%1' is missing."
    if "!language!"=="FR" set "t=Illegal Services ne peut pas démarrer car '!IS_DIR!%1' est manquant."
    if "%2"=="CURL" (
        if "!language!"=="EN" set "t=!t!!\N!!\N!Please reinstall Illegal Services and try again."
        if "!language!"=="FR" set "t=!t!!\N!!\N!Veuillez réinstaller Illegal Services et réessayer."
        set x2=2
    ) else (
        if !errorlevel!==1 (
            if "!language!"=="EN" set "t=!t!!\N!!\N!You must activate Internet and try again."
            if "!language!"=="FR" set "t=!t!!\N!!\N!Veuillez activer Internet et réessayer."
        ) else if !errorlevel!==2 (
            if "!language!"=="EN" set "t=!t!!\N!!\N!IS Git proxy: '!git!' appears to be offline. For more updates visit our Telegram."
            if "!language!"=="FR" set "t=!t!!\N!!\N!IS Git proxy: '!git!' semble être hors ligne. Pour plus de mises à jour, visitez notre Telegram."
            set x2=1
        )
    )
    set t="!t!"
)
if not "%1"=="IS_OUTPUT_DIRECTORY" (
    if not "%1"=="DATE_TIME" (
        call :LOGGING_GET_DATE_TIME
        if not exist "!IS_OUTPUT_DIRECTORY_LOGS!\crashes\!date_time!\" (
            md "!IS_OUTPUT_DIRECTORY_LOGS!\crashes\!date_time!\"
        )
        >"!IS_OUTPUT_DIRECTORY_LOGS!\crashes\!date_time!\DUMP.log" (
            echo errorlevel=%errorlevel%
            set "
        )
    )
)
if defined x1 (
    mshta vbscript:Execute^("msgbox "!t1!" & Chr(10) & Chr(10) & "!t2!",69648,""Illegal Services"":close"^)
) else (
    call :MSGBOX 69648 "Illegal Services"
)
if "!x2!"=="1" (
    start "" "https://t.me/illegal_services_forum"
) else if "!x2!"=="2" (
    start "" "https://t.me/illegal_services"
)
exit 0

:PROCESS_IS_BOOKMARKS_PARSER
set #TITLE=!#TITLE! x IS.bookmarks.html
if "!language!"=="EN" (
    title !#TITLE:`=Initializing!
) else if "!language!"=="FR" (
    title !#TITLE:`=Initialisation!
)
call :DOWNLOAD_IS_BOOKMARKS_DB IS_BOOKMARKS_PARSER || (
    exit 0
)
call :CHECK_FILE_SIGNATURE_IS_BOOKMARKS_DB || (
    exit 0
)
for %%A in (x warning_streaming warning_ip_loggers) do (
    if defined %%A (
        set %%A=
    )
)
set LOOKUP_folders=`
set root_folder_length=0
if defined root_folder (
    set root_folder=
)
call :CHECK_PATCH_BOOKMARKS_PARSER
call :CHECK_FILE_ACCESS_IS_BOOKMARKS_PARSER
for /f "tokens=2,3*" %%A in ('!bookmarks_parser.exe! -f -i -e "!IS_OUTPUT_DIRECTORY!\IS.bookmarks.html"') do (
    if not defined root_folder (
        if "%%A"=="1" (
            set "root_folder=%%C"
        )
    )
    set "memory_folder_%%A=%%C"
    set "LOOKUP_folders=!LOOKUP_folders!%%C`"
)
if defined root_folder (
    call :IS_BOOKMARKS_SET_ROOT_FOLDER_LENGTH
    set root_folder=
)
for /f "tokens=2,3*" %%A in ('!bookmarks_parser.exe! -f -i -e --folders-path "!IS_OUTPUT_DIRECTORY!\IS.bookmarks.html"') do (
    set "memory_path_%%A=%%C"
    if defined memory_path_%%A (
        if not "!memory_path_%%A!"=="!memory_path_1!" (
            for /f "delims=" %%D in ("!memory_folder_%%A!") do (
                set "memory_path_%%A=!memory_path_%%A:\\=\!"
                set "memory_path_%%A=!memory_path_%%A:\/=/!"
                set "memory_path_%%A=!memory_path_%%A:~%root_folder_length%!"
                set "memory_path_%%A=!memory_path_%%A:/%%~D=!"
            )
        )
    )
)

:IS_BOOKMARKS_PARSER
if not "!LOOKUP_folders:`%category_folder%`=!"=="!LOOKUP_folders!" (
    for /f "tokens=1*delims==" %%A in ('set memory_folder_') do (
        if /i "%%B"=="!category_folder!" (
            if not "%%B"=="!category_folder!" (
                set "category_folder=%%B"
            )
        )
    )
)
for %%A in (category_path_ untrusted_website_ name_ url_) do (
    >nul 2>&1 set %%A && (
        for /f "delims==" %%B in ('set %%A') do (
            set %%B=
        )
    )
)
if defined open_folder_statut (
    set open_folder_statut=
)
if defined c1 (
    if defined c2 (
        for /l %%A in (!c1!,1,!c2!) do (
            set %%A=
        )
    )
)
set /a first_scan=1, path_index=0, untrusted_website_index=0

:CONTINUE_IS_BOOKMARKS_PARSER
title !#TITLE:`=%category_folder%!
cls
call :CHECK_FILE_SIGNATURE_IS_BOOKMARKS_DB || (
    call :DOWNLOAD_IS_BOOKMARKS_DB IS_BOOKMARKS_PARSER || (
        exit 0
    )
)
if defined x (
    set "memory_x=!x!"
    for /f "delims=1234567890" %%A in ("!x!") do (
        set memory_x=
    )
)
for %%A in (previous_action previous_depth current_depth) do (
    if defined %%A (
        set %%A=
    )
)
set /a c1=1, c2=0
for /f "tokens=1-4*" %%A in ('!bookmarks_parser.exe! -i -e --folders-path --folder-all "!category_folder!" "!IS_OUTPUT_DIRECTORY!\IS.bookmarks.html"') do (
    if "%%A"=="PATH" (
        set previous_action=PATH
        if "!memory_folder_%%B!"=="!category_folder!" (
            if defined first_scan (
                set /a path_index+=1
                set "category_path_!path_index!=!memory_path_%%B!"
            )
            echo:
            if %%B lss 3 (
                echo !"!  !CYAN!█!BGYELLOW!!BLACK!█ ROOT PATH: / █!BGBLACK!!CYAN!█!"!
            ) else (
                echo !"!  !CYAN!█!BGYELLOW!!BLACK!█ ROOT PATH: !memory_path_%%B! █!BGBLACK!!CYAN!█!"!
            )
        )
        echo:
        echo !"! !YELLOW!^>!CYAN! ■█!BGYELLOW!!RED!█ !memory_folder_%%B! █!BGBLACK!!CYAN!█■!"!
    ) else if "%%A"=="LINK" (
        set "current_depth=%%C"
        if "!previous_action!"=="LINK" (
            if not "!previous_depth!"=="!current_depth!" (
                echo:
            )
        )
        set previous_action=LINK
        set "previous_depth=!current_depth!"
        set /a c2+=1
        set "url=%%D"
        set "name=%%E"
        if defined name (
            if "!name:~-14!"==" | (untrusted)" (
                if defined first_scan (
                    set /a untrusted_website_index+=1
                    set "untrusted_website_!untrusted_website_index!=!c2!`!name: | (untrusted)=!"
                )
                set "name=!RED!!name!!WHITE!"
            )
        )
        if !c2! lss 10 (
            set "display_padding=  "
        ) else if !c2! lss 100 (
            set "display_padding= "
        ) else if !c2! lss 1000 (
            set display_padding=
        )
        if defined !c2! (
            for %%F in ("!c2!") do (
                echo !"! !display_padding!!%%~F!!name! (!BRIGHTMAGENTA!!url!!WHITE!)!"!
            )
        ) else (
            for %%F in (!path_index!) do (
                set "path_!c2!=!category_path_%%F!"
            )
            set "url_!c2!=!url!"
            set "name_!c2!=!name!"
            set "!c2!=!YELLOW!!c2! !UNCHECKED!"
            echo !"! !display_padding!!YELLOW!!c2! !UNCHECKED!!name! (!BRIGHTMAGENTA!!url!!WHITE!)!"!
        )
    )
)
if defined first_scan (
    if defined path_index (
        for /l %%A in (1,1,!path_index!) do (
            <nul set /p="!category_path_%%A!/!category_folder!" | >nul findstr /rc:"^Illegal Services/Doxing" /c:"^Illegal Services/Portable Apps" && (
                set open_folder_statut=1
            )
        )
    )
    set first_scan=
)
echo !BRIGHTBLACK!
if "!category_folder!"=="Internet Protocol Television (IPTV)" (
    goto :IS_BOOKMARKS_CHOICES_IPTV
) else if "!category_folder!"=="Torrenting" (
    goto :IS_BOOKMARKS_CHOICES_TORRENTING
)
goto :IS_BOOKMARKS_CHOICES_OTHER

:IS_BOOKMARKS_CHOICES_IPTV
if "!language!"=="EN" (set t1=Write a number/category OR) & (set t2=AND press) & set t3=ENTER
if "!language!"=="FR" (set t1=Ecrivez un numéro/catégorie OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!UPDATE!BRIGHTBLACK!" / "!YELLOW!INSTALL!BRIGHTBLACK!" / "!YELLOW!HELP!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
>nul 2>&1 reg query "HKCR\.m3u8" || (
    echo:
    if "!language!"=="EN" call :DRAW_CENTER "!RED!ERROR: To be able to use !YELLOW!IPTV!RED!, first you need to choose: !YELLOW![INSTALL]"
    if "!language!"=="FR" call :DRAW_CENTER "!RED!ERREUR: Pour pouvoir utiliser !YELLOW!IPTV!RED!, vous devez d'abord choisir: !YELLOW![INSTALL]"
)
goto :IS_BOOKMARKS_PROMPT

:IS_BOOKMARKS_IPTV_TUTORIAL
cls
title !#TITLE:`=Internet Protocol Television Tutorial!
call :ROSE "Internet Protocol Television Tutorial"

:CONTINUE_IS_BOOKMARKS_IPTV_TUTORIAL
cls
echo !CYAN!
echo !\E![24C═════════════════════
if "!language!"=="EN" set t=TUTORIAL
if "!language!"=="FR" set t=TUTORIEL
echo !\E![23C// !RED!█!BGYELLOW!!BLACK! IPTV !t! !RED!█!BGBLACK!!CYAN! \\
echo !\E![4C╔═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
echo !\E![4C║                                                                                                                                             ║
if "!language!"=="EN" echo !\E![4C║        ■█!BGYELLOW!!RED!█ ♦ What's IPTV (Wikipedia) ? █!BGBLACK!!CYAN!█■                                                                                                  ║
if "!language!"=="FR" echo !\E![4C║        ■█!BGYELLOW!!RED!█ ♦ Qu'est-ce que l'IPTV (Wikipedia) ? █!BGBLACK!!CYAN!█■                                                                                         ║
echo !\E![4C║                                                                                                                                             ║
if "!language!"=="EN" echo !\E![4C║    Internet Protocol television (IPTV) is the delivery of television content over Internet Protocol (IP) networks.                          ║
if "!language!"=="FR" echo !\E![4C║    La télévision sur protocole Internet (IPTV) est la diffusion de contenu télévisuel sur des réseaux IP (Internet Protocol).               ║
if "!language!"=="EN" echo !\E![4C║    This is in contrast to delivery through traditional terrestrial, satellite, and cable television formats.                                ║
if "!language!"=="FR" echo !\E![4C║    Cela contraste avec la diffusion via les formats traditionnels de télévision terrestre, par satellite et par câble.                      ║
if "!language!"=="EN" echo !\E![4C║    Unlike downloaded media, IPTV offers the ability to stream the source media continuously.                                                ║
if "!language!"=="FR" echo !\E![4C║    Contrairement aux médias téléchargés, IPTV offre la possibilité de diffuser en continu le média source.                                  ║
if "!language!"=="EN" echo !\E![4C║    As a result, a client media player can begin playing the content (such as a TV channel) almost immediately.                              ║
if "!language!"=="FR" echo !\E![4C║    En conséquence, un lecteur multimédia client peut commencer à lire le contenu (comme une chaîne de télévision) presque immédiatement.    ║
if "!language!"=="EN" echo !\E![4C║    This is known as streaming media.                                                                                                        ║
if "!language!"=="FR" echo !\E![4C║    C'est ce qu'on appelle le streaming multimédia.                                                                                          ║
echo !\E![4C║                                                                                                                                             ║
if "!language!"=="EN" echo !\E![4C║    VLC is an open-source media player to stream and play any kind of media on all the available devices.                                    ║
if "!language!"=="FR" echo !\E![4C║    VLC est un lecteur multimédia open source pour diffuser et lire tout type de média sur tous les appareils disponibles.                   ║
echo !\E![4C║                                                                                                                                             ║
if "!language!"=="EN" echo !\E![4C║    To access IPTV on VLC, make sure to have the following things listed below:                                                              ║
if "!language!"=="FR" echo !\E![4C║    Pour accéder à l'IPTV sur VLC, assurez-vous que les éléments suivants sont répertoriés ci-dessous:                                       ║
if "!language!"=="EN" echo !\E![4C║    - Internet connection                                                                                                                    ║
if "!language!"=="FR" echo !\E![4C║    - Connexion Internet                                                                                                                     ║
echo !\E![4C║    - VLC Media Player                                                                                                                       ║
if "!language!"=="EN" echo !\E![4C║    - M3U or M3U8 URL (That you have downloaded in one of the previous Illegal Services IPTV links.)                                         ║
if "!language!"=="FR" echo !\E![4C║    - URL M3U ou M3U8 (que vous avez téléchargée dans l'un des liens IPTV de services illégaux précédents.)                                  ║
echo !\E![4C║                                                                                                                                             ║
echo !\E![4C║                                                                                                                                             ║
if "!language!"=="FR" echo !\E![4C║        ■█!BGYELLOW!!RED!█ ♦ Comment utiliser l'IPTV sur PC en utilisant VLC ? █!BGBLACK!!CYAN!█■                                                                          ║
if "!language!"=="EN" echo !\E![4C║        ■█!BGYELLOW!!RED!█ ♦ How to watch IPTV on PC using VLC ? █!BGBLACK!!CYAN!█■                                                                                        ║
echo !\E![4C║                                                                                                                                             ║
if "!language!"=="EN" echo !\E![4C║    [!YELLOW!1!CYAN!]  ^> !WHITE! Download and install VLC Media Player.!CYAN!                                                                                           ║
if "!language!"=="FR" echo !\E![4C║    [!YELLOW!1!CYAN!]  ^> !WHITE! Téléchargez et installer VLC Media Player.!CYAN!                                                                                       ║
if "!language!"=="EN" echo !\E![4C║    Launch VLC Media Player and choose "Media" from the menu bar.                                                                            ║
if "!language!"=="FR" echo !\E![4C║    Lancez VLC Media Player et choisissez "Media" dans la barre de menu.                                                                     ║
if "!language!"=="EN" echo !\E![4C║    Select "Open Network Stream" or press "Ctrl + N" on the keyboard to open directly.                                                       ║
if "!language!"=="FR" echo !\E![4C║    Sélectionnez "Open Network Stream" ou appuyez sur "Ctrl + N" sur le clavier pour ouvrir directement.                                     ║
if "!language!"=="EN" echo !\E![4C║    Under the "Network tab", enter the M3U or M3U8 URL.                                                                                      ║
if "!language!"=="FR" echo !\E![4C║    Sous l'onglet "Réseau", entrez l'URL M3U ou M3U8.                                                                                        ║
if "!language!"=="EN" echo !\E![4C║    Click on "Play" to start to stream all the available content.                                                                            ║
if "!language!"=="FR" echo !\E![4C║    Cliquez sur "Play" pour commencer à diffuser tout le contenu disponible.                                                                 ║
if "!language!"=="EN" echo !\E![4C║    To navigate among channels, press "Ctrl + L" to view all the available content.                                                          ║
if "!language!"=="FR" echo !\E![4C║    Pour naviguer parmi les chaînes, appuyez sur "Ctrl + L" pour afficher tout le contenu disponible.                                        ║
echo !\E![4C║                                                                                                                                             ║
echo !\E![4C╚═════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
if "!x!"=="1" (
    call :INSTALL_FILE VLC
    goto :CONTINUE_IS_BOOKMARKS_IPTV_TUTORIAL
)
call :CHOOSE BACK && goto :CONTINUE_IS_BOOKMARKS_PARSER
call :ERRORMESSAGE
goto :CONTINUE_IS_BOOKMARKS_IPTV_TUTORIAL

:IS_BOOKMARKS_CHOICES_TORRENTING
if "!language!"=="EN" (set t1=Write a number/category OR) & (set t2=AND press) & set t3=ENTER
if "!language!"=="FR" (set t1=Ecrivez un numéro/catégorie OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!UPDATE!BRIGHTBLACK!" / "!YELLOW!INSTALL!BRIGHTBLACK!" / "!YELLOW!ADD!BRIGHTBLACK!" / "!YELLOW!HELP!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
>nul 2>&1 reg query "HKCR\.torrent" || (
    echo:
    if "!language!"=="EN" call :DRAW_CENTER "!RED!ERROR: To be able to use !YELLOW!TORRENTING!RED!, first you need to choose: !YELLOW![INSTALL]"
    if "!language!"=="FR" call :DRAW_CENTER "!RED!ERREUR: Pour pouvoir utiliser !YELLOW!TORRENTING!RED!, vous devez d'abord choisir: !YELLOW![INSTALL]"
)
goto :IS_BOOKMARKS_PROMPT

:TORRENTTUTORIAL
cls
call :ROSE "Torrent Tutorial"

:CONTINUETORRENTTUTORIAL
cls
title !#TITLE:`=Torrent Tutorial!
echo !CYAN!
echo !\E![42C════════════════════════
if "!language!"=="EN" set t=TUTORIAL
if "!language!"=="FR" set t=TUTORIEL
echo !\E![41C// !RED!█!BGYELLOW!!BLACK! TORRENT !t! !RED!█!BGBLACK!!CYAN! \\
echo !\E![4C╔═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
echo !\E![4C║                                                                                                                                           ║
if "!language!"=="EN" echo !\E![4C║                          ■█!BGYELLOW!!RED!█ ♦ What's a torrent (Wikipedia) ? █!BGBLACK!!CYAN!█■                                                                         ║
if "!language!"=="FR" echo !\E![4C║                          ■█!BGYELLOW!!RED!█ ♦ Qu'est-ce qu'un torrent (Wikipedia) ? █!BGBLACK!!CYAN!█■                                                                  ║
echo !\E![4C║                                                                                                                                           ║
if "!language!"=="EN" echo !\E![4C║  Torrents are a method of distributing files over the internet.                                                                           ║
if "!language!"=="FR" echo !\E![4C║  Le Torrent est une méthode de distribution de fichiers sur Internet.                                                                     ║
if "!language!"=="EN" echo !\E![4C║  It operate over the BitTorrent protocol to facilitate what's called peer-to-peer (P2P) file sharing.                                     ║
if "!language!"=="FR" echo !\E![4C║  Il fonctionne sur le protocole Bittorrent pour faciliter ce que l'on appelle le partage de fichiers peer-to-peer (P2P).                  ║
if "!language!"=="EN" echo !\E![4C║  The most common way to use torrents is through a special file that uses the .torrent file extension.                                     ║
if "!language!"=="FR" echo !\E![4C║  La façont la plus courante d'utiliser des torrents consiste à utiliser un fichier spécial qui utilise l'extension de fichier .torrent    ║
echo !\E![4C║                                                                                                                                           ║
if "!language!"=="EN" echo !\E![4C║                           ■█!BGYELLOW!!RED!█ ♦ How to open .torrent files ? █!BGBLACK!!CYAN!█■                                                                          ║
if "!language!"=="FR" echo !\E![4C║                          ■█!BGYELLOW!!RED!█ ♦ Comment ouvrir des fichiers .torrent ? █!BGBLACK!!CYAN!█■                                                                 ║
echo !\E![4C║                                                                                                                                           ║
if "!language!"=="EN" echo !\E![4C║  !YELLOW!1!CYAN!  ^> !WHITE! Download and install qBittorrent.!CYAN!                                                                                                  ║
if "!language!"=="FR" echo !\E![4C║  !YELLOW!1!CYAN!  ^> !WHITE! Téléchargez et installer qBittorrent.!CYAN!                                                                                              ║
if "!language!"=="EN" echo !\E![4C║  Then you can run the .torrent that you have downloaded in one of the previous Illegal Services Torrenting links.                         ║
if "!language!"=="FR" echo !\E![4C║  Ensuite, vous pouvez exécuter le .torrent que vous avez téléchargé dans l'un des liens de Torrenting depuis Illegal Services.            ║
echo !\E![4C║                                                                                                                                           ║
echo !\E![4C╚═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
echo !BRIGHTBLACK!
if "!language!"=="EN" (set t1=Write a number OR) & (set t2=AND press) & set t3=ENTER
if "!language!"=="FR" (set t1=Ecrivez un numéro OU) & (set t2=et appuyé sur) & set t3=ENTRER
call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
echo:
call :PROMPT
if "!x!"=="1" call :INSTALL_FILE qBittorent & goto :CONTINUETORRENTTUTORIAL
call :CHOOSE BACK && goto :CONTINUE_IS_BOOKMARKS_PARSER
call :ERRORMESSAGE
goto :CONTINUETORRENTTUTORIAL

:ADDTORRENT
echo !CYAN!
if "!language!"=="EN" (
echo This option allow you to create a magnet link with an HASH.
echo Exemple of an HASH: "c12fe1c06bba254a9dc9f519b335aa7c1367a88a"
)
if "!language!"=="FR" (
echo Cette option vous permet de créer un lien magnétique avec un HASH.
echo Exemple d'un HASH: "c12fe1c06bba254a9dc9f519b335aa7c1367a88a"
)
>nul 2>&1 reg query "HKCR\magnet\shell\open\command" || goto :ERROR_ADDTORRENT
echo !CYAN!
if "!language!"=="EN" set t=Type the torrent's HASH
if "!language!"=="FR" set t=Entrez le HASH du torrent
%@SHOWCURSOR%
set x=
set /p "x=!t!: !YELLOW!"
%@HIDECURSOR%
call :CHECK_HASH_SHA1 x && (
    start "" "magnet:?xt=urn:btih:!x!"
    goto :CONTINUE_IS_BOOKMARKS_PARSER
)
call :CHOOSE BACK && goto :CONTINUE_IS_BOOKMARKS_PARSER
call :ERRORMESSAGE x "un HASH" HASH
goto :CONTINUE_IS_BOOKMARKS_PARSER

:ERROR_ADDTORRENT
echo:
if "!language!"=="EN" (
echo !RED!ERROR: You need a working bittorrent platform in order to make magnet links working.
echo !CYAN!Do you want to install qBittorrent in order to make it working ? [!YELLOW!YES!CYAN!] / [!YELLOW!NO!CYAN!]
>nul choice /n /c YN
)
if "!language!"=="FR" (
echo ERREUR: vous avez besoin d'une plate-forme bittorrent fonctionnelle pour que les liens magnétiques fonctionnent.
echo Voulez-vous installer qBittorrent pour le faire fonctionner ? [!YELLOW!OUI!CYAN!] / [!YELLOW!NON!CYAN!]
>nul choice /n /c ON
)
if !errorlevel!==1 call :INSTALL_FILE qBittorent
goto :CONTINUE_IS_BOOKMARKS_PARSER

:IS_BOOKMARKS_CHOICES_OTHER
if "!category_folder!"=="Illegal Services" (
    if "!language!"=="EN" (set t1=Write a number/category OR) & (set t2=AND press) & set t3=ENTER
    if "!language!"=="FR" (set t1=Ecrivez un numéro/catégorie OU) & (set t2=et appuyé sur) & set t3=ENTRER
    call :DRAW_CENTER "!t1! "!YELLOW!UPDATE!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
) else if defined open_folder_statut (
        if "!language!"=="EN" (set t1=Write a number/category OR) & (set t2=AND press) & set t3=ENTER
        if "!language!"=="FR" (set t1=Ecrivez un numéro/catégorie OU) & (set t2=et appuyé sur) & set t3=ENTRER
        call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!OPEN!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
) else (
    if "!language!"=="EN" (set t1=Write a number/category OR) & (set t2=AND press) & set t3=ENTER
    if "!language!"=="FR" (set t1=Ecrivez un numéro/catégorie OU) & (set t2=et appuyé sur) & set t3=ENTRER
    call :DRAW_CENTER "!t1! "!YELLOW!BACK!BRIGHTBLACK!" / "!YELLOW!UPDATE!BRIGHTBLACK!" !t2! !YELLOW!{!t3!}!BRIGHTBLACK!."
)
:IS_BOOKMARKS_PROMPT
echo:
if "!category_folder!"=="Streaming" (
    if "!UntrustedWebsitesWarning!"=="1" (
        if not defined warning_streaming (
            set warning_streaming=1
            if "!language!"=="EN" set t="INFORMATION: No payment / credit card / registration / installation is required to view the videos offered by the sites indexed in Illegal Services.!\N!All sites are free so watch out for scam advertising.!\N!!\N!If the player is not visible, disable your ad blocker and click on the button to close the ad in the middle of the video then on the player's Play button to launch the video."
            if "!language!"=="FR" set t="INFORMATION: Aucun paiement / carte de crédit / inscription / installation n'est requis pour visionner les vidéos proposées par les sites indexés dans Illegal Services.!\N!Tous les sites sont gratuits donc faites attention aux publicités d'arnaques.!\N!!\N!Si le lecteur n'est pas visible, désactiver votre bloqueur de publicité et cliquer sur le bouton pour fermer la pub au milieu de la vidéo puis sur le bouton Play du lecteur pour lancer la vidéo."
            call :MSGBOX 69680 "Illegal Services"
        )
    )
) else if "!category_folder!"=="IP Loggers" (
    if "!UntrustedWebsitesWarning!"=="1" (
        if not defined warning_ip_loggers (
            set warning_ip_loggers=1
            if "!language!"=="EN" set t="INFORMATION: URL Shorters are useful for hiding the original links in your IP Logger link.!\N!!\N!This trick does not work with some services that will directly redirect your shortcut link to it's last linked URL.!\N!Example Facebook, Instagram, Twitter ..."
            if "!language!"=="FR" set t="INFORMATION: Les URL Shorteners sont utiles pour cacher les liens originaux de votre lien IP Logger.!\N!!\N!Cette astuce ne fonctionne pas avec certains services qui redirigeront directement votre lien raccourci vers sa dernière URL liée.!\N!Exemple: Facebook, Instagram, Twitter ..."
            call :MSGBOX 69680 "Illegal Services"
        )
    )
)
call :PROMPT
if "!category_folder!"=="Internet Protocol Television (IPTV)" (
    call :CHOOSE INSTALL && (
        call :INSTALL_FILE VLC
        goto :CONTINUE_IS_BOOKMARKS_PARSER
    )
    call :CHOOSE HELP && goto :IS_BOOKMARKS_IPTV_TUTORIAL
) else if "!category_folder!"=="Torrenting" (
    call :CHOOSE INSTALL && (
        call :INSTALL_FILE qBittorent
        goto :CONTINUE_IS_BOOKMARKS_PARSER
    )
    call :CHOOSE ADD && goto :ADDTORRENT
    call :CHOOSE HELP && goto :TORRENTTUTORIAL
)
call :CHOOSE UPDATE && (
    call :DOWNLOAD_IS_BOOKMARKS_DB UPDATE
    goto :CONTINUE_IS_BOOKMARKS_PARSER
)
if defined open_folder_statut (
    call :CHOOSE OPEN && (
        call :OPEN_FOLDER "!IS_OUTPUT_DIRECTORY!\Portable Apps" IS_BOOKMARKS
        goto :CONTINUE_IS_BOOKMARKS_PARSER
    )
)
call :IS_BOOKMARKS_NAVIGATOR && goto :IS_BOOKMARKS_PARSER
call :WEBSITECHECK && goto :CONTINUE_IS_BOOKMARKS_PARSER
call :IS_BOOKMARKS_WEBSITESTART && goto :CONTINUE_IS_BOOKMARKS_PARSER
call :ERRORMESSAGE
goto :CONTINUE_IS_BOOKMARKS_PARSER

:IS_BOOKMARKS_NAVIGATOR
if not "!category_folder!"=="Illegal Services" (
    call :CHOOSE BACK && (
        call :IS_BOOKMARKS_SET_BACK_FOLDER || (
            set "category_folder=Illegal Services"
        )
        set char=
        set common_folder=
        set current_folder=
        exit /b 0
    )
)
if not "!LOOKUP_folders:`%x%`=!"=="!LOOKUP_folders!" (
    set "category_folder=!x!"
    exit /b 0
)
exit /b 1

:IS_BOOKMARKS_WEBSITESTART
if defined x (
    exit /b 1
)
for %%A in (started start_folder) do (
    if defined %%A (
        set %%A=
    )
)
set /a #el=1, IS_Log=1
for /l %%A in (!c1!,1,!c2!) do (
    if "!%%A!"=="!YELLOW!%%A !CHECKED!" (
        set #el=0
        for %%B in (
            "Illegal Services\Doxing\Dox Tool v2`Dox Tool V2.7z"
            "Illegal Services\Portable Apps\Winaero Tweaker`WinaeroTweaker.zip"
            "Illegal Services\Portable Apps\Winaero Tweaker`WinaeroTweaker.zip"
            "Illegal Services\Portable Apps\Ultimate Windows Tweaker 4`Ultimate Windows Tweaker 4.zip"
            "Illegal Services\Portable Apps\Ultimate Windows Tweaker 3`Ultimate Windows Tweaker 3.zip"
            "Illegal Services\Portable Apps\Ultimate Windows Tweaker`Ultimate Windows Tweaker.zip"
            "Illegal Services\Portable Apps\SophiApp`SophiApp.zip"
            "Illegal Services\Portable Apps\Sophia Script LTSC`Sophia.Script.LTSC.v5.2.14.zip"
            "Illegal Services\Portable Apps\Sophia Script PowerShell 7`Sophia.Script.v5.12.3.PowerShell.7.zip"
            "Illegal Services\Portable Apps\Sophia Script`Sophia.Script.v5.12.3.zip"
            "Illegal Services\Portable Apps\Sophia Script Windows 11`Sophia.Script.Windows.11.v6.0.4.zip"
            "Illegal Services\Portable Apps\Sophia Script Wrapper`Sophia.Script.Wrapper.v2.4.zip"
            "Illegal Services\Portable Apps\TCP Optimizer`TCPOptimizer\TCPOptimizer.exe"
            "Illegal Services\Portable Apps\DNS Jumper`DnsJumper.7z"
            "Illegal Services\Portable Apps\SpeedyFox`Speedyfox.zip"
            "Illegal Services\Portable Apps\Autoruns`Autoruns.zip"
            "Illegal Services\Portable Apps\CCleaner`CCleaner.zip"
            "Illegal Services\Portable Apps\CCEnhancer`CCEnhancer Multilingual.zip"
            "Illegal Services\Portable Apps\BleachBit`BleachBit.zip"
            "Illegal Services\Portable Apps\Dism++`Dism++.zip"
            "Illegal Services\Portable Apps\Glary Utilities`GlaryUtilities\GlaryUtilities.exe"
            "Illegal Services\Portable Apps\Revo Uninstaller`RevoUninstaller.zip"
            "Illegal Services\Portable Apps\Czkawka`windows_czkawka_gui.zip"
            "Illegal Services\Portable Apps\Windows Repair AIO`Tweaking.com - Windows Repair.7z"
            "Illegal Services\Portable Apps\Windows Repair Toolbox`Windows Repair Toolbox.zip"
            "Illegal Services\Portable Apps\FixWin 10`FixWin10.zip"
            "Illegal Services\Portable Apps\FixWin 2`fixwin2.zip"
            "Illegal Services\Portable Apps\FixWin`FixWin.zip"
            "Illegal Services\Portable Apps\Patch My PC`PatchMyPC\PatchMyPC.exe"
            "Illegal Services\Portable Apps\UCheck x64`UCheck_portable64\UCheck_portable64.exe"
            "Illegal Services\Portable Apps\UCheck x86`UCheck_portable32\UCheck_portable32.exe"
            "Illegal Services\Portable Apps\Windows Update MiniTool x64`Windows_Update_MiniTool.7z"
            "Illegal Services\Portable Apps\WSUS Offline Update`WSUS Offline Update.zip"
            "Illegal Services\Portable Apps\DriversCloud x64`DriversCloud.zip"
            "Illegal Services\Portable Apps\DriversCloud x86`DriversCloud.zip"
            "Illegal Services\Portable Apps\Snappy Driver Installer`Snappy Driver Installer.zip"
            "Illegal Services\Portable Apps\Driver Store Explorer`Driver Store Explorer.zip"
            "Illegal Services\Portable Apps\Device Cleanup Tool`DeviceCleanup.zip"
            "Illegal Services\Portable Apps\Display Driver Uninstaller`DDU.zip"
            "Illegal Services\Portable Apps\Radeon Software Slimmer net60`RadeonSoftwareSlimmer_1.4.0_net48.zip"
            "Illegal Services\Portable Apps\Radeon Software Slimmer net48`RadeonSoftwareSlimmer_1.4.0_net60.zip"
            "Illegal Services\Portable Apps\NVSlimmer`NVSlimmer.zip"
            "Illegal Services\Portable Apps\NVCleanstall`NVCleanstall\NVCleanstall.exe"
            "Illegal Services\Portable Apps\MSI Util v3`MSI_util_v3\MSI_util_v3.exe"
            "Illegal Services\Portable Apps\CPU-Z`CPU-Z.zip"
            "Illegal Services\Portable Apps\OOSU10 (Win 10)`OOSU10\OOSU10.exe"
            "Illegal Services\Portable Apps\Ashampoo AntiSpy (Win 10)`Ashampoo_AntiSpy\Ashampoo_AntiSpy.exe"
            "Illegal Services\Portable Apps\DoNotSpy 10`DoNotSpy10.7z"
            "Illegal Services\Portable Apps\Windows Privacy Dashboard`Windows Privacy Dashboard.zip"
            "Illegal Services\Portable Apps\Windows 10 Privacy`W10Privacy.zip"
            "Illegal Services\Portable Apps\Windows Spy Blocker`WindowsSpyBlocker\WindowsSpyBlocker.exe"
            "Illegal Services\Portable Apps\Destroy Windows 10 Spying`Destroy Windows 10 Spying.zip"
            "Illegal Services\Portable Apps\Destroy Windows 10 Spying RE`Destroy Windows 10 Spying RE.zip"
            "Illegal Services\Portable Apps\Blackbird x64`Blackbird.zip"
            "Illegal Services\Portable Apps\Blackbird x32`Blackbird.zip"
            "Illegal Services\Portable Apps\ADW Cleaner`AdwCleaner\AdwCleaner.exe"
            "Illegal Services\Portable Apps\ZHP Cleaner`ZHPCleaner\ZHPCleaner.exe"
            "Illegal Services\Portable Apps\Rogue Killer x64`RogueKiller_portable64\RogueKiller_portable64.exe"
            "Illegal Services\Portable Apps\Rogue Killer x86`RogueKiller_portable86\RogueKiller_portable86.exe"
            "Illegal Services\Portable Apps\No Bot`NoBot\NoBot.exe"
            "Illegal Services\Portable Apps\Kaspersky KVRT`KVRT\KVRT.exe"
            "Illegal Services\Portable Apps\Kaspersky TDSSKiller`tdsskiller\tdsskiller.exe"
            "Illegal Services\Portable Apps\Microsoft Safety Scanner x64`MSERT\MSERT.exe"
            "Illegal Services\Portable Apps\Microsoft Safety Scanner x86`MSERT\MSERT.exe"
            "Illegal Services\Portable Apps\Spybot - Search and Destroy`SpybotPortable\SpybotPortable_2.7.64-2020-02.paf.exe"
            "Illegal Services\Portable Apps\Batch Antivirus`Batch Antivirus.zip"
            "Illegal Services\Portable Apps\Everything x64`Everything-x64.zip"
            "Illegal Services\Portable Apps\Everything x86`Everything-x86.zip"
            "Illegal Services\Portable Apps\Process Hacker`Process Hacker.zip"
            "Illegal Services\Portable Apps\CrystalDiskInfo`CrystalDiskInfo.zip"
            "Illegal Services\Portable Apps\Defender Control`DefenderControl.zip"
            "Illegal Services\Portable Apps\Edge Blocker`EdgeBlocker.zip"
            "Illegal Services\Portable Apps\Mem Reduct`memreduct-3.4-bin.zip"
            "Illegal Services\Portable Apps\GiveMePower`GiveMePower\GiveMePower v2.1.0.0.exe"
            "Illegal Services\Portable Apps\RegScanner x64`regscanner-x64.zip"
            "Illegal Services\Portable Apps\RegScanner x86`regscanner.zip"
            "Illegal Services\Portable Apps\ISLC`ISLC\ISLC v1.0.2.5.exe"
            "Illegal Services\Portable Apps\Windows ISO Downloader`Windows-ISO-Downloader\Windows-ISO-Downloader.exe"
        ) do (
            for /f "tokens=1*delims=`" %%C in ("%%~B") do (
                if "!path_%%A!\!category_folder!\!name_%%A!"=="%%C" (
                    set started=1
                    call :CURL "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!\%%D" "!url_%%A:%%=%%%%!" && (
                        if "%%C"=="Illegal Services\Doxing\Dox Tool v2" (
                            call :START_DOXTOOLV2
                        )
                    )
                )
            )
        )
        if not defined started (
            start "" "!url_%%A!" && !cmdwiz.exe! delay 1500
        ) else (
            set started=
        )
        set "%%A=!YELLOW!%%A !UNCHECKED!"
    )
)
set IS_Log=
if exist "!TMPF!\IS_Log.txt" (
    echo:
    for /f "usebackqtokens=1*delims=:" %%A in ("!TMPF!\IS_Log.txt") do echo !RED!%%A:!YELLOW!%%B
    del /f /q "!TMPF!\IS_Log.txt"
    echo !CYAN!
    if "!Language!"=="EN" set "t=Press !YELLOW!{ANY KEY}!CYAN! to continue..."
    if "!Language!"=="FR" set "t=Appuyez sur !YELLOW!{UNE TOUCHE}!CYAN! pour continuer..."
    call :DRAW_CENTER "!t!" 1
    %@SHOWCURSOR%
    >nul pause
)
if defined start_folder (
    start /max "" "!IS_OUTPUT_DIRECTORY_PORTABLE_APPS!"
)
exit /b !#el!

:IS_BOOKMARKS_SET_ROOT_FOLDER_LENGTH
set root_folder_length=0
:_IS_BOOKMARKS_SET_ROOT_FOLDER_LENGTH
set /a root_folder_length+=1
if not "!root_folder:~0,%root_folder_length%!"=="!root_folder!" (
    goto :_IS_BOOKMARKS_SET_ROOT_FOLDER_LENGTH
)
set /a root_folder_length+=1
exit /b

:IS_BOOKMARKS_SET_BACK_FOLDER
if "!category_folder!"=="Illegal Services" (
    exit /b 1
)
if "!category_path_1!"=="Illegal Services" (
    set "category_folder=Illegal Services"
    exit /b 0
)
if !path_index! gtr 1 (
    for /l %%A in (1,1,!path_index!) do (
        if defined previous_folder (
            if "!previous_folder!"=="!category_path_%%A!" (
                set /a previous_folder_index+=1
            )
        )
        if "!category_path_%%A!"=="Illegal Services" (
            set "category_folder=Illegal Services"
            exit /b 0
        )
        set "previous_folder=!category_path_%%A!"
    )
    if "!path_index!"=="!previous_folder_index!" (
        set previous_folder_index=
        set previous_folder=
        exit /b 1
    )
    if defined previous_folder_index (
        set previous_folder_index=
    )
    set previous_folder=
)
for %%A in (current_folder common_folder) do (
    if defined %%A (
        set %%A=
    )
)
set "_tmp=!category_path_1!"
set len=0
for %%A in (4096,2048,1024,512,256,128,64,32,16,8,4,2,1) do (
    if "!_tmp:~%%A,1!" neq "" (
        set /a "len+=%%A"
        set "_tmp=!_tmp:~%%A!"
    )
)
set _tmp=
for /l %%A in (0,1,!len!) do (
    set "char=!category_path_1:~%%A,1!"
    if not defined char (
        if defined current_folder (
            set "category_folder=!current_folder!"
            exit /b 0
        )
        exit /b 1
    )
    for /l %%B in (2,1,!path_index!) do (
        if not "!category_path_%%B:~%%A,1!"=="!char!" (
            set "category_folder=!common_folder!"
            exit /b 0
        )
    )
    if "!char!"=="/" (
        if not "!current_folder:~-1!"=="\" (
            set "common_folder=!current_folder!"
            set current_folder=
        ) else (
            set "current_folder=!current_folder!!char!"
        )
    ) else (
        set "current_folder=!current_folder!!char!"
    )
)
if defined current_folder (
    set "category_folder=!current_folder!"
    exit /b 0
)
exit /b 1

:IS_BOOKMARKS_COMPARE_NEW_DATE
call :IS_BOOKMARKS_GET_NEW_DATE_TIME
if "!DBLastDownload!"=="N/A" (
    set #el=1
    goto :1_IS_BOOKMARKS_COMPARE_NEW_DATE
)
set "old_date_time=!DBLastDownload!"
for %%A in (old_date_time new_date_time) do (
    call :2_IS_BOOKMARKS_COMPARE_NEW_DATE %%A
)
set /a "t1=new_date_time_t1-old_date_time_t1"
if !t1! gtr 1440 (
    set #el=1
) else (
    set #el=0
)
:1_IS_BOOKMARKS_COMPARE_NEW_DATE
for %%A in (old_date_time years months days hours minutes leap leap_year leap_month old_date_time_t1 new_date_time_t1 t1) do (
    if defined %%A (
        set %%A=
    )
)
exit /b !#el!

:2_IS_BOOKMARKS_COMPARE_NEW_DATE
for /f "tokens=1-5delims=-: " %%A in ("!%1!") do (
    set "years=%%A"
    set "months=%%B"
    set "days=%%C"
    set "hours=%%D"
    set "minutes=%%E"
)
call :IS_LEAP_YEAR_OR_NOT
if "!leap!"=="1" (
    set leap_year=527040
) else (
    set leap_year=525600
)
if "!months!"=="01" (
    set leap_month=44640
) else if "!months!"=="03" (
    set leap_month=44640
) else if "!months!"=="02" (
    if "!leap!"=="1" (
        set leap_month=41760
    ) else (
        set leap_month=40320
    )
) else if "!months!"=="04" (
    set leap_month=43200
) else if "!months!"=="05" (
    set leap_month=44640
) else if "!months!"=="06" (
    set leap_month=43200
) else if "!months!"=="07" (
    set leap_month=44640
) else if "!months!"=="08" (
    set leap_month=44640
) else if "!months!"=="09" (
    set leap_month=43200
) else if "!months!"=="10" (
    set leap_month=44640
) else if "!months!"=="11" (
    set leap_month=43200
) else if "!months!"=="12" (
    set leap_month=44640
)
for %%A in (months days hours minutes) do (
    if defined %%A (
        if "!%%A:~0,1!"=="0" (
            set "%%A=!%%A:~1!"
        )
    )
)
set /a "years*=leap_year, months*=leap_month, days*=1440, hours*=60, minutes*=1"
set /a "%1_t1=years+months+days+hours+minutes"
exit /b

:IS_BOOKMARKS_GET_NEW_DATE_TIME
if defined new_date_time (
    set new_date_time=
)
for /f "tokens=2delims==." %%A in ('2^>nul wmic os get Localdatetime /value') do (
    set "new_date_time=%%A"
    set "new_date_time=!new_date_time:~0,-10!-!new_date_time:~-10,2!-!new_date_time:~-8,2! !new_date_time:~-6,2!:!new_date_time:~-4,2!"
)
call :CHECK_IS_BOOKMARKS_DATE_TIME new_date_time && (
    exit /b 0
)
if defined new_date_time (
    set new_date_time=
)
>nul chcp 437
for /f "delims=" %%A in ('2^>nul powershell get-date -format "{yyyy-MM-dd HH:mm}"') do (
    set "new_date_time=%%A"
)
>nul chcp 65001
call :CHECK_IS_BOOKMARKS_DATE_TIME new_date_time && (
    exit /b 0
)
call :ERROR_FATAL DATE_TIME

:DOWNLOAD_IS_BOOKMARKS_DB
call :CHECK_FILE_SIGNATURE "!IS_OUTPUT_DIRECTORY!\IS.bookmarks.html" 35 IS_BOOKMARKS_PARSER && (
    if not "%1"=="UPDATE" (
        call :CHECK_DBLASTDOWNLOAD
        call :IS_BOOKMARKS_COMPARE_NEW_DATE && (
            exit /b 0
        )
    )
)
if "%1"=="SCANWEBSITES" (
    if "!language!"=="EN" set t=Downloading the websites database from
    if "!language!"=="FR" set t=Téléchargement de la base de données des sites internet
    title !DEBUG!!t!: '!git_raw_downloads!/IS.bookmarks.html'. - Illegal Services
)
call :CURL "!IS_OUTPUT_DIRECTORY!\IS.bookmarks.html" "`git_raw_downloads`/IS.bookmarks.html" || (
    if "%1"=="UPDATE" (
        call :ERROR_INTERNET
        exit /b 1
    )
    if not exist "!IS_OUTPUT_DIRECTORY!\IS.bookmarks.html" (
        call :ERROR_INTERNET
        exit /b 1
    )
    set el=!errorlevel!
    call :CHECK_FILE_SIGNATURE_IS_BOOKMARKS_DB || (
        cmd /c exit /b !el!
        call :ERROR_INTERNET
        exit /b 1
    )
    exit /b 0
)
call :CHECK_FILE_SIGNATURE_IS_BOOKMARKS_DB || (
    exit /b 1
)
call :IS_BOOKMARKS_GET_NEW_DATE_TIME
>nul reg add "!IS_REG!" /v "DBLastDownload" /t REG_SZ /d "!new_date_time!" /f
set new_date_time=
call :CHECK_DBLASTDOWNLOAD
exit /b 0

:CHECK_LOGGING_DATE_TIME
if not defined %1 (
    exit /b 1
)
if not "!%1:~-15,1!"=="-" (
    exit /b 1
)
if not "!%1:~-12,1!"=="-" (
    exit /b 1
)
if not "!%1:~-9,1!"=="_" (
    exit /b 1
)
if not "!%1:~-6,1!"=="-" (
    exit /b 1
)
if not "!%1:~-3,1!"=="-" (
    exit /b 1
)
for /f "delims=0123456789-_" %%A in ("!%1!") do (
    exit /b 1
)
for /f "tokens=1-6delims=-_" %%A in ("!%1!") do (
    call :CHECK_NUMBER "%%A" && (
        if "%%B"=="01" (
            set y1=31
        ) else if "%%B"=="02" (
            set "years=%%A"
            call :IS_LEAP_YEAR_OR_NOT
            if !leap!==1 (
                set y1=29
            ) else (
                set y1=28
            )
        ) else if "%%B"=="03" (
            set y1=31
        ) else if "%%B"=="04" (
            set y1=30
        ) else if "%%B"=="05" (
            set y1=31
        ) else if "%%B"=="06" (
            set y1=30
        ) else if "%%B"=="07" (
            set y1=31
        ) else if "%%B"=="08" (
            set y1=31
        ) else if "%%B"=="09" (
            set y1=30
        ) else if "%%B"=="10" (
            set y1=31
        ) else if "%%B"=="11" (
            set y1=30
        ) else if "%%B"=="12" (
            set y1=31
        )
        if defined y1 (
            call :CHECK_NUMBER_BETWEEN_CUSTOM "%%C" 01-!y1! && (
                call :CHECK_NUMBER_BETWEEN_CUSTOM "%%D" 00-23 && (
                    call :CHECK_NUMBER_BETWEEN_CUSTOM "%%E" 00-59 && (
                        call :CHECK_NUMBER_BETWEEN_CUSTOM "%%F" 00-59 && (
                            exit /b 0
                        )
                    )
                )
            )
        )
    )
)
exit /b 1

:CHECK_IS_BOOKMARKS_DATE_TIME
if not defined %1 (
    exit /b 1
)
if not "!%1:~4,1!"=="-" (
    exit /b 1
)
if not "!%1:~7,1!"=="-" (
    exit /b 1
)
if not "!%1:~10,1!"==" " (
    exit /b 1
)
if not "!%1:~13,1!"==":" (
    exit /b 1
)
for /f "delims=0123456789-: " %%A in ("!%1!") do (
    exit /b 1
)
for /f "tokens=1-5delims=-: " %%A in ("!%1!") do (
    call :CHECK_NUMBER "%%A" && (
        if "%%B"=="01" (
            set y1=31
        ) else if "%%B"=="02" (
            set "years=%%A"
            call :IS_LEAP_YEAR_OR_NOT
            if !leap!==1 (
                set y1=29
            ) else (
                set y1=28
            )
        ) else if "%%B"=="03" (
            set y1=31
        ) else if "%%B"=="04" (
            set y1=30
        ) else if "%%B"=="05" (
            set y1=31
        ) else if "%%B"=="06" (
            set y1=30
        ) else if "%%B"=="07" (
            set y1=31
        ) else if "%%B"=="08" (
            set y1=31
        ) else if "%%B"=="09" (
            set y1=30
        ) else if "%%B"=="10" (
            set y1=31
        ) else if "%%B"=="11" (
            set y1=30
        ) else if "%%B"=="12" (
            set y1=31
        )
        if defined y1 (
            call :CHECK_NUMBER_BETWEEN_CUSTOM "%%C" 01-!y1! && (
                call :CHECK_NUMBER_BETWEEN_CUSTOM "%%D" 00-23 && (
                    call :CHECK_NUMBER_BETWEEN_CUSTOM "%%E" 00-59 && (
                        exit /b 0
                    )
                )
            )
        )
    )
)
exit /b 1

:CHECK_FILE_SIGNATURE_IS_BOOKMARKS_DB
if not exist "!IS_OUTPUT_DIRECTORY!\IS.bookmarks.html" (
    >nul reg add "!IS_REG!" /v "DBLastDownload" /t REG_SZ /d "N/A" /f
    if "!language!"=="EN" set t="ERROR: Your copy of the file database '!IS_OUTPUT_DIRECTORY!\IS.bookmarks.html' does not exist."
    if "!language!"=="FR" set t="ERREUR: Votre copie de la base de données du fichier '!IS_OUTPUT_DIRECTORY!\IS.bookmarks.html' n'existe pas."
    call :MSGBOX 69648 "Illegal Services"
    exit /b 1
)
call :CHECK_FILE_SIGNATURE "!IS_OUTPUT_DIRECTORY!\IS.bookmarks.html" 35 IS_BOOKMARKS_PARSER || (
    >nul reg add "!IS_REG!" /v "DBLastDownload" /t REG_SZ /d "N/A" /f
    if "!language!"=="EN" set t="ERROR: Your '!IS_OUTPUT_DIRECTORY!\IS.bookmarks.html' database file copy is broken."
    if "!language!"=="FR" set t="ERREUR: Votre copie de la base de données '!IS_OUTPUT_DIRECTORY!\IS.bookmarks.html' est cassée."
    call :MSGBOX 69648 "Illegal Services"
    exit /b 1
)
exit /b 0

:CHECK_PATCH_BOOKMARKS_PARSER
call :GET_FILE_HASH "!bookmarks_parser.exe!" || (
    call :ERROR_FATAL HASH "!bookmarks_parser.exe!"
)
if "!file_hash!"=="6a77663344031f214658941882d6dc39150b64ef" (
    call :CURL "!bookmarks_parser.exe!" "`git_raw_main`/!bookmarks_parser.exe:\=/!" || (
        call :ERROR_FATAL !bookmarks_parser.exe!
    )
)
exit /b