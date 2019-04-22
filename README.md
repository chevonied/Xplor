# README

**To Set Up Xplor, open a Blank Template on Cloud9 (NOT a Rails Template), then run the following commands:**
<br><br>
gem install rails -v 4.2.11

git clone https://github.com/chevonied/Xplor
<br><br>
**After passing the next line below, select no (press "n", then Enter) when prompted to overwrite any files**

rails new Xplor -T

cd Xplor

bundle install --without production

bin/rake db:migrate
<br><br>
**To run server, use:**

rails s -p $PORT -b $IP
<br><br>
**To run cucumber Tests for Homepage and About Page**

cucumber features/homepage_exists.feature

cucumber features/about_exists.feature