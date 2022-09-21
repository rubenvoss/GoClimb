FROM ruby:3.1.2

WORKDIR /app

# COPY . .

# COPY ./Gemfile .

# RUN bundle

# Run a shell
# CMD ["/bin/sh"]
CMD ruby -e "puts 1 + 2"
