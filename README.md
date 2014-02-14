## My Gists

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Wdrażanie aplikacji na Heroku

- Zakładanie konta na [Heroku](http://www.heroku.com/).
- Instalujemy [Heroku Toolbeit](https://toolbelt.heroku.com/).
- Logujemy się na Heroku:

```
heroku login
```
- Tworzymy nową aplikację na Heroku:

```
heroku create
  Creating afternoon-tor-6637... done, stack is cedar
  http://afternoon-tor-6637.herokuapp.com/ | git@heroku.com:afternoon-tor-6637.git
  Git remote heroku added
```
- Wdrażamy aplikację na Heroku:

```
git push heroku master
```
- Tworzymy bazę na gisty na Heroku:

```
heroku run bin/rake db:migrate
```

Jeśli wszystkie polecenia wykonały się bez błędów,
to aplikacja działa pod url wypisanym przez polecenie *create* powyżej:

```
heroku open                               # lub
http://afternoon-tor-6637.herokuapp.com/
```

Zmieniamy nazwę aplikacji:

```
heroku rename herring  # nazwa cod jest już zajęta
```

Potrzebne są też zmiany w *Gemfile*:

```ruby
group :production do
  gem 'pg', '0.14.1'
end

# zob. też http://ruby.railstutorial.org/ruby-on-rails-tutorial-book?version=4.0
group :heroku do
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end
```

Problemy są też ze *static assets*. Trzeba zmienić domyślną ustawienia na:

```ruby
config.serve_static_assets = true
config.assets.compile = true
```
