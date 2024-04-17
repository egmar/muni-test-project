FROM node:20-slim
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
RUN npm ci --production
RUN npm cache clean --force
ENV NODE_ENV="production"
COPY . .
EXPOSE 3000
CMD [ "npm", "start" ]
