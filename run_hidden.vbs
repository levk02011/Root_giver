Set WshShell = CreateObject("WScript.Shell")
WshShell.Run chr(34) & "C:\Path\To\run_program.bat" & chr(34), 0
Set WshShell = Nothing
