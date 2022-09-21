FROM ruby:3.1.2

WORKDIR /goclimb

# Operating system dependencies
RUN apt update
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs


# Application dependencies
# COPY Gemfile Gemfile.lock ./
# RUN bundle


# COPY . .

# COPY ./Gemfile .

# RUN bundle

# Run a shell
# CMD ruby -e "puts 1 + 2"
CMD ["/bin/sh"]
