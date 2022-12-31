FROM node:16.19.0-alpine3.16

ARG NAME
ARG DBCLIENT
ARG DBHOST
ARG DBPORT
ARG DBNAME
ARG DBUSER
ARG DBPASS

WORKDIR /app

RUN echo "Name of folder => $NAME"
RUN npx create-strapi-app@latest "$NAME" --quickstart --no-run

WORKDIR /app/"$NAME"

RUN yarn add strapi-plugin-init-admin-user

RUN yarn build

WORKDIR /app/"$NAME"

EXPOSE 1337 80

CMD [ "yarn","develop" ]