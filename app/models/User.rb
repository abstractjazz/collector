class User < ActiveRecord::Base 
    has_many :memories
    has_many :boards
end 