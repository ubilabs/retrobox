class NotesController < InheritedResources::Base
  before_filter { redirect_to root_path unless user_signed_in? }

  actions :index
end
