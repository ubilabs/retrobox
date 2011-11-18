module NotesHelper

  def find_label_by_type(type)
    case type
    when 'RedNote'
      content_tag(:span, 'Bad', :class => 'label important')
    when 'GreenNote'
      content_tag(:span, 'Good', :class => 'label success')
    end
  end

  def category_tabs
    content_tag(:ul, :class => 'tabs') do
      concat(content_tag(:li, content_tag(:a, 'All', :href => notes_path), :class => ('active' if params['category'].blank?)))
      Note.category_counts.each do |category|
        concat(content_tag(:li, content_tag(:a, category.name.capitalize, :href => "#{notes_path}?category=#{category.name}"), :class => ('active' if params['category'] == category.name)))
      end
    end
  end

end
