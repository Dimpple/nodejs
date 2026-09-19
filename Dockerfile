# 1. Start from an official Node image
FROM node:20-alpine

# 2. Set the working directory inside the image
WORKDIR /app

# 3. Copy dependency manifests first (better layer caching)
COPY package*.json ./

# 4. Install dependencies
RUN npm install 

# 5. Copy the rest of your application code
COPY . .

# 6. Document which port the app listens on
EXPOSE 8080

# 7. Command to run when the container starts
CMD ["node", "server.js"]
