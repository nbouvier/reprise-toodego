FROM node:16.15.1

RUN mkdir app
WORKDIR ./app/
ADD . .
RUN npm i
EXPOSE 3030
VOLUME /logs
VOLUME /data

ENTRYPOINT ["npm", "run", "prod", "--", "--port=3030"]
