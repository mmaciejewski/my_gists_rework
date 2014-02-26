## My Gists

* Ruby version + gemset: **2.1.1@my_gists**
* System dependencies: [RVM](http://rvm.io/rvm/install),
 SQLite, [Heroku Toolbeit](https://toolbelt.heroku.com/)
* Configuration:
```
bundle install --without production [--local | --path=$HOME/.gems]
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

Dopisujemy do pliku *Gemfile*:

```ruby
group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end
``
i uaktualniamy *Gemfile.lock*:

```bash
bundle install --without production
git commit -a -m "uaktualniono Gemfile.lock (Heroku)"
```

Wdrażanie zaczynamy od założenia sobie konta na [Heroku](http://www.heroku.com/).

Po założeniu konta logujemy się na Heroku:

```bash
heroku login
```

Tworzymy nową aplikację na Heroku:

```bash
# cd do katalogu z aplikacją MyGists
heroku create
  Creating afternoon-tor-6637... done, stack is cedar
  http://afternoon-tor-6637.herokuapp.com/ | git@heroku.com:afternoon-tor-6637.git
  Git remote heroku added
```

Wdrażamy aplikację na Heroku:

```bash
git push heroku master
```

Tworzymy bazę danych na Heroku:

```bash
heroku run bin/rake db:migrate
```

Jeśli wszystkie polecenia wykonały się bez błędów,
to aplikacja działa pod url wypisanym przez polecenie *create* powyżej:

```bash
heroku open                               # lub
http://afternoon-tor-6637.herokuapp.com/
```

Zmieniamy nazwę aplikacji:

```bash
heroku rename herring  # nazwa cod jest już zajęta
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
