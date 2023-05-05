# Use an official Node.js runtime as a parent image
FROM node:20

# Set the working directory to /app
WORKDIR /app

# Copy the client package.json file to the working directory
COPY ./client/package*.json ./client/

# Copy the server package.json file to the working directory
COPY ./server/package*.json ./server/

# Install any needed packages specified in the client package.json file
WORKDIR /app/client
RUN npm install

# Install any needed packages specified in the server package.json file
WORKDIR /app/server
RUN npm install

# Copy the rest of the client files to the working directory
WORKDIR /app
COPY ./client .

# Copy the rest of the server files to the working directory
COPY ./server .

# Make port 80 available to the world outside this container
EXPOSE 5000

# Run the server.js file
CMD ["npm", "start"]
