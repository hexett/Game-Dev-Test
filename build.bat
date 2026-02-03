@echo off
REM Build script for Windows using CMake and CPM

setlocal EnableDelayedExpansion

REM Configuration
set BUILD_TYPE=Release
set BUILD_DIR=build
set GENERATOR="Visual Studio 18 2026"

REM Parse command line arguments
:parse_args
if "%~1"=="" goto end_parse
if /i "%~1"=="--debug" (
    set BUILD_TYPE=Debug
    shift
    goto parse_args
)
if /i "%~1"=="--clean" (
    echo Cleaning build directory...
    if exist "%BUILD_DIR%" rmdir /s /q "%BUILD_DIR%"
    shift
    goto parse_args
)
if /i "%~1"=="--help" (
    echo Usage: build.bat [options]
    echo Options:
    echo   --debug       Build in Debug mode (default: Release)
    echo   --clean       Clean build directory before building
    echo   --help        Show this help message
    exit /b 0
)
shift
goto parse_args
:end_parse

echo ================================================
echo Building OpenGL Project
echo ================================================
echo Build Type: %BUILD_TYPE%
echo Generator: %GENERATOR%
echo Build Directory: %BUILD_DIR%
echo ================================================

REM Create build directory if it doesn't exist
if not exist "%BUILD_DIR%" (
    echo Creating build directory...
    mkdir "%BUILD_DIR%"
)

REM Navigate to build directory
cd "%BUILD_DIR%"

REM Configure CMake
echo.
echo Configuring CMake...
cmake -G %GENERATOR% -A x64 -DCMAKE_BUILD_TYPE=%BUILD_TYPE% ..
if %ERRORLEVEL% neq 0 (
    echo Error: CMake configuration failed!
    cd ..
    exit /b 1
)

REM Build the project
echo.
echo Building project...
cmake --build . --config %BUILD_TYPE% --parallel
if %ERRORLEVEL% neq 0 (
    echo Error: Build failed!
    cd ..
    exit /b 1
)

REM Return to root directory
cd ..

echo.
echo ================================================
echo Build completed successfully!
echo ================================================
echo Executable location: %BUILD_DIR%\bin\%BUILD_TYPE%\MyOpenGLProject.exe
echo.
echo To run the application, execute:
echo   %BUILD_DIR%\bin\%BUILD_TYPE%\MyOpenGLProject.exe
echo ================================================

endlocal