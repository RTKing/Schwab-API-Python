# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements to the working directory
COPY requirements.txt .

# Install the necessary packages
RUN pip install --no-cache-dir -r requirements.txt

# Install git and clone the Git repository
# RUN apt-get update && \
#     apt-get install -y git && \
#     git clone https://github.com/tylerebowers/Schwab-API-Python.git

# Set the working directory to the cloned repository
WORKDIR /app/Schwab-API-Python

# Copy the content of the repository to the container's working directory
COPY . .

# Install any remaining dependencies
RUN pip install .

# Set environment variables (these will be overridden by the docker run command)
ENV APP_KEY=default_app_key
ENV APP_SECRET=default_app_secret
ENV CALLBACK_URL=https://127.0.0.1

# Command to run the container
CMD ["python3"]
