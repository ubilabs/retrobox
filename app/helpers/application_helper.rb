module ApplicationHelper
  def title
    "The Retrobox"
  end

  def flash_message
    unless flash.keys.empty?
      mapping = {:notice => "warning", :error => "error", :success => "success" }
      content_tag(:div, :class => "alert-message #{mapping[flash.keys.first]}", :"data-alert" => "alert") do
        concat(content_tag(:a, "x", :class => "close", :href => "#"))
        concat(content_tag(:p, flash[flash.keys.first]))
      end
    end
  end

  def account_button
    if user_signed_in?
      link_to 'Sign out', destroy_user_session_path, :method => :delete, :class => 'btn danger'
    else
      link_to 'Sign in', user_omniauth_authorize_path(:google_apps), :class => 'btn primary'
    end
  end
end
