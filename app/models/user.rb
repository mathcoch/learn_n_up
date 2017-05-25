class User < ApplicationRecord
  has_many :lessons
  has_many :meetings
  has_many :reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  validates :first_name, :last_name, presence:true


  def avatar_url
    facebook_picture_url || "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909__340.png"
  end

  def has_done_lesson(lesson)
    self.meetings.map { |meeting| meeting.lesson == lesson }
                 .include? (true)
  end


  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end
end
