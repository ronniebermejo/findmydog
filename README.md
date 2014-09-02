# README

## Find my dog.

The intention of this application is to allow pet owners to report lost pets and help them to find them.

See a live demo at:
http://findmydog.herokuapp.com


<img src='https://cloud.githubusercontent.com/assets/3291755/4051895/42c9642a-2d66-11e4-8278-9c59549c2e9b.png'>
#### Ruby & Rails version

Ruby 2.0 and Rails 4.1

#### System dependencies

- AngularJS
- Google Maps API


#### Configuration

#### Database creation

rake db:create
rake db:migrate


#### Database initialization

rake db:seed


#### How to run the test suite

rspec spec

#### Services (job queues, cache servers, search engines, etc.)

#### Deployment instructions


Deploy from a different branch (not recommended)
 `git push heroku yourbranch:master`


```heroku run rake db:schema:load```



