class Memory < ActiveRecord::Base 
    belongs_to :user
    has_many :board_memories 
    has_many :boards, through: :board_memories 
end 