# Dockerfile for frontend
FROM node:20.13.1-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files to the working directory
COPY . .

# Build the application with SSR (Server-Side Rendering)
RUN npm run build:ssr

# Set environment variables
ENV PORT=4000

# Expose the application port
EXPOSE 4000

# Command to run the application
CMD ["npm", "run", "serve:ssr:frontend"]
