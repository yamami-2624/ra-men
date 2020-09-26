class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
    	t.integer :raamen_id
      t.integer :review_id
      t.string :name, null: false
    	t.string :address, null: false
    	t.string :phone_number, null: false
    	t.string :business_hours
    	t.string :number_of_seats
    	t.string :shop_image_id
    	t.string :access
    	t.string :text
    	t.string :parking
      t.timestamps
    end
  end
end
