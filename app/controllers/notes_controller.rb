class NotesController < ApplicationController
  def index
    @notes = Note.all

    respond_to do |wants|
      wants.html # index.haml
      wants.json  { render :json => @notes }
    end
  end

  def show
    @note = Note.find(params[:id])

    respond_to do |wants|
      wants.html # show.haml
      wants.json  { render :json => @note }
    end
  end

  def new
    @note = Note.new

    respond_to do |wants|
      wants.html # new.haml
      wants.json  { render :json => @note }
    end
  end

  def create
    @note = Note.new(params[:note])

    respond_to do |wants|
      if @note.save
        flash[:notice] = 'Note was successfully created.'
        wants.html { redirect_to(@note) }
        wants.json  { render :json => @note, :status => :created, :location => @note }
      else
        wants.html { render :action => "new" }
        wants.json  { render :json => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])

    respond_to do |wants|
      if @note.update_attributes(params[:note])
        flash[:notice] = 'Note was successfully updated.'
        wants.html { redirect_to(@note) }
        wants.json  { head :ok }
      else
        wants.html { render :action => "edit" }
        wants.json  { render :json => @note.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |wants|
      wants.html { redirect_to(notes_url) }
      wants.json  { head :ok }
    end
  end
end
