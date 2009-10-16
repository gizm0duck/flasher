module Flasher
  module Helper
    def flasher_helper
      if flash.any?
        output = flash.map{|k, v| render_message(k, v)}.join("\n")
        return content_tag(:div, output, {:id => 'flash-messages'})
      end
    end
    
    def render_message(key, value)
      %(
        <div class="flash-icon #{key}">
          <div class="flash-text">#{value}</div>
        </div>
      )
    end
  end
end

ActionView::Base.send(:include, Flasher::Helper)