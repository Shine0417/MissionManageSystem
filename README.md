# README

* Ruby version
3.0.1
* System dependencies
```
bundle install
```
* Configuration

* Database creation
```
rails db:create db:migrate db:seed
```
* Database initialization

* How to run the test suite
```
#all 
rspec

# special testcase
rspec ./spec/{category}/{name}
```
* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
```
# push code to heroku
git push heroku main

heroku run rails db:migrate

heroku open
```
web url: https://mission-management-system.herokuapp.com/missions

