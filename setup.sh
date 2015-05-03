curl -sSL https://get.rvm.io | bash -s stable
rvm install 2.2.2 # takes a long time
gem install berkshelf # takes a long time

apt-get install virtualbox -y # install oracle virtual box ~ 2 min
wget https://bit.ly/vagrant172
dpkg -i vagrant172 # install vagrant for automating vboxes
rm vagrant172

gem install test-kitchen # installs test-kitchen gem so that berks puts it into Gemfile
berks cookbook hello-infra # generate infrastructure as code layout
cd hello infra

gem install bundler # install bundler gem < 1 min (setting up main tooling)
bundle install # install test kitchen from Gemfile

sed -i 's/chef_solo/chef_zero/g' .kitchen.yml # use chef zero instead of solo
sed -i 's/ubuntu-12.04/debian-7.8/g' .kitchen.yml # use debian instead of ubuntu
sed -i '10d' .kitchen.yml # remove centos from platfor list to begin with
# pontentially make the box more beafy and forward port 80 to host's 8080

kitchen list # outputs results of our modifications
kitchen create # creates a new virtual box > 8 min in case it has to download
kitchen verify # verify tests after box's converged, first time around will pull down and install chef

mkdir test/integration/default/serverspec # add test for nodejs recipe
# 
mkdir spec # add chefspec test for nodejs cookbook 
echo "cookbook 'nodejs'" >> Berksfile
echo "depends 'nodejs'" >> metadata.rb # add nodejs recipe dependency
berks install # install nodejs recipe
echo "include_recipe 'nodejs'" >> recipes/default.rb # include nodejs recipe
# add serverspec test for simple app listening on port 3000
# create simple nodejs http server to listen on port 3000 in files/default/simple.js, serve it using node and update chefspec tests with stubbed command.

# add serverspec, chefspec test for nginx site
# add rspec integration test for hello-world app

# add simple chaos monkey bats test to verify nodejs app gets restarted automatically
# add supervisor to restart simple nodejs app

# demo aws test-kitchen driver
# install aws cli
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

aws configure # configure aws credentials and default settings
# create & copy key pair from amazon console

