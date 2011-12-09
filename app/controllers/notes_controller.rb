class NotesController < InheritedResources::Base
  before_filter { redirect_to root_path unless user_signed_in? }

  def create
    create!{ notes_path }
  end

  def update
    update!{ notes_path }
  end

  def destroy
    destroy!{ notes_path }
  end

  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    @notes ||= end_of_association_chain.current_without_unsolved
  end

end
