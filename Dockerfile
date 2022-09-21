FROM ruby:3.1.2 AS goclimb

WORKDIR /app

COPY . .

# COPY ./Gemfile .

# RUN bundle

# Run a shell
CMD ["/bin/sh"]
