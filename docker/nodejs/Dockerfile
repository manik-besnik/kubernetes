# Use the official Node.js image
FROM node:latest

# Set the working directory for the Node.js container
WORKDIR /var/www

# Copy only the necessary files (package.json and package-lock.json)
COPY ./package*.json ./

# Install npm dependencies
RUN npm install

# Copy the rest of the frontend code into the container
COPY ./resources/js/ ./  # Adjust path if your JS code is in a different location

# Expose port for the frontend dev server (assuming Vite or Webpack)
EXPOSE 3000

# Run the development server
CMD ["npm", "run", "dev"]
