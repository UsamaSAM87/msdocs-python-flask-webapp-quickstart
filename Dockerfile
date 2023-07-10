# Use the official Python base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Create and activate a virtual environment
RUN python -m venv venv
ENV PATH="/app/venv/bin:$PATH"
RUN . venv/bin/activate

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code to the working directory
COPY app.py .

# Expose the desired port (replace 5000 with the port your Flask app uses)
EXPOSE 5000

# Set the environment variable to run Flask in production mode
ENV FLASK_ENV=production

# Set the entry point to run the Python script within the virtual environment
CMD ["/app/venv/bin/python3", "app.py"]
