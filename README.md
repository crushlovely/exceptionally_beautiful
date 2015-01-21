# Exceptionally Beautiful

[![RubyGem Version](http://img.shields.io/gem/v/exceptionally_beautiful.svg?style=flat)](https://rubygems.org/gems/exceptionally_beautiful)
[![Dependency Status](http://img.shields.io/gemnasium/crushlovely/exceptionally_beautiful.svg?style=flat)](https://gemnasium.com/crushlovely/exceptionally_beautiful)
[![Build Status](http://img.shields.io/travis/crushlovely/exceptionally_beautiful.svg?style=flat)](https://travis-ci.org/crushlovely/exceptionally_beautiful)
[![Code Climate](http://img.shields.io/codeclimate/github/crushlovely/exceptionally_beautiful.svg?style=flat)](https://codeclimate.com/github/crushlovely/exceptionally_beautiful)
[![Code Coverage](http://img.shields.io/codeclimate/coverage/github/crushlovely/exceptionally_beautiful.svg?style=flat)](https://codeclimate.com/github/crushlovely/exceptionally_beautiful)

A Rails engine for handling error pages.

## Setup

The only mandatory piece of setup is to add the route helper to `config/routes.rb`:

``` ruby
Rails.application.routes.draw do
  # This can usually be put at the end of your routes
  exceptionally_beautiful_routes
end
```

## What You Get

Exceptionally Beautiful will handle any three-digit status code you throw at it. It comes with translation data for the following common errors:

|         Error         | Code |
|:---------------------:|------|
| Forbidden             | 403  |
| Not Found             | 404  |
| Unprocessable Entity  | 422  |
| Internal Server Error | 500  |
| Bad Gateway           | 502  |

Any status code that is either unrecognized or missing translation data will fall back to default messaging.

## Customizing

If the default controller, action, and/or layout don't suit your fancy, you can override any of them:

``` ruby
ExceptionallyBeautiful.setup do |config|
  config.layout = 'errors'
  config.controller = 'exceptionally_beautiful/errors'
  config.action = 'show'
end
```

## Usage With `rescue_from`

If you're using Rails' `rescue_from` functionality, you can still use Exceptionally Beautiful:

``` ruby
class ApplicationController < ActionController::Base
  include ExceptionallyBeautiful::ErrorHandler

  rescue_from Mongoid::Errors::DocumentNotFound do |exception|
    error_handler(404)
  end
end
```