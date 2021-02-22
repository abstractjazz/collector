class Board < ActiveRecord::Base
    has_many :board_memories 
    has_many :memories, through: :board_memories 
    has_many :users, through: :memories 
end 