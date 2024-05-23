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

# Set environment variables
ENV PORT=4000

# Expose the application port
EXPOSE 4000

# Command to run the application in development mode
CMD ["npm", "run", "start"]
