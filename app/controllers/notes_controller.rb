class NotesController < InheritedResources::Base
  before_filter { redirect_to root_path unless user_signed_in? }

  has_scope :category

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
    current_user unless current_user.admin
  end

end
