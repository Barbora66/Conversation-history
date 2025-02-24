# README

To run development server

```
cd ./conversation_history
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
cd ./conversation_history
bundle install
rails db:create 
rails db:migrate RAILS_ENV=test
rspec spec
```