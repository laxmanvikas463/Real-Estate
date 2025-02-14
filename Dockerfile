# Use a specific Python version instead of the latest (this avoids unnecessary rebuilds)
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install dependencies first to leverage caching
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your application
COPY . .

# Set the correct environment variable for Flask
ENV FLASK_APP=app.py

# Install Gunicorn
RUN pip install gunicorn

# Expose the app port
EXPOSE 8080

# Command to run the Flask app
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
