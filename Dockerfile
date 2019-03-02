FROM node:8
RUN apt-get update -y && apt-get upgrade -y
RUN mkdir /app
WORKDIR /app

COPY app/ /app
RUN npm install

USER node:node
EXPOSE 8000
ENTRYPOINT ["node", "/app/index.js"]
