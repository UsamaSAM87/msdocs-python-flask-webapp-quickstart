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

# Set the entry point to run the Python script within the virtual environment
CMD ["/app/venv/bin/python", "app.py"]
