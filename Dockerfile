FROM node:18-slim

WORKDIR /src

COPY package.json .env ./

ENV NODE_ENV="production"

RUN npm install --production && npm cache clean --force

COPY . .

RUN npm run build

EXPOSE 3000

CMD [ "node", "-r", "dotenv/config", "./dist/index.js" ]
