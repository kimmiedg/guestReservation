FROM ruby:3.4.4

# Set working directory
WORKDIR /guestReservation

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -y nodejs postgresql-client yarn build-essential

# Copy Gemfiles first
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the app
COPY . .

# Expose Rails port
EXPOSE 3000

# Start Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
