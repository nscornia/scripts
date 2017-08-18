@echo off
REM # -----------------------------------------------------------------------------
REM # Start Script for the CATALINA Server
REM # -----------------------------------------------------------------------------

echo ***** Deleting Log Files *****
cd %CATALINA_HOME%"/logs"
del catalina* 2> nul
del local* 2> nul
del manager* 2> nul
del admin* 2> nul
del host* 2> nul


echo ***** Continuing Normal Startup *****
cd %CATALINA_HOME%"/bin"
