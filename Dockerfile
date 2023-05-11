FROM node:18-slim

WORKDIR /src

COPY package.json .env ./

ENV NODE_ENV="production"

RUN npx install --production --no-optional && npx cache clean --force

COPY . .

RUN npx run build

EXPOSE 3000

CMD [ "node", "-r", "dotenv/config", "./dist/index.js" ]
