class AddColumnToRestaurants < ActiveRecord::Migration[5.1]
  def change
      create_table :restaurant do |t|    
  
      t.text :description

    end
  end
end
