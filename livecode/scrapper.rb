require 'open-uri'
require 'nokogiri'

html_file = open("https://dribbble.com/search?q=wagon")
html_document = Nokogiri::HTML(html_file)

dribbbles = html_document.css('li.group')

dribbbles.each do |dribbble|
  title = dribbble.css('.dribbble .dribbble-shot .dribbble-img a.dribbble-over strong').text

  next if title.empty?

  puts dribbble.css(
    '.dribbble .dribbble-shot div.dribbble-img a.dribbble-link picture img'
  ).attr('src')
end
