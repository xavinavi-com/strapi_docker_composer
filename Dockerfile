
FROM node:16
# Installing libvips-dev for sharp Compatibility
RUN apt-get update && apt-get install -y libvips-dev -y
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
WORKDIR /opt/
COPY ./package.json ./
ENV PATH /opt/node_modules/.bin:$PATH
RUN yarn config set network-timeout 600000 -g && yarn install
WORKDIR /opt/app

COPY ./ .
RUN yarn build
EXPOSE 1337
CMD ["yarn", "develop"]