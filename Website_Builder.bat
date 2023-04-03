@echo off
>nul chcp 65001

setlocal DisableDelayedExpansion
pushd "%~dp0"
setlocal EnabledelayedExpansion

if defined href_path (
    set href_path=
)
set "sp= "
set /a counter_links=0
for %%A in ("Bookmarks Toolbar" js) do (
    if exist "%%~A\" (
        rd /s /q "%%~A"
    )
)
for /f "tokens=1,3,5,7,9delims='" %%A in ('python "D:\Downloads\Python Stuff\IS stuff\IS.bookmarks\bookmarks_parser.py" --extended-parsing --folders-path --quoting-style "'" "D:\Git\Illegal_Services\IS.bookmarks.html"') do (
    if not "%%B"=="" (
        if "%%A_%%B"=="PATH_0" (
            set "href_path=Bookmarks Toolbar"
            if not exist "!href_path!\" (
                md "!href_path!" && (
                    call :WRITE_HEADER %%B
                ) || (
                    echo ERROR ^(WRITE_FOLDER_PATH^): "!href_path!\"
                    pause
                    exit /b 1
                )
            )
        ) else (
            set "href_path=%%C"
            set "href_path=!href_path:?=U+003F!"
            set "href_path=!href_path:\/=U+002F!"
            set "href_path=!href_path:\\=U+005C!"
            if not exist "!href_path!\" (
                md "!href_path!" && (
                    call :WRITE_HEADER %%B
                ) || (
                    echo ERROR ^(WRITE_FOLDER_PATH^): "!href_path!\"
                    pause
                    exit /b 1
                )
            )
            if "%%A"=="PATH" (
                set "href_name=%%D"
                set "name=%%D"
                set "href_name=!href_name:?=U+003F!"
                set "href_name=!href_name:/=U+002F!"
                set "href_name=!href_name:\=U+005C!"
                set "href_name=!href_name: =%%20!"
                set "name=!name:&#39;='!"
                >>"!href_path!/index.html" (
                    echo         ^<a href="!href_name!/index.html"^>^<i class="fa fa-folder-o"^>^</i^>!name!^</a^>
                ) || (
                    echo ERROR ^(WRITE_HREF_FOLDER^): "!href_path!/index.html" "!name!"
                    pause
                    exit /b 1
                )
                rem echo "[%%A] [%%B] [!href_path!] [!name!]"
            ) else if "%%A"=="LINK" (
                set /a counter_links+=1
                set "href_link=%%D"
                for /f "delims=/" %%F in ("!href_link:*://=!") do (
                    set "href_domain=%%F"
                )
                set "name=%%E"
                if defined name (
                    set "name=!name:&#39;='!"
                    if "!name:~-14!"==" | (untrusted)" (
                        set "name=!name:~0,-14!<font color="red">!name:~-14!</font>"
                    ) else if "!name:~-1!"==")" (
                        call :PARSE_UNTRUSTED_WEBSITES name && (
                            set "name=!parse_untrusted_websites[output]!"
                        )
                    )
                )
                >>"!href_path!/index.html" (
                    rem https://s2.googleusercontent.com/s2/favicons?domain=!href_domain!&sz=32
                    rem https://www.google.com/s2/favicons?sz=32&domain_url=!href_domain!
                    rem https://www.google.com/s2/favicons?domain=!href_domain!&sz=32
                    rem https://icons.duckduckgo.com/ip3/!href_domain!.ico
                    rem https://external-content.duckduckgo.com/ip3/!href_domain!.ico
                    rem https://unavatar.now.sh/!href_domain!
                    echo         ^<a href="!href_link!" target="_blank"^>^<img src="https://external-content.duckduckgo.com/ip3/!href_domain!.ico"/^>!name!^</a^>
                ) || (
                    echo ERROR ^(WRITE_HREF_LINK^): "!href_path!/index.html" "!name!"
                    pause
                    exit /b 1
                )
                rem echo "[%%A] [%%B] [!href_path!] [!name!] [!href_link!]"
            ) else if "%%A"=="HR" (
                >>"!href_path!/index.html" (
                    echo         ^<HR^>
                ) || (
                    echo ERROR ^(WRITE_HREF_HR^): "!href_path!/index.html"
                    pause
                    exit /b 1
                )
                rem echo "[%%A] [%%B] [!href_path!]"
            )
        )
    )
)
if defined parse_untrusted_websites[output] (
    set parse_untrusted_websites[output]=
)
call :GET_CURRENT_DATE || (
    echo ERROR ^(GET_DATE_TIME^)
    pause
    exit /b 1
)
for /f "delims=" %%A in ('2^>nul dir "Bookmarks Toolbar\*index.html" /b /a:-d /s') do (
    set "href_path=%%~dpA"
    if defined href_path (
        set "href_path=!href_path:~0,-1!"
        if defined href_path (
            call :WRITE_FOOTER
        )
    )
)
if not exist "js\" (
    md "js" || (
        echo ERROR ^(WRITE_JS_FOLDER^): "js\"
        pause
        exit /b 1
    )
)
>"js\counter.js" (
    echo document.write^(`
    echo     ^<div class="counter"^>
    echo         Updated: !current_date!^&nbsp;^&nbsp;^|^&nbsp;^&nbsp;!counter_links! links indexed.
    echo     ^</div^>
    echo     ^<br^>
    echo `^);
) || (
    echo ERROR ^(WRITE_JS_COUNTER^): "js\counter.js"
    pause
    exit /b 1
)

popd
endlocal
exit /b 0

:WRITE_HEADER
if defined @display_path (
    set @display_path=
)
set tmp_path_href_path="!href_path!"
set "tmp_path_href_path=!tmp_path_href_path:/=" "!"
if defined path_href_path (
    set path_href_path=
)
for %%A in (!tmp_path_href_path!) do (
    if defined path_href_path (
        set "path_href_path=!path_href_path!/%%~A"
    ) else (
        set "path_href_path=%%~A"
    )
    set "path_href_path=!path_href_path: =%%20!"
    set "data=%%~A"
    set "data=!data:U+003F=?!"
    set "data=!data:U+002F=/!"
    set "data=!data:U+005C=\!"
    set @display_path=!@display_path!^<a href^="/Illegal_Services/!path_href_path!/index.html"^>!data!^</a^> ^>!sp!
)
if defined @display_path (
    set "@display_path=!@display_path!index.html"
)
>>"!href_path!\index.html" (
    echo ^<^^!DOCTYPE html^>
    echo ^<html lang="en-US"^>
    echo:
    echo ^<head^>
    echo     ^<meta charset="UTF-8"^>
    echo     ^<meta name="viewport" content="width=device-width, initial-scale=1"^>
    echo     ^<meta name="description" content="Illegal Services Bookmarks"^>
    echo     ^<meta name="keywords" content="Illegal, Services, Bookmarks, website"^>
    echo     ^<meta name="author" content="IB_U_Z_Z_A_R_Dl"^>
    echo     ^<title^>IS Bookmarks - Illegal Services^</title^>
    echo     ^<link rel="shortcut icon" href="/Illegal_Services/icons/favicon.ico" type="image/x-icon"^>
    echo     ^<link rel="icon" href="/Illegal_Services/icons/favicon.ico" type="image/x-icon"^>
    echo     ^<link rel="stylesheet" href="/Illegal_Services/css/styles.css"^>
    echo     ^<link rel="stylesheet" href="/Illegal_Services/font-awesome-4.7.0/css/font-awesome.min.css"^>
    echo ^</head^>
    echo:
    echo ^<body^>
    echo     ^<nav^>
    echo         ^<div class="navbar"^>
    echo             ^<a href="/Illegal_Services/index.html"^>^<i class="fa fa-home"^>^</i^>^<span class="navbar-text-padding"^>Home^</span^>^</a^>
    echo             ^<a href="/Illegal_Services/credits.html"^>^<i class="fa fa-handshake-o"^>^</i^>^<span class="navbar-text-padding"^>Credits^</span^>^</a^>
    echo             ^<a href="/Illegal_Services/tutorial.html"^>^<i class="fa fa-life-ring"^>^</i^>^<span class="navbar-text-padding"^>Tutorial^</span^>^</a^>
    echo             ^<a href="/Illegal_Services/faq.html"^>^<i class="fa fa-question-circle"^>^</i^>^<span class="navbar-text-padding"^>FAQ^</span^>^</a^>
    echo             ^<a href="/Illegal_Services/downloads.html"^>^<i class="fa fa-cloud-download"^>^</i^>^<span class="navbar-text-padding"^>Downloads^</span^>^</a^>
    echo             ^<a href="/Illegal_Services/Bookmarks%%20Toolbar/Illegal%%20Services/index.html" class="navbar-active"^>^<i class="fa fa-bookmark-o"^>^</i^>^<span class="navbar-text-padding"^>^<u^>IS Bookmarks^</u^>^</span^>^</a^>
    echo         ^</div^>
    echo     ^</nav^>
    echo:
    echo     ^<div class="search-or-request_parent"^>
    echo         ^<div class="search-or-request_container"^>
    echo             ^<div class="search-or-request_child1"^>
    echo                 ^<form action="https://eofo904128t6ry8.m.pipedream.net/" method="post" target="_blank"^>
    echo                     ^<h4^>
    echo                         ^<label for="search_link"^>Search a link or folder in IS database:^</label^>
    echo                         ^<br^>
    echo                         ^<br^>
    echo                         ^<input type="text" name="search_link" id="search_link" placeholder="https://example.com/"^>
    echo                         ^<input type="submit" value="Search"^>
    echo                     ^</h4^>
    echo                 ^</form^>
    echo             ^</div^>
    echo             ^<div class="search-or-request_child2"^>
    echo                 ^<form action="https://eolu77sciiyyni6.m.pipedream.net/" method="post" target="_blank"^>
    echo                     ^<h4^>
    echo                         ^<label for="request_link"^>Request a link to be added in IS database:^</label^>
    echo                         ^<br^>
    echo                         ^<br^>
    echo                         ^<input type="text" name="request_link" id="request_link" placeholder="https://example.com/"^>
    echo                         ^<input type="submit" value="Request"^>
    echo                     ^</h4^>
    echo                 ^</form^>
    echo             ^</div^>
    echo         ^</div^>
    echo     ^</div^>
    echo:
    echo     ^<div class="pathbar"^>
    echo         !@display_path!
    echo     ^</div^>
    echo     ^<br^>
    echo:
    echo     ^<div class="vertical-menu"^>
) || (
    echo ERROR ^(WRITE_HEADER^): "!href_path!/index.html"
    pause
    exit /b 1
)
exit /b

:WRITE_FOOTER
>>"!href_path!\index.html" (
    echo     ^</div^>
    echo     ^<br^>
    echo:
    echo     ^<script src="/Illegal_Services/js/counter.js"^>^</script^>
    echo     ^<noscript^>
    echo         ^<div class="javascript-disabled"^>
    echo             ^<img src="/Illegal_Services/icons/no_js.png"^>
    echo             JavaScript disabled in your browser;^<br^>
    echo             can't display the counter informations.
    echo         ^</div^>
    echo     ^</noscript^>
    echo:
    echo     ^<footer^>
    echo         ^<a href="https://illegal-services.github.io/Illegal_Services/" target="_blank"^>^<img src="/Illegal_Services/svgs/internet.svg" alt="Website" title="https://illegal-services.github.io/Illegal_Services/"^>^</a^>
    echo         ^<a href="https://github.com/Illegal-Services/Illegal_Services" target="_blank"^>^<img src="/Illegal_Services/svgs/github.svg" alt="GitHub" title="https://github.com/Illegal-Services/Illegal_Services"^>^</a^>
    echo         ^<a href="https://t.me/illegal_services_forum" target="_blank"^>^<img src="/Illegal_Services/svgs/telegram.svg" alt="Telegram forum" title="https://t.me/illegal_services_forum"^>^</a^>
    echo         ^<a href="https://t.me/illegal_services" target="_blank"^>^<img src="/Illegal_Services/svgs/telegram.svg" alt="Telegram channel" title="https://t.me/illegal_services"^>^</a^>
    echo         ^<br^>
    echo         © 2020-2022 IB_U_Z_Z_A_R_Dl. All rights reserved.
    echo     ^</footer^>
    echo:
    echo ^</body^>
    echo:
    echo ^</html^>
) || (
    echo ERROR ^(WRITE_FOOTER^): "!href_path!/index.html"
    pause
    exit /b 1
)
exit /b

:PARSE_UNTRUSTED_WEBSITES
set "parse_untrusted_websites[_tmp]=!%1!"
set parse_untrusted_websites[len]=0
for %%A in (4096,2048,1024,512,256,128,64,32,16,8,4,2,1) do (
    if "!parse_untrusted_websites[_tmp]:~%%A,1!" neq "" (
        set /a "parse_untrusted_websites[len]+=%%A"
        set "parse_untrusted_websites[_tmp]=!parse_untrusted_websites[_tmp]:~%%A!"
    )
)
set parse_untrusted_websites[_tmp]=
set parse_untrusted_websites[@clear_vars]=for %%a in (start_parsing offset_start) do if defined parse_untrusted_websites[%%a] set parse_untrusted_websites[%%a]=
%parse_untrusted_websites[@clear_vars]%
for /l %%A in (0,1,!parse_untrusted_websites[len]!) do (
    set "parse_untrusted_websites[char]=!%1:~%%A,1!"
    if defined parse_untrusted_websites[start_parsing] (
        if "!parse_untrusted_websites[char]!"=="|" (
            %parse_untrusted_websites[@clear_vars]%
            set parse_untrusted_websites[offset_start]=%%A
        )
    ) else (
        if "!parse_untrusted_websites[char]!"==" " (
            if not defined parse_untrusted_websites[start_parsing] (
                set parse_untrusted_websites[start_parsing]=1
            )
        )
    )
)
if "!parse_untrusted_websites[char]!"==")" (
    if defined parse_untrusted_websites[offset_start] (
        set /a "parse_untrusted_websites[offset_end]=(parse_untrusted_websites[len]+1)-parse_untrusted_websites[offset_start]"
    )
)
set "str_untrusted=!%1:~%parse_untrusted_websites[offset_start]%,%parse_untrusted_websites[offset_end]%!"
if "!str_untrusted:~0,13!"=="| (untrusted)" (
    goto :PARSE_UNTRUSTED_WEBSITES[2]
) else if "!str_untrusted:~0,14!"=="| (untrusted: " (
    goto :PARSE_UNTRUSTED_WEBSITES[2]
)
exit /b 1
:PARSE_UNTRUSTED_WEBSITES[2]
set "parse_untrusted_websites[output]=!%1:~0,%parse_untrusted_websites[offset_start]%!<font color="red">!%1:~%parse_untrusted_websites[offset_start]%,%parse_untrusted_websites[offset_end]%!</font>"
for /f "delims==" %%A in ('2^>nul set parse_untrusted_websites[') do (
    if not "%%A"=="parse_untrusted_websites[output]" (
        set %%A=
    )
)
exit /b 0

:GET_CURRENT_DATE
if defined current_date (
    set current_date=
)
for /f "tokens=2delims==." %%A in ('2^>nul wmic os get Localdatetime /value') do (
    set "current_date=%%A"
    set "current_date=!current_date:~-8,2!/!current_date:~-10,2!/!current_date:~0,-10!"
    goto :L1
)
:L1
call :CHECK_CURRENT_DATE current_date && (
    exit /b 0
)
if defined current_date (
    set current_date=
)
for /f "delims=" %%A in (
    '^>nul chcp 437^& 2^>nul powershell get-date -format "'dd/MM/yyyy'"^& ^>nul chcp 65001'
) do (
    set "current_date=%%A"
    goto :L2
)
:L2
call :CHECK_CURRENT_DATE current_date && (
    exit /b 0
)
exit /b 1

:CHECK_CURRENT_DATE
if not defined %1 (
    exit /b 1
)
if not "!%1:~2,1!"=="/" (
    exit /b 1
)
if not "!%1:~5,1!"=="/" (
    exit /b 1
)
for /f "tokens=1-3delims=/" %%A in ("!%1!") do (
    set "x=%%C"
    call :CHECK_NUMBER x && (
        if "%%B"=="01" (
            set y1=31
        ) else if "%%B"=="02" (
            set "years=%%C"
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
            set "x=%%A"
            call :CHECK_NUMBER_BETWEEN_CUSTOM x 01-!y1! && (
                exit /b 0
            )
        )
    )
)
exit /b 1

:CHECK_NUMBER
if not defined %1 exit /b 1
for /f "delims=0123456789" %%A in ("!%1!") do exit /b 1
exit /b 0

:CHECK_NUMBER_BETWEEN_CUSTOM
if not defined %1 exit /b 1
for /f "delims=0123456789" %%A in ("!%1!") do exit /b 1
for /f "tokens=1,2delims=-" %%A in ("%~2") do (
    if !%1! lss %%A exit /b 1
    if !%1! gtr %%B exit /b 1
)
exit /b 0
