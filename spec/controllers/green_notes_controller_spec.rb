require 'spec_helper'

describe GreenNotesController do

  describe "GET 'new'" do
    it "should not allow anonymous access" do
      get 'new'
      response.should redirect_to(root_path)
    end

    it "should be accessible by signed in user" do
      sign_in Factory.create(:user)

      get 'new'
      response.should render_template('new')
    end
  end

  describe "POST 'create'" do
    it "should redirect to index after create" do
      sign_in Factory.create(:user)
      post 'create', :text => "it's great"

      response.should redirect_to(notes_path)
    end
  end

  describe "DELETE 'destroy'" do
    it "should redirect to index after destroy" do
      user = Factory.create(:user)
      sign_in user
      green_note = Factory(:green_note, :user => user)
      delete "destroy", :id => green_note.id

      response.should redirect_to(notes_path)
    end
  end

end
