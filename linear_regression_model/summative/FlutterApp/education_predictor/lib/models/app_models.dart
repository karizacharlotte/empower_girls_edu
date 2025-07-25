// Data models for the Education Predictor App

class StudentProfile {
  final String gender;
  final String raceEthnicity;
  final String parentalEducation;
  final String lunchType;
  final String testPreparation;

  StudentProfile({
    required this.gender,
    required this.raceEthnicity,
    required this.parentalEducation,
    required this.lunchType,
    required this.testPreparation,
  });

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'race_ethnicity': raceEthnicity,
      'parental_education': parentalEducation,
      'lunch_type': lunchType,
      'test_preparation': testPreparation,
    };
  }
}

class PredictionResult {
  final double predictedScore;
  final double confidence;
  final String modelUsed;
  final List<String> recommendations;
  final DateTime timestamp;

  PredictionResult({
    required this.predictedScore,
    required this.confidence,
    required this.modelUsed,
    required this.recommendations,
    required this.timestamp,
  });

  factory PredictionResult.fromJson(Map<String, dynamic> json) {
    return PredictionResult(
      predictedScore: double.parse(json['predicted_score'].toString()),
      confidence: double.parse(json['confidence'].toString()),
      modelUsed: json['model_used'] ?? 'Linear Regression',
      recommendations: List<String>.from(json['recommendations'] ?? []),
      timestamp: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'predicted_score': predictedScore,
      'confidence': confidence,
      'model_used': modelUsed,
      'recommendations': recommendations,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

class EducationalInsight {
  final String title;
  final String description;
  final String category;
  final double impact;
  final List<String> keyPoints;

  EducationalInsight({
    required this.title,
    required this.description,
    required this.category,
    required this.impact,
    required this.keyPoints,
  });
}

class ModelPerformance {
  final String modelName;
  final double accuracy;
  final double r2Score;
  final String description;

  ModelPerformance({
    required this.modelName,
    required this.accuracy,
    required this.r2Score,
    required this.description,
  });
}

// Global education data structure
class GlobalEducationStat {
  final String title;
  final String value;
  final String description;
  final String source;

  GlobalEducationStat({
    required this.title,
    required this.value,
    required this.description,
    required this.source,
  });
}
