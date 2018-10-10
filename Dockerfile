FROM node:8
RUN mkdir /app
WORKDIR /app
COPY . .
RUN npm install

USER node:node

EXPOSE 8000

ENTRYPOINT ["node", "/app/index.js"]
