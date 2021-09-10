FROM ruby:2.7.2

ENV RUNTIME_PACKAGES="linux-headers libxml2-dev make gcc libc-dev nodejs tzdata postgresql-dev postgresql" \
    DEV_PACKAGES="build-base curl-dev" \
    HOME="/app" \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo

WORKDIR ${HOME}

ADD Gemfile ${HOME}/Gemfile
# ADD Gemfile.lock ${HOME}/Gemfile.lock

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                      libpq-dev \       
                      nodejs \
  && rm -rf /var/lib/apt/lists/*

ADD . ${HOME}
CMD ["rails", "server", "-p", "8080", "-b", "0.0.0.0"]