FROM ruby:3.1.2-alpine3.16

WORKDIR /goclimb

# Operating system dependencies
RUN apk update
# RUN apk add ruby-dev
RUN apk add git
RUN apk add --no-cache build-base
RUN apk add --no-cache gcompat
RUN apk add postgresql-dev
RUN apk add tzdata
RUN apk add nodejs
RUN apk add yarn


# Application dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle


COPY . .

# COPY ./Gemfile .

# RUN bundle

EXPOSE 3000

# Run a shell
CMD ruby -e "cat /usr/local/bundle/extensions/aarch64-linux-musl/3.1.0/pg-1.4.3/mkmf.log"
CMD ["/bin/sh"]
