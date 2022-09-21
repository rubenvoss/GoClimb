FROM ruby:3.1.2

WORKDIR /goclimb

# Operating system dependencies
RUN apt update && \
  apt install npm


# Application dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install


COPY . .

# COPY ./Gemfile .

# RUN bundle

# Run a shell
# CMD ruby -e "puts 1 + 2"
CMD ["/bin/sh"]
