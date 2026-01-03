# ----------------------------
# Backend Dockerfile
# ----------------------------
# Uses multi-stage build for smaller image size
# Assumes backend exposes HTTP API on port 8080
# ----------------------------

# Stage 1: Build
FROM node:18-alpine AS builder

WORKDIR /app

# Install dependencies first (better layer caching)
COPY backend/package*.json ./
RUN npm ci

# Copy application source
COPY backend/ .

# Build step (optional, e.g. TypeScript)
RUN npm run build || echo "No build step"

# ----------------------------
# Stage 2: Runtime
# ----------------------------
FROM node:18-alpine

WORKDIR /app

# Copy only required artifacts from builder
COPY --from=builder /app .

# Expose backend port
EXPOSE 8080

# Run as non-root user (best practice)
USER node

# Start application
CMD ["npm", "start"]
