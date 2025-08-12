# frontend.Dockerfile

# Use official node image
FROM node:18-alpine

WORKDIR /app

# Copy frontend files
COPY frontend/package.json frontend/package-lock.json /app/

# Install frontend dependencies
RUN npm install

# Copy the rest of frontend source code
COPY frontend/ /app/

# Build the React app for production
RUN npm run build

# Use a lightweight server to serve static files
FROM nginx:stable-alpine

# Copy build files to nginx html directory
COPY --from=0 /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Run nginx server
CMD ["nginx", "-g", "daemon off;"]
