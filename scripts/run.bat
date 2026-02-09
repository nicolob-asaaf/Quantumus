@echo off
REM Run Quantum Mus Backend Server

echo ========================================
echo   Quantum Mus Backend Server
echo ========================================
echo.

REM Navigate to project root
cd /d "%~dp0\.."

REM Check if virtual environment exists
if not exist "venv\" (
    echo Creating virtual environment...
    python -m venv venv
    echo.
)

REM Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat

REM Install dependencies
echo Installing dependencies...
pip install -r requirements.txt --quiet
echo.

REM Run server from backend directory
echo Starting server on http://localhost:5000
echo Press Ctrl+C to stop
echo.
cd backend && python server.py

pause
