# [Project Name]

## Tech Stack
- Python 3.11+
- Flask (or FastAPI) for API
- SQLAlchemy for database
- pytest for testing

## Commands
- `python -m flask run` -- start dev server
- `pytest` -- run all tests
- `pytest -x` -- stop on first failure
- `pip install -r requirements.txt` -- install dependencies

## Code Style
- Type hints on all function signatures
- Docstrings on public functions (Google style)
- PEP 8 compliance
- Use `pathlib` instead of `os.path`
- Use f-strings for string formatting

## File Structure
```
app/
  __init__.py       # Flask app factory
  models/           # SQLAlchemy models
  routes/           # API route blueprints
  services/         # Business logic
  utils/            # Helper functions
tests/
  conftest.py       # Shared fixtures
  test_routes/      # Route tests
  test_services/    # Service tests
requirements.txt
.env.example        # Template for environment variables
```

## Rules
- All endpoints return JSON with `{"data": ..., "error": ...}` envelope
- Use environment variables for config (never hardcode secrets)
- Database queries go through service layer, not directly in routes
- Every new endpoint needs a test
- Use `logging` module, not `print()`
- Virtual environment: `python -m venv venv`
- Never commit `venv/`, `__pycache__/`, or `.env`
