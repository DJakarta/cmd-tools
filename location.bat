@echo off
if [%1]==[] goto abort

for /f "delims=" %%f IN ('where %1') do echo %%~dpf

:abort