class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable

  has_many :quests
  has_many :trails, :through => :quests

  # Setup accessible (or protected) attributes for your model

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.find_by_email(data.email)
      user
    else # Create a user with a stub password. 
      user = User.create!(:email => data.email, :encrypted_password => Devise.friendly_token[0,20]) 
    end
    user.update_from_omniauth(access_token)
    user
  end


  attr_accessible :email, :name, :display_name, :gender, :dob, :location, :password, :password_confirmation

  def update_from_omniauth(auth)    
    self.provider = auth['provider']
    self.uid = auth['uid']
    self.token = auth['credentials']['token']
    self.raw_data = auth.to_json
    self.name   = auth['info']['name']
    self.nick   = auth['info']['nickname']
    self.gender = auth['extra']['raw_info']['gender']
    self.dob    = auth['extra']['raw_info']['birthday']
    self.location =  auth['extra']['raw_info']['location']['name']
    self.avatar_url = auth['info']['image']
    save
  end

 def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["user_hash"]
        user.email = data["email"]
      end
    end
  end

end
