FROM node:18-slim

WORKDIR /usr/src/app

COPY package.json yarn.lock ./

RUN yarn install --production --frozen-lockfile && yarn cache clean

ENV NODE_ENV="production"

COPY . .

RUN yarn build
RUN ls -la

EXPOSE 3000

CMD [ "yarn", "start" ]
