module Flasher
  module Helper
    def flasher_helper
      return nil if flash.keys.empty?
      output = []
      flash.each do |key, value|
        body = %(
          <div class="flash-icon #{key}">
            <div class="flash-text">#{value}</div>
          </div>
        )
        output << body
      end
      return content_tag :div, output.join("\n"), {:id => 'flash-messages'}
    end
  end
end

ActionView::Base.send(:include, Flasher::Helper)