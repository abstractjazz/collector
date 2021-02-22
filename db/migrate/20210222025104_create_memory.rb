class CreateMemory < ActiveRecord::Migration[6.1]
  
  def change

    create_table :memories do |t|
      t.string :name
      t.string :description
      t.string :uploaded_photo
      t.integer :user_id 
    end
  end 
end

