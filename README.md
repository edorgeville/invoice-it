# Invoice-it
## A simple invoicing tool

### ??
I started this project after searching for too long for the perfect invoicing tool. Problem is : my needs are pretty basic, but I'm difficult with what I want.  
I started this project so it would fit my needs and could add features as I need them.

### How to use
```
bundle install
bundle exec rake db:setup
bundle exec rails s
```

In a rails console (```bundle exec rails c```), create an admin user : 
```ruby
AdminUser.create!(email:"admin@example.com", password:"12345", password_confirmation:"12345")
```

Visit [0.0.0.0:3000/admin](http://0.0.0.0:3000/admin)

### TODO
- Add validation on models
- Add unit testing
- Add PDF rendering

### License 
Take a look at the [LICENSE file](LICENSE)