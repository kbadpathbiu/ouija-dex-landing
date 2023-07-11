FROM node:lts-slim

WORKDIR /code

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm install

COPY . .

RUN npx next build

FROM node:lts-slim

RUN npm install -g serve

COPY --from=0 /code/out ./out
COPY ./crt/ouija_exchange.crt .
COPY ./crt/ouija_exchange.key .
EXPOSE 443
WORKDIR /

CMD ["serve", "-s", "out", "-l", "443", "--ssl-cert", "/ouija_exchange.crt", "--ssl-key", "/ouija_exchange.key"]