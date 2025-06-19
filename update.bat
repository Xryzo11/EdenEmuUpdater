@echo off
echo update>>update.zip
for /f "tokens=*" %%i in ('dir /a-d *cli ^| find /C "/"') do set cli=%%i
if not %cli%==0 (
    del cli
    echo Skipping GitHub CLI update...
    cls
) else (
	cls
    echo Checking for GitHub CLI updates...
    echo.
    echo Make sure to accept the UAC if prompted!
    echo.
    winget upgrade --accept-source-agreements --accept-package-agreements --id GitHub.cli
    echo updatecli>>cli
    call update.bat
    cls
    exit /B 1
)
for /f "delims=" %%i in ('dir /b /a-d *.zip') do set ver=%%i
del *.zip
echo update>>%ver%
echo Downloading pineappleEA data from GitHub...
gh release -R https://github.com/pineappleEA/pineapple-src download --pattern *.zip
for /f "tokens=*" %%i in ('dir /a-d *.zip ^| find /C "/"') do set updt=%%i
cd ./yuzu-windows-msvc-early-access
del *.tar.xz
cd ../
if not %updt%==1 (
    del %ver%
    powershell Expand-Archive *.zip -DestinationPath ./ -Force
    call update.bat
    cls
    exit /B 1
) else (
    cls
    color 3f
    echo Current version: %ver%
    echo.
    echo Press any button to start Yuzu Early Access
    pause >nul
	start "" "steam://rungameid/17531119177232809984"
    @REM start "" "./yuzu-windows-msvc-early-access/yuzu.exe"
)
exit /B 1