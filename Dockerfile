# Build stage
FROM node:20-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install all dependencies (including dev dependencies for building)
RUN npm ci

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Remove dev dependencies to reduce image size
RUN npm prune --production

# Production stage
FROM node:20-alpine AS production

# Set the working directory inside the container
WORKDIR /app

# Create a non-root user to run the application
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nestjs -u 1001

# Copy package.json for metadata
COPY package*.json ./

# Copy only production dependencies from builder stage
COPY --from=builder /app/node_modules ./node_modules

# Copy the built application from builder stage
COPY --from=builder /app/dist ./dist

# Change ownership of the app directory to the nodejs user
RUN chown -R nestjs:nodejs /app

# Switch to non-root user
USER nestjs

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run the application
CMD ["node", "dist/main"]