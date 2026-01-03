# ----------------------------
# Frontend Dockerfile
# ----------------------------
# Builds static frontend and serves via Nginx
# ----------------------------

# Stage 1: Build
FROM node:18-alpine AS builder

WORKDIR /app

COPY frontend/package*.json ./
RUN npm ci

COPY frontend/ .
RUN npm run build

# ----------------------------
# Stage 2: Nginx
# ----------------------------
FROM nginx:alpine

# Remove default config
RUN rm /etc/nginx/conf.d/default.conf

# Copy custom nginx config (optional)
COPY nginx/frontend.conf /etc/nginx/conf.d/frontend.conf

# Copy built static files
COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
