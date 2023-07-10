# Use the official Python base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code to the working directory
COPY app.py .

# Expose the desired port (replace 5000 with the port your Flask app uses)
EXPOSE 8001

# Set the entry point to run the Flask application
CMD ["python", "app.py"]
