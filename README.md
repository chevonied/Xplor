== README

To Set Up in Cloud9, run:

# Run all development in Cloud9 so we all have the same Dev environment
# Do NOT push into master. Submit pull request.
# We're using ruby version 2.4.0 and rails 4.2.11.

gem install rails -v 4.2.11

# Use http:// before link
git clone http://github.com/housing484/Xplor

rails new Xplor -T

cd Xplor

bundle install --without production

# to run server

rails s -p $PORT -b $IP
