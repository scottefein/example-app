FROM gcr.io/google_appengine/ruby

RUN rbenv install -s 2.4.2 && \
    rbenv global 2.4.2 && \
    gem install -q --no-rdoc --no-ri bundler 
ENV RBENV_VERSION 2.4.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libmagickwand-dev imagemagick

COPY . /app/
RUN bundle install && rbenv rehash
RUN RAILS_ENV=production BUILD_MODE=true bundle exec rake assets:precompile
CMD ["bundle", "exec"]