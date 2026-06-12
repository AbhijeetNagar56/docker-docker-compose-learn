FROM node:18-alpine
WORKDIR /app
COPY package.json ./
RUN npm install
ENV DB=mysql://user:password@host_ip:host_port/db_name
ENV FRONTEND_URL=http://localhost:5173
COPY . .
EXPOSE 4321
RUN apk add --no-cache curl
CMD ["node", "app.js"]

