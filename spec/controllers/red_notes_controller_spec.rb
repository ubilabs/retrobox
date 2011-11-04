require 'spec_helper'

describe RedNotesController do

  describe "GET 'new'" do
    it "should not allow anonymous access" do
      get 'new'
      response.should redirect_to(root_path)
    end

    it "should be accessible by signed in user" do
      sign_in Factory.create(:user)

      get 'new'
      response.should be_success
    end
  end

end
