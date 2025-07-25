#!/bin/bash

echo "🔍 FINAL NOTEBOOK VERIFICATION"
echo "=" * 50

echo "Checking if all required cells have been executed..."

# Use Python to check notebook execution
/home/kariza/Desktop/empower_girls_edu/education_env/bin/python -c "
import json
import sys

try:
    # Load notebook
    with open('linear_regression_model/summative/linear_regression/multivariate.ipynb', 'r') as f:
        notebook = json.load(f)
    
    print('✅ Notebook loaded successfully')
    
    code_cells = []
    executed_cells = []
    
    for i, cell in enumerate(notebook['cells']):
        if cell['cell_type'] == 'code':
            code_cells.append(i + 1)
            if 'execution_count' in cell and cell['execution_count'] is not None:
                executed_cells.append((i + 1, cell['execution_count']))
    
    print(f'📊 Total code cells: {len(code_cells)}')
    print(f'📊 Executed cells: {len(executed_cells)}')
    
    if len(executed_cells) == len(code_cells):
        print('✅ All code cells have been executed')
    else:
        unexecuted = len(code_cells) - len(executed_cells)
        print(f'⚠️  {unexecuted} code cells have not been executed')
    
    # Check execution order
    execution_order = [exec_count for _, exec_count in executed_cells]
    if execution_order == sorted(execution_order):
        print('✅ Cells executed in order')
    else:
        print('⚠️  Cells executed out of order - this is normal for development')
    
    # Check for any cells with errors
    error_cells = []
    for i, cell in enumerate(notebook['cells']):
        if cell['cell_type'] == 'code' and 'outputs' in cell:
            for output in cell['outputs']:
                if output.get('output_type') == 'error':
                    error_cells.append(i + 1)
    
    if error_cells:
        print(f'❌ Cells with errors: {error_cells}')
    else:
        print('✅ No cells with errors found')
    
    print('')
    print('🎯 Key variables that should exist:')
    required_vars = ['df', 'best_model', 'model_artifacts', 'X_train', 'X_test', 'y_train', 'y_test']
    print(f'   Expected: {required_vars}')
    
except Exception as e:
    print(f'❌ Error checking notebook: {e}')
    sys.exit(1)
"

echo ""
echo "Checking model artifacts content..."
/home/kariza/Desktop/empower_girls_edu/education_env/bin/python -c "
import joblib

try:
    artifacts = joblib.load('linear_regression_model/best_model_artifacts.pkl')
    print('✅ Model artifacts loaded')
    print(f'   Model: {artifacts[\"model_name\"]}')
    print(f'   Features: {artifacts[\"feature_names\"]}')
    print(f'   Performance: {artifacts[\"model_performance\"]}')
    
    # Test prediction function
    print('')
    print('Testing prediction function...')
    model = artifacts['model']
    feature_scaler = artifacts['feature_scaler']
    target_scaler = artifacts['target_scaler']
    label_encoders = artifacts['label_encoders']
    
    # Create test input
    test_input = {
        'gender': 'female',
        'race/ethnicity': 'group C',
        'parental level of education': 'bachelor\\'s degree',
        'lunch': 'standard', 
        'test preparation course': 'completed'
    }
    
    print(f'   Test input: {test_input}')
    print('✅ Prediction function components accessible')
    
except Exception as e:
    print(f'❌ Error with model artifacts: {e}')
"

echo ""
echo "🎯 FINAL VERIFICATION COMPLETE"
echo "=" * 50
