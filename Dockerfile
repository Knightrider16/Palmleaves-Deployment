# Use Python 3.11 slim image as base
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies needed for building Python packages
# libevent-dev is required for gevent to build from source
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    python3-dev \
    libgl1 \
    libglib2.0-0 \
    libevent-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first (for better Docker layer caching)
COPY requirements.txt .

# Install Python dependencies
# --retries 5 handles unstable network connections during large downloads (e.g. torch ~670 MB)
RUN pip install --no-cache-dir --retries 5 torch==2.1.0 torchvision==0.16.0 && \
    pip install --no-cache-dir --no-build-isolation basicsr && \
    pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir gevent

# Copy the entire application
COPY . .

# Create necessary directories
RUN mkdir -p webapp/static/uploads webapp/data

# Expose port 5000
EXPOSE 5000

ENV FLASK_APP=webapp.app
ENV PYTHONUNBUFFERED=1

CMD ["gunicorn", "webapp.app:app", "--bind", "0.0.0.0:5000", "--timeout", "600", "--workers", "2", "--worker-class", "gevent"]