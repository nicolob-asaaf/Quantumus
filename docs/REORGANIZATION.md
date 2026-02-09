# Repository Reorganization Summary

## Overview

The Quantumus repository has been reorganized on **February 9, 2026** to provide a clean, professional structure that clearly separates backend, frontend, tests, and documentation.

## What Changed

### New Directory Structure

```
├── backend/                    # All Python backend code
├── frontend/                   # All HTML/CSS/JS frontend code
├── tests/                      # All test files
├── docs/                       # All documentation
└── scripts/                    # Utility scripts (run.sh, run.bat)
```

### Files Moved

#### Backend (`backend/`)
- All `.py` files from root → `backend/`
- `Logica_cuantica/` → `backend/quantum/` (consolidated with `Logica cuantica/`)
- Created `backend/quantum/__init__.py` to make it a proper Python package

#### Frontend (`frontend/`)
- HTML files → `frontend/`
- JavaScript files → `frontend/js/`
- CSS files → `frontend/css/`
- Assets → `frontend/assets/`

#### Tests (`tests/`)
- All `test_*.py` files → `tests/`
- Updated imports to reference backend modules correctly

#### Documentation (`docs/`)
- All `.md` files (except `README.md`) → `docs/`

#### Scripts (`scripts/`)
- `run.sh` and `run.bat` → `scripts/`
- Updated scripts to run from any directory

### Files Removed

The following duplicate and deprecated files were removed:
- `Logica cuantica/` (duplicate folder)
- `stiles.ccs` (typo duplicate of `styles.css`)
- `game.js.backup` (backup file)
- `Requisements.py` (deprecated)
- `quantum-engine.py` (deprecated)
- `__pycache__/` directories
- `instance/` directories

### Updated Configurations

#### Backend
- **Import statements**: Updated to use `from quantum.baraja import ...` instead of `from Logica_cuantica.baraja import ...`
- **Frontend directory**: `server.py` now correctly points to `../frontend` instead of `..`

#### Frontend
- **HTML files**: Updated to reference `js/game.js`, `css/styles.css`, etc.
- Removed references to non-existent files

#### Scripts
- **run.sh**: Updated to navigate to project root and run from `backend/` directory
- **run.bat**: Updated similarly for Windows

#### Other
- **Procfile**: Already referenced `backend/`, no changes needed
- **.gitignore**: Created comprehensive ignore rules for Python, Flask, IDEs, and OS files

## How to Use

### Running the Application

**Unix/Linux/Mac:**
```bash
./scripts/run.sh
```

**Windows:**
```cmd
scripts\run.bat
```

**Manual:**
```bash
cd backend
python server.py
```

The server will start on http://localhost:5000 and automatically serve files from the `frontend/` directory.

### Running Tests

Tests can be run from the `tests/` directory:

```bash
cd tests
python test_client.py
python test_collapse_determinism.py
python test_grande_phase.py
```

### Development

When developing:
1. Backend code: Work in `backend/`
2. Frontend code: Work in `frontend/`
3. Tests: Work in `tests/`
4. Documentation: Work in `docs/`

All imports and paths have been updated to work with the new structure.

## Benefits of the New Structure

1. **Clear Separation**: Backend and frontend are clearly separated
2. **Professional**: Follows standard project organization conventions
3. **Scalable**: Easy to add new features in the appropriate directories
4. **Maintainable**: Easier to navigate and understand the codebase
5. **No Duplicates**: Removed all duplicate and backup files
6. **Clean Git**: `.gitignore` properly excludes temporary and generated files

## Migration Notes

If you have local development in progress:

1. Pull the latest changes
2. Delete your old virtual environment: `rm -rf venv/`
3. Create a new one: `python3 -m venv venv`
4. Install dependencies: `pip install -r requirements.txt`
5. Run from the new location: `cd backend && python server.py`

## Questions or Issues?

If you encounter any problems with the new structure, please check:
1. Are you running the server from the `backend/` directory?
2. Are imports failing? Make sure Python can find the backend modules
3. Are frontend files not loading? Check the browser console for 404 errors

For more information, see:
- [README.md](../README.md) - Main documentation
- [QUICKSTART.md](QUICKSTART.md) - Quick start guide
- [BACKEND_STRUCTURE.md](BACKEND_STRUCTURE.md) - Backend details
