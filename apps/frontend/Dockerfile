# Dockerfile for frontend development

# Use the Node.js image as the base
ARG FRONTEND_TAG
FROM node:${FRONTEND_TAG}

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files to the working directory
COPY . .

# Install Angular CLI globally
RUN npm install -g @angular/cli

# Expose the application port
EXPOSE 4200

# Add healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 CMD curl --fail http://localhost:4200 || exit 1

# Command to run the application in development mode
CMD ["ng", "serve", "--host", "0.0.0.0"]
