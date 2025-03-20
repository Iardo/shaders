@echo off
setlocal EnableDelayedExpansion

set quiet=^> NUL 2^>^&1
set fullpath=%~dp0
set filename=%~1
set bin_name=shader
set dir_love=
set dir_root=
set dir_core=
set dir_dbg=%fullpath%\build\debug
set dir_rel=%fullpath%\build\release
set dir_shader=%fullpath%\shader
set args_cmd=%1


for /D %%D in ("%fullpath%\.") do (
    set dir_root=%%~dpD
    set dir_core=%%~dpD\shader-core
)
for /F %%O in ('where love.exe') do (
    set dir_love=%%O
)

if not exist "!dir_shader!" (
    mklink /J "!dir_shader!" "!dir_root!"
)
if not exist "!dir_dbg!" set gen_build_dir=true
if not exist "!dir_rel!" set gen_build_dir=true
if defined gen_build_dir (
    mkdir !dir_dbg!
    mkdir !dir_rel!
)

@REM Start
@REM ----
if "!args_cmd!" == "" set args_cmd=start
if "!args_cmd!" == "start" (
    love --console .
    exit
)

@REM Release
@REM ----
if "!args_cmd!" == "bundle" (
    copy /b !dir_love!+!bin_name!.zip !dir_rel!\!bin_name!.exe
    exit
)

@REM Debug
@REM ----
if "!args_cmd!" == "build" (
    copy /b !dir_love!+!bin_name!.zip !dir_dbg!\!bin_name!.exe
    exit
)
