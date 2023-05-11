FROM node:17-stretch-slim as base

WORKDIR /src

COPY package.json .env ./

RUN npm install --no-optional && npm cache clean --force

COPY . .

RUN npm run build

EXPOSE 3000

CMD [ "node", "-r", "dotenv/config", "./dist/index.js" ]
