module ApplicationHelper
  def title
    "The Retrobox"
  end

  def header(text)
    content_for(:header) { text }
  end

  def navigation
    content_tag(:ul, :class => 'nav') do
      concat(build_nav_entry('Home', root_path, 'home'))
      concat(build_nav_entry('Notes', notes_path, ['notes', 'green_notes', 'red_notes'])) if user_signed_in?
    end
  end

  def flash_message
    unless flash.keys.empty?
      mapping = {:notice => "success", :error => "error", :success => "success" }
      content_tag(:div, :class => "alert-message #{mapping[flash.keys.first]}", :"data-alert" => "alert") do
        concat(content_tag(:a, "x", :class => "close", :href => "#"))
        concat(content_tag(:p, flash[flash.keys.first]))
      end
    end
  end

  protected

  def build_nav_entry(nav_title, nav_path, nav_controller)
      content_tag(:li, content_tag(:a, nav_title, :href => nav_path), :class => (nav_controller.include?(controller.controller_name) ? 'active' : ''))
  end
end
