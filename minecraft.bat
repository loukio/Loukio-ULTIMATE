@echo off
title=?
set APPDATA=%CD%\AppData\
IF NOT EXIST RAM.txt (GOTO:create) ELSE (GOTO:start)

:create
SET /p A=Zadaj kolko RAMiek si prajes vyuzivat? (M - Megabyte, G - Gygabyte):
echo %A%
SET /p CH=Kontrola. Pokracovat s %A% RAM?(Y/N):
IF %CH%==N goto create
IF %CH%==n goto create

SET /p B=Používaš 64-bit OS?(Y/N):
IF %B%==Y Echo -Xms%A% -Xmx%A% -d64 > RAM.txt
IF %B%==y Echo -Xms%A% -Xmx%A% -d64 > RAM.txt
IF %B%==N Echo -Xms%A% -Xmx%A% > RAM.txt
IF %B%==n Echo -Xms%A% -Xmx%A% > RAM.txt
ECHO Ukladam vase osobne nastavenia...
PING -n 6 localhost>nul
IF NOT EXIST RAM.txt (GOTO:create) ELSE (GOTO:start)

:start
SET /p RAM=<RAM.txt
java %RAM% -jar Minecraft.jar
exit