# README

## Notes
This guide expects you to install and deploy the project on a MacOS Device:

## Set Up Dependencies
1. Install homebrew following the [official guide](https://brew.sh/) as it will be used as the main package manager for deploying the project.
2. Install the ruby version manager and use it to install the same version ruby used for this project:
```  
$ brew install gnupg
$ gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
$ \curl -sSL https://get.rvm.io | bash
$ rvm install 3.1.3
```
3. Install rails 6.1.7.2:
```
$ gem install rails -v 6.1.7.2
```
4. Install javascript dependencies nodejs 16.x and yarn (latest):
```
$ brew install node@16
$ npm install --global yarn
```
5. Install latest version of postgresql database:
```
$ brew install postgresql
$ brew services start postgresql
```

## Set Up Database
1. Create user with password matching the one in `config/database.yml`
```
$ sudo -u postgres createuser -s duartedg -P
```
2. Run commands to create and migrate database:
```
$ rake db:create
$ rake db:migrate
```

## Set Up Frontend Assets
* Run the following commands to install remaining rails dependencies and prepare assets on webpack:
```
$ gem install bundler
$ bundle install 
$ rake assets:precompile
$ rails webpacker:install
$ bundle exec ./bin/webpack
```

## Deploy and Test
1. Run the website using `rails server`
2. Run the tests using `rails test`