# Use an official Python runtime as a parent image.
# Using a slim image for a smaller final size and reduced attack surface.
FROM python:3.9-slim

# Set the maintainer label for metadata.
LABEL maintainer="asmtechrw@gmail.com"

# Set a working directory inside the container to store all our project files.
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install the required packages listed in the requirements file.
# It's a good practice to include the --no-cache-dir flag to prevent the caching of dependencies
# that aren't necessary for executing the application.
RUN pip install --no-cache-dir -r requirements.txt

# Run app.py when the container launches
CMD ["python", "./app.py"]
