#!/bin/bash
# Render startup script for Education Predictor API

echo "🚀 Starting Education Predictor API on Render..."
echo "================================================"

# Check if model file exists
if [ ! -f "best_model_artifacts.pkl" ]; then
    echo "❌ Model artifacts not found!"
    exit 1
fi

echo "✅ Model artifacts found"

# Start the FastAPI server
echo "🌐 Starting FastAPI server on port $PORT..."
python -m uvicorn prediction:app --host 0.0.0.0 --port $PORT
