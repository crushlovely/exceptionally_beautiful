require 'exceptionally_beautiful/markdown_renderer'
require 'exceptionally_beautiful/engine'
require 'exceptionally_beautiful/routes'

module ExceptionallyBeautiful
  mattr_accessor :controller
  self.controller = 'exceptionally_beautiful/errors'

  mattr_accessor :action
  self.action = 'show'

  mattr_accessor :layout
  self.layout = 'exceptionally_beautiful/errors'

  mattr_accessor :translation_namespace
  self.translation_namespace = 'exceptionally_beautiful'

  def self.setup(&block)
    yield self
  end

  def self.translation_scope(status_code)
    [translation_namespace, status_code].join('.')
  end

  def self.log(message)
    Rails.logger.warn("[Exceptionally Beautiful] #{message}")
  end
end
