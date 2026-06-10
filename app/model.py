from sklearn.datasets import load_iris
from sklearn.ensemble import RandomForestClassifier
import pickle

def train_model():
    # Load the iris dataset
    iris = load_iris()
    X, y = iris.data, iris.target

    # Train a simple Random Forest model
    model = RandomForestClassifier(n_estimators=100, random_state=42)
    model.fit(X, y)

    # Save the trained model to a file
    with open("app/model.pkl", "wb") as f:
        pickle.dump(model, f)

    print("Model trained and saved as model.pkl")

if __name__ == "__main__":
    train_model()
