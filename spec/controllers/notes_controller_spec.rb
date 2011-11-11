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


    context "Notes" do

      before(:each) do
        @user_note = Factory(:red_note, :user => user)
        @foreign_user_note = Factory(:red_note, :user => foreign_user)
      end

      it "should only shown to the owner if is not admin" do
        sign_in user

        get 'index'

        assigns[:notes].should include(@user_note)
        assigns[:notes].should_not include(@foreign_user_note)
      end

      it "should all be visible for admin" do
        user.update_attribute(:admin, true)

        sign_in user

        get 'index'

        assigns[:notes].should include(@user_note)
        assigns[:notes].should include(@foreign_user_note)
      end
    end

  end
end
