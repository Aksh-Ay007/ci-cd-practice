# Step 1: Build the React app
FROM node:16-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app and build it
COPY . .
RUN npm run build

# Step 2: Serve the built app with Nginx
FROM nginx:alpine

# Copy the build output to the Nginx web root
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy custom Nginx config (optional)
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
