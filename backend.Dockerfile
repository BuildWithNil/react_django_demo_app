# backend.Dockerfile

# Use official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy backend requirements and install
COPY backend/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy backend code
COPY backend/ /app/

# Expose Django port
EXPOSE 8000

# Run Django development server (or your preferred command)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
