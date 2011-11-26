module ApplicationHelper

  def alert_messages
    return if flash.blank?
    alerts = ""
    flash.each do |type, message|
      alerts += content_tag(:div, :class => "alert-message #{type}") do 
        link_to("&#215;".html_safe, "#", :class => "close") + content_tag(:p, message)
      end
    end
    alerts.html_safe
  end

end
