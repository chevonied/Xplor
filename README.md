# README

## BUILD INSTRUCTIONS
<br/><br/>
**Create a Blank Template if building on Cloud9 (NOT a Rails Template), then run the following commands:**

sudo apt-get update

sudo apt-get install imagemagick

gem install rails -v 4.2.11

git clone https://github.com/chevonied/Xplor

**After passing the next line below, select no (press "n", then Enter) when prompted to overwrite any files**

rails new Xplor -T

cd Xplor

bundle install --without production

bin/rake db:migrate
<br/><br/>

**If app/assets/stylesheets/application.css and application.css.scss are both present, delete application.css to view custom styling.**

**To run server on Cloud9, use:**

rails s -p $PORT -b $IP

**To run server on regular PC environment, use:**

rails server
<br/><br/>

**To run Cucumber Tests for Homepage and About Page, use:**

cucumber features/homepage_exists.feature

cucumber features/about_exists.feature