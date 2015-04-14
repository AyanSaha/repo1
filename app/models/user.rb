class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   acts_as_voter
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 has_many :articles, dependent: :destroy
 has_many :comments
 after_create :admin


  def admin
     user=User.find_by email:'admin@blog.com'
      if !(user.nil?)
        user.update_attribute(:admin,true)
       end
   end
end
