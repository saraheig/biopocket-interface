module ApplicationHelper
  # Initialize a function related to markdown (parser)
  def markdown(text)
    if text
      
      images = text.scan(/!\[((?:full|right|left)\s(?:l|c|r|a)(?:t|c|b|a))\]\(([^)\s]+\.(?:gif|jpe?g|png))\)/)

      images.each { |image|

        url = Rails.configuration.imagesFinalUrl + image[1]
        res = Net::HTTP.get_response(URI.parse(url)).is_a?(Net::HTTPSuccess)

        if res
          url_final = Rails.configuration.imagesFinalUrl + image[1]
          status = "image traitée"
        else
          url_final = Rails.configuration.imagesInitUrl + image[1]
          status = "image à traiter"
        end

        text.gsub!(/!\[((?:full|right|left)\s(?:l|c|r|a)(?:t|c|b|a))\]\((\b(#{ image[1] })\b)\)/, '<br/><img src=' + url_final + ' width=\'250em\'><br/><em>Paramètres de l\'image : ' + image[0] + ' (' + status + ')</em><br/>')
      }

      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, strikethrough: true)
      return markdown.render(text).html_safe
    end
  end
end
