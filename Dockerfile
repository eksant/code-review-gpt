FROM node:18-slim

WORKDIR /src

COPY package.json ./

COPY .env ./.env

RUN npx install --production --frozen-lockfile && npx cache clean --force

ENV NODE_ENV="production"

COPY . .

RUN npx run build
RUN ls -la

EXPOSE 3000

CMD [ "node", "-r dotenv/config ./dist/index.js" ]
