FROM node:16.15.1

RUN mkdir app
WORKDIR /usr/src/app/
ADD . .
RUN npm i

ENTRYPOINT ["npm", "run", "prod", "--", "--port=3030"]
