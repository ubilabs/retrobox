class NotesController < InheritedResources::Base
  before_filter { redirect_to root_path unless user_signed_in? }

  def create
    create! do |format|
      format.html { redirect_to notes_path }
    end
  end

  def destroy
    destroy! do |format|
      format.html { redirect_to notes_path }
    end
  end

  protected

    def begin_of_association_chain
      current_user unless current_user.admin
    end
end
