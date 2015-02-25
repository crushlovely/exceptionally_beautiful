# Exceptionally Beautiful

[![RubyGem Version](http://img.shields.io/gem/v/exceptionally_beautiful.svg?style=flat)](https://rubygems.org/gems/exceptionally_beautiful)
[![Dependency Status](http://img.shields.io/gemnasium/crushlovely/exceptionally_beautiful.svg?style=flat)](https://gemnasium.com/crushlovely/exceptionally_beautiful)
[![Build Status](http://img.shields.io/travis/crushlovely/exceptionally_beautiful.svg?style=flat)](https://travis-ci.org/crushlovely/exceptionally_beautiful)
[![Code Climate](http://img.shields.io/codeclimate/github/crushlovely/exceptionally_beautiful.svg?style=flat)](https://codeclimate.com/github/crushlovely/exceptionally_beautiful)
[![Code Coverage](http://img.shields.io/codeclimate/coverage/github/crushlovely/exceptionally_beautiful.svg?style=flat)](https://codeclimate.com/github/crushlovely/exceptionally_beautiful)

A Rails engine for handling error pages.

## Setup

Getting up-and-running is simple. Just use the built-in generator:

``` bash
bundle exec rails g exceptionally_beautiful:install
```

The generator will:

* Add the route helper to `config/routes.rb`
* Add an initializer that you can customize in `config/initializers/exceptionally_beautiful.rb`
* Copy over the translation data to `config/locales/exceptionally_beautiful.en.yml`

## What You Get

Exceptionally Beautiful can handle any three-digit status code you throw at it. It comes with translation data for the following common errors:

| Code |         Error         |
|------|:---------------------:|
| 403  | Forbidden             |
| 404  | Not Found             |
| 422  | Unprocessable Entity  |
| 500  | Internal Server Error |
| 502  | Bad Gateway           |

## Customizing

If the default errors, controller, action, and/or layout don't suit your fancy, you can override any of them in the initializer provided by the generator:

``` ruby
ExceptionallyBeautiful.setup do |config|
  config.errors = [403, 404, 422, 500, 502]
  config.layout = 'errors'
  config.controller = 'exceptionally_beautiful/errors'
  config.action = 'show'
end
```

**Important:** If you want Exceptionally Beautiful to handle an error code other than the defaults specified, it must be added to `config.errors`.

### Error Messages

You can customize and add new errors to the translation file copied over by the initializer (`config/locales/exceptionally_beautiful.en.yml`). Error codes missing translation data will fall back to default messaging.

#### I18n Gotcha

Make sure that all new error codes in your translation file are prefixed with a `:`. This is needed for `I18n` translation lookups to work properly when using keys that are integers. See [this](https://github.com/svenfuchs/rails-i18n/issues/36) for more information. e.g.

``` yaml
en:
  exceptionally_beautiful:
    default:
      title: "There's been an error"
      message: "Something has gone wrong. Please try again shortly."
    :401:
      title: "Unauthorized"
      message: "Leave and never come back!"
```

#### Markdown Formatting

The `message` for each error can be formatted using Markdown. e.g.

``` yaml
  exceptionally_beautiful:
    default:
      title: "There's been an error"
      message: |
        Something has **gone wrong**. Please try again shortly.

        Or just go [back to our home page](/)...
```

## Usage With `rescue_from`

Using Rails' `rescue_from` in your controllers? You can use Exceptionally Beautiful's error handler there too:

``` ruby
class ApplicationController < ActionController::Base
  include ExceptionallyBeautiful::ErrorHandler

  rescue_from Mongoid::Errors::DocumentNotFound do |exception|
    error_handler(404)
  end
end
```

## Rake Task

This library comes with a Rake task that caches your beautiful error pages as static HTML files in your application's public folder.

``` bash
bundle exec rake exceptionally_beautiful:cache
```

## Capistrano Integration

Want to cache your error pages as part of your deployment workflow? Use the included Capistrano 3 task:

``` ruby
# In your Capfile
require 'exceptionally_beautiful/capistrano'

# In your config/deploy.rb
after 'deploy:compile_assets', 'exceptionally_beautiful:cache'
```

By default, the `exceptionally_beautiful:cache` task is only run on servers with the `:app` role, however you can override that by setting the `:exceptionally_beautiful_roles` option.

## Inspiration & Alternatives

This is by no means the first library to tackle this problem. Check out these other alternatives before deciding what to use.

* [Ryan Bates' Railscast](http://railscasts.com/episodes/53-handling-exceptions-revised)
* [errship](https://github.com/logankoester/errship)
* [error_pages_engine](https://github.com/lazylester/error_pages_engine)
* [dynamic_error_pages](https://github.com/marcusg/dynamic_error_pages)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Running tests

```bash
bundle exec guard
```