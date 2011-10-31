module NotesHelper
  def find_label_by_type(type)
    case type
    when 'RedNote'
      content_tag(:span, 'Bad', :class => 'label important')
    when 'GreenNote'
      content_tag(:span, 'Good', :class => 'label success')
    end
  end
end
