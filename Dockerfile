# Use Python 3.11 slim image as base
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies needed for building Python packages
# gcc, g++: C/C++ compilers for editdistance
# python3-dev: Python headers for building extensions
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    python3-dev \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first (for better Docker layer caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire application
COPY . .

# Create necessary directories
RUN mkdir -p webapp/static/uploads webapp/data

# Expose port 5000
EXPOSE 5000

# Set environment variables
ENV FLASK_APP=webapp.app
ENV PYTHONUNBUFFERED=1

# Run the application with gunicorn
CMD ["gunicorn", "webapp.app:app", "--bind", "0.0.0.0:5000", "--timeout", "120", "--workers", "2"]
