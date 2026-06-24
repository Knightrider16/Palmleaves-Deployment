# Docker Setup Guide

## Prerequisites
1. Install Docker Desktop from: https://www.docker.com/products/docker-desktop/
2. Ensure Docker Desktop is running

## Step-by-Step Setup

### 1. Build the Docker Image
Open a terminal in the project directory and run:
```bash
docker-compose build
```
This will:
- Download the Python base image
- Install system dependencies (gcc, g++ for compiling editdistance)
- Install all Python packages from requirements.txt
- Copy your application code

**First build takes 5-10 minutes** ⏱️

### 2. Start the Application
```bash
docker-compose up
```
Or run in detached mode (background):
```bash
docker-compose up -d
```

### 3. Access the Application
Open your browser and go to:
```
http://localhost:5000
```

### 4. View Logs
If running in detached mode, view logs with:
```bash
docker-compose logs -f
```

### 5. Stop the Application
```bash
docker-compose down
```

## Common Commands

### Rebuild After Code Changes
```bash
docker-compose build
docker-compose up
```

### Run a Single Command in Container
```bash
docker-compose run web python -m crnn.train
```

### Access Container Shell
```bash
docker-compose exec web bash
```

### Clean Up Everything
```bash
docker-compose down
docker system prune -a
```

## Advantages
✅ **No dependency issues** - editdistance compiles automatically
✅ **Works on any OS** - Windows, Mac, Linux
✅ **Consistent environment** - Everyone uses the same setup
✅ **Easy sharing** - Just clone and run `docker-compose up`

## Troubleshooting

**Port already in use?**
```bash
# Change port in docker-compose.yml from "5000:5000" to "8000:5000"
```

**Permission issues on Linux?**
```bash
sudo docker-compose up
```

**Need to rebuild completely?**
```bash
docker-compose build --no-cache
```
