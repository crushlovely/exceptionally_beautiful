# Exceptionally Beautiful

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