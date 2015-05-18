# Hermes Notifier

[![Build Status](https://travis-ci.org/current/hermes.svg?branch=master)](https://travis-ci.org/current/hermes)
[![Test Coverage](https://codeclimate.com/github/current/hermes/badges/coverage.svg)](https://codeclimate.com/github/current/hermes/coverage)
[![Code Climate](https://codeclimate.com/github/current/hermes/badges/gpa.svg)](https://codeclimate.com/github/current/hermes)

The notifier for your business.

## TL;DR;

1. Install dependencies: PostgreSQL and foreman
2. Create database: `bin/rake db:reset`
3. Link env file: `ln -s .env.sample .env`
4. Run foreman: `foreman start`
5. Go to [localhost](localhost:3000)

## README

Hermes notifier is a simple application that sends SMS to your customers to
remind them of all the appointments that they have with you.

It uses:

* Ruby version: 2.2.2
* System dependencies: PostgreSQL
* Configuration: nothing special
* Database creation: `bin/rake db:create`
* Database initialization: `bin/rake db:reset`
* How to run the test suite: `bin/rake`
* Services: it still doesn't use any service
* Deployment instructions: automatic deploy enabled at
[heroku](https://hermes-notifier.herokuapp.com/), _master_ branch has just to
pass at test suite

The prefered way to run it at your machine is through oreman. You can install
it by 3 ways:

- [Ruby gem +foreman+](https://rubygems.org/gems/foreman)
- [Heroku toolbelt](https://toolbelt.heroku.com/)
- [Mac OS X package](http://assets.foreman.io/foreman/foreman.pkg)

After install foreman you will need an `.env` file with
[Twilio](https://www.twilio.com/) credentials and some unicorn config. You can
just rename `.env.sample` to `.env` and everything goes right.
