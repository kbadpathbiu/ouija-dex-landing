FROM node:lts-slim

WORKDIR /code

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm install

COPY ./public ./public

COPY ./src ./src

COPY next.config.js next.config.js

RUN npx next build

FROM node:lts-slim

RUN npm install -g serve

COPY --from=0 /code/.next ./out
COPY ./crt/ouija_exchange.crt .
COPY ./crt/ouija_exchange.key .
EXPOSE 443
WORKDIR /

CMD ["serve", "-s", "out", "-l", "443", "--ssl-cert", "/ouija_exchange.crt", "--ssl-key", "/ouija_exchange.key"]