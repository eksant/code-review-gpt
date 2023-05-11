FROM node:18-slim

WORKDIR /usr/src/app

COPY package.json yarn.lock ./
COPY .env ./.env

RUN yarn install --production --frozen-lockfile && yarn cache clean

ENV NODE_ENV="production"

COPY . .

RUN yarn build

CMD [ "yarn", "start" ]
