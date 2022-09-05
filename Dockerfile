FROM node:16.15.1-alpine

WORKDIR /app
COPY . .
RUN npm i

ENTRYPOINT ["npm", "run", "prod"]
