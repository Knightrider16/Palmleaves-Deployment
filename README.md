# Palm Leaves Transliteration - Web Application

A Flask-based web application for transliterating Malayalam palm leaf manuscripts using deep learning models.

## Features

- 🔍 Search archives
- 📁 Transliteration project with ML models
- 🖼️ Image gallery
- 📊 Dashboard with video background

## Models Included

This deployment includes 2 optimized models:
- `vit_ctc` (40MB) - Vision Transformer with CTC
- `cnn_ctc` (72MB) - Pure CNN encoder with CTC

## Tech Stack

- **Backend:** Flask, PyTorch
- **ML Models:** Custom CRNN architectures
- **Image Processing:** OpenCV
- **Deployment:** Gunicorn

## Local Development

```bash
pip install -r requirements.txt
python -m webapp.app
```

## Deployment

This project is configured for Render.com deployment with:
- `Procfile` - Gunicorn configuration
- `render.yaml` - Render service configuration
- `requirements.txt` - Python dependencies
- `runtime.txt` - Python version

## License

Academic/Research Project
