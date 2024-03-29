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

RUN yarn add @strapi/plugin-graphql
RUN yarn add strapi-plugin-init-admin-user
RUN yarn add strapi-plugin-wysiwyg-react-md-editor
RUN yarn add @artcoded/strapi-plugin-github-projects
RUN yarn add strapi-plugin-multi-select
RUN yarn add @strapi/plugin-seo
RUN yarn add strapi-plugin-todo
RUN yarn add @surunnuage/strapi-plugin-expo-notifications
RUN yarn add @strapi/plugin-documentation
RUN yarn add strapi-plugin-custom-links
RUN yarn add @offset-dev/strapi-calendar
RUN yarn add @chartbrew/plugin-strapi

RUN yarn build

EXPOSE 1337 80

CMD [ "yarn","develop" ]