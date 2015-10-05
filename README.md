# Invoice-it

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