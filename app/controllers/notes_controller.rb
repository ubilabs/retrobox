class NotesController < InheritedResources::Base
  before_filter { redirect_to root_path unless user_signed_in? }

  protected

    def begin_of_association_chain
      current_user unless current_user.admin
    end
end
