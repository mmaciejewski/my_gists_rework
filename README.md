## My Gists

* Ruby version + gemset: **2.1.1@my_gists**
* System dependencies: *RVM*, *SQLite*
* Configuration:
```
bundle install [--path=$HOME/.gems]
```

* Database creation:

```
rake db:migrate
```

* How to run the test suite
```
rspec
```


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

## Wdrażanie aplikacji na Shelly Cloud

Dla studentów Uniwersytetu Gdańskiego, biorących udział w przedmiocie
Architektura Serwisów Internetowych, Shelly Cloud udostępnia darmowe
konta na potrzeby zaliczenia przedmiotu. O szczegóły należy pytać
prowadzącego lub kontaktować się mailowo z Maciejem Małeckim
(smefju@shellycloud.com) **przed** założeniem konta.

 * Zakładamy konto na [Shelly Cloud](https://shellycloud.com/sign_up).
 * Instalujemy gem `shelly`

```bash
 $ gem install shelly
```

 * Logujemy się na wcześniej utworzone konto

```bash
 $ shelly login
```

 * Tworzymy nową chmurę

```bash
 $ shelly add
```

 * Dodajemy gem dla bazy PostgreSQL oraz zależności dla Shelly Cloud

```ruby
# Gemfile

gem 'pg'
gem 'shelly-dependencies'
```

i uruchamiamy `bundle install`

 * Wdrażamy aplikację na Shelly Cloud

```
 $ git add Gemfile Gemfile.lock Cloudfile
 $ git commit -m "Added Cloudfile for Shelly Cloud."
 $ git push shelly master
```

 * Otwieramy naszą aplikację w przeglądarce

```
 $ shelly open # lub po prostu https://nazwa-applikacji.shellyapp.com/
```
