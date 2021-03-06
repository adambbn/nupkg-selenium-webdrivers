@echo off
pushd %~dp0

SET browser=%1
SET version=%2
SET bit=%3

IF "%bit%"=="" (
echo Downloading %browser% %version%...
powershell -noprof -exec unrestricted -c ".\download-driver.ps1 -browser %browser% -version %version%"
) ELSE (
echo Downloading %browser% %version% %bit%...
powershell -noprof -exec unrestricted -c ".\download-driver.ps1 -browser %browser% -version %version% -bit %bit%"
)
echo.
:SKIP_DOWNLOAD

echo Packaging %browser% %version%...
IF /I "%browser%"=="chrome" (
	.\NuGet.exe pack .\Selenium.Chrome.WebDriver.nuspec
)
IF /I "%browser%"=="firefox" (
	.\NuGet.exe pack .\Selenium.Firefox.WebDriver.nuspec
)
IF /I "%browser%"=="ie" (
	.\NuGet.exe pack .\Selenium.InternetExplorer.WebDriver.nuspec
)
IF /I "%browser%"=="phantomjs" (
	.\NuGet.exe pack .\Selenium.PhantomJS.WebDriver.nuspec
)