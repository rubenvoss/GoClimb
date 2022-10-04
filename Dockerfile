FROM ruby:3.1.2-alpine3.16

WORKDIR /goclimb

# Operating system dependencies
RUN apk add --update \
            ruby-dev=3.1.2-r0 \
            git=2.36.2-r0 \
            libpq-dev=14.5-r0 \
            --no-cache build-base=0.5-r3 \
            --no-cache gcompat=1.0.0-r4 \
            tzdata=2022c-r0 \
            nodejs=16.16.0-r0 \
            nano \
            yarn=1.22.19-r0

# Application dependencies
COPY package.json yarn.lock ./
RUN yarn install
COPY Gemfile Gemfile.lock ./
RUN bundle

# You can use the nano texteditor to edit credentials files in the docker container
ENV EDITOR=nano

# Copy the source code into the Docker container
COPY . .

# This container exposes port 3000 on localhost
EXPOSE 3000

# Uncomment this if you want to run the docker container without docker compose ($ docker build -t rails .)
# CMD ["rails", "server", "-b", "0.0.0.0"]
