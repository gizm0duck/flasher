module Flasher
  module Helper
    def flasher_helper
      return nil if flash.keys.empty?
      output = []
      flash.each do |key, value|
        image = image_tag "icons/#{key}.png"
        body = %(
          <div class="#{key}">
            <div class='span-1'>
              #{image}
            </div>
            <div class="flash-text last">#{value}</div>
          </div>
        )
        output << body
      end
      return content_tag :div, output.join("\n"), {:class => 'span-24 last', :id => 'flash-messages'}
    end
  end
end

ActionView::Base.send(:include, Flasher::Helper)