class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
    	t.string :address, null: false
    	t.string :phone_number, null: false
    	t.string :number_of_seats, null: false
    	t.string :shop_image_id, null: false
    	t.string :access, null: false
    	t.string :text, null: false
    	t.string :parking, null: false

      t.timestamps
    end
  end
end
