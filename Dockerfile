FROM node:20-alpine

RUN apk update \
    && apk upgrade

RUN mkdir -p /var/www/app

WORKDIR /var/www/app

COPY package*.json .

RUN npm install -g pnpm \
    && pnpm install

COPY . .

EXPOSE 3000

CMD ["pnpm", "dev"]
