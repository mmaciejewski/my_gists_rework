## My Gists

* Ruby version + gemset: **2.1.1@my_gists**
* Rails version: **4.1.0.rc1**. Rusztowanie aplikacji generujemy w takis sposób:
  ```
  rails new my_app
  rails _4.0.3_ new my_app  # jeśli w systemie zainstalowano kilka wersji Rails
  ```

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
rake db:migrate RAILS_ENV=test
rspec
```

## Edytory

1\. Emacs, v24.3.1:

* [Rinari](http://rinari.rubyforge.org/Navigation.html) –
a Ruby on Rails minor mode for Emacs

2\. Vim?

3\. Sublime Text?


## Wdrażanie aplikacji na Heroku

Dopisujemy do pliku *Gemfile* gemy *pg* i *rails_12factor*:

```ruby
group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end
```

oraz dodajemy gem *sqlite3* do grup *development* i *test*:

```ruby
gem 'sqlite3', group: [:development, :test]
```

Po tych poprawkach uaktualniamy *Gemfile.lock*:

```bash
bundle install --without production
git commit -a -m "uaktualniono Gemfile.lock (Heroku)"
```

Wdrażanie zaczynamy od założenia sobie konta na [Heroku](http://www.heroku.com/).

Po założeniu konta logujemy się na Heroku i przesyłamy na Heroku swój klucz publiczny:

```bash
heroku login
heroku keys:add
```

Tworzymy nową aplikację na Heroku:

```bash
# cd do katalogu z aplikacją MyGists
heroku create
  Creating desolate-ocean-2038... done, stack is cedar
  http://desolate-ocean-2038.herokuapp.com/ | git@heroku.com:desolate-ocean-2038.git
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
heroku open                               # lub wchodzimy na stronę
http://desolate-ocean-2038.herokuapp.com/
```

Zmieniamy nazwę aplikacji:

```bash
heroku rename paczek
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

## Pry

Warto zainstalować następujace gemy:

* pry
* pry-doc
* pry-theme
* pry-syntax-hacks
* pry-git
* awesome_print
* rubyvis

