require 'spec_helper'

describe NotesController do

  describe "GET 'index'" do
    let (:user) { Factory(:user) }
    let (:foreign_user) { Factory(:user, :email => "foreign@example.com") }

    it "should not allow anonymous access" do
      get 'index'
      response.should redirect_to(root_path)
    end

    it "should be accessible by signed in user" do
      sign_in user

      get 'index'
      response.should render_template('index')
    end

  end
end
