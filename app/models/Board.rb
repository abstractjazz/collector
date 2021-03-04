class Board < ActiveRecord::Base
    belongs_to :user 
    has_many :memories
   
    accepts_nested_attributes_for :memories
end 