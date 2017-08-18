@echo off
REM # -----------------------------------------------------------------------------
REM # clears deployed webapps and logs
REM # -----------------------------------------------------------------------------

echo ***** Deleting Log Files *****
del %CATALINA_HOME%"\logs\catalina*"
del %CATALINA_HOME%"\logs\local*"
del %CATALINA_HOME%"\logs\manager*"
del %CATALINA_HOME%"\logs\admin*"
del %CATALINA_HOME%"\logs\host*"
