class AddShopIdToRaamen < ActiveRecord::Migration[5.2]
  def change
    add_column :raamen, :shop_id, :integer
  end
end
