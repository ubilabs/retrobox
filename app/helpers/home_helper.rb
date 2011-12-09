module HomeHelper
  def name
    current_user.try(:first_name) || "Stranger"
  end
end
