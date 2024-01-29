# Events App: [Iterable](https://iterable.com/) Service Integration Demo App

## PreRequisites
- MySQL
- Ruby via rbenv
- Rails

> references - Select OS as necessary

  >- [Steps for installing Rails](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-20-04)
  
  >- [Steps for installing MySQL](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04)

## Installation

  1. Set up Backend

  1.1 Correct ruby version

  This project uses ruby 3.2.2, with [rbenv](https://github.com/rbenv/rbenv) installed ensure presence
  ```
    rbenv install 3.2.2
    gem install bundler
  ```
  1.2 All libraries and their versions

  ``` 
    bundle install
  ```
  1.3 Add application configuation in config/application.yml

  ``` 
    cp config/application.yml.example config/application.yml
  ```

  2. Set up the app - Create the very first user
  
  ```
    rake db:seed
  ```

  4. For Development
  Bypass the authentication for the specific resource by commenting
  ```ruby
    before_action :authenticate_user!
  ```
  where required (controller level)
