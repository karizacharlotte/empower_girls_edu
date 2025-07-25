# Empowering Girls' Education Through Data-Driven Insights

## Mission and Problem Description
Our mission is to empower girls' education globally by developing predictive models that identify educational barriers and intervention opportunities. This project addresses the critical challenge of educational gender gaps by analyzing socioeconomic and demographic factors that influence girls' academic performance and dropout rates. By understanding these patterns through data science, we aim to provide actionable insights that enable policymakers, educators, and NGOs to implement targeted interventions that support girls' educational success in underserved communities worldwide. The model serves as a tool for educational equity, helping stakeholders allocate limited resources where they can have the maximum transformative impact on girls' educational outcomes and long-term empowerment.

## Dataset Description and Source
**Dataset**: Student Performance in Exams
**Source**: Kaggle - [Students Performance in Exams Dataset](https://www.kaggle.com/datasets/spscientist/students-performance-in-exams)
**Original Context**: Marks secured by students in high school from the United States
**Geographic Context**: While this dataset originates from a non-African context, the educational challenges it addresses—particularly gender-based performance gaps and socioeconomic barriers to education—are globally relevant and especially critical in empowering girls' education worldwide.

**Dataset Justification**: This dataset was specifically chosen because:
- **Universal Relevance**: Educational gender disparities exist globally, making insights applicable across geographical boundaries
- **Socioeconomic Focus**: The lunch program indicator (free/reduced vs. standard) mirrors economic challenges faced by students in underserved communities worldwide
- **Intervention Opportunities**: Parental education and test preparation factors provide actionable intervention points for educational policy
- **Girls' Empowerment Alignment**: Gender-based analysis directly supports our mission of empowering girls' education

**Description**: This dataset contains 1000 student records with demographic and socioeconomic factors including gender, race/ethnicity, parental education level, lunch type (economic indicator), test preparation course completion, and academic scores in math, reading, and writing. The dataset is particularly rich for analyzing gender-based educational disparities and the impact of socioeconomic factors on academic achievement. It enables us to predict student performance and identify intervention points to support girls' educational success through targeted educational interventions and policy recommendations.

## Project Structure
```
linear_regression_model/
│
├── summative/
│   ├── linear_regression/
│   │   ├── multivariate.ipynb
│   ├── API/
│   │   ├── prediction.py
│   │   ├── requirements.txt
│   ├── FlutterApp/
```

## API Endpoint
🚀 **Live API**: [Will be updated after deployment]
📋 **Swagger Documentation**: [Will be updated after deployment]/docs

*Note: The API will be deployed to Render.com with public access for testing and demonstration.*

## Video Demo
🎥 **YouTube Demo**: [Will be updated with 5-minute demo video]

*The demo video will showcase:*
- Mobile app making predictions
- Swagger UI API testing
- Model performance explanation
- Educational insights and recommendations

## How to Run the Mobile App

### Prerequisites
- Flutter SDK (3.7.2 or higher)
- Android Studio or VS Code with Flutter extensions
- Android device/emulator or iOS device/simulator

### Installation Steps
1. **Clone the repository**
   ```bash
   git clone https://github.com/karizacharlotte/empower_girls_edu.git
   cd empower_girls_edu/linear_regression_model/summative/FlutterApp/education_predictor
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Update API URL**
   - Open `lib/main.dart`
   - Update the `baseUrl` constant with the deployed API URL

4. **Run the app**
   ```bash
   flutter run
   ```

### App Features
- **Home Page**: Introduction to the education empowerment mission
- **Prediction Page**: Input student data and get performance predictions
- **About Page**: Information about the project and methodology
- **Real-time API Integration**: Live predictions from the deployed ML model

### Input Fields Required
The app includes 5 input fields matching the ML model requirements:
1. **Gender**: Male or Female
2. **Race/Ethnicity**: Group A through E
3. **Parental Education**: From 'some high school' to 'master's degree'
4. **Lunch Type**: Standard or Free/Reduced (economic indicator)
5. **Test Preparation**: None or Completed

The app validates all inputs and provides educational insights with each prediction.
