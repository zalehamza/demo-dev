# Use the official Node.js image as a base image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the application code to the container
COPY . .

# Expose the application on port 3000
EXPOSE 3000

# Run the application
CMD ["node", "index.js"]
