class NotesController < ApplicationController
  def index
    @notes = Note.all

    respond_to do |wants|
      wants.html # index.haml
      wants.json  { render :json => @notes }
    end
  end
end
