# Use Ubuntu as the base image
FROM ubuntu:20.04

# Install Nginx
RUN apt-get update && apt-get install -y nginx && apt-get clean

# Copy Nginx configuration files
COPY ./docker/nginx/ /etc/nginx/

# Expose port 80 for Nginx
EXPOSE 80

# Start Nginx service
CMD ["nginx", "-g", "daemon off;"]
