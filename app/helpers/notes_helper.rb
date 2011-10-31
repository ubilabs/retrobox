module NotesHelper
  def find_label_by_type(type)
    case type
    when 'RedNote'
      'label important'
    when 'GreenNote'
      'label success'
    end
  end
end
