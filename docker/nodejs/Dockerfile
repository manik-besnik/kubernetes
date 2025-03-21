# Use the official Node.js image
FROM node:latest

# Set working directory
WORKDIR /var/www

# Copy package.json and package-lock.json
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the frontend assets
RUN npm run build
