@echo off
:: 自动提升为管理员权限
>nul 2>&1 "%SystemRoot%\system32\cacls.exe" "%SystemRoot%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo 正在请求管理员权限...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

echo 正在修改 Synaptics 触控板 UIStyle 注册表值...
reg add "HKLM\SOFTWARE\Synaptics\SynTPCpl" /v UIStyle /t REG_SZ /d 237c /f

if %errorlevel%==0 (
    echo 修改成功！UIStyle 已设置为 237c
) else (
    echo 修改失败，请检查系统权限或注册表路径是否存在。
)

pause
