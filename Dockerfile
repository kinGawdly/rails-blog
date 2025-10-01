# syntax = docker/dockerfile:1

FROM ruby:3.0.4

WORKDIR /app

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client imagemagick libvips

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
EXPOSE 3000

# Copy the main proccess to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]