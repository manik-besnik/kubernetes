# Use Ubuntu as the base image
FROM ubuntu:20.04

# Install Node.js and npm
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    && apt-get clean

# Set the working directory
WORKDIR /var/www

# Copy the project files into the container
COPY . /var/www

# Install JS dependencies
RUN npm install

# Expose port 3000 for Node.js
EXPOSE 3000

# Start the Node.js application (example command)
CMD ["npm", "start"]
