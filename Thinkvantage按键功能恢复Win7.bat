@echo off
:: 自动提升为管理员权限
>nul 2>&1 "%SystemRoot%\system32\cacls.exe" "%SystemRoot%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo 正在请求管理员权限...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

echo ===============================
echo  IBM TPHOTKEY 注册表自动配置
echo ===============================

:: 让用户输入程序路径
set /p userpath=请输入你要运行的程序完整路径（例如 C:\Program Files\xxx\xxx.exe）： 

:: 去掉可能的引号
set userpath=%userpath:"=%

echo.
echo 你输入的路径为：%userpath%
echo.

:: 注册表键路径
set KEY=HKLM\SOFTWARE\IBM\TPHOTKEY\8001

echo 创建或检查注册表键: %KEY%
reg add "%KEY%" /f

echo 写入字符串值 file
reg add "%KEY%" /v file /t REG_SZ /d "%userpath%" /f

if %errorlevel%==0 (
    echo 注册表已成功写入！
) else (
    echo 写入失败，请检查权限或路径格式。
)

pause
