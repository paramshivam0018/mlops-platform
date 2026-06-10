from fastapi import FastAPI
from pydantic import BaseModel
import pickle
import numpy as np

# Initialize the FastAPI app
app = FastAPI(title="Iris Flower Prediction API")

# Load the trained model once when the app starts

with open("model.pkl", "rb") as f:
    model = pickle.load(f)

# Define what input data looks like
class InputData(BaseModel):
    features: list

# Prediction endpoint
@app.post("/predict")
def predict(data: InputData):
    prediction = model.predict([data.features])
    flower_names = {0: "Setosa", 1: "Versicolor", 2: "Virginica"}
    return {
        "prediction": int(prediction[0]),
        "flower": flower_names[int(prediction[0])]
    }

# Health check endpoint
@app.get("/health")
def health():
    return {"status": "ok"}
