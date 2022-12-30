FROM node:16.19.0-alpine3.16

ARG NAME

WORKDIR /app

RUN npm install -g npm@latest
RUN echo "Name of folder => $NAME"
RUN npx create-strapi-app@latest "$NAME" --quickstart --no-run

WORKDIR /app/"$NAME"

RUN npm i @strapi/plugin-graphql
RUN npm i strapi-plugin-init-admin-user
RUN npm i strapi-plugin-wysiwyg-react-md-editor
RUN npm i @artcoded/strapi-plugin-github-projects
RUN npm i strapi-plugin-multi-select
RUN npm i @strapi/plugin-seo
RUN npm i strapi-plugin-todo
RUN npm i @surunnuage/strapi-plugin-expo-notifications
RUN npm i @strapi/plugin-documentation
RUN npm i strapi-plugin-custom-links
RUN npm i @offset-dev/strapi-calendar
RUN npm i @chartbrew/plugin-strapi

RUN npm run build

EXPOSE 1337 80

CMD [ "npm","run","develop" ]