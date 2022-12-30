FROM node:16.19.0-alpine3.16

ARG NAME

WORKDIR /app

RUN npm install -g npm@latest
RUN echo "Name of folder => $NAME"
RUN npx create-strapi-app@latest "$NAME" --quickstart --no-run

WORKDIR /app/"$NAME"

RUN npm i strapi-plugin-init-admin-user

RUN npm run build

WORKDIR /app/"$NAME"

EXPOSE 1337 80

CMD [ "npm","run","develop" ]