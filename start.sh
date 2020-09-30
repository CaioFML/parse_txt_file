bundle check || bundle install
bundle exec rails db:drop db:create db:migrate
bundle exec puma -C config/puma.rb