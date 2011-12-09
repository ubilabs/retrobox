module ApplicationHelper
  def title
    "The Retrobox"
  end

  def header(text)
    content_for(:header) { text }
  end

  def big_blue_button(text, path)
    content_for(:big_blue_button) do
      link_to text, path, :class => [:btn, :large, :primary], :confirm => 'Finish the retrospective?'
    end
  end

  def navigation
    content_tag(:ul, :class => 'nav') do
      concat(build_nav_entry('Home', root_path, 'home'))
      concat(build_nav_entry('Notes', notes_path, ['notes', 'green_notes', 'red_notes'])) if user_signed_in?
      concat(build_nav_entry('Admin', admin_index_path, 'admin')) if current_user.try(:admin)
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

  def styled_label_for(resource, index_view = nil)
    mapping = {"RedNote" => "error", "GreenNote" => "success" }
    content_tag(:div, :class => "alert-message block-message #{mapping[resource.type.to_s]}") do
      concat(content_tag(:h2) do
        concat(content_tag(:span, resource.text))
        concat(content_tag(:span, :class => 'pull-right') do
          concat(link_to 'Edit', edit_polymorphic_path(resource), :class => :btn)
          concat(link_to 'Destroy', polymorphic_path(resource), :method => :delete, :confirm => 'Really delete?', :class => :btn)
        end) if index_view
      end)
      concat(content_tag(:h6, "Author: #{resource.user.full_name}")) unless index_view
    end
  end

  protected

  def build_nav_entry(nav_title, nav_path, nav_controller)
    content_tag(:li, content_tag(:a, nav_title, :href => nav_path), :class => (nav_controller.include?(controller.controller_name) ? 'active' : ''))
  end
end
