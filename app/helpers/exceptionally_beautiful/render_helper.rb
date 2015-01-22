module ExceptionallyBeautiful
  module RenderHelper
    def markdown(str)
      ExceptionallyBeautiful::MarkdownRenderer.new(str).render
    end
  end
end
