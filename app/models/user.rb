class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable, omniauth_providers: [:facebook]

  has_many :photos    
  has_many :comments
  
  
  def to_s
    self.nickname
  end
  
  @@mail_counter = 0
  def self.from_omniauth(auth)

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = "mail#{@@mail_counter}@mail.com" if user.email.nil?
      user.password = Devise.friendly_token[0,20]
      user.nickname = auth.info.name

      @@mail_counter += 1
    end
  end
end
