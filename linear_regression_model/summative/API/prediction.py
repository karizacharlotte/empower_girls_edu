"""
Empowering Girls' Education - Student Performance Prediction API

This FastAPI application provides an endpoint to predict student academic performance
based on demographic and socioeconomic factors. The API is designed to support
educational interventions and policy decisions to empower girls' education.

Author: Education Data Science Team
Mission: Empower girls' education through data-driven insights
"""

from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel, Field, validator
import joblib
import pandas as pd
import numpy as np
from typing import Literal
import uvicorn

# Load the trained model and preprocessing components
try:
    model_artifacts = joblib.load('../../best_model_artifacts.pkl')
    print("✅ Model artifacts loaded successfully!")
    print(f"   Model: {model_artifacts['model_name']}")
    print(f"   Test MSE: {model_artifacts['model_performance']['test_mse']:.4f}")
    print(f"   Test R²: {model_artifacts['model_performance']['test_r2']:.4f}")
except Exception as e:
    print(f"❌ Error loading model: {e}")
    model_artifacts = None

# Initialize FastAPI app
app = FastAPI(
    title="Empowering Girls' Education - Student Performance Predictor",
    description="""
    🎓 **Mission**: Empower girls' education through data-driven insights
    
    This API predicts student academic performance based on demographic and socioeconomic factors.
    Use these predictions to:
    - Identify students who may need additional support
    - Target educational interventions effectively  
    - Support policy decisions for educational equity
    - Promote girls' educational success
    
    **Dataset**: Student Performance in Exams (1000+ student records)
    **Model**: Machine Learning ensemble optimized for educational outcomes
    **Purpose**: Educational intervention and policy support
    """,
    version="1.0.0",
    docs_url="/docs",
    redoc_url="/redoc"
)

# Add CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # In production, specify actual domains
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Pydantic models for request validation
class StudentData(BaseModel):
    """
    Student demographic and socioeconomic data for performance prediction.
    
    All fields include validation constraints to ensure realistic input values.
    """
    
    gender: Literal["male", "female"] = Field(
        ...,
        description="Student's gender",
        example="female"
    )
    
    race_ethnicity: Literal[
        "group A", "group B", "group C", "group D", "group E"
    ] = Field(
        ...,
        description="Student's racial/ethnic group classification",
        example="group C"
    )
    
    parental_education: Literal[
        "some high school",
        "high school", 
        "some college",
        "associate's degree",
        "bachelor's degree",
        "master's degree"
    ] = Field(
        ...,
        description="Highest level of parental education completed",
        example="bachelor's degree"
    )
    
    lunch_type: Literal["standard", "free/reduced"] = Field(
        ...,
        description="Lunch program type (economic indicator: standard = higher income, free/reduced = lower income)",
        example="standard"
    )
    
    test_preparation: Literal["none", "completed"] = Field(
        ...,
        description="Whether student completed test preparation course",
        example="completed"
    )
    
    class Config:
        schema_extra = {
            "example": {
                "gender": "female",
                "race_ethnicity": "group C",
                "parental_education": "bachelor's degree",
                "lunch_type": "standard",
                "test_preparation": "completed"
            }
        }

class PredictionResponse(BaseModel):
    """Response model for prediction results."""
    
    predicted_score: float = Field(
        ...,
        description="Predicted overall academic score (0-100 scale)",
        ge=0,
        le=100
    )
    
    confidence_level: str = Field(
        ...,
        description="Model confidence level based on input data quality"
    )
    
    model_info: dict = Field(
        ...,
        description="Information about the model used for prediction"
    )
    
    educational_insights: dict = Field(
        ...,
        description="Educational insights and recommendations based on the prediction"
    )

class HealthResponse(BaseModel):
    """Health check response model."""
    status: str
    message: str
    model_loaded: bool

def predict_student_performance(student_data: StudentData) -> float:
    """
    Predict student performance using the trained model.
    
    Args:
        student_data: Validated student demographic and socioeconomic data
        
    Returns:
        Predicted overall academic score (0-100)
    """
    if model_artifacts is None:
        raise HTTPException(status_code=500, detail="Model not loaded")
    
    # Create input DataFrame with correct column names
    input_data = pd.DataFrame({
        'gender': [student_data.gender],
        'race/ethnicity': [student_data.race_ethnicity],
        'parental level of education': [student_data.parental_education],
        'lunch': [student_data.lunch_type],
        'test preparation course': [student_data.test_preparation]
    })
    
    try:
        # Encode categorical variables
        input_encoded = input_data.copy()
        for column in input_data.columns:
            if column in model_artifacts['label_encoders']:
                input_encoded[column] = model_artifacts['label_encoders'][column].transform(input_data[column])
            else:
                raise ValueError(f"Unknown column: {column}")
        
        # Scale features
        input_scaled = model_artifacts['feature_scaler'].transform(input_encoded)
        
        # Make prediction
        prediction_scaled = model_artifacts['model'].predict(input_scaled)
        
        # Convert back to original scale
        prediction_original = model_artifacts['target_scaler'].inverse_transform(
            prediction_scaled.reshape(-1, 1)
        )[0][0]
        
        # Ensure prediction is within valid range
        prediction_original = max(0, min(100, prediction_original))
        
        return round(prediction_original, 2)
        
    except Exception as e:
        raise HTTPException(status_code=422, detail=f"Prediction error: {str(e)}")

def get_educational_insights(student_data: StudentData, predicted_score: float) -> dict:
    """
    Generate educational insights and recommendations based on prediction.
    
    Args:
        student_data: Student demographic data
        predicted_score: Predicted academic score
        
    Returns:
        Dictionary containing educational insights and recommendations
    """
    insights = {
        "performance_category": "",
        "key_factors": [],
        "recommendations": [],
        "intervention_priority": ""
    }
    
    # Categorize performance
    if predicted_score >= 80:
        insights["performance_category"] = "High Performer"
        insights["intervention_priority"] = "Low"
    elif predicted_score >= 65:
        insights["performance_category"] = "Average Performer" 
        insights["intervention_priority"] = "Medium"
    else:
        insights["performance_category"] = "At-Risk Student"
        insights["intervention_priority"] = "High"
    
    # Identify key factors
    if student_data.lunch_type == "free/reduced":
        insights["key_factors"].append("Economic disadvantage (free/reduced lunch)")
        insights["recommendations"].append("Provide additional academic support and resources")
    
    if student_data.parental_education in ["some high school", "high school"]:
        insights["key_factors"].append("Limited parental educational background")
        insights["recommendations"].append("Implement family engagement and education programs")
    
    if student_data.test_preparation == "none":
        insights["key_factors"].append("No test preparation completed")
        insights["recommendations"].append("Encourage participation in test preparation programs")
    
    if student_data.gender == "female" and predicted_score < 70:
        insights["key_factors"].append("Female student with performance concerns")
        insights["recommendations"].append("Implement girls' education empowerment initiatives")
    
    # Add general recommendations
    if not insights["recommendations"]:
        insights["recommendations"].append("Continue current educational support")
    
    insights["recommendations"].append("Monitor progress and adjust interventions as needed")
    
    return insights

def get_confidence_level(student_data: StudentData) -> str:
    """
    Determine model confidence level based on input data characteristics.
    
    Args:
        student_data: Student demographic data
        
    Returns:
        Confidence level string
    """
    confidence_score = 0
    
    # Common demographic combinations increase confidence
    if student_data.race_ethnicity in ["group B", "group C", "group D"]:
        confidence_score += 1
    
    if student_data.parental_education in ["some college", "bachelor's degree", "associate's degree"]:
        confidence_score += 1
        
    if student_data.lunch_type == "standard":
        confidence_score += 1
    
    if confidence_score >= 2:
        return "High"
    elif confidence_score == 1:
        return "Medium"
    else:
        return "Low"

# API Endpoints

@app.get("/", response_model=dict)
async def root():
    """Root endpoint with API information."""
    return {
        "message": "Empowering Girls' Education - Student Performance Prediction API",
        "mission": "Empower girls' education through data-driven insights",
        "version": "1.0.0",
        "docs": "/docs",
        "prediction_endpoint": "/predict"
    }

@app.get("/health", response_model=HealthResponse)
async def health_check():
    """Health check endpoint."""
    return HealthResponse(
        status="healthy" if model_artifacts else "unhealthy",
        message="API is running" if model_artifacts else "Model not loaded",
        model_loaded=model_artifacts is not None
    )

@app.post("/predict", response_model=PredictionResponse)
async def predict_performance(student_data: StudentData):
    """
    🎯 **Predict Student Academic Performance**
    
    Predicts overall academic performance based on demographic and socioeconomic factors.
    This endpoint supports educational intervention planning and policy decisions.
    
    **Use Cases:**
    - Identify students who may need additional support
    - Plan targeted educational interventions
    - Support educational equity initiatives
    - Empower girls' education through early identification
    
    **Input Validation:**
    - All fields are required and validated against realistic ranges
    - Gender: male or female
    - Race/ethnicity: group A through E
    - Parental education: from 'some high school' to 'master's degree'
    - Lunch type: standard (higher income) or free/reduced (lower income)
    - Test preparation: none or completed
    
    **Returns:**
    - Predicted overall academic score (0-100)
    - Model confidence level
    - Educational insights and recommendations
    - Model performance information
    """
    
    # Make prediction
    predicted_score = predict_student_performance(student_data)
    
    # Get confidence level
    confidence = get_confidence_level(student_data)
    
    # Generate educational insights
    insights = get_educational_insights(student_data, predicted_score)
    
    # Prepare model info
    model_info = {
        "model_name": model_artifacts['model_name'] if model_artifacts else "Unknown",
        "test_mse": round(model_artifacts['model_performance']['test_mse'], 4) if model_artifacts else None,
        "test_r2": round(model_artifacts['model_performance']['test_r2'], 4) if model_artifacts else None,
        "features_used": model_artifacts['feature_names'] if model_artifacts else []
    }
    
    return PredictionResponse(
        predicted_score=predicted_score,
        confidence_level=confidence,
        model_info=model_info,
        educational_insights=insights
    )

@app.get("/model-info")
async def get_model_info():
    """
    Get detailed information about the trained model.
    """
    if not model_artifacts:
        raise HTTPException(status_code=500, detail="Model not loaded")
    
    return {
        "model_name": model_artifacts['model_name'],
        "performance_metrics": model_artifacts['model_performance'],
        "features": model_artifacts['feature_names'],
        "description": "Machine learning model trained on student performance data to predict academic outcomes",
        "purpose": "Educational intervention planning and girls' education empowerment"
    }

# For local development
if __name__ == "__main__":
    uvicorn.run(
        "prediction:app",
        host="0.0.0.0",
        port=8000,
        reload=True,
        log_level="info"
    )
