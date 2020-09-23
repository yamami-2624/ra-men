class CreateRaamen < ActiveRecord::Migration[5.2]
  def change
    create_table :raamen do |t|
    	t.integer :genre_id
    	t.integer :review_id
    	t.string :name, null: false
    	t.string :price, null: false
    	t.string :raamen_image_id
    	t.string :text, null: false
      t.boolean :is_active, default: true
      t.timestamps
    end
  end
end
