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

