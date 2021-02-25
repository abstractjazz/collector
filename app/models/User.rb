class User < ActiveRecord::Base 
    
    has_many :boards
    has_many :memories, :through => :boards

    has_secure_password

    validates :username, :learn_handle, presence: true
    validates :username, :learn_handle, uniqueness: true

    def slug
    username.downcase.gsub(" ","-")
    end 

    def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
    end 
    
end 