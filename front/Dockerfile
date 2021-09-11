FROM node:12.18.3-alpine

ENV LANG=C.UTF-8 \
    TZ=Asia/Tokyo

RUN mkdir /app
ENV APP_ROOT /app
WORKDIR $APP_ROOT

RUN apk update && \
    apk upgrade && \
    npm install -g npm && \
    npm install -g @vue/cli

COPY . /app
RUN npm install

ENV HOST 0.0.0.0
EXPOSE 3000

CMD ["npm", "run", "dev"]
