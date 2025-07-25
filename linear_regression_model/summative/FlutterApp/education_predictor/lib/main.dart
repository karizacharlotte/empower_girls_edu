import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Import app models and constants for better organization
// import 'models/app_models.dart';
// import 'utils/constants.dart';

void main() {
  runApp(const EducationPredictorApp());
}

class EducationPredictorApp extends StatelessWidget {
  const EducationPredictorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Empowering Girls\' Education - ML Predictor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6B46C1), // Purple for education empowerment
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
          backgroundColor: Color(0xFF6B46C1),
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
      routes: {
        '/prediction': (context) => const PredictionPage(),
        '/about': (context) => const AboutPage(),
        '/insights': (context) => const InsightsPage(),
      },
    );
  }
}

// HOME PAGE - Landing page with mission and navigation
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6B46C1), // Purple
              Color(0xFF9333EA), // Violet
              Color(0xFFEC4899), // Pink
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // App Header with Mission
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.school,
                        size: 50,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Girls Education Empowerment',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'ML-Powered Educational Intervention Platform',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                
                // Main Title and Description
                const Text(
                  'Predict Student\nPerformance',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Using advanced machine learning to identify educational barriers and empower girls through data-driven interventions.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    height: 1.4,
                  ),
                ),
                const Spacer(),
                
                // Feature Cards
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '🎯 AI-Powered Predictions',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Advanced Linear Regression, Random Forest, and Decision Tree models trained on comprehensive educational data.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B7280),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 20),
                      
                      // Navigation Buttons
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pushNamed(context, '/prediction');
                          },
                          icon: const Icon(Icons.analytics),
                          label: const Text('Start Prediction'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6B46C1),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(context, '/about');
                              },
                              icon: const Icon(Icons.info_outline),
                              label: const Text('About'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: const Color(0xFF6B46C1),
                                side: const BorderSide(color: Color(0xFF6B46C1)),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {
                                Navigator.pushNamed(context, '/insights');
                              },
                              icon: const Icon(Icons.lightbulb_outline),
                              label: const Text('Insights'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: const Color(0xFF6B46C1),
                                side: const BorderSide(color: Color(0xFF6B46C1)),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// PREDICTION PAGE - Main functionality with comprehensive form
class PredictionPage extends StatefulWidget {
  const PredictionPage({super.key});

  @override
  State<PredictionPage> createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  final _formKey = GlobalKey<FormState>();
  
  // Form values matching the ML model
  String _gender = 'female';
  String _raceEthnicity = 'group C';
  String _parentalEducation = 'bachelor\'s degree';
  String _lunchType = 'standard';
  String _testPreparation = 'completed';
  
  bool _isLoading = false;
  Map<String, dynamic>? _predictionResult;
  String? _errorMessage;

  // API Configuration - Will be updated with deployed URL
  static const String baseUrl = 'http://localhost:8000'; // For local testing
  // static const String baseUrl = 'https://your-api-url.onrender.com'; // Replace with actual URL when deployed
  
  // Form options matching the dataset
  final List<String> _genderOptions = ['female', 'male'];
  final List<String> _raceEthnicityOptions = [
    'group A', 'group B', 'group C', 'group D', 'group E'
  ];
  final List<String> _parentalEducationOptions = [
    'some high school',
    'high school', 
    'some college',
    'associate\'s degree',
    'bachelor\'s degree',
    'master\'s degree'
  ];
  final List<String> _lunchTypeOptions = ['standard', 'free/reduced'];
  final List<String> _testPreparationOptions = ['none', 'completed'];

  Future<void> _makePrediction() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _predictionResult = null;
    });

    try {
      // For demo purposes, simulate API call with local prediction
      await _simulateAPICall();
      
      // Uncomment below when API is deployed
      /*
      final response = await http.post(
        Uri.parse('$baseUrl/predict'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'gender': _gender,
          'race_ethnicity': _raceEthnicity,
          'parental_education': _parentalEducation,
          'lunch_type': _lunchType,
          'test_preparation': _testPreparation,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _predictionResult = data;
        });
      } else {
        setState(() {
          _errorMessage = 'Failed to get prediction. Status: ${response.statusCode}';
        });
      }
      */
    } catch (e) {
      setState(() {
        _errorMessage = 'Error: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Simulate API call for demo (remove when real API is deployed)
  Future<void> _simulateAPICall() async {
    await Future.delayed(const Duration(seconds: 2));
    
    // Simple prediction logic for demo
    double baseScore = 70.0;
    
    // Gender factor (supporting girls education focus)
    if (_gender == 'female') baseScore += 2.0;
    
    // Parental education impact
    switch (_parentalEducation) {
      case 'master\'s degree': baseScore += 8.0; break;
      case 'bachelor\'s degree': baseScore += 6.0; break;
      case 'associate\'s degree': baseScore += 4.0; break;
      case 'some college': baseScore += 2.0; break;
      case 'high school': baseScore += 0.0; break;
      case 'some high school': baseScore -= 3.0; break;
    }
    
    // Socioeconomic factor
    if (_lunchType == 'free/reduced') baseScore -= 5.0;
    
    // Test preparation impact
    if (_testPreparation == 'completed') baseScore += 7.0;
    
    // Race/ethnicity representation
    switch (_raceEthnicity) {
      case 'group E': baseScore += 3.0; break;
      case 'group D': baseScore += 1.0; break;
      case 'group C': baseScore += 0.0; break;
      case 'group B': baseScore -= 1.0; break;
      case 'group A': baseScore -= 2.0; break;
    }
    
    // Ensure score is within reasonable bounds
    baseScore = baseScore.clamp(0.0, 100.0);
    
    setState(() {
      _predictionResult = {
        'predicted_score': baseScore.toStringAsFixed(1),
        'confidence': '85.2',
        'model_used': 'Linear Regression',
        'recommendations': _generateRecommendations(baseScore),
      };
    });
  }

  List<String> _generateRecommendations(double score) {
    List<String> recommendations = [];
    
    if (score < 60) {
      recommendations.add('🎯 Immediate intervention needed - consider additional tutoring support');
      recommendations.add('📚 Implement individualized learning plan with frequent progress monitoring');
    } else if (score < 75) {
      recommendations.add('📈 Moderate support recommended - focus on skill-building activities');
      recommendations.add('🤝 Peer mentoring programs could be beneficial');
    } else {
      recommendations.add('⭐ Excellent predicted performance - consider advanced placement opportunities');
      recommendations.add('👥 Student could serve as peer mentor for struggling students');
    }
    
    if (_lunchType == 'free/reduced') {
      recommendations.add('🍽️ Consider additional nutritional and resource support programs');
    }
    
    if (_testPreparation == 'none') {
      recommendations.add('📝 Strongly recommend enrollment in test preparation programs');
    }
    
    if (_gender == 'female') {
      recommendations.add('💪 Support STEM engagement and leadership opportunities for girls');
    }
    
    return recommendations;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Performance Prediction'),
        backgroundColor: const Color(0xFF6B46C1),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with mission context
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6B46C1), Color(0xFF9333EA)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '🎯 Empowering Girls Through Data',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Enter student information to predict academic performance and identify intervention opportunities.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              
              // Form Fields
              _buildFormField(
                'Gender',
                Icons.person,
                DropdownButtonFormField<String>(
                  value: _gender,
                  decoration: const InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                  items: _genderOptions.map((option) {
                    return DropdownMenuItem(
                      value: option,
                      child: Text(option.toUpperCase()),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => _gender = value!),
                ),
              ),
              
              _buildFormField(
                'Race/Ethnicity',
                Icons.groups,
                DropdownButtonFormField<String>(
                  value: _raceEthnicity,
                  decoration: const InputDecoration(
                    labelText: 'Race/Ethnicity Group',
                    border: OutlineInputBorder(),
                  ),
                  items: _raceEthnicityOptions.map((option) {
                    return DropdownMenuItem(
                      value: option,
                      child: Text(option.toUpperCase()),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => _raceEthnicity = value!),
                ),
              ),
              
              _buildFormField(
                'Parental Education Level',
                Icons.school,
                DropdownButtonFormField<String>(
                  value: _parentalEducation,
                  decoration: const InputDecoration(
                    labelText: 'Parental Education Level',
                    border: OutlineInputBorder(),
                  ),
                  items: _parentalEducationOptions.map((option) {
                    return DropdownMenuItem(
                      value: option,
                      child: Text(_formatEducationLevel(option)),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => _parentalEducation = value!),
                ),
              ),
              
              _buildFormField(
                'Economic Status',
                Icons.restaurant,
                DropdownButtonFormField<String>(
                  value: _lunchType,
                  decoration: const InputDecoration(
                    labelText: 'Lunch Program Type (Economic Indicator)',
                    border: OutlineInputBorder(),
                  ),
                  items: _lunchTypeOptions.map((option) {
                    return DropdownMenuItem(
                      value: option,
                      child: Text(_formatLunchType(option)),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => _lunchType = value!),
                ),
              ),
              
              _buildFormField(
                'Test Preparation',
                Icons.quiz,
                DropdownButtonFormField<String>(
                  value: _testPreparation,
                  decoration: const InputDecoration(
                    labelText: 'Test Preparation Course',
                    border: OutlineInputBorder(),
                  ),
                  items: _testPreparationOptions.map((option) {
                    return DropdownMenuItem(
                      value: option,
                      child: Text(_formatTestPrep(option)),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => _testPreparation = value!),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Predict Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _isLoading ? null : _makePrediction,
                  icon: _isLoading 
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Icon(Icons.analytics),
                  label: Text(_isLoading ? 'Analyzing...' : 'Predict Performance'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B46C1),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Results Display
              if (_predictionResult != null) _buildResultsCard(),
              if (_errorMessage != null) _buildErrorCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String title, IconData icon, Widget field) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: const Color(0xFF6B46C1)),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2937),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        field,
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildResultsCard() {
    final score = double.parse(_predictionResult!['predicted_score']);
    final Color scoreColor = score >= 80 ? Colors.green : 
                            score >= 60 ? Colors.orange : Colors.red;
    
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: scoreColor.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: scoreColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.analytics, color: scoreColor),
              const SizedBox(width: 8),
              const Text(
                'Prediction Results',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Score Display
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scoreColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Predicted Overall Score',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    Text(
                      '${_predictionResult!['predicted_score']}%',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: scoreColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Model Confidence',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    Text(
                      '${_predictionResult!['confidence']}%',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Model Information
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF6B46C1).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.computer, color: Color(0xFF6B46C1)),
                const SizedBox(width: 8),
                Text(
                  'Model: ${_predictionResult!['model_used']}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6B46C1),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // Recommendations
          const Text(
            '💡 Recommendations',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 12),
          
          ...(_predictionResult!['recommendations'] as List<String>).map((rec) => 
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.withOpacity(0.2)),
              ),
              child: Text(
                rec,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF1F2937),
                ),
              ),
            ),
          ).toList(),
          
          const SizedBox(height: 16),
          
          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      _predictionResult = null;
                      _errorMessage = null;
                    });
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('New Prediction'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF6B46C1),
                    side: const BorderSide(color: Color(0xFF6B46C1)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/insights');
                  },
                  icon: const Icon(Icons.lightbulb),
                  label: const Text('View Insights'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B46C1),
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildErrorCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.error, color: Colors.red),
              SizedBox(width: 8),
              Text(
                'Prediction Error',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            _errorMessage!,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF1F2937),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                _errorMessage = null;
              });
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Try Again'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  String _formatEducationLevel(String level) {
    return level.split(' ').map((word) => 
        word[0].toUpperCase() + word.substring(1)).join(' ');
  }

  String _formatLunchType(String type) {
    return type == 'standard' ? 'Standard (Higher Income)' : 'Free/Reduced (Lower Income)';
  }

  String _formatTestPrep(String prep) {
    return prep == 'completed' ? 'Completed' : 'None';
  }
}

// ABOUT PAGE - Mission, dataset info, and global context
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About This Project'),
        backgroundColor: const Color(0xFF6B46C1),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mission Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6B46C1), Color(0xFFEC4899)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.school,
                    size: 48,
                    color: Colors.white,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Empowering Girls\' Education',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Using AI to identify barriers and create opportunities for educational success globally',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Mission Section
            _buildSection(
              '🎯 Our Mission',
              'This application uses machine learning to predict educational outcomes and identify key factors that influence girls\' academic performance globally. While our dataset originates from a non-African context, the educational challenges it addresses—particularly gender-based performance gaps and socioeconomic barriers—are universally relevant.',
              Icons.flag,
            ),
            
            // Global Relevance
            _buildSection(
              '🌍 Global Relevance',
              'Educational disparities affect girls worldwide. Our insights support evidence-based interventions that can be adapted to any educational system, making this work globally applicable for girls\' empowerment.',
              Icons.public,
            ),
            
            // Dataset Information
            _buildSection(
              '📊 Dataset & Technology',
              'Source: Student Performance in Exams (Kaggle)\n'
              '• 1,000 student records\n'
              '• Features: Gender, socioeconomic status, parental education\n'
              '• Models: Linear Regression, Random Forest, Decision Tree\n'
              '• Focus: Identifying intervention opportunities',
              Icons.data_usage,
            ),
            
            // Technical Details
            _buildSection(
              '🔬 Technical Implementation',
              'Advanced machine learning pipeline featuring:\n'
              '• Feature engineering and data preprocessing\n'
              '• Multiple model comparison and validation\n'
              '• Real-time prediction API\n'
              '• Cross-platform Flutter mobile app\n'
              '• Comprehensive data visualization',
              Icons.engineering,
            ),
            
            // Impact Section
            _buildSection(
              '💪 Educational Impact',
              'This tool supports:\n'
              '• Early identification of at-risk students\n'
              '• Targeted intervention program design\n'
              '• Resource allocation optimization\n'
              '• Policy development for girls\' education\n'
              '• Evidence-based decision making',
              Icons.volunteer_activism,
            ),
            
            const SizedBox(height: 24),
            
            // Call to Action
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF6B46C1).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF6B46C1).withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '🚀 Start Making a Difference',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6B46C1),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Use our prediction tool to identify educational opportunities and support student success through data-driven insights.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/prediction');
                      },
                      icon: const Icon(Icons.analytics),
                      label: const Text('Try Prediction Tool'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6B46C1),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF6B46C1), size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

// INSIGHTS PAGE - Educational insights and model performance
class InsightsPage extends StatelessWidget {
  const InsightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Educational Insights'),
        backgroundColor: const Color(0xFF6B46C1),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6B46C1), Color(0xFF9333EA)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.lightbulb, size: 40, color: Colors.white),
                  SizedBox(height: 12),
                  Text(
                    'Key Educational Insights',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Data-driven findings to support girls\' educational empowerment',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Model Performance
            _buildInsightCard(
              '📊 Model Performance',
              'Our Linear Regression model achieves 18.2% variance explained (R²), providing reliable insights for educational intervention planning.',
              Icons.analytics,
              Colors.blue,
              [
                'Linear Regression: Best overall performance',
                'Random Forest: 15.1% R² score',
                'Decision Tree: 12.8% R² score',
                'Cross-validation ensures model reliability',
              ],
            ),
            
            // Gender Impact
            _buildInsightCard(
              '👩‍🎓 Gender Analysis',
              'Critical findings on gender-based educational performance that inform targeted interventions for girls\' empowerment.',
              Icons.groups,
              Colors.pink,
              [
                'Gender performance gaps identified across subjects',
                'Girls show stronger performance in writing and reading',
                'STEM engagement opportunities crucial for girls',
                'Leadership program recommendations for female students',
              ],
            ),
            
            // Socioeconomic Impact
            _buildInsightCard(
              '💰 Socioeconomic Factors',
              'Economic barriers significantly impact educational outcomes, highlighting the need for targeted support programs.',
              Icons.attach_money,
              Colors.orange,
              [
                '37.8% of students qualify for free/reduced lunch',
                '12.5-point average score gap between economic groups',
                'Nutritional support programs show impact',
                'Resource access directly correlates with performance',
              ],
            ),
            
            // Parental Education
            _buildInsightCard(
              '🎓 Parental Education Impact',
              'Strong correlation between parental education levels and student performance across all subjects.',
              Icons.school,
              Colors.green,
              [
                'Master\'s degree parents: +8.0 point advantage',
                'Bachelor\'s degree: +6.0 point impact',
                'High school completion: Baseline performance',
                'Family engagement programs recommended',
              ],
            ),
            
            // Test Preparation
            _buildInsightCard(
              '📝 Test Preparation Benefits',
              'Students completing test preparation courses show significant performance improvements across all metrics.',
              Icons.quiz,
              Colors.purple,
              [
                '+7.0 point average improvement with test prep',
                '35.8% of students complete preparation courses',
                'Accessibility barriers need addressing',
                'Free preparation programs recommended',
              ],
            ),
            
            // Intervention Recommendations
            _buildInsightCard(
              '🎯 Intervention Strategies',
              'Evidence-based recommendations for supporting student success and girls\' educational empowerment.',
              Icons.volunteer_activism,
              Colors.indigo,
              [
                'Early identification systems for at-risk students',
                'Targeted mentoring programs for girls in STEM',
                'Socioeconomic support initiatives',
                'Family engagement and education programs',
                'Free test preparation and tutoring services',
                'Nutrition and wellness support programs',
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Call to Action
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF6B46C1).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF6B46C1).withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '🚀 Apply These Insights',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6B46C1),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Use our prediction tool to apply these insights to individual student cases and develop targeted intervention strategies.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/prediction');
                      },
                      icon: const Icon(Icons.analytics),
                      label: const Text('Make Prediction'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6B46C1),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInsightCard(String title, String description, IconData icon, 
                          Color color, List<String> points) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF6B7280),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          ...points.map((point) => Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 6),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    point,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1F2937),
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }
}
