# Use an official Python runtime as a parent image.
# Using a slim image for a smaller final size and reduced attack surface.
FROM jupyter/minimal-notebook

# Set the maintainer label for metadata.
LABEL maintainer="hrmuwanika@gmail.com"

# Update the operating system
RUN apt-get update && \
    apt-get upgrade -y
    
# Set a working directory inside the container to store all our project files.
WORKDIR /opt

# Copy the current directory contents into the container at /opt
COPY . .

# Install the required packages listed in the requirements file.
# It's a good practice to include the --no-cache-dir flag to prevent the caching of dependencies
# that aren't necessary for executing the application.
RUN pip install --no-cache-dir -r requirements.txt

# Run jupyter notebook when the container launches
COPY start-notebook.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start-notebook.sh && \
    apt-get clean
CMD ["/usr/local/bin/start-notebook.sh"]
