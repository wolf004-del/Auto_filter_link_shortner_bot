
# Use a compatible base image
FROM python:3.10-slim-buster

# Install required packages
RUN apt update && apt upgrade -y && apt install -y git
# Fixed typo in "apt apt update upgrade" to "apt update && apt upgrade"
# Updated the syntax to use "apt update" instead of "apt && update"

# Copy requirements.txt to the root directory
COPY requirements.txt /requirements.txt

# Install Python dependencies
RUN pip install -U pip && pip install -U -r requirements.txt
# Replaced "pip3" with "pip" since the base image uses Python 3.10
# Removed the extra pip install command as it is unnecessary

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
EXPOSE 5222


