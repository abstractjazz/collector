class CreateBoard < ActiveRecord::Migration[6.1]
  
  def change

    create_table :boards do |t|
     t.string :name
     t.string :description 
    end
  end
end   
