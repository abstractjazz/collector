class User < ActiveRecord::Base 
    
    has_many :boards
    has_many :memories, :through => :boards

    has_secure_password

    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness:true 
    validates  :password, presence: true 
end 