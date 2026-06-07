FROM node:18-alpine
WORKDIR /app
COPY package.json ./
RUN npm install
ENV DB=mysql://root:abc123@172.19.0.2:3306/appdb
ENV FRONTEND_URL=http://localhost:5173
COPY . .
EXPOSE 4321
RUN apk add --no-cache curl
CMD ["node", "app.js"]

