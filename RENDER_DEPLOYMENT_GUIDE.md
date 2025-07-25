# 🚀 Render.com Deployment Guide
## Deploy Your Education Predictor API

### 📋 Prerequisites
- [x] GitHub repository with your code (already done!)
- [x] FastAPI application ready (`prediction.py`)
- [x] Requirements file (`requirements.txt`)
- [x] Model artifacts (`best_model_artifacts.pkl`)

### 🌐 Step 1: Sign Up for Render.com
1. Go to [render.com](https://render.com)
2. Sign up with your GitHub account
3. Authorize Render to access your repositories

### 📂 Step 2: Create a New Web Service
1. Click **"New +"** in your Render dashboard
2. Select **"Web Service"**
3. Connect your GitHub repository: `empower_girls_edu`
4. Choose the repository from the list

### ⚙️ Step 3: Configure Your Service
**Basic Settings:**
- **Name**: `education-predictor-api`
- **Region**: Choose closest to your users
- **Branch**: `main`
- **Runtime**: `Python 3`

**Build & Deploy Settings:**
- **Root Directory**: `linear_regression_model/summative/API`
- **Build Command**: 
  ```bash
  pip install -r requirements.txt
  ```
- **Start Command**: 
  ```bash
  python -m uvicorn prediction:app --host 0.0.0.0 --port $PORT
  ```

**Advanced Settings:**
- **Auto-Deploy**: `Yes` (deploy on every push)
- **Health Check Path**: `/health`

### 💰 Step 4: Choose Your Plan
- **Free Tier**: Perfect for this project
  - 750 hours/month
  - Sleeps after 15 minutes of inactivity
  - Wakes up automatically on request

### 🚀 Step 5: Deploy!
1. Click **"Create Web Service"**
2. Wait for the build to complete (3-5 minutes)
3. Your API will be live at: `https://your-service-name.onrender.com`

### ✅ Step 6: Test Your Deployment
Once deployed, test these endpoints:
- **Health Check**: `GET https://your-service-name.onrender.com/health`
- **Prediction**: `POST https://your-service-name.onrender.com/predict`

### 📱 Step 7: Update Flutter App
Update your Flutter app's API URL:
```dart
// In main.dart, change from:
static const String baseUrl = 'http://localhost:8000';

// To your Render URL:
static const String baseUrl = 'https://your-service-name.onrender.com';
```

### 🔍 Step 8: Monitor Your Service
- View logs in real-time from Render dashboard
- Monitor performance and uptime
- Set up notifications for issues

---

## 📊 Expected Deployment Timeline
- **Setup**: 5 minutes
- **First Build**: 3-5 minutes
- **Total Time**: ~10 minutes

## 🎯 Your API Endpoints After Deployment
- **Base URL**: `https://your-service-name.onrender.com`
- **Health Check**: `GET /health`
- **Predict**: `POST /predict`
- **Documentation**: `GET /docs` (Swagger UI)

## 🐛 Troubleshooting
If deployment fails:
1. Check build logs in Render dashboard
2. Verify `requirements.txt` includes all dependencies
3. Ensure model file path is correct
4. Check Python version compatibility

## 💡 Pro Tips
1. **Keep it awake**: The free tier sleeps after 15 minutes. Consider upgrading for production use.
2. **Monitor logs**: Use Render's log viewer to debug issues
3. **Environment variables**: Add any secrets via Render's environment variables
4. **Custom domain**: Upgrade to add your own domain

---

**🎉 Once deployed, your API will be accessible worldwide and ready for your Flutter app!**
