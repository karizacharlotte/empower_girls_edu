// Constants and configuration for the Education Predictor App

class AppConstants {
  // API Configuration
  static const String baseUrl = 'http://localhost:8000'; // Local development
  // static const String baseUrl = 'https://your-api-url.onrender.com'; // Production
  
  // App Colors
  static const primaryColor = 0xFF6B46C1;
  static const secondaryColor = 0xFF9333EA;
  static const accentColor = 0xFFEC4899;
  
  // API Endpoints
  static const String predictEndpoint = '/predict';
  static const String healthEndpoint = '/health';
  
  // App Metadata
  static const String appName = 'Empowering Girls\' Education - ML Predictor';
  static const String appVersion = '1.0.0';
  static const String developer = 'Educational AI Research Team';
  
  // Dataset Information
  static const String datasetSource = 'Student Performance in Exams (Kaggle)';
  static const String datasetSize = '1,000 student records';
  static const String kaggleUrl = 'https://www.kaggle.com/datasets/spscientist/students-performance-in-exams';
  
  // Model Information
  static const List<String> modelTypes = [
    'Linear Regression',
    'Random Forest',
    'Decision Tree'
  ];
  
  // Educational Insights
  static const Map<String, String> educationalInsights = {
    'gender_gap': 'Girls show stronger performance in writing and reading, highlighting opportunities in STEM engagement',
    'socioeconomic_impact': '12.5-point average score gap between economic groups shows need for targeted support',
    'parental_education': 'Strong correlation between parental education and student outcomes across all subjects',
    'test_preparation': '+7.0 point average improvement with test preparation course completion',
  };
  
  // Global Education Statistics
  static const Map<String, String> globalStats = {
    'girls_out_of_school': '129 million girls are out of school globally',
    'literacy_gap': 'Women make up 2/3 of the world\'s 750 million illiterate adults',
    'stem_representation': 'Only 30% of STEM researchers globally are women',
    'leadership_gap': 'Women hold only 25% of senior management positions in education',
  };
}

// Prediction Categories for better UI feedback
enum PredictionCategory {
  excellent,
  good,
  needsSupport,
  criticalIntervention
}

extension PredictionCategoryExtension on PredictionCategory {
  String get displayName {
    switch (this) {
      case PredictionCategory.excellent:
        return 'Excellent Performance';
      case PredictionCategory.good:
        return 'Good Performance';
      case PredictionCategory.needsSupport:
        return 'Needs Support';
      case PredictionCategory.criticalIntervention:
        return 'Critical Intervention Needed';
    }
  }
  
  String get emoji {
    switch (this) {
      case PredictionCategory.excellent:
        return '⭐';
      case PredictionCategory.good:
        return '✅';
      case PredictionCategory.needsSupport:
        return '⚠️';
      case PredictionCategory.criticalIntervention:
        return '🚨';
    }
  }
}

// Helper function to categorize prediction scores
PredictionCategory categorizePrediction(double score) {
  if (score >= 80) return PredictionCategory.excellent;
  if (score >= 70) return PredictionCategory.good;
  if (score >= 60) return PredictionCategory.needsSupport;
  return PredictionCategory.criticalIntervention;
}
