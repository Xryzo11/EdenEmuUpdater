@echo off
:0
cls
echo Do you own a GitHub account?
echo.
echo 1) Yes
echo 2) No
echo.
set /p a=Select number: 
if %a%==2 (
    cls
    echo Press any button open the GitHub registration page
    pause >nul
    start "" "https://github.com/join"
    echo.
    echo Press any button after you've registered your account
    pause >nul
    goto 1
) else (
    if %a%==1 (
        goto 1
    ) else (
        goto 0
    )
)
goto 0
:1
cls
echo Do you have GitHub CLI installed?
echo.
echo 1) Yes
echo 2) No
echo.
set /p b=Select number: 
if %b%==2 (
    cls
    echo Press any button to start installing GitHub CLI
    echo Make sure to accept any prompted UAC!
    pause >nul
    winget install --accept-source-agreements --accept-package-agreements --id GitHub.cli
    goto 2
) else (
    if %b%==1 (
        goto 2
    ) else (
        goto 1
    )
)
goto 1
:2
cls
gh auth status
echo.
echo Are you currently logged into GitHub CLI? (refer to the text displayed above)
echo.
echo 1) Yes
echo 2) No
echo.
set /p c=Select number: 
if %c%==2 (
    cls
    echo Select the following: GitHub.com - HTTPS - No - Paste an authentication token
    echo Generate a classic token without expiration and all scopes on the website that opened
    echo Paste token into GitHub CLI
    echo.
    echo Press any button to open the token generation page
    pause >nul
    start "" "https://github.com/settings/tokens"
    echo.
    echo Press any button after authentication
    echo.
    gh auth login
    pause >nul
    goto 2
) else (
    if %c%==1 (
        goto 3
    ) else (
        goto 2
    )
)
goto 2
:3
cls
echo.
echo Do you have update.bat downloaded?
echo.
echo 1) Yes
echo 2) No
echo.
set /p d=Select number: 
if %d%==2 (
    cls
    echo Download update.zip
    start "" "https://github.com/Xryzo11/EdenEmuUpdater/releases"
    echo Press any button after you've finished downloading
    pause >nul
    goto 4
) else (
    if %d%==1 (
        goto 4
    ) else (
        goto 3
    )
)
goto 3
:4
timeout /t 1 nobreak>nul
cls
echo Everything is ready!
echo In order to have everything working properly, make sure to read the instructions on:
echo https://github.com/Xryzo11/EdenEmuUpdater
echo Press any button to remove this installation file.
pause >nul
del install.bat
exit /B 1