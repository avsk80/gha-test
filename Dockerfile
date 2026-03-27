# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies first (for better Docker caching)
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY src/ ./src/


# Make port 8080 available to the world outside this container, if applicable
EXPOSE 8080

# Run the application when the container launches
# Run it using the path
CMD ["python", "src/main.py"]