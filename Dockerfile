
FROM python:3.10-slim-buster

# Install required packages
RUN apt update && apt upgrade -y
RUN apt install git -y

# Copy requirements.txt to the root directory
COPY requirements.txt /requirements.txt

# Install Python dependencies
RUN pip3 install -U pip && pip3 install -U -r requirements.txt

# Create a directory inside the container
RUN mkdir /Eva

# Set the working directory
WORKDIR /Eva

# Copy start.sh script to the container
COPY start.sh /start.sh

# Copy all files to the /Eva directory inside the container
COPY . .

# Set the command to be executed when the container starts
CMD ["/bin/bash", "/start.sh"]

# Expose port 8080
EXPOSE 8080
