@echo off
:: Перевіряємо чи є права адміністратора
net session >nul 2>&1
if %errorlevel% == 0 (
    echo Права адміністратора є.
) else (
    echo Перезапуск із правами адміністратора...
    powershell Start-Process "%~f0" -Verb runAs
    exit /b
)

:: Запускаємо твою програму
start "" "C:\Path\To\your_program.exe"

exit