@echo off
chcp 65001 >nul
mode con: cols=80 lines=25
title Kali Linux XRDP Control Panel
color 0A
cls

:: Function to display a cool ASCII title
echo [92m
echo ==================================================
echo   ██╗  ██╗ █████╗ ██╗     ██╗     ██████╗ ██╗
echo   ██║ ██╔╝██╔══██╗██║     ██║     ██╔══██╗██║
echo   █████╔╝ ███████║██║     ██║     ██████╔╝██║
echo   ██╔═██╗ ██╔══██║██║     ██║     ██╔═══╝ ██║
echo   ██║  ██╗██║  ██║███████╗███████╗██║     ██║
echo   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝
echo ==================================================
timeout /t 1 >nul

:: Creating cool loading effect
echo.
echo [92m[+] Initializing system...[0m
ping -n 2 127.0.0.1 >nul
echo [92m[+] Connecting to WSL...[0m
ping -n 2 127.0.0.1 >nul
echo [92m[+] Accessing XRDP service...[0m
ping -n 2 127.0.0.1 >nul
cls

:: Main Menu
:menu
cls
echo [92m==========================================[0m
echo        [92mKali Linux XRDP Control Panel[0m
echo [92m==========================================[0m
echo [92m[1] Start XRDP Service[0m
echo [91m[2] Stop XRDP Service[0m
echo [93m[3] Restart XRDP Service[0m
echo [94m[4] Show IP Address[0m
echo [95m[5] Exit[0m
echo [92m==========================================[0m
echo.
set /p choice=[92mEnter your choice (1-5): [0m

if "%choice%"=="1" goto start_xrdp
if "%choice%"=="2" goto stop_xrdp
if "%choice%"=="3" goto restart_xrdp
if "%choice%"=="4" goto show_ip
if "%choice%"=="5" goto exit_script

echo [91m[ERROR] Invalid choice! Try again.[0m
timeout /t 2 >nul
goto menu

:start_xrdp
cls
echo [92m[+] Starting XRDP Service...[0m
wsl -d kali-linux -- bash -c "sudo service xrdp start"
timeout /t 2 >nul
goto show_ip

:stop_xrdp
cls
echo [91m[-] Stopping XRDP Service...[0m
wsl -d kali-linux -- bash -c "sudo service xrdp stop"
timeout /t 2 >nul
goto menu

:restart_xrdp
cls
echo [93m[*] Restarting XRDP Service...[0m
wsl -d kali-linux -- bash -c "sudo service xrdp restart"
timeout /t 2 >nul
goto show_ip

:show_ip
cls
echo [94m[*] Fetching Kali Linux IP Address...[0m
wsl -d kali-linux -- bash -c "ip=\$(hostname -I | awk '{print \$1}'); echo [92m[✔] Your Kali IP Address: \${ip}[0m; read -p 'Press Enter to continue...'"
start %windir%\system32\mstsc.exe
goto menu

:exit_script
cls
echo [91m[-] Exiting...[0m
timeout /t 2 >nul
exit
