# Use official Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy files
COPY . .

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN python -m nltk.downloader punkt wordnet omw-1.4

# Expose the port Flask will run on
EXPOSE 8080

# Run Flask app with Gunicorn
CMD ["gunicorn", "-bind", "0.0.0.0:8080", "app:app"]
