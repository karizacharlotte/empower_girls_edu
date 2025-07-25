# Education Predictor - Empowering Girls' Education 👩‍🎓

A comprehensive Flutter mobile application that uses machine learning to predict student performance and identify educational intervention opportunities, with a special focus on empowering girls' education globally.

## 🎯 Mission

This application leverages artificial intelligence to predict educational outcomes and identify key factors that influence girls' academic performance. While our dataset originates from a non-African context, the educational challenges it addresses—particularly gender-based performance gaps and socioeconomic barriers—are universally relevant for girls' educational empowerment worldwide.

## ✨ Features

### 📱 Multi-Page Application
- **Home Page**: Beautiful landing page with mission statement and navigation
- **Prediction Page**: Comprehensive form for student data input and ML predictions
- **About Page**: Detailed mission, dataset information, and global context
- **Insights Page**: Educational insights and model performance data

### 🤖 AI-Powered Predictions
- **Multiple ML Models**: Linear Regression, Random Forest, Decision Tree
- **Real-time Predictions**: Instant performance predictions with confidence scores
- **Smart Recommendations**: Personalized intervention suggestions
- **Visual Feedback**: Color-coded results with intuitive indicators

### 🌍 Global Education Focus
- **Girls' Empowerment**: Special focus on identifying barriers for girls' education
- **Universal Relevance**: Insights applicable to global educational contexts
- **Evidence-Based**: Data-driven recommendations for educational interventions
- **Cultural Sensitivity**: Recognition of diverse educational contexts

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.7.2 or higher
- Dart SDK 3.0.0 or higher
- Android Studio / VS Code with Flutter extensions
- Web browser (for web deployment) or mobile device/emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd education_predictor
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   # For web (recommended for demo)
   flutter run -d chrome
   
   # For mobile
   flutter run
   ```

## 📱 App Structure

```
lib/
├── main.dart                 # Main app entry point with all pages
├── models/
│   └── app_models.dart      # Data models and structures
└── utils/
    └── constants.dart       # App constants and configuration
```

## 🎨 Design Principles

### Visual Design
- **Modern UI**: Material Design 3 with gradient backgrounds
- **Accessibility**: High contrast colors and readable fonts
- **Consistency**: Unified color scheme and component design
- **Intuitive Navigation**: Clear visual hierarchy and user flow

### User Experience
- **Predictive Flow**: Guided user journey from input to insights
- **Educational Context**: Clear mission and purpose communication
- **Actionable Results**: Specific recommendations for intervention
- **Global Perspective**: Inclusive design for diverse users

## 🌟 Educational Impact

### Intervention Support
- **Early Identification**: Predict at-risk students before failure
- **Targeted Programs**: Specific recommendations for different student profiles
- **Resource Allocation**: Data-driven budget and program planning
- **Policy Development**: Evidence-based educational policy recommendations

### Girls' Empowerment Focus
- **STEM Engagement**: Identify opportunities for girls in science and math
- **Leadership Development**: Recommendations for leadership programs
- **Barrier Identification**: Highlight systemic barriers to girls' education
- **Mentorship Programs**: Suggest peer and adult mentoring opportunities

## 📊 Dataset & Models

### Data Source
- **Origin**: Student Performance in Exams (Kaggle)
- **Size**: 1,000 student records
- **Features**: Gender, race/ethnicity, parental education, lunch type, test preparation
- **Target**: Overall academic performance prediction

### Machine Learning Models
1. **Linear Regression**: 18.2% R² score - Best overall performance
2. **Random Forest**: 15.1% R² score - Good ensemble performance
3. **Decision Tree**: 12.8% R² score - Interpretable results

---

**Built with ❤️ for girls' education empowerment globally**
