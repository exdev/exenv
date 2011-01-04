@ECHO OFF

IF "%OS%"=="Windows_NT" GOTO winver_ok

ECHO This batch file requires Windows NT4/2K/XP or higher.
ECHO ����� ������ 䠩� �㤥� ࠡ���� ⮫쪮 ��� Windows NT4/2K/XP ��� ���.
GOTO end

:winver_ok

IF {%1}=={} GOTO help
IF {%2}=={} GOTO help
IF {%1}=={/?} GOTO help
IF {%1}=={\?} GOTO help
GOTO start

:help

ECHO.
ECHO ����஢���� � ������� NSCopy ᮤ�ন���� ������ ��⠫��� � ��㣮� 
ECHO ��⠫��, ������ �����⠫���.
ECHO.
ECHO �ᯮ�짮�����:
ECHO   nscopyd.bat {SourcePath} {DestPath} [Parameters]
ECHO ���:
ECHO   {DestPath} - ��� ��⠫��� � ����� �㤥� ᪮��஢��� ᮤ�ন���
ECHO      ��⠫��� {SourcePath}
ECHO   [Parameters] - �������⥫�� ��ࠬ����, ����� ���� ��।��� NSCopy
ECHO.
ECHO ��������! ��ਡ��� ��⠫���� �� ����������.

GOTO end

:start

REM �஢�ઠ �� ४��ᨢ�� �맮�
IF NOT {%__BATCHNAME%}=={} GOTO recursion

REM ��砫� �믮������
SET __BATCHNAME="%~0"
SET __NSCOPY_PATH=%~dp0
SET __ARGS=%3 %4 %5 %6 %7 %8 %9

IF NOT EXIST "%__NSCOPY_PATH%nscopy.exe" (
	ECHO ERROR: "%__NSCOPY_PATH%nscopy.exe" not found.
	GOTO end
)

FOR %%I IN ("%~1\") DO SET SOURCE_PATH="%%~fdpI"
FOR %%I IN ("%~2\") DO SET DEST_PATH="%%~fdpI"

IF NOT EXIST %SOURCE_PATH% (
	ECHO ERROR: Path %SOURCE_PATH% not found.
	GOTO end
)

CALL %__BATCHNAME% %SOURCE_PATH% %DEST_PATH%
GOTO end


REM �������
:recursion
PUSHD "%~1%~3"
IF NOT EXIST "%~2%~3" (
	MKDIR "%~2%~3" 1>nul 2>nul
	IF ERRORLEVEL 1 (
		ECHO ERROR: Can't create directory "%~2%~3".
		MKDIR "%~2%~3"
		POPD
		GOTO end
	)
)
FOR /F "delims=" %%I IN ('DIR /B /A:-D') DO (
    ECHO Copying "%%~fI" to "%~2%~3%%~I"
    START /B /MIN /WAIT /D"%__NSCOPY_PATH%" nscopy.exe "%%~fI" "%~2%~3%%~I" /e %__ARGS%
)
FOR /F "delims=" %%I IN ('DIR /B /A:D') DO CALL %__BATCHNAME% %1 %2 "%~3%%~I\"
POPD

:end