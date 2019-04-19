# README

**To Set Up Xplor, open a Blank Template on Cloud9 (NOT a Rails Template), then run the following commands:**
<br><br>
gem install rails -v 4.2.11

git clone https://github.com/chevonied/Xplor
<br><br>
**After passing the code below, select no (press "n", then Enter) when prompted to overwrite any files**

rails new Xplor -T

cd Xplor

bundle install --without production
<br><br>
**To run server, use:**

rails s -p $PORT -b $IP
