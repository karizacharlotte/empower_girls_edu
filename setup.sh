#!/bin/bash

# Empowering Girls' Education - Project Setup Script
# This script sets up the Python environment and installs all required dependencies

echo "🎓 Setting up Empowering Girls' Education Project"
echo "================================================"

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3.8 or higher."
    exit 1
fi

echo "✅ Python 3 found: $(python3 --version)"

# Create virtual environment
echo "📦 Creating virtual environment..."
python3 -m venv education_env

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source education_env/bin/activate

# Upgrade pip
echo "⬆️ Upgrading pip..."
pip install --upgrade pip

# Install API dependencies
echo "🚀 Installing API dependencies..."
cd linear_regression_model/summative/API
pip install -r requirements.txt

echo "✅ Setup completed successfully!"
echo ""
echo "📋 Next steps:"
echo "1. Activate the environment: source education_env/bin/activate"
echo "2. Run the Jupyter notebook: jupyter notebook linear_regression_model/summative/linear_regression/multivariate.ipynb"
echo "3. Train the model and save artifacts"
echo "4. Test the API: cd linear_regression_model/summative/API && python prediction.py"
echo "5. Deploy to Render.com for public access"
echo ""
echo "🎯 For Flutter app:"
echo "1. cd linear_regression_model/summative/FlutterApp/education_predictor"
echo "2. flutter pub get"
echo "3. Update API URL in lib/main.dart"
echo "4. flutter run"
