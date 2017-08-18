@echo off
REM # -----------------------------------------------------------------------------
REM # Build the npm libraries after a svn repo restore
REM # -----------------------------------------------------------------------------

set arg1=%1
set arg2=%2

cd %1
npm i

cd %2
npm i
