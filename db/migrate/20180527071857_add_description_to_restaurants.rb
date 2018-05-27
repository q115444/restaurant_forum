class AddDescriptionToRestaurants < ActiveRecord::Migration[5.1]
  #導正之前拼錯description 拼成descrption

  def change
    add_column :restaurants,:description,:text
  end
end
