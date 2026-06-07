# 1. Use official Nginx base image
FROM nginx:stable-alpine

# 2. Copy your static site files into Nginx default directory
COPY ./dist /usr/share/nginx/html
ENV BACKEND_URL=http://localhost:4321/api
# 3. Expose HTTP port
EXPOSE 80

# 4. Nginx default CMD is already defined