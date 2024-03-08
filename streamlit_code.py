import streamlit as st
import joblib
import numpy as np
import pandas as pd
import seaborn as sns


# Function to make predictions
def make_prediction(loaded_model, scaler, features):
    # Transform input features using the fitted scaler
    scaled_features = scaler.transform(features)

    # Make prediction using the loaded model
    prediction = loaded_model.predict(scaled_features)
    return prediction

def main():
    st.title('Prediction App')

    # Load the trained model and scaler from the pickle files
    model_file_path = 'D:/Project/naive_bayes_model.pkl'
    scaler_file_path = 'D:/Project/scaler.pkl'

    loaded_model = joblib.load(model_file_path)
    scaler = joblib.load(scaler_file_path)  # Load the scaler


# Function to make predictions
def make_prediction(loaded_model, features, user, pw, db, uploaded_file):
    result = None  # Initialize result variable

    if features is not None:
        # Perform any required data preprocessing on the input features
        # In this example, assuming the features are already preprocessed
        
        # Convert features to a NumPy array
        input_features = np.array(features).reshape(1, -1)
        
        # Make prediction using the loaded model
        prediction = loaded_model.predict(input_features)
        return prediction

    elif uploaded_file is not None:
        try:
            data = pd.read_csv(uploaded_file)
        except:
            try:
                data = pd.read_excel(uploaded_file)
            except:
                data = pd.DataFrame()
        
        # Perform database prediction logic using user, pw, db, and data
        # result = your_database_prediction_function(user, pw, db, data)
        
        # Assign a value to result based on your database prediction logic
        result = "Your database prediction result"  

    return result


def main():
    st.title('Prediction App')

    # Load the trained model from the pickle file
    model_file_path = 'D:/neural_network_trained_model.pkl'
    loaded_model = joblib.load(model_file_path)

    # Sidebar to take input from the user
    st.sidebar.title('Enter Input Features')
    # Assuming three input features
    feature1 = st.sidebar.slider('Temperature', 0.0, 100.0, 50.0)
    feature2 = st.sidebar.slider('Humidity', 0.0, 100.0, 50.0)
    feature3 = st.sidebar.slider('Pressure', 0.0, 100.0, 50.0)

    user_features = [feature1, feature2, feature3]

    # Display user inputs
    st.write('### User Input Features')
    st.write('Temperature: ', feature1)
    st.write('Humidity: ', feature2)
    st.write('Pressure: ', feature3)

    # Sidebar inputs for database credentials and file upload
    uploaded_file = st.sidebar.file_uploader("Choose a file", type=['csv', 'xlsx'], accept_multiple_files=False, key="fileUploader")
    user = st.sidebar.text_input("user", "")
    pw = st.sidebar.text_input("password", "", type="password")
    db = st.sidebar.text_input("database", "")

    # Predict on user input when a button is clicked
    if st.button('Predict'):
        prediction = make_prediction(loaded_model, user_features, user, pw, db, uploaded_file)
        if isinstance(prediction, np.ndarray):
            st.success(f'Prediction: {prediction[0]}')
        else:
            st.write("Prediction result is not available.")

if __name__ == '__main__':
    main()
