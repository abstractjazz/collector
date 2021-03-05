class Board < ActiveRecord::Base
    belongs_to :user 
    has_many :memories
   
end 