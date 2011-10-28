class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :remember_me

  def self.find_for_google_apps_oauth(access_token, signed_in_resource=nil)
    data = access_token['user_info']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password
      User.create!(:email => data["email"], :first_name => data["first_name"], :last_name => data["last_name"], :password => Devise.friendly_token[0, 20])
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
