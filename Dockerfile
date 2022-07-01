FROM node:10-alpine
RUN mkdir -p /tmp/ddc-app/node_modules && chown -R node:node /tmp/ddc-app
WORKDIR /tmp/ddc-app
COPY package*.json ./
USER node
RUN npm install prod
COPY --chown=node:node . .
EXPOSE 4000
CMD node bin/www