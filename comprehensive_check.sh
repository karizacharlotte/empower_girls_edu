#!/bin/bash

echo "🔍 COMPREHENSIVE ERROR CHECK AND VERIFICATION"
echo "=" * 60

# Check Python environment
echo "1. Python Environment Check:"
/home/kariza/Desktop/empower_girls_edu/education_env/bin/python --version
echo ""

# Check dataset
echo "2. Dataset Verification:"
if [ -f "StudentsPerformance.csv" ]; then
    echo "✅ Dataset file exists"
    lines=$(wc -l < StudentsPerformance.csv)
    echo "   Lines: $lines"
else
    echo "❌ Dataset file missing"
fi
echo ""

# Check model artifacts
echo "3. Model Artifacts Check:"
if [ -f "linear_regression_model/best_model_artifacts.pkl" ]; then
    echo "✅ Main model file exists"
else
    echo "❌ Main model file missing"
fi

if [ -f "linear_regression_model/summative/API/best_model_artifacts.pkl" ]; then
    echo "✅ API model file exists"
else
    echo "❌ API model file missing"
fi
echo ""

# Check notebook
echo "4. Notebook Verification:"
if [ -f "linear_regression_model/summative/linear_regression/multivariate.ipynb" ]; then
    echo "✅ Notebook file exists"
    # Check if notebook is valid JSON
    if /home/kariza/Desktop/empower_girls_edu/education_env/bin/python -c "import json; json.load(open('linear_regression_model/summative/linear_regression/multivariate.ipynb'))" 2>/dev/null; then
        echo "✅ Notebook has valid JSON structure"
    else
        echo "❌ Notebook has invalid JSON structure"
    fi
else
    echo "❌ Notebook file missing"
fi
echo ""

# Test Python imports
echo "5. Python Dependencies Check:"
/home/kariza/Desktop/empower_girls_edu/education_env/bin/python -c "
try:
    import pandas as pd
    print('✅ pandas')
except: print('❌ pandas')

try:
    import numpy as np
    print('✅ numpy')
except: print('❌ numpy')

try:
    import sklearn
    print('✅ sklearn')
except: print('❌ sklearn')

try:
    import joblib
    print('✅ joblib')
except: print('❌ joblib')

try:
    import fastapi
    print('✅ fastapi')
except: print('❌ fastapi')

try:
    import matplotlib
    print('✅ matplotlib')
except: print('❌ matplotlib')

try:
    import seaborn
    print('✅ seaborn')
except: print('❌ seaborn')
"
echo ""

# Test model loading
echo "6. Model Loading Test:"
/home/kariza/Desktop/empower_girls_edu/education_env/bin/python -c "
try:
    import joblib
    artifacts = joblib.load('linear_regression_model/best_model_artifacts.pkl')
    print('✅ Model loaded successfully')
    print(f'   Model type: {artifacts[\"model_name\"]}')
    print(f'   Features: {len(artifacts[\"feature_names\"])}')
    print(f'   R² Score: {artifacts[\"model_performance\"][\"test_r2\"]:.4f}')
except Exception as e:
    print(f'❌ Model loading failed: {e}')
"
echo ""

# Test API functionality
echo "7. API Module Test:"
cd linear_regression_model/summative/API
/home/kariza/Desktop/empower_girls_edu/education_env/bin/python -c "
try:
    import sys
    sys.path.append('.')
    
    # Test basic imports
    from fastapi import FastAPI
    import joblib
    import pandas as pd
    print('✅ API dependencies imported')
    
    # Test model loading in API context
    try:
        model_artifacts = joblib.load('best_model_artifacts.pkl')
        print('✅ API model loading works')
    except Exception as e:
        try:
            model_artifacts = joblib.load('../../best_model_artifacts.pkl')
            print('✅ API model loading works (relative path)')
        except Exception as e2:
            print(f'❌ API model loading failed: {e2}')
    
except Exception as e:
    print(f'❌ API module test failed: {e}')
"
cd ../../..
echo ""

# Check Flutter app
echo "8. Flutter App Check:"
if [ -d "linear_regression_model/summative/FlutterApp/education_predictor" ]; then
    echo "✅ Flutter app directory exists"
    if [ -f "linear_regression_model/summative/FlutterApp/education_predictor/pubspec.yaml" ]; then
        echo "✅ Flutter pubspec.yaml exists"
    else
        echo "❌ Flutter pubspec.yaml missing"
    fi
    if [ -f "linear_regression_model/summative/FlutterApp/education_predictor/lib/main.dart" ]; then
        echo "✅ Flutter main.dart exists"
    else
        echo "❌ Flutter main.dart missing"
    fi
else
    echo "❌ Flutter app directory missing"
fi
echo ""

echo "🎯 VERIFICATION COMPLETE"
echo "=" * 60
