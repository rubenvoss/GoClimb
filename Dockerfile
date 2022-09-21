FROM ruby:3.1.2-alpine3.16

WORKDIR /goclimb

# Operating system dependencies
RUN apk update

# RUN apk add npm
# RUN apk add nodejs
RUN apk add yarn


# Application dependencies
# COPY Gemfile Gemfile.lock ./
# RUN bundle


# COPY . .

# COPY ./Gemfile .

# RUN bundle

# Run a shell
# CMD ruby -e "puts 1 + 2"
CMD ["/bin/sh"]
