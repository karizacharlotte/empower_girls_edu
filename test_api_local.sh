#!/bin/bash

# API Testing Script for Local Development
# Test your FastAPI before deploying to Render

echo "🧪 Testing Education Predictor API Locally"
echo "==========================================="

# Navigate to API directory
cd "$(dirname "$0")/linear_regression_model/summative/API"

# Check if required files exist
echo "📋 Checking required files..."
if [ ! -f "prediction.py" ]; then
    echo "❌ prediction.py not found!"
    exit 1
fi

if [ ! -f "requirements.txt" ]; then
    echo "❌ requirements.txt not found!"
    exit 1
fi

if [ ! -f "best_model_artifacts.pkl" ]; then
    echo "❌ best_model_artifacts.pkl not found!"
    exit 1
fi

echo "✅ All required files found"

# Install dependencies
echo ""
echo "📦 Installing dependencies..."
pip install -r requirements.txt

# Test imports
echo ""
echo "🔍 Testing Python imports..."
python -c "
import pandas as pd
import numpy as np
import joblib
from fastapi import FastAPI
from pydantic import BaseModel
import uvicorn
print('✅ All imports successful!')
"

# Start the server in background for testing
echo ""
echo "🚀 Starting FastAPI server for testing..."
uvicorn prediction:app --host 127.0.0.1 --port 8000 &
SERVER_PID=$!

# Wait for server to start
sleep 5

# Test health endpoint
echo ""
echo "🏥 Testing health endpoint..."
HEALTH_RESPONSE=$(curl -s http://127.0.0.1:8000/health)
echo "Response: $HEALTH_RESPONSE"

# Test prediction endpoint
echo ""
echo "🎯 Testing prediction endpoint..."
PREDICTION_RESPONSE=$(curl -s -X POST http://127.0.0.1:8000/predict \
  -H "Content-Type: application/json" \
  -d '{
    "gender": "female",
    "race_ethnicity": "group C",
    "parental_education": "bachelor'\''s degree",
    "lunch_type": "standard",
    "test_preparation": "completed"
  }')
echo "Response: $PREDICTION_RESPONSE"

# Stop the server
echo ""
echo "🛑 Stopping test server..."
kill $SERVER_PID

echo ""
echo "✅ Local API testing complete!"
echo ""
echo "🌐 Ready for Render deployment!"
echo "   1. Go to render.com"
echo "   2. Connect your GitHub repository"
echo "   3. Follow the deployment guide in RENDER_DEPLOYMENT_GUIDE.md"
