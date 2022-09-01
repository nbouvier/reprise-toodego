FROM node:16.15.1
RUN mkdir app
WORKDIR ./app/
COPY . .
RUN npm i
EXPOSE 3030

ENTRYPOINT ["npm", "run", "prod", "--", "--port=3030"]
