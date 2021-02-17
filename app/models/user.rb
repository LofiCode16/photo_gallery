class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable #:confirmable

<<<<<<< HEAD
  has_many :photos      

=======
  has_many :photos    
  has_many :comments
  
  def to_s
    self.nickname
  end
>>>>>>> comments
end
