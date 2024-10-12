# Step 1: Build the React app (if you're using a frontend framework like React)
FROM node:18-alpine as build

# Set working directory in the build container
WORKDIR /app

# Copy the package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the source code and build it
COPY . .
RUN npm run build

# Step 2: Use nginx to serve the static files
FROM nginx:latest

# Remove the default nginx static content
RUN rm -rf /usr/share/nginx/html/*

# Copy the built React app to the Nginx directory
COPY --from=build /app/build /usr/share/nginx/html

# Copy a custom nginx config file (optional)
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
