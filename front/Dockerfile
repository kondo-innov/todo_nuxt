FROM node:12.18.3-alpine

ARG NODE_ENV=production

ENV LANG=C.UTF-8 \
    TZ=Asia/Tokyo

RUN mkdir /app
ENV APP_ROOT /app
WORKDIR $APP_ROOT

RUN apk update && \
    apk upgrade

COPY . /app
RUN npm install
RUN npm run build

CMD ["npm", "run", "dev"]
