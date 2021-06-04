# README

* Ruby version
3.0.1
* Install System dependencies
```
bundle install
```
* Configuration
```
# database
./config/database.yml
```

* Database creation
```
rails db:create db:migrate db:seed
```
<!-- * Database initialization -->

* Start the app
```
bundle exec rails server
```
* How to run the test suite
```
# test all 
rspec

# test file
rspec ./spec/{category}

# test specific testcase
rspec ./spec/{category}/{name}
```
<!-- * Services (job queues, cache servers, search engines, etc.) -->

* Deployment config
framework : .NET framework 4.8 or later

* Deployment instructions
```
# push code to heroku
git push heroku main

heroku run rails db:migrate

heroku open
```
<!-- web url: https://mission-management-system.herokuapp.com/missions -->

