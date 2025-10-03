FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

WORKDIR /app

# System deps (for some pip packages)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential git \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

# Copy app code
COPY . /app

# Default to Jay deploy profile (override WIKI_VAULT_CONFIG at runtime if needed)
ENV WIKI_VAULT_CONFIG=/app/configs/jay-transcripts-deploy.yaml

# Expose port for FastAPI
ENV PORT=8000
EXPOSE 8000

# Start the web API
CMD ["uvicorn", "scripts.web_api:app", "--host", "0.0.0.0", "--port", "8000"]

