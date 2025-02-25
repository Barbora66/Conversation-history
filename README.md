# README

To run development server

```
bundle install
rails db:create
rails db:migrate
rails db:seed
rails s
```

In another terminal run
```
rails tailwindcss:watch
```

To run test

```
bundle install
rails db:create 
rails db:migrate RAILS_ENV=test
rspec spec
```