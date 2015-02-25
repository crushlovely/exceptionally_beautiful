require 'exceptionally_beautiful/html_renderer'

module ExceptionallyBeautiful
  class MarkdownRenderer
    attr_reader :text

    def initialize(text)
      @text = text
    end

    def render
      markdown.render(text).html_safe
    end

    private

    def markdown
      Redcarpet::Markdown.new(ExceptionallyBeautiful::HtmlRenderer, extensions)
    end

    def extensions
      {
        :autolink => true,
        :fenced_code_blocks => true,
        :no_intra_emphasis => true,
        :space_after_headers => true,
        :tables => true
      }
    end
  end
end
