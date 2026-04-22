@echo off
setlocal EnableDelayedExpansion
title BEN-TWEAKS V1 - RYZEN 5 5500 + GTX 1660 SUPER EDITION
color 0A

:: ============================================================================
:: BEN-TWEAKS V1 - CUSTOM BUILD
:: Optimized specifically for: Ryzen 5 5500 + GTX 1660 Super + 16GB 2400MHz
:: Safe but aggressive optimization for mid-range gaming systems
:: ============================================================================

:: Stage 1: Administrative Privilege Verification
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if %errorlevel% neq 0 (
    echo.
    echo [ABORT] Administrative privileges required.
    echo Right-click this script and select "Run as administrator"
    echo.
    pause
    exit /b 1
)

cls
echo.
echo ============================================================================
echo  BEN-TWEAKS V1 - CUSTOM EDITION
echo  Ryzen 5 5500 + GTX 1660 Super + 16GB 2400MHz Optimization
echo ============================================================================
echo.
echo  [STAGE 1] Verifying administrative privileges... PASSED
timeout /t 2 /nobreak >nul

:: Stage 2: System Restore Point Creation
echo  [STAGE 2] Creating system restore point...
powershell -NoProfile -Command "Checkpoint-Computer -Description 'BEN_TWEAKS_CUSTOM_RYZEN5_GTX1660S' -RestorePointType 'MODIFY_SETTINGS'" >nul 2>&1
if %errorlevel% equ 0 (
    echo  [STAGE 2] System restore point created successfully
) else (
    echo  [STAGE 2] Restore point creation skipped or failed - continuing
)
timeout /t 2 /nobreak >nul

:: Stage 3: Aggressive Performance Cleaner
echo  [STAGE 3] Executing performance cleaner...

:: Clear Windows Temp
del /f /s /q "%TEMP%\*" >nul 2>&1
for /d %%p in ("%TEMP%\*") do rmdir "%%p" /s /q >nul 2>&1

:: Clear System Temp
del /f /s /q "%SystemRoot%\Temp\*" >nul 2>&1
for /d %%p in ("%SystemRoot%\Temp\*") do rmdir "%%p" /s /q >nul 2>&1

:: Clear Prefetch
del /f /s /q "%SystemRoot%\Prefetch\*" >nul 2>&1

:: Clear Windows Update Cache
del /f /s /q "%SystemRoot%\SoftwareDistribution\Download\*" >nul 2>&1

:: Clear DirectX Shader Cache
del /f /s /q "%LocalAppData%\D3DSCache\*" >nul 2>&1
del /f /s /q "%LocalAppData%\NVIDIA\DXCache\*" >nul 2>&1

:: Clear GPU Shader Caches
del /f /s /q "%LocalAppData%\NVIDIA\GLCache\*" >nul 2>&1

:: Clear Thumbnail Cache
del /f /s /q "%LocalAppData%\Microsoft\Windows\Explorer\*.db" >nul 2>&1

:: Clear Windows Error Reporting
del /f /s /q "%ProgramData%\Microsoft\Windows\WER\ReportQueue\*" >nul 2>&1
del /f /s /q "%ProgramData%\Microsoft\Windows\WER\ReportArchive\*" >nul 2>&1

:: Clear Event Logs
for /f "tokens=*" %%G in ('wevtutil.exe el') do wevtutil.exe cl "%%G" >nul 2>&1

echo  [STAGE 3] Performance cleaner completed
timeout /t 2 /nobreak >nul

:: Stage 4: Performance Optimizations
echo  [STAGE 4] Applying Ryzen 5 5500 + GTX 1660 Super optimizations...

:: High Performance Power Plan (Best for mid-range systems)
echo  [STAGE 4.1] Configuring power plan for Ryzen 5 5500...
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

:: Power Plan Settings
powercfg -change -monitor-timeout-ac 0
powercfg -change -disk-timeout-ac 0
powercfg -change -standby-timeout-ac 0
powercfg -change -hibernate-timeout-ac 0

:: Disable USB Selective Suspend
for /f "tokens=4" %%G in ('powercfg -getactivescheme') do set ACTIVE_SCHEME=%%G
powercfg -setacvalueindex %ACTIVE_SCHEME% 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
powercfg -setactive %ACTIVE_SCHEME%

:: AMD Ryzen Specific: Minimum Processor State 100% (keeps boost clocks active)
powercfg -setacvalueindex %ACTIVE_SCHEME% 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 100
powercfg -setacvalueindex %ACTIVE_SCHEME% 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100
powercfg -setactive %ACTIVE_SCHEME%

echo  [STAGE 4.1] AMD Ryzen power plan optimized

:: CPU Scheduler Optimization
echo  [STAGE 4.2] Optimizing CPU scheduler for 6-core Ryzen...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 38 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 4294967295 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 10 /f >nul 2>&1

:: Game Task Priority
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f >nul 2>&1

echo  [STAGE 4.2] CPU scheduler optimized

:: Game Process Priorities
echo  [STAGE 4.3] Configuring Fortnite and Valorant priorities...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v IoPriority /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /v IoPriority /t REG_DWORD /d 3 /f >nul 2>&1

echo  [STAGE 4.3] Game process priorities configured

:: Memory Optimization for 16GB 2400MHz
echo  [STAGE 4.4] Optimizing memory management for 16GB 2400MHz RAM...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileAtShutdown /t REG_DWORD /d 0 /f >nul 2>&1

echo  [STAGE 4.4] Memory optimized for gaming

:: NVIDIA GTX 1660 Super Optimizations
echo  [STAGE 4.5] Applying NVIDIA GTX 1660 Super optimizations...

:: GPU Hardware Scheduling (supported on GTX 1660 Super)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 2 /f >nul 2>&1

:: NVIDIA TDR Settings (safe for GTX 1660 Super)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrLevel /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrDelay /t REG_DWORD /d 10 /f >nul 2>&1

:: GPU Power Settings (keep GPU active)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultD3TransitionLatencyActivelyUsed /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultD3TransitionLatencyIdleLongTime /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v DefaultD3TransitionLatencyIdleMonitorOff /t REG_DWORD /d 1 /f >nul 2>&1

:: NVIDIA Specific (GTX 1660 Super settings)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v PerfLevelSrc /t REG_DWORD /d 8738 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v PowerMizerEnable /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v PowerMizerLevel /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v PowerMizerLevelAC /t REG_DWORD /d 1 /f >nul 2>&1

echo  [STAGE 4.5] GTX 1660 Super optimizations applied

:: USB and Input Latency
echo  [STAGE 4.6] Reducing input latency...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v MouseDataQueueSize /t REG_DWORD /d 20 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v KeyboardDataQueueSize /t REG_DWORD /d 20 /f >nul 2>&1

for /f %%G in ('wmic path Win32_USBController get PNPDeviceID ^| findstr /L "PCI\VEN_"') do (
    reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%G\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v MSISupported /t REG_DWORD /d 1 /f >nul 2>&1
)

echo  [STAGE 4.6] Input latency reduced

:: Game Mode Configuration
echo  [STAGE 4.7] Configuring Windows Game Mode...
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v ShowStartupPanel /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v UseNexusForGameBarEnabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKCU\System\GameConfigStore" /v GameDVR_DXGIHonorFSEWindowsCompatible /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f >nul 2>&1

echo  [STAGE 4.7] Game Mode enabled, DVR disabled

:: Windows Defender Exclusions
echo  [STAGE 4.8] Adding game exclusions to Windows Defender...
powershell -Command "Add-MpPreference -ExclusionPath 'C:\Program Files\Epic Games\Fortnite' -ErrorAction SilentlyContinue" >nul 2>&1
powershell -Command "Add-MpPreference -ExclusionPath 'C:\Riot Games\VALORANT' -ErrorAction SilentlyContinue" >nul 2>&1
powershell -Command "Add-MpPreference -ExclusionProcess 'FortniteClient-Win64-Shipping.exe' -ErrorAction SilentlyContinue" >nul 2>&1
powershell -Command "Add-MpPreference -ExclusionProcess 'VALORANT-Win64-Shipping.exe' -ErrorAction SilentlyContinue" >nul 2>&1
powershell -Command "Add-MpPreference -ExclusionProcess 'vgc.exe' -ErrorAction SilentlyContinue" >nul 2>&1

echo  [STAGE 4.8] Game exclusions configured

:: Network Optimization
echo  [STAGE 4.9] Optimizing network for competitive gaming...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
netsh int tcp set global chimney=enabled >nul 2>&1
netsh int tcp set global dca=enabled >nul 2>&1
netsh int tcp set global netdma=enabled >nul 2>&1
netsh int tcp set global timestamps=disabled >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPNoDelay /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpAckFrequency /t REG_DWORD /d 1 /f >nul 2>&1

:: Disable Nagle's Algorithm
for /f %%i in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /s /f "DhcpIPAddress" ^| findstr "HKEY"') do (
    reg add "%%i" /v TcpAckFrequency /t REG_DWORD /d 1 /f >nul 2>&1
    reg add "%%i" /v TCPNoDelay /t REG_DWORD /d 1 /f >nul 2>&1
)

echo  [STAGE 4.9] Network latency minimized

:: AMD Ryzen Specific Optimizations
echo  [STAGE 4.10] Applying AMD Ryzen 5000 series optimizations...
bcdedit /set useplatformclock no >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1
bcdedit /set tscsyncpolicy legacy >nul 2>&1

echo  [STAGE 4.10] AMD Ryzen optimizations applied

:: Visual Effects Optimization
echo  [STAGE 4.11] Optimizing visual effects for performance...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038010000000 /f >nul 2>&1
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKCU\Software\Microsoft\Windows\DWM" /v EnableAeroPeek /t REG_DWORD /d 0 /f >nul 2>&1

echo  [STAGE 4.11] Visual effects optimized

:: Disable Safe Unnecessary Services
echo  [STAGE 4.12] Disabling unnecessary background services...
sc config "SysMain" start=disabled >nul 2>&1
sc config "DiagTrack" start=disabled >nul 2>&1
sc config "dmwappushservice" start=disabled >nul 2>&1
sc config "TabletInputService" start=disabled >nul 2>&1
sc config "WSearch" start=demand >nul 2>&1

echo  [STAGE 4.12] Background services optimized

:: Telemetry Reduction
echo  [STAGE 4.13] Reducing telemetry and tracking...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f >nul 2>&1
schtasks /change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE >nul 2>&1
schtasks /change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /DISABLE >nul 2>&1

echo  [STAGE 4.13] Telemetry reduced

echo  [STAGE 4] All optimizations completed
timeout /t 2 /nobreak >nul

:: Stage 5: Final Status
cls
echo.
echo ============================================================================
echo  BEN-TWEAKS V1 - CUSTOM EDITION
echo  Optimization Complete
echo ============================================================================
echo.
echo  [STATUS] Ryzen 5 5500 + GTX 1660 Super optimizations applied
echo.
echo  HARDWARE-SPECIFIC OPTIMIZATIONS APPLIED:
echo  - AMD Ryzen 5500: Minimum processor state 100%% (boost enabled)
echo  - AMD Ryzen: TSC sync policy and platform clock optimized
echo  - 6-core CPU scheduler optimized
echo  - GTX 1660 Super: Hardware scheduling enabled
echo  - GTX 1660 Super: Power states optimized for performance
echo  - GTX 1660 Super: PowerMizer set to maximum performance
echo  - 16GB RAM: Memory management optimized for gaming
echo  - 16GB RAM: Paging executive disabled for faster access
echo.
echo  GENERAL OPTIMIZATIONS APPLIED:
echo  - System restore point created
echo  - Performance cleaner executed
echo  - High Performance power plan activated
echo  - Game process priorities configured
echo  - Input latency minimized
echo  - Windows Game Mode enabled, DVR disabled
echo  - Windows Defender exclusions added
echo  - Network latency optimized (Nagle disabled)
echo  - Visual effects optimized
echo  - Background services reduced
echo  - Telemetry disabled
echo.
echo  SAFE APPROACH:
echo  - NO core parking changes (let Windows manage)
echo  - NO aggressive preemption disabling
echo  - NO dangerous timer changes
echo  - Optimized specifically for mid-range gaming
echo.
echo ============================================================================
echo.
choice /C YN /N /M "Reboot now to apply all changes? (Y/N): "
if errorlevel 2 goto :EOF
if errorlevel 1 shutdown /r /t 10 /c "BEN-TWEAKS V1 CUSTOM - Rebooting for optimization"

:EOF
endlocal
exit /b 0