class AdminController < InheritedResources::Base
  before_filter { redirect_to root_path unless current_user.try(:admin) }

  defaults :resource_class => Note

  custom_actions :collection => :finish

  has_scope :category

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
    @notes = end_of_association_chain.current_without_unsolved
    collection.each { |note| note.update_attributes :retrospective => Date.today.strftime("retro-%d-%m-%y") }
    flash[:success] = 'Nice job finishing that retro!'
    redirect_to admin_index_path
  end

  protected

  def collection
    @notes ||= end_of_association_chain.current_with_unsolved
  end

end
