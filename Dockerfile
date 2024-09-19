# Use the official Python image from the Docker Hub
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements files
COPY requirements.txt requirements-test.txt ./

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application code
COPY . .

# Expose the port that your app runs on
EXPOSE 8080

# Command to run the application
CMD ["gunicorn", "-b", ":8080", "main:app"]
