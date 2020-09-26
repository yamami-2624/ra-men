class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
    	t.integer :user_id
    	t.integer :shop_id
    	t.integer :raamen_id
    	t.string :review, null: false
    	t.string :review_image_id
    	t.string :topping, null: false
    	t.string :tennsuu, null: false
      t.timestamps
    end
  end
end
