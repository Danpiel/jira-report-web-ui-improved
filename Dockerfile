FROM node:lts-alpine

ENV NODE_ENV=production \
    SERVER_PORT=8080

EXPOSE 8080

RUN apk add libsass --update-cache; \
    mkdir -p /app

COPY . /app

WORKDIR /app

RUN npm i npm -g; \
    npm install; \
    npm run build;

USER node

CMD ["node","/app/src/server/index.js"]