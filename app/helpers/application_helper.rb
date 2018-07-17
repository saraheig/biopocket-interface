module ApplicationHelper
  # Initialize a function related to markdown (parser)
  def markdown(text)
    if text
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, strikethrough: true)
      return markdown.render(text).html_safe
    end
  end
end
