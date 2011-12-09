class AdminController < InheritedResources::Base
  before_filter { redirect_to root_path unless current_user.try(:admin) }

  defaults :resource_class => Note

  custom_actions :collection => :finish

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

  def finish
    collection.each { |note| note.update_attributes :retrospective=> Date.today.strftime("retro-%d-%m-%y") }
    flash[:success] = 'Nice job finishing that retro!'
    redirect_to admin_index_path
  end

end
