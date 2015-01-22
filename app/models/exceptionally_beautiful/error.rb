module ExceptionallyBeautiful
  class Error
    attr_reader :status_code

    def initialize(status_code)
      @status_code = status_code.to_i
    end

    def title
      @title ||= pretty_error_translation(:title)
    end

    def message
      @message ||= pretty_error_translation(:message)
    end

    private

    def pretty_error_translation(key)
      I18n.t(key, :scope => translation_scope, :raise => true)
    rescue I18n::MissingTranslationData
      log("Translation missing: #{translation_scope}.#{key}. Falling back to defaults.")
      I18n.t(key, :scope => ExceptionallyBeautiful.translation_scope('default'))
    end

    def log(message)
      ExceptionallyBeautiful.log(message)
    end

    def translation_scope
      ExceptionallyBeautiful.translation_scope(status_code)
    end
  end
end
