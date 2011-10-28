module ApplicationHelper
  def title
    "The Retrobox"
  end

  def flash_message
    mapping = {:notice => "info", :error => "error", :success => "success" }
    content_tag(:div, :class => "alert-message #{mapping[flash.keys.first]}", :"data-alert" => "alert") do
      concat(content_tag(:a, "x", :class => "close", :href => "#"))
      concat(content_tag(:p, flash[flash.keys.first]))
    end
  end
end
