@echo off
:: 设置代码页为 UTF-8 以正确处理中文字符
chcp 65001 >nul

:: 为文件添加到 Windows Defender 排除项
reg add "HKEY_CLASSES_ROOT\*\shell\AddToWindowsDefenderExclusions" /f
reg add "HKEY_CLASSES_ROOT\*\shell\AddToWindowsDefenderExclusions" /ve /d "添加到 Windows Defender 排除项" /f
reg add "HKEY_CLASSES_ROOT\*\shell\AddToWindowsDefenderExclusions" /v "Icon" /d "\"%ProgramFiles%\\Windows Defender\\EppManifest.dll\",-100" /f
reg add "HKEY_CLASSES_ROOT\*\shell\AddToWindowsDefenderExclusions\command" /ve /d "powershell -Command \"Start-Process powershell -ArgumentList 'Add-MpPreference -ExclusionPath \"%%1\"' -Verb RunAs\"" /f

:: 为文件夹添加到 Windows Defender 排除项
reg add "HKEY_CLASSES_ROOT\Directory\shell\AddToWindowsDefenderExclusions" /f
reg add "HKEY_CLASSES_ROOT\Directory\shell\AddToWindowsDefenderExclusions" /ve /d "添加到 Windows Defender 排除项" /f
reg add "HKEY_CLASSES_ROOT\Directory\shell\AddToWindowsDefenderExclusions" /v "Icon" /d "\"%ProgramFiles%\\Windows Defender\\EppManifest.dll\",-100" /f
reg add "HKEY_CLASSES_ROOT\Directory\shell\AddToWindowsDefenderExclusions\command" /ve /d "powershell -Command \"Start-Process powershell -ArgumentList 'Add-MpPreference -ExclusionPath \"%%1\"' -Verb RunAs\"" /f

echo 操作已成功完成
pause