# 1. Use Node.js base image
FROM node:18-alpine

# 2. Set working directory
WORKDIR /app

# 3. Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# 4. Copy application code
COPY . .

# 5. Expose backend port
EXPOSE 4321

# 6. Install curl for healthchecks
RUN apk add --no-cache curl

# 7. Environment variables (placeholders, overridden by Compose)
ENV DB_USER=root
ENV DB_HOST=database
ENV DB_PORT=3306
ENV DB_NAME=appdb
ENV DB_PASSWORD_FILE=/run/secrets/mysql_root_password
ENV FRONTEND_URL=http://localhost:5173

# 8. Start the app
CMD ["node", "app.js"]
