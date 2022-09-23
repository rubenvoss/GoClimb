FROM ruby:3.1.2-alpine3.16

WORKDIR /goclimb

# Operating system dependencies
RUN apk update
RUN apk add ruby-dev=3.1.2-r0
RUN apk add git=2.36.2-r0
RUN apk add postgresql-dev
RUN apk add --no-cache build-base=0.5-r3
RUN apk add --no-cache gcompat=1.0.0-r4
RUN apk add tzdata=2022c-r0
RUN apk add nodejs=16.16.0-r0
RUN apk add yarn=1.22.19-r0



# Application dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle


COPY . .

# COPY ./Gemfile .

# RUN bundle
EXPOSE 3000

# exposing port 3000 to localhost
# set the script as executable with chmod
# RUN chmod +x /goclimb/container_start.sh
# execute the starting script to start rails server, etc.
# CMD ["/goclimb/container_start.sh"]

# CMD ["rails", "server", "-b", "0.0.0.0"]

# ➜  GoClimb git:(docker) ✗ docker run --name rails --rm -d -p 3000:3000 rails
