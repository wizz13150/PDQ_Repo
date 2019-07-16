Batch to get Mapped/Network Printers on a remote computer. List also Local Printers.
````
@ECHO OFF
CLS
setLocal EnableDelayedExpansion
REM The textfile to store the printers
SET textFile=C:\printers.txt
REM Clear the text file and start new
COPY /Y NUL !textFile! >nul 2>&1


REM =================================================================================================================
REM Recuperation des Imprimantes pour tout utilisateur actuellement connecte.
REM =================================================================================================================
ECHO ==============================================================
REM ECHO Recherche des Utilisateurs qui sont connectes !
REM ECHO ==============================================================
REM ECHO.
FOR /F "tokens=*" %%G IN ('REG QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList"') DO (
    SET line=%%G
    FOR /F "tokens=3" %%X IN ('REG QUERY "HKLM\!line:~19!" /v "profileImagePath" 2^>nul') DO (
        SET userPath=%%X
        SET userPath=!userPath:*C:\Users\=!

        SET isUser=true

        REM Specify users to filter out
        IF "!userPath!" == "Administrator" SET isUser=false
        IF "!userPath!" == "defaultuser0" SET isUser=false
        IF "!userPath!" == "Public" SET isUser=false
        IF "!isUser!" == "true" (
            IF EXIST "C:\users\!userPath!\" (
                REM Make sure the key actually exists
                REG QUERY "HKU\!line:~76!" >nul 2>&1
                IF !ERRORLEVEL! EQU 0 (
                    ECHO Recuperation des Imprimantes pour !userPath!
                    ECHO !userPath!: >> !textFile!
                    REM Get all network printers
                    FOR /F "tokens=*" %%F IN ('REG QUERY "HKU\!line:~76!\Printers\Connections" 2^>nul') DO (

                        REM Format the output to only contain the printer name,portname. Then print it to the text file.
                        SET newLine=%%F
                        SET output=!newLine:*Connections\=!
                        ECHO !output:,=\! >> !textFile!
                    )
                    ECHO.>>!textFile!
                )
            )
        )
    )
)
REM ECHO Les utilisateurs connectes sont maintenant traites.
REM ECHO.
REM =================================================================================================================
REM Recherche des Imprimantes réseaux des Utilisateurs déconnectés.
REM =================================================================================================================
REM ECHO ==============================================================
REM ECHO Recherche des Utilisateurs deconnectes.
REM ECHO ==============================================================
REM ECHO.
FOR /F "tokens=*" %%D IN ('DIR C:\Users\ /B') DO (
    SET line=%%D
    SET isUser=true

    REM Specify users to filter out
    IF "!line!" == "Administrator" SET isUser=false
    IF "!line!" == "defaultuser0" SET isUser=false
    IF "!line!" == "Public" SET isUser=false
    IF "!isUser!" == "true" (
        XCOPY "C:\Users\!line!\NTUSER.DAT" "C:\Users\!line!\NTUSER_TEMP.DAT*" /H /Q >nul 2>&1
        IF !ERRORLEVEL! EQU 0 (
            REG LOAD "HKU\TempHive" "C:\Users\!line!\NTUSER_TEMP.DAT" >nul 2>&1

            REM Make sure the key actually exists
            REG QUERY "HKU\TempHive\Printers\Connections" >nul 2>&1
            IF !ERRORLEVEL! EQU 0 (

                REM Get all network printers
                REM ECHORecuperation des Imprimantes pour !userPath!
                ECHO !line!: >> !textFile!
                FOR /F "tokens=*" %%F IN ('REG QUERY "HKU\TempHive\Printers\Connections" 2^>nul') DO (

                    REM Format the output to only contain the printer name. Then print it to the text file.
                    SET newLine=%%F
                    SET output=!newLine:*Connections\=!
                    ECHO - !output:,=\! >> !textFile!
                )
                ECHO.>>!textFile!
            )

            REG UNLOAD "HKU\TempHive" >nul 2>&1
            DEL /Q /A:H "C:\Users\!line!\NTUSER_TEMP.DAT"
        )
    )
)

REM =================================================================================================================
REM Récupération des imprimantes installées localement.
REM =================================================================================================================
ECHO ==============================================================
ECHO Recherche des imprimantes locales.
ECHO ==============================================================
ECHO.
ECHO Local Printers:>>!textFile!
FOR /F "tokens=*" %%a in ('WMIC PRINTER GET NAME') do (
    SET printer=%%a
    IF NOT "!printer:~0,2!" == "\\" (
        IF NOT "!printer:~0,4!" == "Name" (
            ECHO.!printer! >> !textFile!
        )
    )
)
ENDLOCAL
TYPE \\%COMPUTERNAME%\C$\printers.txt
pause
````
