@echo off
REM # 1 run regedit
REM # 2 navigate to the HKEY_CURRENT_USER\SOFTWARE\Microsoft\Command Processor key
REM # 3 add a new string value called "AutoRun" and set the value to "<doskey.bat location>"

SET DEV=%HOME%"\dev"

doskey home=cd %HOME%$* $T dir /B

REM #
REM # cd aliases
REM #
doskey ..=cd ..
doskey ...=cd ..\..
doskey ....=cd ..\..\..
doskey .....=cd ..\..\..\..
doskey ......=cd ..\..\..\..\..
doskey .......=cd ..\..\..\..\..\..
doskey ........=cd ..\..\..\..\..\..\..

REM #
REM # ls Aliases
REM #
doskey la=ls -A
doskey lla=ls -Al
doskey ll=ls -l

REM #
REM # SVN Aliases
REM #
doskey svnempty=svn update --set-depth empty $*
doskey svnfull=svn update --set-depth infinity $*
doskey svnnone=svn update --set-depth exclude $*
doskey svnsparse=svn update --set-depth immediates $*
doskey svnstig=svn st --no-ignore $*

REM #
REM # Folder Aliases
REM #
doskey work=cd %HOME%
doskey win=cd C:\


doskey aliases=doskey /macros

REM echo. & echo Doskey macros applied; type aliases for a list of options
