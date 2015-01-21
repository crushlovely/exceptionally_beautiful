module ExceptionallyBeautiful
  class Error
    attr_reader :status_code, :status

    def initialize(status_code)
      @status_code = status_code.to_i
      determine_status
    end

    def title
      @title ||= pretty_error_translation(:title)
    end

    def message
      @message ||= pretty_error_translation(:message)
    end

    private

    def determine_status
      match = Rack::Utils::SYMBOL_TO_STATUS_CODE.detect { |k, v| v == status_code }
      if match
        @status = match.first
      else
        log('The status code passed in is not recognized by Rack.')
        @status = 'default'
      end
    end

    def pretty_error_translation(key)
      I18n.t(key, :scope => ExceptionallyBeautiful.translation_scope(status), :raise => true)
    rescue I18n::MissingTranslationData
      log("Translation missing: #{ExceptionallyBeautiful.translation_scope(status)}.#{key}. Falling back to defaults.")
      I18n.t(key, :scope => ExceptionallyBeautiful.translation_scope('default'))
    end

    def log(message)
      ExceptionallyBeautiful.log(message)
    end
  end
end
