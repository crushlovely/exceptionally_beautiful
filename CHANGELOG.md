# CHANGELOG

## 0.1.4 (2015-07-13)

* Allow an application's named routes to work within custom layouts.

## 0.1.3 (2015-03-02)

* Fixed issue with `Gemfile.lock` being stuck on 0.1.1.

## 0.1.2 (2015-02-25)

* Specify error codes the gem will handle via `config.errors`.
* Rake task for caching error pages in your app's public folder (see README for more information).
* Capistrano integration (see README for more information).

## 0.1.1 (2015-02-10)

Removed beta restrictions from Rails dependency.

## 0.1.0 (2015-01-22)

This release breaks the previous I18n translation file format. See the README for information on how the translation file should be setup now.

* Switched to using numeric representation of status codes in translation files.
* Improved default error messages
* Fixed up default layout and styles so it's more universal.
* Added support for rendering error messages with Markdown via Redcarpet.

## 0.0.1 (2015-01-20)

* Initial release
