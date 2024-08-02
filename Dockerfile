# Use a Ruby image with the required version
FROM ruby:3.1

# Set the working directory in the container
WORKDIR /srv/jekyll

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install the correct version of Bundler and dependencies
RUN gem install bundler:2.4.20
RUN bundle install

# Copy the rest of the application code into the container
COPY . .

# Expose port 4000 for the Jekyll server
EXPOSE 4000

# Command to run Jekyll
CMD ["jekyll", "serve", "--host", "0.0.0.0"]
