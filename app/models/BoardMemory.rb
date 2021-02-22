class BoardMemory < ActiveRecord::Base
    belongs_to :board
    belongs_to :memory
end 