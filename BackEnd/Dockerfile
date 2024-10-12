# Base image for Node.js
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install only production dependencies
RUN npm install --production

# Copy the backend source code
COPY . .

# Expose port 3000 for the backend API
EXPOSE 3000

# Start the backend service
CMD ["node", "app.js"]
