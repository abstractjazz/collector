class CreateBoardMemories < ActiveRecord::Migration[6.1]
  def change
    
    create_table :board_memories do |t| 
      t.integer :board_id
      t.integer :memory_id 
    end 
  end
end
