class AdminController < InheritedResources::Base
  before_filter { redirect_to root_path unless current_user.try(:admin) }

  defaults :resource_class => Note

  has_scope :category
  has_scope :retrospective

  def create
    create!{ admin_index_path }
  end

  def update
    update!{ admin_index_path }
  end

  def destroy
    destroy!{ admin_index_path }
  end

end
