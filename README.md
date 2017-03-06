# Messenger

To set up project run the following commands with proper database configuration:
```
git clone git@github.com:mkustov/messenger.git
cd messenger
bundle install
bundle exec rake db:create db:migrate
```
To run test (both unit and integration) run:
```
rspec
```

Additional feature - Emoji support.
