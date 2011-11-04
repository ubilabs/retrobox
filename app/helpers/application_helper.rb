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
      concat(build_nav_entry('Notes', notes_path, 'notes')) if user_signed_in?
    end
  end

  def flash_message
    unless flash.keys.empty?
      mapping = {:notice => "info", :error => "error", :success => "success" }
      content_tag(:div, :class => "alert-message #{mapping[flash.keys.first]}", :"data-alert" => "alert") do
        concat(content_tag(:a, "x", :class => "close", :href => "#"))
        concat(content_tag(:p, flash[flash.keys.first]))
      end
    end
  end

  def account_button
    if user_signed_in?
      link_to 'Sign out', destroy_user_session_path, :method => :delete, :class => 'btn'
    else
      link_to 'Sign in', user_omniauth_authorize_path(:google_apps), :class => 'btn primary'
    end
  end

  protected

  def build_nav_entry(nav_title, nav_path, nav_controller)
      content_tag(:li, content_tag(:a, nav_title, :href => nav_path), :class => (controller.controller_name == nav_controller ? 'active' : ''))
  end
end
