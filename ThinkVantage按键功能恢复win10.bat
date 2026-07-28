@echo off
:: 检查是否以管理员权限运行
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo 请以管理员权限运行此脚本！
    pause
    exit /b
)

echo -----------------------------------------
echo   Lenovo 快捷键 AppLaunch Ex_17 注册表配置
echo -----------------------------------------

:: 读取系统 ReleaseId（如 2004、21H2、22H2）
for /f "tokens=2*" %%i in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ReleaseId ^| find "ReleaseId"') do set ReleaseId=%%j

echo 检测到系统版本 ReleaseId=%ReleaseId%
echo.

:: 判断是否 <= 21H2
set IsOldVersion=0
if "%ReleaseId%"=="2004" set IsOldVersion=1
if "%ReleaseId%"=="20H2" set IsOldVersion=1
if "%ReleaseId%"=="21H1" set IsOldVersion=1
if "%ReleaseId%"=="21H2" set IsOldVersion=1

echo -----------------------------------------
echo 请输入要启动的程序完整路径（例如 C:\Program Files\xxx\app.exe）
set /p UserFilePath=路径：

if "%UserFilePath%"=="" (
    echo 未输入路径，脚本终止。
    pause
    exit /b
)

echo -----------------------------------------
echo 开始写入注册表...
echo.

:: 创建主路径
reg add "HKLM\SOFTWARE\Lenovo\ShortcutKey\AppLaunch\Ex_17" /f

:: 根据系统版本写入 AppType
if %IsOldVersion%==1 (
    echo 系统版本 <=21H2，写入 AppType = 0x10001
    reg add "HKLM\SOFTWARE\Lenovo\ShortcutKey\AppLaunch\Ex_17" /v AppType /t REG_DWORD /d 0x10001 /f
) else (
    echo 系统版本 >21H2，写入 AppType = 1
    reg add "HKLM\SOFTWARE\Lenovo\ShortcutKey\AppLaunch\Ex_17" /v AppType /t REG_DWORD /d 1 /f
)

:: 创建 Desktop 子项
reg add "HKLM\SOFTWARE\Lenovo\ShortcutKey\AppLaunch\Ex_17\Desktop" /f

:: 写入 File
reg add "HKLM\SOFTWARE\Lenovo\ShortcutKey\AppLaunch\Ex_17\Desktop" /v File /t REG_SZ /d "%UserFilePath%" /f

:: 创建空 Parameters
reg add "HKLM\SOFTWARE\Lenovo\ShortcutKey\AppLaunch\Ex_17\Desktop" /v Parameters /t REG_SZ /d "" /f

echo -----------------------------------------
echo 注册表写入完成！
echo Ex_17 已成功配置为启动：
echo %UserFilePath%
echo -----------------------------------------

pause
