@echo off
taskkill /F /IM nginx.exe /T 2> nul
cd "C:/Program Files/nginx"
start nginx.exe
