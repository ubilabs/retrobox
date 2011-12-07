module AdminHelper

  def category_tabs
    content_tag(:ul, :class => 'tabs') do
      concat(content_tag(:li, content_tag(:a, 'All', :href => admin_index_path), :class => ('active' if params['category'].blank?)))
      Note.category_counts.each do |category|
        concat(content_tag(:li, content_tag(:a, category.name.capitalize, :href => "#{admin_index_path}?category=#{category.name}"), :class => ('active' if params['category'] == category.name)))
      end
    end
  end

end
