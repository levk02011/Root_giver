@echo off
set "progpath=C:\Path\To\your_program.exe"
set "regkey=HKCU\Software\Microsoft\Windows\CurrentVersion\Run"

:: Підняття прав адміністратора
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Перевірка чи існує файл
if exist "%progpath%" (
    start "" "%progpath%"
) else (
    powershell -Command "Add-Type -AssemblyName PresentationFramework;[System.Windows.MessageBox]::Show('Файл не знайдено: %progpath%','Помилка',0,16)"
)

:: Додавання програми в автозавантаження (реєстр)
reg query "%regkey%" /v "MyApp" >nul 2>&1
if %errorlevel% neq 0 (
    reg add "%regkey%" /v "MyApp" /t REG_SZ /d "\"%~f0\"" /f
)

exit
