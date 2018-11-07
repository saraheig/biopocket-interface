module ApplicationHelper
  # Initialize a function related to markdown (parser)
  def markdown(text)
    if text
      text.gsub!(/!\[((?:full|right|left)\s(?:l|c|r|a)(?:t|c|b|a))\]\(([^)\s]+\.(?:gif|jpe?g|png))\)/, '<img src=' + Rails.configuration.imagesBaseUrl + '\2 width=\'50%\'><br/><em>Paramètres de l\'image : \1</em>');
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, strikethrough: true);
      return markdown.render(text).html_safe
    end
  end
end
